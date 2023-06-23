package models

import (
	"time"
)

type F572Presentacionb struct {
	//gorm.Model       // adds ID, created_at etc.
	Id                int       `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Cuit              uint      `json:"cuit" gorm:"type:int8;column:cuit"`
	Periodo           uint      `json:"periodo" gorm:"type:int4;column:periodo"`
	Envio             uint      `json:"envio" gorm:"type:int4;column:envio"`
	Nropresentacion   uint      `json:"nropresentacion" gorm:"type:int4;column:nropresentacion"`
	Fechapresentacion string    `json:"fechapresentacion" gorm:"type:varchar(11);column:fechapresentacion"`
	Emplcuit          string    `json:"emplcuit" gorm:"type:varchar(11);column:emplcuit"`
	Empltipodoc       string    `json:"empltipodoc" gorm:"type:varchar(3);column:empltipodoc"`
	Emplapellido      string    `json:"emplapellido" gorm:"type:varchar(100);column:emplapellido"`
	Emplnombre        string    `json:"emplnombre" gorm:"type:varchar(100);column:emplnombre"`
	Dirprovincia      uint      `json:"dirprovincia" gorm:"type:int4;column:dirprovincia"`
	Dircp             string    `json:"dircp" gorm:"type:varchar(8);column:dircp"`
	Dirlocalidad      string    `json:"dirlocalidad" gorm:"type:varchar(60);column:dirlocalidad"`
	Dircalle          string    `json:"dircalle" gorm:"type:varchar(40);column:dircalle"`
	Dirnro            string    `json:"dirnro" gorm:"type:varchar(6);column:dirnro"`
	Dirpiso           string    `json:"dirpiso" gorm:"type:varchar(5);column:dirpiso"`
	Dirdpto           string    `json:"dirdpto" gorm:"type:varchar(5);column:dirdpto"`
	Agretcuit         string    `json:"agretcuit" gorm:"type:varchar(11);column:agretcuit"`
	Agretdenominacion string    `json:"agretdenominacion" gorm:"type:varchar(200);column:agretdenominacion"`
	File_id           uint      `json:"file_id" gorm:"type:int4;column:file_id"`
	CreatedAt         time.Time `json:"createdat" gorm:"type:timestamp;column:createdat;not null"`
	UpdatedAt         time.Time `json:"updatedat" gorm:"type:timestamp;column:updatedat;not null"`
}

func (e *F572Presentacionb) TableName() string {
	return "siradig.f572_presentacionb"
}
