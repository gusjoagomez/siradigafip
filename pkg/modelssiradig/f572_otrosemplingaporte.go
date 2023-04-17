package models

type F572Otrosemplingaporte struct {
	//gorm.Model       // adds ID, created_at etc.
	Id             int           `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Otrosemp_id    uint          `json:"otrosemp_id" gorm:"type:int4;column:otrosemp_id"`
	F572Otrosempl1 F572Otrosempl `gorm:"foreignKey:Otrosemp_id;references:Id"`
	Mes            uint          `json:"mes" gorm:"type:int4;column:mes"`
	Obrasoc        uint          `json:"obrasoc" gorm:"type:numeric(13,2);column:obrasoc"`
	Segsoc         uint          `json:"segsoc" gorm:"type:numeric(13,2);column:segsoc"`
	Sind           uint          `json:"sind" gorm:"type:numeric(13,2);column:sind"`
	Ganbrut        uint          `json:"ganbrut" gorm:"type:numeric(13,2);column:ganbrut"`
	Retgan         uint          `json:"retgan" gorm:"type:numeric(13,2);column:retgan"`
	Retribnohab    uint          `json:"retribnohab" gorm:"type:numeric(13,2);column:retribnohab"`
	Ajuste         uint          `json:"ajuste" gorm:"type:numeric(13,2);column:ajuste"`
	Exenoalc       uint          `json:"exenoalc" gorm:"type:numeric(13,2);column:exenoalc"`
	Sac            uint          `json:"sac" gorm:"type:numeric(13,2);column:sac"`
	Horasextgr     uint          `json:"horasextgr" gorm:"type:numeric(13,2);column:horasextgr"`
	Horasextex     uint          `json:"horasextex" gorm:"type:numeric(13,2);column:horasextex"`
	Matdid         uint          `json:"matdid" gorm:"type:numeric(13,2);column:matdid"`
	Gastosmovviat  uint          `json:"gastosmovviat" gorm:"type:numeric(13,2);column:gastosmovviat"`
}

func (e *F572Otrosemplingaporte) TableName() string {
	return "siradig.f572_otrosemplingaporte"
}
