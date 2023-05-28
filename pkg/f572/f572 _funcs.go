package f572

import (
	"siradigafip/pkg/gormfun"

	"gorm.io/gorm"
)

// ---------------------
// Estructuras comunes
// ---------------------

// GetRelacionAtributosGrp : retorna valores para la grilla de Atributos grupo
func GetRelacionAtributosGrp(db *gorm.DB) []map[string]interface{} {
	var results []map[string]interface{}
	sql := "SELECT distinct obj,\"name\" FROM " + gormfun.Schema + ".f572_relacionatributosgrp order by obj"
	db.Raw(sql).Scan(&results)
	return results
}

// GetListPresentacionB
// Retorna valores para la grilla GetListPresentacionB
func GetListPresentacionB(db *gorm.DB, criteria string) gormfun.DatatableGrid {
	var datogrilla gormfun.DatatableGrid
	datogrilla = gormfun.FindForGrid(db, "siradig", "f572_presentacionb", "*", criteria)

	return datogrilla
}

// GetListPresentacion
// Retorna valores para la grilla GetListPresentacion
func GetListPresentacion(db *gorm.DB, criteria string) gormfun.DatatableGrid {
	var datogrilla gormfun.DatatableGrid
	datogrilla = gormfun.FindForGrid(db, "siradig", "f572_presentacion", "*", criteria)

	return datogrilla
}

// --------------------------------------------
// CONCEPTOS:
// --------------------------------------------
// func DetalleFamilia(db *gorm.DB, cuit, anio string) []map[string]interface{} {
// 	var grupo string = "AFPAR17"
// 	sqlx := `
// 	SELECT atributo, mes, valor FROM liqui.f572_siradigconceptos
// 	WHERE cuit=%v AND anio=%v AND atributo IN (
//   		SELECT DISTINCT atributo FROM (
// 			SELECT atributo FROM liqui.f572_relacionatributos WHERE grupo='%v'
// 			UNION
// 			SELECT atributo_50 FROM liqui.f572_relacionatributos WHERE grupo='%v'
//    		) t
// 	) ORDER BY mes`

// 	sql := fmt.Sprintf(sqlx, cuit, anio, grupo, grupo)
// 	return gormfun.FindRawSQL(db, sql)
// }

// func DetalleFamiliaAtribs(db *gorm.DB, cuit, anio string) []map[string]interface{} {

// 	var grupo string = "AFPAR17"
// 	sqlx := `
// 	SELECT DISTINCT atributo FROM liqui.f572_siradigconceptos
// 	WHERE cuit=%v AND anio=%v AND atributo IN (
//   		SELECT DISTINCT atributo FROM (
// 			SELECT atributo FROM liqui.f572_relacionatributos WHERE grupo='%v'
// 			UNION
// 			SELECT atributo_50 FROM liqui.f572_relacionatributos WHERE grupo='%v'
//    		) t
// 	)`

// 	sql := fmt.Sprintf(sqlx, cuit, anio, grupo, grupo)
// 	return gormfun.FindRawSQL(db, sql)
// }

// func DetalleDeduccion(db *gorm.DB, cuit, anio string) []map[string]interface{} {
// 	var grupo string = "AFDEDUC"
// 	sqlx := `
// 	SELECT atributo, mes, valor
// 	FROM liqui.f572_siradigconceptos
// 	WHERE cuit=%v AND anio=%v AND atributo IN (
// 		SELECT atributo FROM liqui.f572_relacionatributos WHERE grupo='%d'
// 	) ORDER BY mes`

// 	sql := fmt.Sprintf(sqlx, cuit, anio, grupo)
// 	return gormfun.FindRawSQL(db, sql)
// }

// func DetalleDeduccionAtribs(db *gorm.DB, cuit, anio string) []map[string]interface{} {

// 	var grupo string = "AFDEDUC"
// 	sqlx := `
// 	SELECT DISTINCT atributo FROM liqui.f572_siradigconceptos
// 	WHERE cuit=%v AND anio=%v AND atributo IN (
// 		SELECT atributo FROM liqui.f572_relacionatributos WHERE grupo='%d'
// 	)`

// 	sql := fmt.Sprintf(sqlx, cuit, anio, grupo)
// 	return gormfun.FindRawSQL(db, sql)
// }

// func DetalleAnios(db *gorm.DB, cuit string) []map[string]interface{} {
// 	sqlx := `SELECT DISTINCT anio FROM liqui.f572_siradigconceptos WHERE cuit=%v ORDER BY anio`
// 	sql := fmt.Sprintf(sqlx, cuit)
// 	return gormfun.FindRawSQL(db, sql)
// }

// --------------------------------------------
// DEDUCCIONES: Periodo y Detalle
// --------------------------------------------
// func DeduccionesTraerDetalle(db *gorm.DB, id int) []map[string]interface{} {
// 	istr := strconv.Itoa(id)
// 	return gormfun.Find(db, "f572_deduccionesdetalle", "deduccion_id="+istr, "*")
// }

// func DeduccionesTraerPeriodo(db *gorm.DB, id int) []map[string]interface{} {
// 	istr := strconv.Itoa(id)
// 	return gormfun.Find(db, "f572_deduccionesperiodo", "deduccion_id="+istr, "*")
// }
