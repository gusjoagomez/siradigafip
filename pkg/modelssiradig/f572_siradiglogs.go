package models

import (
	"time"
)

type F572Siradiglogs struct {
	//gorm.Model       // adds ID, created_at etc.
	Id          int       `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Fechahora   time.Time `json:"fechahora" gorm:"not null;type:timestamp;column:fechahora"`
	Tipo        string    `json:"tipo" gorm:"not null;type:varchar(5);column:tipo"`
	Descripcion string    `json:"descripcion" gorm:"type:varchar(255);column:descripcion"`
	Referencia  string    `json:"referencia" gorm:"type:varchar(100);column:referencia"`
	Sessid      string    `json:"sessid" gorm:"type:varchar(100);column:sessid"`
}

func (e *F572Siradiglogs) TableName() string {
	return "siradig.f572_siradiglogs"
}
