package gormfun

import (
	"fmt"
	"reflect"
	"strings"

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

// --------------------------------------------
// FUNCIONES HELPER GORM - COMPLEMENTARIAS
// --------------------------------------------
func FindRawSQL(db *gorm.DB, sql string) []map[string]interface{} {
	result, err := ExeQuery(db, sql)
	if err != nil {
		fmt.Println("***** ERROR SQL: ", sql)
		panic(err)
	}
	return result
}

// ExeQuery ... Execute query and return values in a map.
func ExeQuery(db *gorm.DB, query string) ([]map[string]interface{}, error) {
	var result []map[string]interface{}

	rows, err := db.Raw(query).Rows()

	if err != nil {
		return nil, err
	}
	defer rows.Close()

	columns, err := rows.Columns()
	if err != nil {
		return nil, err
	}

	values := make([]interface{}, len(columns))
	valuePtrs := make([]interface{}, len(columns))

	for rows.Next() {
		for i := range columns {
			valuePtrs[i] = &values[i]
		}
		if err := rows.Scan(valuePtrs...); err != nil {
			return nil, err
		}
		row := make(map[string]interface{})
		for i, col := range columns {
			val := values[i]
			b, ok := val.([]byte)
			if ok {
				row[col] = string(b)
			} else {
				row[col] = val
			}
		}
		result = append(result, row)
	}
	return result, nil
}

func ExeQueryTX(tx *gorm.DB, query string) ([]map[string]interface{}, error) {
	var result []map[string]interface{}

	rows, err := tx.Raw(query).Rows()
	if err != nil {
		return nil, err
	}

	defer rows.Close()

	columns, err := rows.Columns()
	if err != nil {
		return nil, err
	}

	values := make([]interface{}, len(columns))
	valuePtrs := make([]interface{}, len(columns))

	for rows.Next() {
		for i := range columns {
			valuePtrs[i] = &values[i]
		}

		if err := rows.Scan(valuePtrs...); err != nil {
			return nil, err
		}

		row := make(map[string]interface{})
		for i, col := range columns {
			val := values[i]

			b, ok := val.([]byte)
			if ok {
				row[col] = string(b)
			} else {
				row[col] = val
			}
		}
		result = append(result, row)
	}

	return result, nil
}

// FindOneFields ... Find a unique record according Criteria
// Return: array related record
func FindOne(db *gorm.DB, table, criteria, fields string) map[string]interface{} {
	sql := FindSQL(db, table, criteria, fields, "")
	sql = sql + " LIMIT 1"
	resultdb, _ := ExeQuery(db, sql)
	if len(resultdb) > 0 {
		return (resultdb[0])
	} else {
		return nil
	}
}

func Find(db *gorm.DB, table, criteria, fields string) []map[string]interface{} {
	sql := FindSQL(db, table, criteria, fields, "")
	resultdb, _ := ExeQuery(db, sql)
	return resultdb
}

func FindSQL(db *gorm.DB, table, criteria, fields, orderby string) string {

	sql := "SELECT " + fields + " FROM \"" + Schema + "\".\"" + table + "\" WHERE 1=1 "
	if criteria != "" {
		sql += " AND " + criteria
	}
	if orderby != "" {
		sql += " ORDER BY " + orderby
	}

	return sql
}

// FindForGrid --
func FindForGrid(db *gorm.DB, table, fields, criteria string) DatatableGrid {
	sql := FindSQL(db, table, criteria, fields, "")
	result, _ := ExeQuery(db, sql)
	ret := DatatableGrid{
		Draw: 1, RecordsTotal: len(result), RecordsFiltered: len(result), Data: result,
	}
	return ret
}

// FindValuesSelect ... Generate a map with Key=>Value to implement on Select html component
// Return: string list with a separator.
func FindValuesSelect(db *gorm.DB, table, kk, kv, criteria, order string) map[string]string {
	result := make(map[string]string)
	fields := "\"" + kk + "\",\"" + kv + "\""
	sql := FindSQL(db, table, criteria, fields, order)
	resdb, _ := ExeQuery(db, sql)
	for _, valrec := range resdb {

		k := valrec[kk].(string)
		v := valrec[kv].(string)
		result[k] = v
	}
	return result
}

func GetValuesMapString(obj map[string]interface{}) map[string]string {
	ret := make(map[string]string)
	for k, v := range obj {
		ret[k] = fmt.Sprintf("%v", v)
	}
	return ret
}

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
		default:
			// OTROS tipos. Que ahora NO me interesan
		}
	}

	return m
}

func GetGormObject(db *gorm.DB, entityType reflect.Type, criteria interface{}) (interface{}, error) {

	entity := reflect.New(entityType).Interface() // Crea una nueva instancia de la entidad
	// Busca el primer registro que concuerde con el criteria
	err := db.Where(criteria).First(entity).Error
	if err != nil && err != gorm.ErrRecordNotFound {
		return nil, err
	}
	// Retorna el objeto Gorm en la instancia de la entidad
	return entity, nil
}

func SetSchema(sch string) {
	Schema = sch
}

func SetTX(Tx *gorm.DB) {
	currenTX = Tx
}
func GetTX() *gorm.DB {
	return currenTX
}
func ClearTX() {
	currenTX = nil
}
