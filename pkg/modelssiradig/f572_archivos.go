package models

import (
	"time"
)

type F572Archivos struct {

	//gorm.Model       // adds ID, created_at etc.
	Id        int       `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Filename  string    `json:"filename" gorm:"type:varchar(100);column:filename"`
	Periodo   uint      `json:"periodo" gorm:"type:int4;column:periodo"`
	Createdat time.Time `json:"createdat" gorm:"type:timestamp;column:createdat"`
	Updatedat time.Time `json:"updatedat" gorm:"type:timestamp;column:updatedat"`
}

func (e *F572Archivos) TableName() string {
	return "siradig.f572_archivos"
}
