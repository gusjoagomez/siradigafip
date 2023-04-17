package models

type F572Relacionatributosgrp struct {
	//gorm.Model       // adds ID, created_at etc.
	Obj       string `json:"obj" gorm:"primaryKey;not null;type:varchar(7);column:obj"`
	Name      string `json:"name" gorm:"not null;type:varchar(100);column:name"`
	Orderlist uint   `json:"orderlist" gorm:"not null;type:int4;column:orderlist"`
	Property  string `json:"property" gorm:"type:varchar(255);column:property"`
	Active    bool   `json:"active" gorm:"column:active"`
}

func (e *F572Relacionatributosgrp) TableName() string {
	return "siradig.f572_relacionatributosgrp"
}
