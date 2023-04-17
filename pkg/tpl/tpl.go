package tpl

import (
	"html/template"
	"log"
	"net/http"
	"path/filepath"
)

var dirGbl, dirTpl string
var listBase []string

// Inicializa los directorios de template Global y especifico para template
func init() {
	dirTpl = "app/view/"
	dirGbl = "app/view/_global/"
	listBase, _ = filepath.Glob(dirGbl + "*.html")
}

// RenderTemplate -- Ejecuta render de los archivos pasados. El ultimo de la lista se ejecutara.
// Se puede ademas pasar data
func RenderTemplate(files []string, w http.ResponseWriter, data interface{}) {

	//Concatena el prefijo de directorio de vista al archivo que se pasa
	for k, v := range files {
		files[k] = dirTpl + v
	}

	listTemplates := append(listBase, files...)

	//fmt.Println(listTemplates)
	tplname := filepath.Base(listTemplates[len(listTemplates)-1])

	ts, err := template.New(tplname).ParseFiles(listTemplates...)
	if err != nil {
		log.Println(err.Error())
		http.Error(w, "Internal Server Error. Loading template. -", 500)
		return
	}

	// fmt.Println("***data template***:")
	// fmt.Println(data)
	// fmt.Println("************************")
	err = ts.Execute(w, data)
	if err != nil {
		log.Println(err.Error())
		http.Error(w, "Internal Server Error - RenderTemplate. -", 500)
	}
}
