package models

type F572Sajustesdetalle struct {
	//gorm.Model       // adds ID, created_at etc.
	Id            int          `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Ajuste_id     uint         `json:"ajuste_id" gorm:"type:int4;column:ajuste_id"`
	F572Sajustes1 F572Sajustes `gorm:"foreignKey:Ajuste_id;references:Id"`
	Nombre        string       `json:"nombre" gorm:"type:varchar(300);column:nombre"`
	Valor         string       `json:"valor" gorm:"type:varchar(300);column:valor"`
}

func (e *F572Sajustesdetalle) TableName() string {
	return "siradig.f572_sajustesdetalle"
}
