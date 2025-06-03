package f572

import (
	"encoding/xml"
	"fmt"
	"io/ioutil"
	"log"
	"path/filepath"
	"siradigafip/pkg/config"
	"siradigafip/pkg/gormfun"
	models "siradigafip/pkg/modelssiradig"

	"siradigafip/pkg/util"
	"strconv"
	"strings"

	"github.com/shopspring/decimal"
	"gorm.io/gorm"
)

func ProcesarZip(filezip string) string {

	config.CreateConnections()
	var mensaje string = ""
	Dir_xml := config.Get("dir.xml").(string)

	//--- Si existe archivo ---
	if !util.FileExists(filezip) {
		mensaje = "* No existe el archivo: " + filezip
		return mensaje
	} else {
		//--- Si no es un zip ---
		if !util.IsExtension(filezip, ".zip") {
			mensaje = "El archivo NO es un archivo tipo zip"
			return mensaje
		}
	}

	if !util.DirectoryExists(Dir_xml) {
		mensaje = "El directorio configurado en archivo de configuracion NO existe. Deberá crearlo. " +
			"*Directorio: " + Dir_xml
		return mensaje
	}

	//--- Descomprime archivo en temporal ---
	err := util.UnzipSource(filezip, Dir_xml)
	if err != nil {
		mensaje = "Error: intentando descomprimir el archivo " + filezip + " en el directorio: " + Dir_xml + " " +
			"Asegurese que existan el archivo y el directorio."
	} else {
		//Una vez descomprimido, borra el zip
		//### os.Remove(filezip)

		db := config.DB("rrhh")

		tx := db.Begin()
		if err != nil {
			mensaje = "Error al abrir transaccion"
			return mensaje
		}

		gormfun.SetTX(tx)
		mensaje := ImportarABaseDatos(db, Dir_xml)
		if mensaje == "" {
			fmt.Println("El proceso fue completado satisfactoriamente")
			tx.Commit()
		} else {
			mensaje += "\nNO se ha podido completar el proceso"
			fmt.Println(mensaje)
			tx.Rollback()
		}

	}

	return mensaje
}

func ImportarABaseDatos(db *gorm.DB, pathZips string) string {

	var mensaje string = ""

	config.Init("./config/config.conf")
	config.CreateConnections()

	fmt.Println("Procesando archivo...")
	listaFiles := util.GetFilesExtension(pathZips, ".xml")
	for _, file := range listaFiles {
		filenoext := strings.ReplaceAll(filepath.Base(file), ".xml", "")
		par := strings.Split(filenoext, "_")

		fmt.Printf("\n ARCHIVO: %v // %v", file, len(par))

		CUIT, err := strconv.ParseInt(par[0], 10, 64)
		if err != nil {
			mensaje += "\n" + fmt.Sprintln("Error al convertir CUIT a int64", par[0])
			return mensaje
		}
		periodo, err := strconv.Atoi(par[1])
		if err != nil {
			mensaje += "\n" + fmt.Sprintln("Error al convertir Periodo a int", par[1])
			return mensaje
		}
		envio, err := strconv.Atoi(par[3])
		if err != nil {
			mensaje += "\n" + fmt.Sprintln("Error al convertir Envio a int", par[3])
			return mensaje
		}

		data, err := ioutil.ReadFile(file)
		if err != nil {
			mensaje += "\n" + err.Error()
			log.Fatal(err)
			return mensaje
		}

		// Si es Presentacion B, (tiene 5 componentes el split)
		if len(par) == 5 {

			px := &PresentacionBType{}
			err = xml.Unmarshal([]byte(data), &px)
			if err != nil {
				mensaje += "\n" + err.Error()
				log.Fatal(err)
				return mensaje
			}
			mensaje = insertarPresentacionB(CUIT, periodo, envio, db, px)
		} else { //Presentacion normal
			px := &PresentacionType{}
			err = xml.Unmarshal([]byte(data), &px)
			if err != nil {
				mensaje += "\n" + err.Error()
				log.Fatal(err)
				return mensaje
			}
			mensaje = insertarPresentacion(CUIT, periodo, envio, db, px)
		}
		if mensaje != "" {
			return mensaje
		}
	}
	return mensaje
}

func handleError(err error) {
	if err != nil {
		log.Fatal(err)
	}
}

func insertarPresentacion(CUIT int64, periodo, envio int, db *gorm.DB, px *PresentacionType) string {

	//-- Recupera la transaccion
	tx := gormfun.GetTX()

	var mensaje string = ""
	var Legajo uint //para extraccionSiradig

	sCUIT := strconv.FormatInt(CUIT, 10)
	sEnvio := strconv.Itoa(envio)
	sPeriodo := strconv.Itoa(periodo)
	otrosEmpAttribs := valorParametroOtrosEmp(db)

	//---- Busca el legajo para SIRADIG
	db = config.DB("legajos")
	db.Raw(`SELECT distinct legajo FROM "public".empleado WHERE "nroCuil"= ?`, sCUIT).Scan(&Legajo)
	if Legajo == 0 {
		mensajeerr := fmt.Sprintf("** NO se encontro legajo para el CUIT: %s (%s , %s)", sCUIT, px.Empleado.Apellido, px.Empleado.Nombre)
		fmt.Println(mensajeerr)
	}

	db = config.DB("rrhh")
	gormfun.SetSchema("siradig")

	// Si ya existe, retorna - No hace nada
	Presentacion := models.F572Presentacion{}
	resu := db.Where("cuit = ? AND periodo = ? AND envio = ?", sCUIT, sPeriodo, sEnvio).First(&Presentacion)
	if resu.Error != nil && resu.Error != gorm.ErrRecordNotFound {
		panic(resu.Error)
	}
	if resu.RowsAffected > 0 {
		// Si ya existe, retorna sin mensaje. Hace nada!
		return mensaje
	}

	empleadorCuit := fmt.Sprintf("%v", px.Empleado.Cuit)

	//---- Busca el legajo
	pr := models.F572Presentacion{}
	pr.Cuit = uint(CUIT)
	pr.Periodo = uint(periodo)
	pr.Envio = uint(envio)
	pr.Nropresentacion = uint(px.NroPresentacion)
	pr.Fechapresentacion = px.FechaPresentacion
	pr.Emplcuit = strings.TrimSpace(empleadorCuit)
	pr.Empltipodoc = string(px.Empleado.TipoDoc)
	pr.Emplapellido = string(px.Empleado.Apellido)
	pr.Emplnombre = string(px.Empleado.Nombre)
	pr.Dirprovincia = uint(px.Empleado.Direccion.Provincia)
	pr.Dircp = px.Empleado.Direccion.Cp
	pr.Dirlocalidad = px.Empleado.Direccion.Localidad
	pr.Dircalle = px.Empleado.Direccion.Calle
	pr.Dirnro = px.Empleado.Direccion.Nro
	pr.Dirpiso = px.Empleado.Direccion.Piso
	pr.Dirdpto = px.Empleado.Direccion.Dpto

	result := tx.Create(&pr)
	if result.Error != nil {
		//mensaje = fmt.Sprintf("Error al insertar presentacion: cuit-periodo-envio: %d-%d-%d", CUIT, periodo, envio)
		return mensaje
	}
	presentacionId := pr.Id

	///--- Deducciones ----
	for _, deduccion := range px.Deducciones.Deduccion {

		unTipo, err := strconv.ParseUint(deduccion.Tipo, 10, 64)
		if err != nil {
			mensaje = fmt.Sprintf("Error de Parseo valor entero: %d-%d-%d-%s-%d", CUIT, periodo, envio, deduccion.Tipo, deduccion.TipoDoc)
			return mensaje
		}

		dex := models.F572Deducciones{
			Presentacion_id: uint(presentacionId),
			Tipo:            uint(unTipo),
			Tipodoc:         uint(deduccion.TipoDoc),
			Descbasica:      string(deduccion.DescBasica),
			Montototal:      decimal.NewFromFloat(float64(deduccion.MontoTotal)),
			Nrodoc:          string(deduccion.NroDoc),
			Denominacion:    string(deduccion.Denominacion),
			Descadicional:   string(deduccion.DescAdicional),
		}

		result := tx.Create(&dex)
		if result.Error != nil {
			mensaje = fmt.Sprintf("Error al insertar deduccion: cuit-periodo-envio-tipo-tipoDoc: %d-%d-%d-%s-%d", CUIT, periodo, envio, deduccion.Tipo, deduccion.TipoDoc)
			return mensaje
		}
		deduccionId := dex.Id

		for _, periodox := range deduccion.Periodos.Periodo {

			mdesde, err := strconv.ParseUint(periodox.MesDesde, 10, 64)
			if err != nil {
				fmt.Println("Error de parseo MesDesde", err)
			}
			mhasta, err := strconv.ParseUint(periodox.MesHasta, 10, 64)
			if err != nil {
				fmt.Println("Error de parseo MesHasta", err)
			}
			mtomensual, err := strconv.ParseFloat(periodox.MontoMensual, 64)
			if err != nil {
				fmt.Println("Error de parseo MontoMensual", err)
			}

			per1 := models.F572Deduccionesperiodo{
				Deduccion_id: uint(deduccionId),
				Mesdesde:     uint(mdesde),
				Meshasta:     uint(mhasta),
				Montomensual: decimal.NewFromFloat(float64(mtomensual)),
			}

			result := tx.Create(&per1)
			if result.Error != nil {
				mensaje = fmt.Sprintf("Error al insertar deduccion-periodo: cuit-periodo-envio-tipo-tipoDoc-MesDesde: %d-%d-%d-%s-%d-%s-%s", CUIT, periodo, envio, deduccion.Tipo, deduccion.TipoDoc, periodox.MesDesde, periodox.MesHasta)
				return mensaje
			}

			//################################
			//---- CONCEPTOS SIRADIG ---------
			//################################
			var ip int
			importe, _ := strconv.ParseFloat(periodox.MontoMensual, 64)
			mesd, _ := strconv.Atoi(periodox.MesDesde)
			mesh, _ := strconv.Atoi(periodox.MesHasta)
			iPeriodo, _ := strconv.Atoi(sPeriodo)
			for ip = mesd; ip <= mesh; ip++ {
				dedu := models.F572Siradigconceptos{}
				ok := dedu.SetGrupoTipo(db, Legajo, CUIT, iPeriodo, ip, px.NroPresentacion, "AFDEDUC", deduccion.Tipo, importe)
				if ok {
					result := tx.Create(&dedu)
					if result.Error != nil {
						mensaje = fmt.Sprintln("Error al insertar conceptos#: cuit-periodo-envio-tipo-tipoDoc: ", CUIT, periodo, envio, deduccion.Tipo, deduccion.TipoDoc)
						return mensaje
					}
				} //f572_siradigconceptos
			}
			//--------------------------------
		}

		for _, detalle := range deduccion.Detalles.Detalle {
			det1 := models.F572Deduccionesdetalle{
				Deduccion_id: uint(deduccionId),
				Valor:        detalle.Valor,
				Nombre:       detalle.Nombre,
			}
			result := tx.Create(&det1)
			if result.Error != nil {
				mensaje = fmt.Sprintln("Error al insertar deduccion-detalle: cuit-periodo-envio-tipo-tipoDoc: ", CUIT, periodo, envio, deduccion.Tipo, deduccion.TipoDoc)
				return mensaje
			}
		}
	}

	//---- Carga Familia
	for _, cargaFamilia := range px.CargasFamilia.CargaFamilia {

		unTipoDoc, err := strconv.ParseUint(string(cargaFamilia.TipoDoc), 10, 64)
		if err != nil {
			// Error de parseo
		}

		det1 := models.F572Cargasfamilia{
			Presentacion_id: uint(presentacionId),
			Nrodoc:          string(cargaFamilia.NroDoc),
			Apellido:        string(cargaFamilia.Apellido),
			Nombre:          string(cargaFamilia.Nombre),
			Tipodoc:         uint(unTipoDoc),
			Mesdesde:        uint(cargaFamilia.MesDesde),
			Meshasta:        uint(cargaFamilia.MesHasta),
			Fechalimite:     string(cargaFamilia.FechaLimite),
			Porcdeduccion:   uint(cargaFamilia.PorcentajeDeduccion),
			Fechanac:        string(cargaFamilia.FechaNac),
			Parentesco:      uint(cargaFamilia.Parentesco),
			Vigenteproxper:  string(cargaFamilia.VigenteProximosPeriodos),
		}
		result := tx.Create(&det1)
		if result.Error != nil {
			mensaje = fmt.Sprintln("Error al insertar cargaFamilia: cuit-periodo-envio-tipo-tipoDoc: ", CUIT, periodo, envio, cargaFamilia.NroDoc)
			return mensaje
		}

		//################################
		//---- CONCEPTOS SIRADIG ---------
		//################################
		var ip int
		valorPorc := float64(cargaFamilia.PorcentajeDeduccion)
		mesd := cargaFamilia.MesDesde
		mesh := cargaFamilia.MesHasta
		iPeriodo, _ := strconv.Atoi(sPeriodo)
		TIPOX := strconv.Itoa(cargaFamilia.Parentesco)
		for ip = mesd; ip <= mesh; ip++ {
			dedu := models.F572Siradigconceptos{}
			ok := dedu.SetGrupoTipo(db, Legajo, CUIT, iPeriodo, ip, px.NroPresentacion, "AFPAR17", TIPOX, valorPorc)
			if ok {
				result := tx.Create(&dedu)
				if result.Error != nil {
					mensaje = fmt.Sprintln("Error al insertar SiradigConceptos (AFPAR17): cuit-periodo-tipo-tipoDoc: ", CUIT, periodo, cargaFamilia.NroDoc)
					return mensaje
				}
			}
		}
		//--------------------------------
	}
	for _, empEnt := range px.GanLiqOtrosEmpEnt.EmpEnt {
		empent := models.F572Otrosempl{
			Presentacion_id: uint(presentacionId),
			Cuit:            uint(empEnt.Cuit),
			Denominacion:    string(empEnt.Denominacion),
		}
		result := tx.Create(&empent)
		if result.Error != nil {
			mensaje = fmt.Sprintln("Error al insertar Otrosempl: cuit-periodo-envio: ", CUIT, periodo, envio)
			return mensaje
		}

		ganLiqId := empent.Id

		for _, ingApLST := range empEnt.IngresosAportes {
			for _, ingAp := range ingApLST.IngAp {

				unMes, err := strconv.ParseUint(ingAp.Mes, 10, 64)
				if err != nil {
					// Error de parseo
				}

				oea := models.F572Otrosemplingaporte{
					Otrosemp_id:   uint(ganLiqId),
					Ganbrut:       decimal.NewFromFloat(float64(ingAp.GanBrut)),
					Retgan:        decimal.NewFromFloat(float64(ingAp.RetGan)),
					Exenoalc:      decimal.NewFromFloat(float64(ingAp.ExeNoAlc)),
					Matdid:        decimal.NewFromFloat(float64(ingAp.MatDid)),
					Retribnohab:   decimal.NewFromFloat(float64(ingAp.RetribNoHab)),
					Ajuste:        decimal.NewFromFloat(float64(ingAp.Ajuste)),
					Sac:           decimal.NewFromFloat(float64(ingAp.Sac)),
					Horasextex:    decimal.NewFromFloat(float64(ingAp.HorasExtEx)),
					Gastosmovviat: decimal.NewFromFloat(float64(ingAp.GastosMovViat)),
					Segsoc:        decimal.NewFromFloat(float64(ingAp.SegSoc)),
					Obrasoc:       decimal.NewFromFloat(float64(ingAp.ObraSoc)),
					Horasextgr:    decimal.NewFromFloat(float64(ingAp.HorasExtGr)),
					Mes:           uint(unMes),
					Sind:          decimal.NewFromFloat(float64(ingAp.Sind)),
				}

				result := tx.Create(&oea)
				if result.Error != nil {
					mensaje = fmt.Sprintln("Error al insertar Otrosemplingaporte: cuit-periodo-envio: ", CUIT, periodo, envio)
					return mensaje
				}

				//################################
				//---- CONCEPTOS SIRADIG ---------
				//################################

				// Transforma el Objecto a Key=Value para poder recuperar cada importe
				oeaKV := gormfun.ObjectToMapString(oea)
				for tipo, atributo := range otrosEmpAttribs {

					valorstr := fmt.Sprintf("%v", oeaKV[tipo])

					valorP, _ := strconv.ParseFloat(valorstr, 64)
					if valorP > 0 {
						if atributo != "" {
							mesx, _ := strconv.Atoi(ingAp.Mes)

							criteria := map[string]interface{}{
								"cuit":     CUIT,
								"anio":     periodo,
								"mes":      mesx,
								"nrover":   envio,
								"atributo": atributo,
							}

							//registrox, _ := gormfun.GetGormObject(db, reflect.TypeOf(models.F572Siradigconceptos{}), criteria)

							dedu := models.F572Siradigconceptos{}
							err := db.Where(criteria).First(&dedu).Error
							/// Si ya existe
							if err != nil && err != gorm.ErrRecordNotFound {
								//dedu := registrox.(*models.F572Siradigconceptos)
								valAux, _ := dedu.Valor.Float64()
								dedu.Valor = decimal.NewFromFloat(valAux + valorP)
								result := tx.Save(&dedu)
								if result.Error != nil {
									mensaje = fmt.Sprintln("Error al modificar concepto cuit-periodo-envio-atributo: ", CUIT, periodo, envio, atributo)
									return mensaje
								}

							} else { //Si NO existe
								iCuit, _ := strconv.ParseUint(sCUIT, 10, 64)
								dedu := models.F572Siradigconceptos{}
								dedu.Legajo = uint(Legajo)
								dedu.Cuit = uint(iCuit)
								dedu.Anio = uint(periodo)
								dedu.Mes = uint(mesx)
								dedu.Nrover = uint(envio)
								dedu.Atributo = atributo
								dedu.Valor = decimal.NewFromFloat(float64(valorP))

								result := tx.Create(&dedu)
								if result.Error != nil {
									mensaje = fmt.Sprintln("Error al crear concepto cuit-periodo-envio-atributo: ", CUIT, periodo, envio, atributo)
									return mensaje
								}
							}
						} else {
							fmt.Println("NO existe atributo para el campo: " + tipo + " en Otrosemplingaporte")
						}
					}
				}
			}
		}
	}

	//----- Datos Adicionales  ------
	for _, datoad := range px.DatosAdicionales.DatoAdicional {
		daa := models.F572Datadicional{
			Presentacion_id: uint(presentacionId),
			Nombre:          datoad.Nombre,
			Valor:           datoad.Valor,
		}
		if datoad.MesDesde != "" {
			unMesDesde, err := strconv.ParseUint(datoad.MesDesde, 10, 64)
			if err != nil {
				fmt.Sprintln("Error parseo # cuit-periodo-envio: ", CUIT, periodo, envio)
			}
			daa.Mesdesde = uint(unMesDesde)
		}
		if datoad.MesHasta != "" {
			unMesHasta, err := strconv.ParseUint(datoad.MesHasta, 10, 64)
			if err != nil {
				fmt.Sprintln("Error parseo # cuit-periodo-envio: ", CUIT, periodo, envio)
			}
			daa.Meshasta = uint(unMesHasta)
		}
		result := tx.Create(&daa)
		if result.Error != nil {
			mensaje = fmt.Sprintln("Error al insertar Datadicional: cuit-periodo-envio: ", CUIT, periodo, envio)
			return mensaje
		}
	}

	//--- RetPerPago
	for _, retpago := range px.RetPerPagos.RetPerPago {

		untdoc, _ := strconv.ParseUint(string(retpago.TipoDoc), 10, 64)

		rpp := models.F572Retperpagos{
			Presentacion_id: uint(presentacionId),
			Tipo:            retpago.Tipo,
			Nrodoc:          string(retpago.NroDoc),
			Tipodoc:         uint(untdoc),
			Descbasica:      string(retpago.DescBasica),
			Denominacion:    string(retpago.Denominacion),
			Descadicional:   string(retpago.DescAdicional),
			Montototal:      decimal.NewFromFloat(float64(retpago.MontoTotal)),
		}
		result := tx.Create(&rpp)
		if result.Error != nil {
			mensaje = fmt.Sprintln("Error al insertar Retperpagos: cuit-periodo-envio: ", CUIT, periodo, envio)
			return mensaje
		}
		rppID := rpp.Id

		for _, periodo := range retpago.Periodos.Periodo {

			unMesDesde, _ := strconv.ParseUint(periodo.MesDesde, 10, 64)
			unMesHasta, _ := strconv.ParseUint(periodo.MesDesde, 10, 64)
			unMtoMensual, _ := strconv.ParseUint(periodo.MesDesde, 10, 64)

			rpx := models.F572Retperpagosperiodo{
				Retperpago_id: uint(rppID),
				Mesdesde:      uint(unMesDesde),
				Meshasta:      uint(unMesHasta),
				Montomensual:  decimal.NewFromFloat(float64(unMtoMensual)),
			}

			result := tx.Create(&rpx)
			if result.Error != nil {
				mensaje = fmt.Sprintln("Error al insertar Retperpagos-periodo: cuit-periodo-envio: ", CUIT, periodo, envio)
				return mensaje
			}
		}

		/// Ret.Per.Pago Detalle
		for _, detalle := range retpago.Detalles.Detalle {

			rpde := models.F572Retperpagosdetalle{
				Retperpago_id: uint(rppID),
				Nombre:        detalle.Nombre,
				Valor:         detalle.Valor,
			}
			result := tx.Create(&rpde)
			if result.Error != nil {
				mensaje = fmt.Sprintln("Error al insertar Retperpagos-detalle: cuit-periodo-envio: ", CUIT, periodo, envio)
				return mensaje
			}
		}
	}
	return mensaje
}

func insertarPresentacionB(CUIT int64, periodo, envio int, db *gorm.DB, px *PresentacionBType) string {

	// Recupera la transaccion
	tx := gormfun.GetTX()

	mensaje := ""

	sCUIT := strconv.FormatInt(CUIT, 10)
	sEnvio := strconv.Itoa(envio)
	sPeriodo := strconv.Itoa(periodo)
	// Si ya existe, retorna - No hace nada

	pr := models.F572Presentacionb{}
	resu := db.Where("cuit = ? AND periodo = ? AND envio = ?", sCUIT, sPeriodo, sEnvio).First(&pr)
	if resu.Error != nil && resu.Error != gorm.ErrRecordNotFound {
		panic(resu.Error)
	}
	if resu.RowsAffected > 0 {
		//YA existe la Presentacion B
		return mensaje
	}

	empleadorCuit := fmt.Sprintf("%v", px.Empleado.Cuit)

	pr.Cuit = uint(CUIT)
	pr.Periodo = uint(periodo)
	pr.Envio = uint(envio)
	pr.Nropresentacion = uint(px.NroPresentacion)
	pr.Fechapresentacion = px.FechaPresentacion
	pr.Emplcuit = strings.TrimSpace(empleadorCuit)
	pr.Empltipodoc = string(px.Empleado.TipoDoc)
	pr.Emplapellido = string(px.Empleado.Apellido)
	pr.Emplnombre = string(px.Empleado.Nombre)
	pr.Dirprovincia = uint(px.Empleado.Direccion.Provincia)
	pr.Dircp = string(px.Empleado.Direccion.Cp)
	pr.Dirlocalidad = string(px.Empleado.Direccion.Localidad)
	pr.Dircalle = string(px.Empleado.Direccion.Calle)
	pr.Dirnro = string(px.Empleado.Direccion.Nro)
	pr.Dirpiso = string(px.Empleado.Direccion.Piso)
	pr.Dirdpto = string(px.Empleado.Direccion.Dpto)
	// pr.SetValue("agretcuit", px.AgenteRetencion.Cuit)
	// pr.SetValue("agretdenominacion", px.AgenteRetencion.Denominacion)

	result := tx.Create(&pr)
	if result.Error != nil {
		mensaje = fmt.Sprintln("Error al insertar presentacionB: cuit-periodo-envio: ", CUIT, periodo, envio)
		return mensaje
	}

	return mensaje
}

// valorParametroOtrosEmp
// Retorna el campo y su atributo para grabar valores de Otros Empleadores
func valorParametroOtrosEmp(db *gorm.DB) map[string]string {
	return gormfun.FindValuesSelect(db, "siradig", "f572_relacionatributos", "codigoafip", "atributo", "grupo='AFOEMPL' AND active=true", "codigoafip")
}
