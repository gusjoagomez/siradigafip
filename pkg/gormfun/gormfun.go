package gormfun

import (
	"fmt"
	"reflect"
	"strings"

	"github.com/shopspring/decimal"
	"gorm.io/gorm"
)

var Schema = "siradig"
var currenTX *gorm.DB = nil

// ----------------------------------------------------------
// Estructura para retornar datos de la grilla
// ----------------------------------------------------------
// DatatableGrid -- estructura para mostrar en datatables
// ----------------------------------------------------------
type DatatableGrid struct {
	Draw            int                      `json:"draw"`
	RecordsTotal    int                      `json:"recordsTotal"`
	RecordsFiltered int                      `json:"recordsFiltered"`
	Data            []map[string]interface{} `json:"data"`
}

// FindForGrid --
// Trae los valores formateados para mostrar en la grilla web Datatables
func FindForGrid(db *gorm.DB, schema, table, fields, criteria string) DatatableGrid {

	var results []map[string]interface{}
	db.Where(criteria).Table(schema + "." + table).Find(&results)
	ret := DatatableGrid{
		Draw: 1, RecordsTotal: len(results), RecordsFiltered: len(results), Data: results,
	}
	return ret
}

// FindValuesSelect
// Retorna un map de la forma Key=Value para una tabla y criteria
// Generalmente se utiliza para armar "selects" para formularios
func FindValuesSelect(db *gorm.DB, schema, table, kk, kv, criteria, order string) map[string]string {
	var results []map[string]interface{}

	db.Select(kk, kv).Where(criteria).Table(schema + "." + table).Order(order).Find(&results)
	kk = strings.ReplaceAll(kk, `"`, "") //quita comillas dobles

	result := make(map[string]string)
	for _, valrec := range results {
		k := fmt.Sprintf("%s", valrec[kk])
		v := fmt.Sprintf("%s", valrec[kv])
		result[k] = v
	}
	return result
}

// GetValuesMapString
// Retorna propiedades de un map de interface{} pero de la forma KEY=Value
func GetValuesMapString(obj map[string]interface{}) map[string]string {
	ret := make(map[string]string)
	for k, v := range obj {
		ret[k] = fmt.Sprintf("%v", v)
	}
	return ret
}

// ObjectToMapString
// Retorna propiedades de un objecto pero de la forma KEY=Value
func ObjectToMapString(obj interface{}) map[string]string {
	m := make(map[string]string)

	v := reflect.ValueOf(obj)
	t := v.Type()

	for i := 0; i < v.NumField(); i++ {
		key := strings.ToLower(t.Field(i).Name)
		value := v.Field(i).Interface()

		switch value.(type) {
		case string:
			m[key] = value.(string)
		case int:
			m[key] = fmt.Sprintf("%d", value.(int))
		case uint:
			m[key] = fmt.Sprintf("%d", value.(uint))
		case float64:
			m[key] = fmt.Sprintf("%f", value.(float64))
		case decimal.Decimal:
			m[key] = value.(decimal.Decimal).String() //fmt.Sprintf("%s", value.String())
		default:
			// OTROS tipos. Que ahora NO me interesan
		}
	}

	return m
}

// func GetGormObject(db *gorm.DB, entityType reflect.Type, criteria interface{}) (interface{}, error) {
// 	entity := reflect.New(entityType).Interface() // Crea una nueva instancia de la entidad
// 	// Busca el primer registro que concuerde con el criteria
// 	err := db.Where(criteria).First(entity).Error
// 	if err != nil && err != gorm.ErrRecordNotFound {
// 		return nil, err
// 	}
// 	// Retorna el objeto Gorm en la instancia de la entidad
// 	return entity, nil
// }

// SetSchema: setea el esquema default
func SetSchema(sch string) {
	Schema = sch
}

// SetTX: setea la transaction default
func SetTX(Tx *gorm.DB) {
	currenTX = Tx
}

// GetTX: Obtiene la transaccion default
func GetTX() *gorm.DB {
	return currenTX
}

// ClearTX: Quita transaction default
func ClearTX() {
	currenTX = nil
}
