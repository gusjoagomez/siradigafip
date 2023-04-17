package models

type F572Retperpagosdetalle struct {
	//gorm.Model       // adds ID, created_at etc.
	Id               int             `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Retperpago_id    uint            `json:"retperpago_id" gorm:"type:int4;column:retperpago_id"`
	F572Retperpagos1 F572Retperpagos `gorm:"foreignKey:Retperpago_id;references:Id"`
	Nombre           string          `json:"nombre" gorm:"type:varchar(300);column:nombre"`
	Valor            string          `json:"valor" gorm:"type:varchar(300);column:valor"`
}

func (e *F572Retperpagosdetalle) TableName() string {
	return "siradig.f572_retperpagosdetalle"
}
