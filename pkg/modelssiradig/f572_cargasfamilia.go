package models

type F572Cargasfamilia struct {
	//gorm.Model       // adds ID, created_at etc.
	Id                int              `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Presentacion_id   uint             `json:"presentacion_id" gorm:"type:int4;column:presentacion_id"`
	F572Presentacion1 F572Presentacion `gorm:"foreignKey:Presentacion_id;references:Id"`
	Tipodoc           uint             `json:"tipodoc" gorm:"type:int4;column:tipodoc"`
	Nrodoc            string           `json:"nrodoc" gorm:"type:varchar(15);column:nrodoc"`
	Apellido          string           `json:"apellido" gorm:"type:varchar(100);column:apellido"`
	Nombre            string           `json:"nombre" gorm:"type:varchar(100);column:nombre"`
	Fechanac          string           `json:"fechanac" gorm:"type:varchar(10);column:fechanac"`
	Mesdesde          uint             `json:"mesdesde" gorm:"type:int4;column:mesdesde"`
	Meshasta          uint             `json:"meshasta" gorm:"type:int4;column:meshasta"`
	Parentesco        uint             `json:"parentesco" gorm:"type:int4;column:parentesco"`
	Vigenteproxper    string           `json:"vigenteproxper" gorm:"type:varchar(1);column:vigenteproxper"`
	Fechalimite       string           `json:"fechalimite" gorm:"type:varchar(10);column:fechalimite"`
	Porcdeduccion     uint             `json:"porcdeduccion" gorm:"type:int4;column:porcdeduccion"`
}

func (e *F572Cargasfamilia) TableName() string {
	return "siradig.f572_cargasfamilia"
}
