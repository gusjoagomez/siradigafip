package models

import (
	"time"

	"gorm.io/datatypes"
)

type ExtraCargo struct {
	//gorm.Model       // adds ID, created_at etc.
	Anio            uint           `json:"anio" gorm:"primaryKey;not null;size:32;type:int4;column:anio"`
	Mes             uint           `json:"mes" gorm:"primaryKey;not null;size:32;type:int4;column:mes"`
	Nro_legajo      uint           `json:"nro_legajo" gorm:"primaryKey;not null;size:32;type:int4;column:nro_legajo"`
	Nro_cargo       uint           `json:"nro_cargo" gorm:"primaryKey;not null;size:32;type:int4;column:nro_cargo"`
	Extraccion      datatypes.JSON `json:"extraccion" gorm:"column:extraccion;type:jsonb"`
	Fecha_ingreso   time.Time      `json:"fecha_ingreso" gorm:"column:fecha_ingreso;type:date"`
	Fecha_egreso    *time.Time     `json:"fecha_egreso" gorm:"column:fecha_egreso;type:date; default:null"`
	Planta_personal uint           `json:"planta_personal" gorm:"type:int4;column:planta_personal"`
	Id_convenio     uint           `json:"id_convenio" gorm:"type:int4;column:id_convenio"`
}

func (e *ExtraCargo) TableName() string {
	return "siradig.extra_cargo"
}
