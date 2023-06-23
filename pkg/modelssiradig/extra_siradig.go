package models

import (
	"time"

	"github.com/shopspring/decimal"
)

type ExtraSiradig struct {
	//gorm.Model       // adds ID, created_at etc.
	Legajo    uint            `json:"legajo" gorm:"primaryKey;not null;size:32;type:int4;column:legajo"`
	Cuit      uint            `json:"cuit" gorm:"not null;type:int8;column:cuit"`
	Anio      uint            `json:"anio" gorm:"primaryKey;not null;size:32;type:int4;column:anio"`
	Mes       uint            `json:"mes" gorm:"primaryKey;not null;column:mes"`
	Nrover    uint            `json:"nrover" gorm:"primaryKey;not null;size:32;type:int4;column:nrover"`
	Atributo  string          `json:"atributo" gorm:"primaryKey;not null;type:varchar(30);column:atributo"`
	Valoracum decimal.Decimal `json:"valoracum" gorm:"type:numeric(10,2);column:valoracum"`
	CreatedAt time.Time       `json:"createdat" gorm:"type:timestamp;column:createdat; not null"`
	UpdatedAt time.Time       `json:"updatedat" gorm:"type:timestamp;column:updatedat; not null"`
	Estadoliq string          `json:"estadoliq" gorm:"type:varchar(1);column:estadoliq"`
}

func (e *ExtraSiradig) TableName() string {
	return "siradig.extra_siradig"
}
