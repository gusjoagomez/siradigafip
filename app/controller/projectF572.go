package controller

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"
	"strconv"
	"strings"

	"siradigafip/pkg/config"
	"siradigafip/pkg/f572"
	"siradigafip/pkg/gormfun"
	models "siradigafip/pkg/modelssiradig"

	"siradigafip/pkg/mvc"
	"siradigafip/pkg/tpl"

	"github.com/gorilla/mux"
	"github.com/gorilla/sessions"
	"gorm.io/gorm"
)

type ProjectF572Controller struct {
	*mvc.Controller
	Store *sessions.CookieStore
}

var ProjectF572 *ProjectF572Controller

func init() {
	ProjectF572 = new(ProjectF572Controller)
	config.Init("./config/config.conf")
	config.CreateConnections()
}
func (c *ProjectF572Controller) init() {
	config.Init("./config/config.conf")
	config.CreateConnections()
}

// Root ...
func (c *ProjectF572Controller) Root(w http.ResponseWriter, r *http.Request) {
	http.Redirect(w, r, "/project/a/list", http.StatusFound)
}

// List ...
func (c *ProjectF572Controller) List(w http.ResponseWriter, r *http.Request) {
	ts := []string{"projectf572/projectf572_list.html"}
	m := make(map[string]interface{})
	params := mux.Vars(r)
	m["tipo"] = params["tipo"]
	tpl.RenderTemplate(ts, w, m)
}

// Edit ...
func (c *ProjectF572Controller) Edit(w http.ResponseWriter, r *http.Request) {
	ts := []string{"projectf572/projectf572_form.html"}
	tpl.RenderTemplate(ts, w, nil)
}

// This is where the action happens.
func (c *ProjectF572Controller) Process(w http.ResponseWriter, r *http.Request) {
	var mensaje string = ""
	var archivoDestino string = ""
	c.init()

	// Maximo de subida: 10 MB
	r.ParseMultipartForm(10 << 20)
	file, handler, err := r.FormFile("archivozip")
	if err != nil {
		mensaje = "Error recuperando archivo zip: " + archivoDestino
	}
	defer file.Close()

	// Crea el archivo
	Dir_xml := config.Get("dir.xml").(string)
	archivoDestino = Dir_xml + "/" + handler.Filename
	dst, err := os.Create(archivoDestino)
	defer dst.Close()
	if err != nil {
		mensaje = "Error al intentar crear archivo: " + archivoDestino
	}

	fmt.Println("archivo destino: ", archivoDestino)

	// Copia el archivo creado a la ubicacion definitiva
	if _, err := io.Copy(dst, file); err != nil {
		mensaje = "Error al copiar el archivo zip a carpeta temporal de trabajo: " + archivoDestino
	}

	// Procesa el archivo
	res := make(map[string]string)
	//mensaje = ""
	mensaje = f572.ProcesarZip(archivoDestino)

	res["mensaje"] = mensaje
	json.NewEncoder(w).Encode(res)
}

// TraerDatosGrilla ...
func (c *ProjectF572Controller) TraerDatosGrilla(w http.ResponseWriter, r *http.Request) {
	var data gormfun.DatatableGrid
	c.init()
	config.CreateConnections()
	db := config.DB("rrhh")

	params := mux.Vars(r)
	if params["tipo"] == "b" {
		data = f572.GetListPresentacionB(db, "")
	} else {
		data = f572.GetListPresentacion(db, "")
	}
	json.NewEncoder(w).Encode(data)
}

// TraerDatosGrilla ...
func (c *ProjectF572Controller) Ver(w http.ResponseWriter, r *http.Request) {
	ts := []string{"projectf572/projectf572_ver.html"}
	m := make(map[string]interface{})
	Presentacion := models.F572Presentacion{}
	PresentacionB := models.F572Presentacionb{}

	config.CreateConnections()

	db := config.DB("rrhh")

	params := mux.Vars(r)
	if params["id"] != "" {

		id := params["id"] //ID presentacion

		// Depende del tipo de presentacion a o b
		m["tipo"] = strings.ToUpper(params["tipo"])
		if params["tipo"] == "b" {

			db.First(&PresentacionB, id)
			m["PR"] = PresentacionB

			/// Descipcion provincia
			m["PROV"] = TraerDescripcionProvincia(db, int64(PresentacionB.Dirprovincia))

		} else {

			CargasFamilias := []models.F572Cargasfamilia{}
			OtrosEmpl := []models.F572Otrosempl{}
			Deducciones := []models.F572Deducciones{}
			DeduccionesDetalle := []models.F572Deduccionesdetalle{}
			DeduccionesPeriodo := []models.F572Deduccionesperiodo{}
			datades := make(map[int]map[string]interface{}, 0)
			datares := make(map[int]map[string]interface{}, 0)

			db.First(&Presentacion, id)
			db.Where("presentacion_id = ?", id).Find(&CargasFamilias)
			db.Where("presentacion_id = ?", id).Find(&OtrosEmpl)

			m["PR"] = Presentacion
			m["CFS"] = CargasFamilias
			m["OES"] = OtrosEmpl

			/// Descipcion provincia
			m["PROV"] = TraerDescripcionProvincia(db, int64(Presentacion.Dirprovincia))

			//----Deducciones--------------------
			db.Where("presentacion_id = ?", id).Find(&Deducciones)

			for k, item := range Deducciones {
				id := strconv.FormatInt(int64(item.Id), 10)
				db.Where("deduccion_id = ?", id).Find(&DeduccionesDetalle)
				datades[k] = make(map[string]interface{})
				datades[k]["GEN"] = item
				datades[k]["DET"] = DeduccionesDetalle
			}
			for k, item := range Deducciones {
				id := strconv.FormatInt(int64(item.Id), 10)
				db.Where("deduccion_id = ?", id).Find(&DeduccionesPeriodo)
				datades[k]["PER"] = DeduccionesPeriodo
			}
			m["DES"] = datades

			//----RetPerPagos--------------------
			RetPerPagos := []models.F572Retperpagos{}
			RetPerPagosDetalle := []models.F572Retperpagosdetalle{}
			RetPerPagosPeriodo := []models.F572Retperpagosperiodo{}

			db.Where("presentacion_id = ?", id).Find(&RetPerPagos)
			for k, item := range RetPerPagos {
				id := strconv.FormatInt(int64(item.Id), 10)
				db.Where("retperpago_id = ?", id).Find(&RetPerPagosDetalle)
				datares[k] = make(map[string]interface{})
				datares[k]["GEN"] = item
				datares[k]["DET"] = RetPerPagosDetalle
			}

			for k, item := range RetPerPagos {
				id := strconv.FormatInt(int64(item.Id), 10)
				db.Where("retperpago_id = ?", id).Find(&RetPerPagosPeriodo)
				datares[k] = make(map[string]interface{})
				datares[k]["GEN"] = item
				datares[k]["PER"] = RetPerPagosPeriodo
			}
			m["RES"] = datares

			SAjustes := []models.F572Sajustes{}
			db.Where("presentacion_id = ?", id).Find(&SAjustes)
			m["SAS"] = SAjustes

			Datadicional := []models.F572Datadicional{}
			db.Where("presentacion_id = ?", id).Find(&Datadicional)
			m["DAS"] = Datadicional
		}
	}

	tpl.RenderTemplate(ts, w, m)
}

func TraerDescripcionProvincia(db *gorm.DB, provId int64) string {
	codprov := strconv.FormatInt(provId, 10)
	Atributo := models.F572Relacionatributos{}
	db.Where("grupo ='AFPROVI' AND codigoafip = ?", codprov).Find(&Atributo)
	return Atributo.Descripafip //ret["descripafip"].(string)
}

func (c *ProjectF572Controller) Register(r *mux.Router, store *sessions.CookieStore) {
	c.Store = store
	r.HandleFunc("/project/{tipo}/getdata", c.TraerDatosGrilla).Methods("GET")
	r.HandleFunc("/project/{tipo}/list", c.List).Methods("GET", "POST")
	r.HandleFunc("/project/{tipo}/{id}/ver", c.Ver).Methods("GET")
	r.HandleFunc("/project/upload", c.Edit).Methods("GET", "POST")
	r.HandleFunc("/project/process", c.Process).Methods("POST")
	r.HandleFunc("/", c.Root).Methods("GET")
}
