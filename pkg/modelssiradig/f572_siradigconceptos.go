package models

import (
	"fmt"
	"siradigafip/pkg/gormfun"
	"time"

	"gorm.io/gorm"
)

type F572Siradigconceptos struct {
	//gorm.Model       // adds ID, created_at etc.
	Id        int       `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Legajo    uint      `json:"legajo" gorm:"not null;type:int8;default:0;column:legajo"`
	Cuit      uint      `json:"cuit" gorm:"not null;type:int8;column:cuit"`
	Anio      uint      `json:"anio" gorm:"not null;type:int4;column:anio"`
	Mes       uint      `json:"mes" gorm:"not null;type:smallint;column:mes"`
	Nrover    uint      `json:"nrover" gorm:"not null;type:int4;column:nrover"`
	Atributo  string    `json:"atributo" gorm:"not null;type:varchar(30);column:atributo"`
	Valor     uint      `json:"valor" gorm:"type:numeric(10,2);column:valor"`
	Createdat time.Time `json:"createdat" gorm:"type:timestamp;column:createdat"`
	Updatedat time.Time `json:"updatedat" gorm:"type:timestamp;column:updatedat"`
	Estadoliq string    `json:"estadoliq" gorm:"type:varchar(1);column:estadoliq"`
}

func (e *F572Siradigconceptos) TableName() string {
	return "siradig.f572_siradigconceptos"
}

func (c *F572Siradigconceptos) SetGrupoTipo(db *gorm.DB, legajo, cuit int64, anio, mes, version int, grupo, tipo string, valor float64) bool {
	var ret bool = false

	// sql := "SELECT atributo FROM liqui.f572_relacionatributos WHERE grupo='" + grupo + "' AND codigoafip='" + tipo + "' AND active=true"
	// resultdb := FindRawSQL(sql)
	// row := resultdb[0]
	row := gormfun.FindOne(db, "f572_relacionatributos", "grupo='"+grupo+"' AND codigoafip='"+tipo+"' AND active=true", "atributo")
	if row != nil {
		attr := row["atributo"].(string)
		if attr != "" {
			c.Legajo = uint(legajo)
			c.Cuit = uint(cuit)
			c.Anio = uint(anio)
			c.Mes = uint(mes)
			c.Nrover = uint(version)
			c.Atributo = attr
			c.Valor = uint(valor)
			ret = true
		} else {
			fmt.Println("*No está configurado atributo para grupo/codigoafip: " + grupo + "/" + tipo)
			ret = false
		}
	} else {
		fmt.Println("**No se encontro atributo activo para grupo/codigoafip: " + grupo + "/" + tipo)
		ret = false
	}
	return ret
}
