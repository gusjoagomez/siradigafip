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

	config.CreateConnections()

	db := config.DB("rrhh")

	params := mux.Vars(r)
	if params["id"] != "" {

		id := params["id"] //ID presentacion

		// Depende del tipo de presentacion a o b
		m["tipo"] = strings.ToUpper(params["tipo"])
		if params["tipo"] == "b" {

			Presentacion := gormfun.FindOne(db, "f572_presentacionb", "id="+id, "*")
			m["PR"] = Presentacion

			/// Descipcion provincia
			m["PROV"] = TraerDescripcionProvincia(db, Presentacion["dirprovincia"].(int64))

		} else {
			Presentacion := gormfun.FindOne(db, "f572_presentacion", "id="+id, "*")
			m["PR"] = Presentacion
			m["CFS"] = gormfun.Find(db, "f572_cargasfamilia", "presentacion_id="+id, "*")
			m["OES"] = gormfun.Find(db, "f572_otrosempl", "presentacion_id="+id, "*")

			/// Descipcion provincia
			m["PROV"] = TraerDescripcionProvincia(db, Presentacion["dirprovincia"].(int64))

			//----Deducciones--------------------
			datades := gormfun.Find(db, "f572_deducciones", "presentacion_id="+id, "*")

			for k, item := range datades {
				id := strconv.FormatInt(item["id"].(int64), 10)
				deta := gormfun.Find(db, "f572_deduccionesdetalle", "deduccion_id="+id, "*")
				datades[k]["DET"] = deta
			}
			for k, item := range datades {
				id := strconv.FormatInt(item["id"].(int64), 10)
				deta := gormfun.Find(db, "f572_deduccionesperiodo", "deduccion_id="+id, "*")
				datades[k]["PER"] = deta
			}
			m["DES"] = datades

			//----RetPerPagos--------------------
			datares := gormfun.Find(db, "f572_retperpagos", "presentacion_id="+id, "*")
			for k, item := range datares {
				id := strconv.FormatInt(item["id"].(int64), 10)
				detx := gormfun.Find(db, "f572_retperpagosdetalle", "retperpago_id="+id, "*")
				datares[k]["DET"] = detx
			}
			for k, item := range datares {
				id := strconv.FormatInt(item["id"].(int64), 10)
				detx := gormfun.Find(db, "f572_retperpagosperiodo", "retperpago_id="+id, "*")
				datares[k]["PER"] = detx
			}
			m["RES"] = datares

			m["SAS"] = gormfun.Find(db, "f572_sajustes", "presentacion_id="+id, "*")
			m["DAS"] = gormfun.Find(db, "f572_datadicional", "presentacion_id="+id, "*")
		}
	}
	tpl.RenderTemplate(ts, w, m)
}

func TraerDescripcionProvincia(db *gorm.DB, provId int64) string {
	codprov := strconv.FormatInt(provId, 10)
	ret := gormfun.FindOne(db, "f572_relacionatributos", "grupo ='AFPROVI' AND codigoafip ='"+codprov+"'", "descripafip")

	return ret["descripafip"].(string)

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
