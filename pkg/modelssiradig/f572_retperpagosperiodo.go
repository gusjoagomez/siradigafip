package models

import "github.com/shopspring/decimal"

type F572Retperpagosperiodo struct {
	//gorm.Model       // adds ID, created_at etc.
	Id               int             `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Retperpago_id    uint            `json:"retperpago_id" gorm:"type:int4;column:retperpago_id"`
	F572Retperpagos1 F572Retperpagos `gorm:"foreignKey:Retperpago_id;references:Id"`
	Mesdesde         uint            `json:"mesdesde" gorm:"type:int4;column:mesdesde"`
	Meshasta         uint            `json:"meshasta" gorm:"type:int4;column:meshasta"`
	Montomensual     decimal.Decimal `json:"montomensual" gorm:"type:numeric(13,2);column:montomensual"`
}

func (e *F572Retperpagosperiodo) TableName() string {
	return "siradig.f572_retperpagosperiodo"
}
