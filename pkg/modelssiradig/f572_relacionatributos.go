package models

type F572Relacionatributos struct {
	//gorm.Model       // adds ID, created_at etc.
	Grupo       string `json:"grupo" gorm:"primaryKey;not null;type:varchar(10);column:grupo"`
	Codigoafip  string `json:"codigoafip" gorm:"primaryKey;not null;type:varchar(25);column:codigoafip"`
	Descripafip string `json:"descripafip" gorm:"type:varchar(300);column:descripafip"`
	Atributo    string `json:"atributo" gorm:"not null;type:varchar(25);default:'';column:atributo"`
	Atributo_50 string `json:"atributo_50" gorm:"not null;type:varchar(25);default:'';column:atributo_50"`
	Porc        bool   `json:"porc" gorm:"column:porc"`
	Active      bool   `json:"active" gorm:"not null;default:true;column:active"`
}

func (e *F572Relacionatributos) TableName() string {
	return "siradig.f572_relacionatributos"
}
