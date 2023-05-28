package models

import "github.com/shopspring/decimal"

type F572Otrosemplingaporte struct {
	//gorm.Model       // adds ID, created_at etc.
	Id             int             `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Otrosemp_id    uint            `json:"otrosemp_id" gorm:"type:int4;column:otrosemp_id"`
	F572Otrosempl1 F572Otrosempl   `gorm:"foreignKey:Otrosemp_id;references:Id"`
	Mes            uint            `json:"mes" gorm:"type:int4;column:mes"`
	Obrasoc        decimal.Decimal `json:"obrasoc" gorm:"type:numeric(13,2);column:obrasoc"`
	Segsoc         decimal.Decimal `json:"segsoc" gorm:"type:numeric(13,2);column:segsoc"`
	Sind           decimal.Decimal `json:"sind" gorm:"type:numeric(13,2);column:sind"`
	Ganbrut        decimal.Decimal `json:"ganbrut" gorm:"type:numeric(13,2);column:ganbrut"`
	Retgan         decimal.Decimal `json:"retgan" gorm:"type:numeric(13,2);column:retgan"`
	Retribnohab    decimal.Decimal `json:"retribnohab" gorm:"type:numeric(13,2);column:retribnohab"`
	Ajuste         decimal.Decimal `json:"ajuste" gorm:"type:numeric(13,2);column:ajuste"`
	Exenoalc       decimal.Decimal `json:"exenoalc" gorm:"type:numeric(13,2);column:exenoalc"`
	Sac            decimal.Decimal `json:"sac" gorm:"type:numeric(13,2);column:sac"`
	Horasextgr     decimal.Decimal `json:"horasextgr" gorm:"type:numeric(13,2);column:horasextgr"`
	Horasextex     decimal.Decimal `json:"horasextex" gorm:"type:numeric(13,2);column:horasextex"`
	Matdid         decimal.Decimal `json:"matdid" gorm:"type:numeric(13,2);column:matdid"`
	Gastosmovviat  decimal.Decimal `json:"gastosmovviat" gorm:"type:numeric(13,2);column:gastosmovviat"`
}

func (e *F572Otrosemplingaporte) TableName() string {
	return "siradig.f572_otrosemplingaporte"
}
