package config

import (
	"encoding/json"
	"errors"
	"fmt"
	"log"
	"os"
	"runtime"
	"strings"

	_ "github.com/lib/pq"
	"github.com/spf13/viper"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var File string
var Value map[string]interface{}
var db map[string]*gorm.DB

func Init(file string) {
	Value = map[string]interface{}{}
	db = make(map[string]*gorm.DB)
	SetDefaultConfig(file)
}

// SetDefaultConfig ... levanta la configuracion al inicio del packager
func SetDefaultConfig(file string) {
	File = file
	viper.SetConfigType("toml")
	fh, err := os.Open(File)
	if err != nil {
		fmt.Println("Archivo de configuracion NO existe: " + File)
		os.Exit(0)
	} else {
		err := viper.ReadConfig(fh)
		if err != nil {
			panic(err)
		}

		// Separador: Windows o Linux
		if runtime.GOOS == "windows" {
			Value["AppSeparator"] = "\\"
		} else {
			Value["AppSeparator"] = "/"
		}

		for _, v := range viper.AllKeys() {
			Value[v] = viper.Get(v)
		}
	}
}

func Get(v string) interface{} {
	return Value[v]
}

func VerConfiguracion() {

	fmt.Println(strings.Repeat("-", 40))
	fmt.Println("--- Configuracion ----")
	fmt.Println(strings.Repeat("-", 40))
	for k, v := range Value {
		fmt.Println("* ", k, ": ", v)
	}
	fmt.Println(strings.Repeat("-", 40))

	files := viper.GetStringMap("files")
	fmt.Println(files)
}

func deepCopyJSON(src map[string]interface{}, dest map[string]interface{}) error {
	if src == nil {
		return errors.New("src is nil. You cannot read from a nil map")
	}
	if dest == nil {
		return errors.New("dest is nil. You cannot insert to a nil map")
	}
	jsonStr, err := json.Marshal(src)
	if err != nil {
		return err
	}
	err = json.Unmarshal(jsonStr, &dest)
	if err != nil {
		return err
	}
	return nil
}

// --------------------------------------------------------
// ---- database ------
//
//	Create and return a database conection
func CreateConnections() map[string]*gorm.DB {
	var url string
	dbs := viper.GetStringMap("db")

	//fmt.Println("Conexiones creadas.")
	for k, urli := range dbs {
		if _, exist := db[k]; exist {
			//fmt.Println("*** Ya existe ***")
			continue
		}
		url = urli.(string)
		//fmt.Println(url)
		connection, err := gorm.Open(postgres.Open(url), &gorm.Config{})
		if err != nil {
			fmt.Println("-----------------------")
			fmt.Println("Error al conectarse a la base de datos.")
			fmt.Println("Debera crear la base de datos.")
			fmt.Println("-----------------------")
			log.Fatalln(err)
		}
		db[k] = connection
	}
	return db
}

// Return gorm.DB element.
func DB(k string) *gorm.DB {
	var ret *gorm.DB

	if _, ok := db[k]; ok {
		ret = db[k]
	} else {
		fmt.Println("Error. NO existe conexion configurada: " + k)
		panic(k)
	}
	return ret
}
