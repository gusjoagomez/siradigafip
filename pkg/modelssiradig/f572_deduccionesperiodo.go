package models

import "github.com/shopspring/decimal"

type F572Deduccionesperiodo struct {
	//gorm.Model       // adds ID, created_at etc.
	Id               int             `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Deduccion_id     uint            `json:"deduccion_id" gorm:"type:int4;column:deduccion_id"`
	F572Deducciones1 F572Deducciones `gorm:"foreignKey:Deduccion_id;references:Id"`
	Mesdesde         uint            `json:"mesdesde" gorm:"type:int4;column:mesdesde"`
	Meshasta         uint            `json:"meshasta" gorm:"type:int4;column:meshasta"`
	Montomensual     decimal.Decimal `json:"montomensual" gorm:"type:numeric(13,2);column:montomensual"`
}

func (e *F572Deduccionesperiodo) TableName() string {
	return "siradig.f572_deduccionesperiodo"
}
