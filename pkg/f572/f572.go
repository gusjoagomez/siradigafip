package f572

import (
	"encoding/xml"
)

type PresentacionType struct {
	XMLName           xml.Name             `xml:"presentacion"`
	Periodo           int                  `xml:"periodo"`
	NroPresentacion   int                  `xml:"nroPresentacion"`
	FechaPresentacion string               `xml:"fechaPresentacion"`
	Empleado          EmpleadoType         `xml:"empleado"`
	CargasFamilia     CargasFamiliaType    `xml:"cargasFamilia"`
	GanLiqOtrosEmpEnt OtrosEmpEntType      `xml:"ganLiqOtrosEmpEnt"`
	Deducciones       DeduccionesType      `xml:"deducciones"`
	RetPerPagos       RetPerPagosType      `xml:"retPerPagos"`
	Sjustes           AjustesType          `xml:"sjustes"`
	DatosAdicionales  DatosAdicionalesType `xml:"datosAdicionales"`
}

type EmpleadoType struct {
	Cuit      CUITSimpleType           `xml:"cuit"`
	TipoDoc   TipoDocSimpleType        `xml:"tipoDoc"`
	Apellido  ApellidoNombreSimpleType `xml:"apellido"`
	Nombre    ApellidoNombreSimpleType `xml:"nombre"`
	Direccion DireccionType            `xml:"direccion"`
}

// type Date time.Time
type CUITSimpleType uint64
type TipoDocSimpleType int8
type NroDocSimpleType string
type ApellidoNombreSimpleType string
type ImportePNSimpleType float64
type ImporteSimpleType float64
type DescripcionSimpleType string
type DenominacionSimpleType string
type SiNoSimpleType string

type CargasFamiliaType struct {
	CargaFamilia []CargaFamiliaType `xml:"cargaFamilia"`
}

type CargaFamiliaType struct {
	TipoDoc                 TipoDocSimpleType        `xml:"tipoDoc"`
	NroDoc                  NroDocSimpleType         `xml:"nroDoc"`
	Apellido                ApellidoNombreSimpleType `xml:"apellido"`
	Nombre                  ApellidoNombreSimpleType `xml:"nombre"`
	FechaNac                string                   `xml:"fechaNac"`
	MesDesde                int                      `xml:"mesDesde"`
	MesHasta                int                      `xml:"mesHasta"`
	Parentesco              int                      `xml:"parentesco"`
	VigenteProximosPeriodos SiNoSimpleType           `xml:"vigenteProximosPeriodos"`
	FechaLimite             string                   `xml:"fechaLimite"`
	PorcentajeDeduccion     int                      `xml:"porcentajeDeduccion"`
}

type AjustesType struct {
	Ajuste []AjusteType `xml:"cuit"`
}
type AjusteType struct {
	Tipo          string                 `xml:"tipo,attr"`
	Cuit          CUITSimpleType         `xml:"cuit"`
	Denominacion  DenominacionSimpleType `xml:"denominacion"`
	DescBasica    DescripcionSimpleType  `xml:"descBasica"`
	DescAdicional DescripcionSimpleType  `xml:"descAdicional"`
	MontoTotal    ImporteSimpleType      `xml:"montoTotal"`
	Detalles      []DetallesType         `xml:"detalles"`
}

type DatosAdicionalesType struct {
	DatoAdicional []DatoAdicionalType `xml:"datoAdicional"`
}
type DatoAdicionalType struct {
	Nombre   string `xml:"nombre,attr"`
	MesDesde string `xml:"mesDesde,attr"`
	MesHasta string `xml:"mesHasta,attr"`
	Valor    string `xml:"valor,attr"`
}

type DeduccionesType struct {
	Deduccion []DeduccionType `xml:"deduccion"`
}
type DeduccionType struct {
	Tipo          string                 `xml:"tipo,attr"`
	TipoDoc       TipoDocSimpleType      `xml:"tipoDoc"`
	NroDoc        NroDocSimpleType       `xml:"nroDoc"`
	Denominacion  DenominacionSimpleType `xml:"denominacion"`
	DescBasica    DescripcionSimpleType  `xml:"descBasica"`
	DescAdicional DescripcionSimpleType  `xml:"descAdicional"`
	MontoTotal    ImporteSimpleType      `xml:"montoTotal"`
	Periodos      PeriodosType           `xml:"periodos"`
	Detalles      DetallesType           `xml:"detalles"`
}

type RetPerPagosType struct {
	RetPerPago []RetPerPagoType `xml:"retPerPago"`
}
type RetPerPagoType struct {
	Tipo          string                 `xml:"tipo,attr"`
	TipoDoc       TipoDocSimpleType      `xml:"tipoDoc"`
	NroDoc        NroDocSimpleType       `xml:"nroDoc"`
	Denominacion  DenominacionSimpleType `xml:"denominacion"`
	DescBasica    DescripcionSimpleType  `xml:"descBasica"`
	DescAdicional DescripcionSimpleType  `xml:"descAdicional"`
	MontoTotal    ImporteSimpleType      `xml:"montoTotal"`
	Periodos      PeriodosType           `xml:"periodos"`
	Detalles      DetallesType           `xml:"detalles"`
}

type PeriodosType struct {
	Periodo []PeriodoType `xml:"periodo"`
}
type PeriodoType struct {
	Text         string `xml:",chardata"`
	MesDesde     string `xml:"mesDesde,attr"`
	MesHasta     string `xml:"mesHasta,attr"`
	MontoMensual string `xml:"montoMensual,attr"`
}

type DetallesType struct {
	Detalle []DetalleType `xml:"detalle"`
}
type DetalleType struct {
	Text   string `xml:",chardata"`
	Nombre string `xml:"nombre,attr"`
	Valor  string `xml:"valor,attr"`
}

type OtrosEmpEntType struct {
	EmpEnt []EmpleadorEntidadType `xml:"empEnt"`
}
type EmpleadorEntidadType struct {
	Cuit            CUITSimpleType         `xml:"cuit"`
	Denominacion    DenominacionSimpleType `xml:"denominacion"`
	IngresosAportes []IngresosAportesType  `xml:"ingresosAportes"`
}

type IngresosAportesType struct {
	IngAp []IngApType `xml:"ingAp"`
}
type IngApType struct {
	Mes           string              `xml:"mes,attr"`
	ObraSoc       ImporteSimpleType   `xml:"obraSoc"`
	SegSoc        ImporteSimpleType   `xml:"segSoc"`
	Sind          ImporteSimpleType   `xml:"sind"`
	GanBrut       ImporteSimpleType   `xml:"ganBrut"`
	RetGan        ImportePNSimpleType `xml:"retGan"`
	RetribNoHab   ImporteSimpleType   `xml:"retribNoHab"`
	Ajuste        ImportePNSimpleType `xml:"ajuste"`
	ExeNoAlc      ImporteSimpleType   `xml:"exeNoAlc"`
	Sac           ImportePNSimpleType `xml:"sac"`
	HorasExtGr    ImporteSimpleType   `xml:"horasExtGr"`
	HorasExtEx    ImporteSimpleType   `xml:"horasExtEx"`
	MatDid        ImporteSimpleType   `xml:"matDid"`
	GastosMovViat ImporteSimpleType   `xml:"gastosMovViat"`
}
type DireccionType struct {
	Provincia int    `xml:"provincia"`
	Cp        string `xml:"cp"`
	Localidad string `xml:"localidad"`
	Calle     string `xml:"calle"`
	Nro       string `xml:"nro"`
	Piso      string `xml:"piso"`
	Dpto      string `xml:"dpto"`
}

// ----------- SECCION B - PRESENTACION -----
type PresentacionBType struct {
	XMLName           xml.Name            `xml:"presentacion"`
	Periodo           int                 `xml:"periodo"`
	NroPresentacion   int                 `xml:"nroPresentacion"`
	FechaPresentacion string              `xml:"fechaPresentacion"`
	Empleado          EmpleadoType        `xml:"empleado"`
	AgenteRetencion   AgenteRetencionType `xml:"agenteRetencion"`
}

type AgenteRetencionType struct {
	Cuit         CUITSimpleType         `xml:"cuit"`
	Denominacion DenominacionSimpleType `xml:"denominacion"`
}
