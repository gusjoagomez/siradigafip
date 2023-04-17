package controller

import (
	"encoding/json"
	"net/http"
	"reflect"
	"strings"

	"siradigafip/pkg/config"
	"siradigafip/pkg/f572"
	"siradigafip/pkg/formg"
	"siradigafip/pkg/gormfun"
	models "siradigafip/pkg/modelssiradig"
	"siradigafip/pkg/mvc"
	"siradigafip/pkg/tpl"

	"github.com/gorilla/mux"
	"github.com/gorilla/sessions"
)

var AtributosRelacionID = "100004"

type AtributoController struct {
	*mvc.Controller
	Store *sessions.CookieStore
}

var Atributo *AtributoController

func init() {
	Atributo = new(AtributoController)

	config.Init("./config/config.conf")
	config.CreateConnections()
}

func (c *AtributoController) init() {
	config.Init("./config/config.conf")
	config.CreateConnections()
}

// Root ...
func (c *AtributoController) Root(w http.ResponseWriter, r *http.Request) {
	http.Redirect(w, r, "/atributo/list", http.StatusFound)
}

// List ...
func (c *AtributoController) List(w http.ResponseWriter, r *http.Request) {
	c.init()
	config.CreateConnections()
	db := config.DB("rrhh")

	ts := []string{"atributo/atributo_list.html"}
	m := make(map[string]interface{})
	m["grupos"] = f572.GetRelacionAtributosGrp(db)

	tpl.RenderTemplate(ts, w, m)
}

// Edit ...
func (c *AtributoController) Edit(w http.ResponseWriter, r *http.Request) {
	c.init()
	db := config.DB("rrhh")

	ts := []string{"atributo/atributo_form.html"}
	params := mux.Vars(r)
	d := strings.Split(params["id"], "|")

	//--- Busca el Registro ---
	criteria := map[string]interface{}{"grupo": d[0], "codigoafip": d[1]}
	atributox, _ := gormfun.GetGormObject(db, reflect.TypeOf(models.F572Relacionatributos{}), criteria)

	atributo := gormfun.FindOne(db, "f572_relacionatributos", "grupo='"+d[0]+"' AND codigoafip='"+d[1]+"'", "*")

	form := c.getForm(r, gormfun.GetValuesMapString(atributo))
	if form.Valid() {
		data := form.PostValues(r)

		atributodb := atributox.(*models.F572Relacionatributos)
		atributodb.Atributo = data["atributo"].(string)
		_, existe := data["atributo_50"]
		if existe {
			atributodb.Atributo_50 = data["atributo_50"].(string)
		}
		db.Save(atributodb)

		http.Redirect(w, r, "/atributo/list", http.StatusFound)
	}
	m := make(map[string]interface{})
	m["form"] = form
	m["entity"] = atributo

	tpl.RenderTemplate(ts, w, m)
}

// TraerDatosGrilla ...
func (c *AtributoController) TraerDatosGrilla(w http.ResponseWriter, r *http.Request) {

	var data gormfun.DatatableGrid
	c.init()
	db := config.DB("rrhh")
	data = gormfun.FindForGrid(db, "f572_relacionatributos", "*", "")

	json.NewEncoder(w).Encode(data)
}

// GetForm
func (c *AtributoController) getForm(r *http.Request, data map[string]string) *formg.Form {
	var att100, att50 string = "", ""
	db := config.DB("rrhh")

	gormfun.Schema = "public"
	lista := gormfun.FindValuesSelect(db, "tablaAuxiliarDetalle", "codigoString", "descripcion", "\"tablaAuxiliarId\"="+AtributosRelacionID, "descripcion")
	if data["porc"] == "true" {
		att100 = "Atributo 100%"
		att50 = "Atributo 50%"
	} else {
		att100 = "Atributo"
	}

	form := formg.CreateForm(r, data, "frm1", "#", "POST", "multipart/form-data")
	form.AddField("id", formg.Hidden, formg.FF{"placeholder": "Id", "label": "Id"})
	form.AddField("atributo", formg.Select, formg.FF{"placeholder": att100, "label": att100, "required": "true"}).SetOptions(lista)
	if data["porc"] == "true" {
		form.AddField("atributo_50", formg.Select, formg.FF{"placeholder": att50, "label": att50, "required": "true"}).SetOptions(lista)
	}
	gormfun.Schema = "siradig"
	return form
}

func (c *AtributoController) Register(r *mux.Router, store *sessions.CookieStore) {
	c.Store = store
	r.HandleFunc("/atributo/getdata", c.TraerDatosGrilla).Methods("GET")
	r.HandleFunc("/atributo/list", c.List).Methods("GET", "POST")
	r.HandleFunc("/atributo/{id}/edit", c.Edit).Methods("GET", "POST")
	r.HandleFunc("/", c.Root).Methods("GET")
}
