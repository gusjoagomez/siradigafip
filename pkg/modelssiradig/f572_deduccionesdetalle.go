package models

type F572Deduccionesdetalle struct {
	//gorm.Model       // adds ID, created_at etc.
	Id               int             `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Deduccion_id     uint            `json:"deduccion_id" gorm:"type:int4;column:deduccion_id"`
	F572Deducciones1 F572Deducciones `gorm:"foreignKey:Deduccion_id;references:Id"`
	Nombre           string          `json:"nombre" gorm:"type:varchar(300);column:nombre"`
	Valor            string          `json:"valor" gorm:"type:varchar(300);column:valor"`
}

func (e *F572Deduccionesdetalle) TableName() string {
	return "siradig.f572_deduccionesdetalle"
}
