package models

import (
	"fmt"
	"time"

	"github.com/shopspring/decimal"
	"gorm.io/gorm"
)

type F572Siradigconceptos struct {
	//gorm.Model       // adds ID, created_at etc.
	Id        int             `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Legajo    uint            `json:"legajo" gorm:"not null;type:int8;default:0;column:legajo"`
	Cuit      uint            `json:"cuit" gorm:"not null;type:int8;column:cuit"`
	Anio      uint            `json:"anio" gorm:"not null;type:int4;column:anio"`
	Mes       uint            `json:"mes" gorm:"not null;type:smallint;column:mes"`
	Nrover    uint            `json:"nrover" gorm:"not null;type:int4;column:nrover"`
	Atributo  string          `json:"atributo" gorm:"not null;type:varchar(30);column:atributo"`
	Valor     decimal.Decimal `json:"valor" gorm:"type:numeric(10,2);column:valor"`
	CreatedAt time.Time       `json:"createdat" gorm:"type:timestamp;column:createdat;not null"`
	UpdatedAt time.Time       `json:"updatedat" gorm:"type:timestamp;column:updatedat;not null"`
	Estadoliq string          `json:"estadoliq" gorm:"type:varchar(1);column:estadoliq"`
}

func (e *F572Siradigconceptos) TableName() string {
	return "siradig.f572_siradigconceptos"
}

func (c *F572Siradigconceptos) SetGrupoTipo(db *gorm.DB, legajo uint, cuit int64, anio, mes, version int, grupo, tipo string, valor float64) bool {
	var ret bool = false

	Atributo := F572Relacionatributos{}
	result := db.Where("grupo = ?  AND codigoafip = ? AND active = true", grupo, tipo).First(&Atributo)
	if result.Error == nil {
		c.Legajo = uint(legajo)
		c.Cuit = uint(cuit)
		c.Anio = uint(anio)
		c.Mes = uint(mes)
		c.Nrover = uint(version)
		c.Atributo = Atributo.Atributo
		c.Valor = decimal.NewFromFloat(valor)
		ret = true
	} else {
		if result.Error == gorm.ErrRecordNotFound { //NO se encontro atributo
			fmt.Println("*No está configurado atributo para grupo/codigoafip: " + grupo + "/" + tipo)
		} else { //Otro error
			fmt.Println("*Error al buscar grupo/codigoafip: ", result.Error)
		}
		ret = false
	}
	return ret
}
