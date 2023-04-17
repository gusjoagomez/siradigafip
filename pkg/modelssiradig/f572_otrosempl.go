package models

type F572Otrosempl struct {
	//gorm.Model       // adds ID, created_at etc.
	Id                int              `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Cuit              uint             `json:"cuit" gorm:"type:int8;column:cuit"`
	Denominacion      string           `json:"denominacion" gorm:"type:varchar(100);column:denominacion"`
	Presentacion_id   uint             `json:"presentacion_id" gorm:"type:int4;column:presentacion_id"`
	F572Presentacion1 F572Presentacion `gorm:"foreignKey:Presentacion_id;references:Id"`
}

func (e *F572Otrosempl) TableName() string {
	return "siradig.f572_otrosempl"
}
