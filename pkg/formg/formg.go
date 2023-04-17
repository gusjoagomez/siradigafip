package formg

import (
	"bytes"
	"fmt"
	"html/template"
	"net/http"
	"siradigafip/pkg/mvc"
	"strings"
)

// Input field types
const (
	Button        = "button"
	Checkbox      = "checkbox"
	Color         = "color" // Not yet implemented
	Date          = "date"
	DateTime      = "datetime"
	DateTimeLocal = "datetime-local"
	Email         = "email" // Not yet implemented
	File          = "file"  // Not yet implemented
	Hidden        = "hidden"
	Imag          = "image" // Not yet implemented
	Month         = "month" // Not yet implemented
	Number        = "number"
	Password      = "password"
	Radio         = "radio"
	Range         = "range"
	Reset         = "reset"
	Search        = "search" // Not yet implemented
	Submit        = "submit"
	Tel           = "tel" // Not yet implemented
	Text          = "text"
	Time          = "time"
	URL           = "url"  // Not yet implemented
	Week          = "week" // Not yet implemented
	TextArea      = "textarea"
	Select        = "select"
	Static        = "static"
	CSRF          = "csrf"
)
const DIRTPL = "app/view/_global/tpl"

// FF ... Form Fields Data
type FF map[string]string

// FAttr ... Atributos del formulario
type FAttr map[string]string

// ----------------------------------------------------------------------------------------------------------
// Field --
type Field struct {
	id        string
	fieldType string
	Attribs   map[string]string
	Options   map[string]string
	Form      *Form
}

// Form -- formulario
type Form struct {
	template    *template.Template
	DirTemplate string
	columns     int
	Type        string            //form: form normal, properties: para propiedades
	Attribs     map[string]string // Atributos del formulario
	Data        map[string]string // Datos actuales
	Fields      []Field           // Id campo y atributos
	C           mvc.Controller    // Request
}

// ----------------------------------------------------------------------------------------------------------

func (f *Field) init() {
	f.Form.Type = "form"
}

// GetID ... Recupera el id del campo
func (f *Field) GetID() string {
	return f.id
}

// SetOptions -- Agrega un field al formulario
func (f *Field) SetOptions(options map[string]string) *Field {
	for k, v := range options {
		f.Options[k] = v
	}
	return f
}

// Render -- Hace render sobre elemento field
func (f *Field) Render() string {

	var err error

	//--- inicializa los datos para el template
	data := make(map[string]interface{})
	aux := map[string]string{"frmname": f.Form.Attribs["name"], "id": f.id, "type": f.fieldType}

	htmlattr := make(map[string]string)
	htmlattr["id"] = f.Form.Attribs["name"] + "_" + f.id
	htmlattr["name"] = f.Form.Attribs["name"] + "_" + f.id
	aux["value"] = ""

	for k, v := range f.Attribs {
		if f.fieldType != Hidden {
			if f.Form.Attribs["disabled"] != "" {
				htmlattr["disabled"] = "true"
			}
		}

		if f.Form.Attribs["class"] != "" {
			htmlattr["class"] = htmlattr["class"] + " " + f.Form.Attribs["class"]
		}

		switch k {
		case "caption", "label", "class", "type":
			aux[k] = v
		default:
			htmlattr[k] = v
		}
	}

	//fmt.Println("----DATOS DEL FORM----")
	//fmt.Println(f.Form.Data)
	//fmt.Println("----------------------")

	_, exist := f.Form.Data[f.id]
	if exist {
		aux["value"] = fmt.Sprintf("%v", f.Form.Data[f.id])
	}

	data["data"] = aux
	data["attr"] = htmlattr
	data["opts"] = f.Options

	//fmt.Println("----DATOS FINALES----")
	//fmt.Println(data)
	//fmt.Println("----------------------")

	if f.Form.DirTemplate == "" {
		fmt.Println("*** Directorio templates para formulario NO configurado ***")
	}

	t, err := template.ParseFiles(f.Form.DirTemplate + "/" + f.Form.Type + "/" + f.fieldType + ".html")
	if err != nil {
		panic(err)
	}

	var buf bytes.Buffer
	if err := t.Execute(&buf, data); err != nil {
		panic(err)
	}
	return buf.String()
}

// CreateForm ... create form structure
// func CreateForm(c mvc.Controller, data map[string]interface{}, name, typeform string) *Form {
// 	var aform *Form
// 	aform = new(Form)
// 	aform.C = c
// 	aform.columns = 1
// 	if typeform == "" {
// 		typeform = "form"
// 	}
// 	aform.Type = typeform

// 	//aform.AddField("csrfField", CSRF, FF{})
// 	aform.Attribs = map[string]string{"name": name, "id": name}
// 	aform.Data = make(map[string]string)

// 	// aform.Data["csrfField"] = csrf.Token(r)
// 	if data != nil {
// 		for k, v := range data {
// 			aform.Data[k] = fmt.Sprintf("%v", v)
// 		}
// 	}
// 	// fmt.Println("----valores data----")
// 	// fmt.Println(aform.Data)

// 	return aform
// }

// CreateForm -- create form structure
func CreateForm(r *http.Request, data map[string]string, name, action, method, enctype string) *Form {
	var aform *Form
	aform = new(Form)
	aform.C.Request = r
	aform.Type = "form"
	aform.DirTemplate = DIRTPL
	//aform.AddField("csrfField", CSRF, FF{})

	aform.Attribs = map[string]string{"name": name, "action": action, "method": method, "enctype": enctype}
	aform.Data = make(map[string]string)

	//aform.Data["csrfField"] = csrf.Token(r)
	if data != nil {
		for k, v := range data {
			aform.Data[k] = v
		}
	}

	return aform
}

// CreateFormAttr ... create form structure
/*
func CreateFormAttr(c mvc.Controller, data map[string]interface{}, attr FAttr) *Form {
	var aform *Form
	aform = new(Form)
	aform.C = c
	aform.Attribs = attr

	aform.Data = make(map[string]string)
	if data != nil {
		for k, v := range data {
			aform.Data[k] = fmt.Sprintf("%v", v)
		}
	}
	return aform
}
*/

func (aform *Form) SetDirTemplate(dir string) {
	aform.DirTemplate = dir
}

// PostValues -- Retrieve data post from Form called fname
func (aform *Form) PostValues(r *http.Request) map[string]interface{} {

	const (
		defaultMaxMemory = 32 << 20 // 32 MB
	)
	r.ParseMultipartForm(defaultMaxMemory)
	// if len(r.PostForm) > 0 {
	// 	for k := range r.PostForm {
	// 		fmt.Println(r.FormValue(k))
	// 	}
	// }

	res := make(map[string]interface{})
	isPost := (r.Method == http.MethodPost)
	if isPost {
		fname := aform.Attribs["name"]
		if fname != "" {
			fname = fname + "_"
		}

		for k, vs := range r.PostForm {
			for _, value := range vs {
				nk := strings.Replace(k, fname, "", -1) //Quita el nombre de form
				res[nk] = value
			}
		}
		// Form parameters append
		// params := r.PostFormValue("params")
		// for k, v := range params {
		// 	if strings.Contains(k, fname) {
		// 		nk = strings.ReplaceAll(k, fname, "")
		// 		res[nk] = strings.Join(v, "")
		// 	}
		// }

		//--- corrige campo checkbox
		for _, f := range aform.Fields {
			if f.fieldType == Checkbox {
				_, exist := res[f.id]
				if exist {
					res[f.id] = 1
				} else {
					res[f.id] = 0
				}
			}
		}
	}

	return res
}

// AddField -- Agrega un field al formulario
func (aform *Form) AddField(id, tipo string, attribs map[string]string) *Field {

	options := make(map[string]string)
	ff := Field{id: id, fieldType: tipo, Attribs: attribs, Form: aform, Options: options}
	aform.Fields = append(aform.Fields, ff)

	return &ff
}

// SetValues ... asigna valores a Data
func (aform Form) SetValues(data map[string]interface{}) {
	for k, v := range data {
		aform.Data[k] = fmt.Sprintf("%v", v)
	}
}

// SetAttribute ... asigna atributos a valores
func (aform Form) SetAttribute(index, value string) {
	aform.Attribs[index] = value
}

// Valid --- Si es valido o no el formulario
func (aform *Form) Valid() bool {
	var ret bool
	ret = (aform.C.Request.Method == http.MethodPost)

	return ret
}

// SetColumns --- setea la cantidad de columnas que tiene el Formulario
func (aForm *Form) SetColumns(cantColumns int) {
	aForm.columns = cantColumns
}

// Render -- Retorna el codigo html del formulario
func (aform *Form) Render() template.HTML {

	var attribs string
	for k, v := range aform.Attribs {
		attribs = attribs + " " + k + "=\"" + v + "\""
	}
	content := "<form " + attribs + " enctype='multipart/form-data'  >" + aform.RenderFields(nil) + "</form>"

	return template.HTML(content)
}

// RenderWidgets -- Retorna el codigo html del formulario
func (aform *Form) RenderWidgets() template.HTML {
	content := aform.RenderFields(nil)
	return template.HTML(content)
}

// RenderFields - Hace render de todos los campos del formulario
func (aform *Form) RenderFields(val map[string]interface{}) string {

	var contCol int = 0
	var colabierta = false

	content := ""
	for _, field := range aform.Fields {

		//--- abre column
		if aform.Type == "form" {
			if contCol == 0 {
				content = content + "<div class=\"row\">"
				colabierta = true
			}
		}
		contCol++
		content = content + field.Render()

		//--- cierra colum cuando llegoa cantidad configurada
		if aform.Type == "form" {
			if contCol >= aform.columns {
				content = content + "</div>"
				contCol = 0
				colabierta = false
			}
		}
	}
	if aform.Type == "form" {
		if colabierta {
			content = content + "</div>"
		}
	}

	return content
}

// HandlerRequest ... create form structure
func (aform Form) HandlerRequest(data map[string]interface{}) (bool, map[string]interface{}) {

	isPost := (aform.C.Request.Method == http.MethodPost)
	if isPost {
		data = aform.PostValues(aform.C.Request)
		aform.SetValues(data)
		return true, data
	}

	return false, data

}

// Validator -- Agrega un validador para un campo de formulario
// func (aform *Form) Validator(f string, v revel.Validator) *Form {

// 	return nil
// }
