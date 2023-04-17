package models

type F572Datadicional struct {
	//gorm.Model       // adds ID, created_at etc.
	Id                int              `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Presentacion_id   uint             `json:"presentacion_id" gorm:"type:int4;column:presentacion_id"`
	F572Presentacion1 F572Presentacion `gorm:"foreignKey:Presentacion_id;references:Id"`
	Nombre            string           `json:"nombre" gorm:"type:varchar(300);column:nombre"`
	Mesdesde          uint             `json:"mesdesde" gorm:"type:int4;column:mesdesde"`
	Meshasta          uint             `json:"meshasta" gorm:"type:int4;column:meshasta"`
	Valor             string           `json:"valor" gorm:"type:varchar(100);column:valor"`
}

func (e *F572Datadicional) TableName() string {
	return "siradig.f572_datadicional"
}
