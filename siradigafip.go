package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
	"path/filepath"
	con "siradigafip/app/controller"
	config "siradigafip/pkg/config"
	"siradigafip/pkg/f572"
	"strings"

	"github.com/gorilla/mux"
	"github.com/gorilla/sessions"
)

func main() {

	var pAyuda, pProcesar, pConfig, pWeb bool

	config.Init("./config/config.conf")

	appname := filepath.Base(os.Args[0])

	txtAyuda := fmt.Sprintf("Muestra opciones de ayuda. \n Ejemplo: %s -ayuda \n", appname)
	txtProcesar := fmt.Sprintf("Procesa archivo desde linea de comandos. \n Ejemplo: %s -procesar <archivoZip>\n", appname)
	txtConfig := fmt.Sprintf("Muestra las opciones de configuracion actualmente cargadas.\n Ejemplo: %s -configuracion\n", appname)
	txtWeb := fmt.Sprintf("Ejecuta la interface web.\n %s Ejemplo: -web \n", appname)

	flag.BoolVar(&pAyuda, "ayuda", false, txtAyuda)
	flag.BoolVar(&pProcesar, "procesar", false, txtProcesar)
	flag.BoolVar(&pWeb, "web", false, txtWeb)
	flag.BoolVar(&pConfig, "configuracion", false, txtConfig)
	flag.Parse()

	if len(os.Args) <= 1 {
		fmt.Println("\nUse los siguientes comandos: ...")
		flag.PrintDefaults()
		os.Exit(0)
	}

	// MUESTRA AYUDA
	if pAyuda {
		flag.PrintDefaults()
	} else if pConfig { // Muestra Configuracion
		config.VerConfiguracion()
	} else if pProcesar { // Procesa desde linea de comandos
		if len(os.Args) <= 2 {
			fmt.Println(strings.Repeat("-", 45))
			fmt.Println("ATENCION: Debe indicar la ruta al archivo ZIP")
			fmt.Println(strings.Repeat("-", 45))
			flag.PrintDefaults()
		} else {
			mensaje := f572.ProcesarZip(os.Args[2])
			if mensaje != "" {
				ImprimirMensaje(mensaje)
			}
		}
	} else if pWeb { // Procesa Interface web
		var store = sessions.NewCookieStore([]byte("MiSesionFlashAbracadabra"))
		router := mux.NewRouter()
		con.ProjectF572.Register(router, store)
		con.Atributo.Register(router, store)

		//-- Archivos estaticos --
		portHttp := config.Get("http.port").(string)
		router.PathPrefix("/public/").Handler(http.StripPrefix("/public/", http.FileServer(http.Dir("./public"))))
		fmt.Println("---------------------------------------------")
		fmt.Println("Ejecute el aplicativo en un navegador/browser")
		fmt.Println("Escuchando en:  http://localhost" + portHttp)
		fmt.Println("---------------------------------------------")
		log.Fatal(http.ListenAndServe(portHttp, router))
	} else {
		fmt.Println("\nUse los siguientes comandos: ...")
		flag.PrintDefaults()
		os.Exit(0)
	}
}

func ImprimirMensaje(msg string) {
	fmt.Println("")
	fmt.Println("")
	fmt.Println("---------------------------------------------")
	fmt.Println(" ATENCION: El proceso Arrojó los siguientes mensajes: ")
	fmt.Println("---------------------------------------------")
	fmt.Println(msg)
	fmt.Println("---------------------------------------------")
}
