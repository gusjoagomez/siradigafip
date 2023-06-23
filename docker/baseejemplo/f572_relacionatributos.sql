INSERT INTO siradig.f572_relacionatributos (grupo,codigoafip,descripafip,atributo,atributo_50,porc,active) VALUES
	 ('AFPAR17','3','Hijo/a Menor de 18 Años','fam_hijos_100','fam_hijos_50',true,true),
	 ('AFPAR17','33','Hijastro/a Incapacitado para el Trabajo','fam_hijos_disc_100','fam_hijos_disc_100',true,true),
	 ('AFPAR17','31','Hijo/a Incapacitado para el Trabajo','fam_hijos_disc_50','fam_hijos_disc_50',true,true),
	 ('AFPAR17','30','Hijastro/a Menor de 18 Años','fam_hijastros_100','fam_hijastros_50',true,true),
	 ('AFPAR16','1','Cónyuge','fam_conyuge','fam_conyuge',true,true),
	 ('AFPAR16','32','Hijastro/a Incapcacitado para el Trabajo','fam_hijos_disc_100','fam_hijos_disc_50',true,true),
	 ('AFDEDUC','2','Primas de Seguro para el caso de muerte / riesgo de muerte','ded_seguros','',false,true),
	 ('AFDEDUC','1','Cuotas Médico-Asistenciales','ded_cuota_medica','',false,true),
	 ('AFDEDUC','3','Donaciones','ded_donaciones','',false,true),
	 ('AFDEDUC','4','Intereses Préstamo Hipotecario','ded_int_hipotecarios','',false,true);
INSERT INTO siradig.f572_relacionatributos (grupo,codigoafip,descripafip,atributo,atributo_50,porc,active) VALUES
	 ('AFDEDUC','5','Gastos de Sepelio','ded_gastos_sepelio','',false,true),
	 ('AFDEDUC','7','Gastos Médicos y Paramédicos','ded_gastos_medicos','',false,true),
	 ('AFDEDUC','8','Deducción del Personal Doméstico','ded_domestica','',false,true),
	 ('AFDEDUC','10','Vehiculos de Corredores y Viajantes de Comercio','ded_viajantes','',false,true),
	 ('AFDEDUC','22','Alquiler de Inmuebles destinados a casa habitación','ded_alquiler','',false,true),
	 ('AFDEDUC','23','Primas de Ahorro correspondientes a Seguros Mixtos','ded_seguros','',false,true),
	 ('AFDEDUC','24','Aportes correspondientes a Planes de Seguro de Retiro Privado','ded_retiro','',false,true),
	 ('AFDEDUC','25','Adquisición de Cuotapartes de Fondos Comunes de Retiro','ded_fondo_inversion','',false,true),
	 ('AFDEDUC','99','Otras deducciones','ded_otras','',false,true),
	 ('AFAJUST','1','Montos Retroactivos','','',false,true);
INSERT INTO siradig.f572_relacionatributos (grupo,codigoafip,descripafip,atributo,atributo_50,porc,active) VALUES
	 ('AFTDOC','80','CUIT','','',false,true),
	 ('AFPAR16','3','Hijo/a Menor de 24 Años','fam_hijos_100','fam_hijos_50',true,true),
	 ('AFRPPAC','6','Impuestos sobre Créditos y Débitos en cuenta Bancaria','ret_imp_movim','',false,true),
	 ('AFRPPAC','20','Pago a Cuenta - Compra de Pasajes en efectivo','ret_pasajes_efec','',false,true),
	 ('AFRPPAC','12','Retenciones y Percepciones Aduaneras','ret_aduana','',false,true),
	 ('AFRPPAC','13','Pago a Cuenta - Compras en el Exterior','ret_compras_ext','',false,true),
	 ('AFRPPAC','14','Impuesto sobre los Movimientos de Fondos Propios o de Terceros','ret_imp_movim','',false,true),
	 ('AFRPPAC','15','Pago a Cuenta - Compra de Paquetes Turísticos','ret_turismo','',false,true),
	 ('AFRPPAC','16','Pago a Cuenta - Compra de Pasajes','ret_pasajes','',false,true),
	 ('AFRPPAC','17','Pago a Cuenta - Compra de Moneda Extranjera para Turismo / Transf. al Exterior','ret_compras_ext','',false,true);
INSERT INTO siradig.f572_relacionatributos (grupo,codigoafip,descripafip,atributo,atributo_50,porc,active) VALUES
	 ('AFRPPAC','18','Pago a Cuenta - Adquisición de moneda extranjera para tenencia de billetes extranjeros en el país','ret_dolares_tenencia','',false,true),
	 ('AFRPPAC','19','Pago a Cuenta - Compra de Paquetes Turísticos en efectivo','ret_pasajes_efec','',false,true),
	 ('AFPAR16','31','Hijo/a Incapacitado para el Trabajo','fam_hijos_disc_100','fam_hijos_disc_50',true,true),
	 ('AFOEMPL','sac','Sueldo Anual Complementario','otro_sac','',false,true),
	 ('AFOEMPL','ajuste','Ajustes','otro_ajuste','',false,true),
	 ('AFOEMPL','exenoalc','Importe Conceptos Exentos / No Alcanzados en Ganancias','otro_ex_nogan','',false,true),
	 ('AFDEDUC','9','Aporte a Sociedades de Garantía Recíproca','ded_sociedades','',false,true),
	 ('AFDEDUC','21','Gastos de Adquisición de Indumentaria y Equipamiento para uso Exclusivo en el Lugar de Trabajo','ded_indumentaria','',false,true),
	 ('AFDEDUC','11','Períodos 2018 y anteriores: Gastos de Movilidad, Viáticos y Representaciones e Intereses de Corredores y Viajantes de Comercio Período 2019 en adelante: Gastos de Movilidad e Intereses de Corredores y Viajantes de Comercio','ded_viajantes','',false,true),
	 ('AFOEMPL','sind','Monto de Aportes Sindicales','otro_sindicato','',false,true);
INSERT INTO siradig.f572_relacionatributos (grupo,codigoafip,descripafip,atributo,atributo_50,porc,active) VALUES
	 ('AFTDOC','86','CUIL','','',false,true),
	 ('AFOEMPL','ganbrut','Monto Ganancias Bruto','otro_gan_brut','',false,true),
	 ('AFOEMPL','retgan','Monto Retenciones del Impuesto a las Ganancias','otro_ret_gan','',false,true),
	 ('AFAJUST','2','Reintegros de Soc. de Garantia Recíprocas Art. 79 Párrafo 2 y Párrafo 3','','',false,true),
	 ('AFTDOC','87','CDI','','',false,true),
	 ('AFTDOC','96','DNI','','',false,true),
	 ('AFTDOC','89','LC','','',false,true),
	 ('AFTDOC','90','LE','','',false,true),
	 ('AFTDOC','92','En Trámite','','',false,true),
	 ('AFPROVI','1','Buenos Aires','','',false,true);
INSERT INTO siradig.f572_relacionatributos (grupo,codigoafip,descripafip,atributo,atributo_50,porc,active) VALUES
	 ('AFPROVI','2','Catamarca','','',false,true),
	 ('AFPROVI','3','Córdoba','','',false,true),
	 ('AFPROVI','4','Corrientes','','',false,true),
	 ('AFPROVI','5','Entre Ríos','','',false,true),
	 ('AFPROVI','6','Jujuy','','',false,true),
	 ('AFPROVI','7','Mendoza','','',false,true),
	 ('AFPROVI','8','La Rioja','','',false,true),
	 ('AFPROVI','9','Salta','','',false,true),
	 ('AFPROVI','10','San Juan','','',false,true),
	 ('AFPROVI','11','San Luis','','',false,true);
INSERT INTO siradig.f572_relacionatributos (grupo,codigoafip,descripafip,atributo,atributo_50,porc,active) VALUES
	 ('AFPROVI','12','Santa Fe','','',false,true),
	 ('AFPROVI','13','Santiago del Estero','','',false,true),
	 ('AFPROVI','14','Tucumán','','',false,true),
	 ('AFPROVI','16','Chaco','','',false,true),
	 ('AFPROVI','17','Chubut','','',false,true),
	 ('AFPROVI','18','Formosa','','',false,true),
	 ('AFPROVI','19','Misiones','','',false,true),
	 ('AFPROVI','20','Neuquén','','',false,true),
	 ('AFPROVI','21','La Pampa','','',false,true),
	 ('AFPROVI','22','Río Negro','','',false,true);
INSERT INTO siradig.f572_relacionatributos (grupo,codigoafip,descripafip,atributo,atributo_50,porc,active) VALUES
	 ('AFPROVI','23','Santa Cruz','','',false,true),
	 ('AFPROVI','24','Tierra del Fuego','','',false,true),
	 ('AFPROVI','25','xxx','','',false,true),
	 ('AFPROVI','0','Ciudad Autónoma de Buenos Aires','','',false,true),
	 ('AFMODED','1','Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES','','',false,true),
	 ('AFMODED','2','Cajas Provinciales o Municipales','','',false,true),
	 ('AFMODED','3','Impuesto sobre los Créditos y Débitos en Cuenta Bancaria sin CBU [nota: reemplazado por Pago a Cuenta Cód. 14 – ver Tabla 9]','','',false,true),
	 ('AFMODED','4','Beneficios Derivados de Regímenes que impliquen tratamientos Preferenciales que se Efectivicen Mediante Deducciones','','',false,true),
	 ('AFMODED','5','Beneficios Derivados de Regímenes que impliquen tratamientos Preferenciales que No se Efectivicen Mediante Deducciones','','',false,true),
	 ('AFMODED','6','Actores - Retribuciones Abonadas a Representantes - R.G. N° 2442/08','','',false,true);
INSERT INTO siradig.f572_relacionatributos (grupo,codigoafip,descripafip,atributo,atributo_50,porc,active) VALUES
	 ('AFMODED','7','Cajas Complementarias de Previsión','','',false,true),
	 ('AFMODED','8','Fondos Compensadores de Previsión','','',false,true),
	 ('AFMODED','9','Otros','','',false,true),
	 ('AFTTARJ','1','Tarjeta de Crédito / Compra','','',false,true),
	 ('AFTTARJ','2','Tarjeta de Débito','','',false,true),
	 ('AFIDTAR','1','MasterCard','','',false,true),
	 ('AFIDTAR','2','Visa','','',false,true),
	 ('AFIDTAR','3','American Express','','',false,true),
	 ('AFIDTAR','4','Cabal','','',false,true),
	 ('AFIDTAR','5','Italcred','','',false,true);
INSERT INTO siradig.f572_relacionatributos (grupo,codigoafip,descripafip,atributo,atributo_50,porc,active) VALUES
	 ('AFIDTAR','6','Naranja','','',false,true),
	 ('AFIDTAR','7','Nativa','','',false,true),
	 ('AFIDTAR','8','Diners Club','','',false,true),
	 ('AFIDTAR','99','Otra','','',false,true),
	 ('AFTNORM','0','Ley','','',false,true),
	 ('AFTNORM','1','Decreto','','',false,true),
	 ('AFTNORM','2','RG','','',false,true),
	 ('ADDADIC','1','x','','',false,true),
	 ('AFPAR16','33','Padre','','',true,true),
	 ('AFPAR16','34','Madre','','',true,true);
INSERT INTO siradig.f572_relacionatributos (grupo,codigoafip,descripafip,atributo,atributo_50,porc,active) VALUES
	 ('AFPAR16','35','Nieto/a Meneor de 24 Años','','',true,true),
	 ('AFPAR16','36','Nieto/a Incapacitado para el Trabajo','','',true,true),
	 ('AFPAR16','37','Bisnieto/a Meneor de 24 Años','','',true,true),
	 ('AFPAR16','38','Bisnieto/a Incapacitado para el Trabajo','','',true,true),
	 ('AFPAR16','39','Abuelo/a','','',true,true),
	 ('AFPAR16','40','Bisabuelo/a','','',true,true),
	 ('AFPAR16','41','Padrastro/Madrastra','','',true,true),
	 ('AFPAR16','42','Hermano/a Menor de 24 Años','','',true,true),
	 ('AFPAR16','43','Hermano/a Incapacitado para el Trabajo','','',true,true),
	 ('AFPAR16','44','Suegro/a','','',true,true);
INSERT INTO siradig.f572_relacionatributos (grupo,codigoafip,descripafip,atributo,atributo_50,porc,active) VALUES
	 ('AFPAR16','45','Yerno/Nuera Menor de 24 Años','','',true,true),
	 ('AFPAR16','46','Yerno/Nuera Incapacitado para el Trabajo','','',true,true),
	 ('AFPAR16','30','Hijastro/a Menor de 24 Años','','',true,true),
	 ('AFOEMPL','segsoc','Monto del Aporte a Seguridad Social','otro_seg_soc','',false,true),
	 ('AFOEMPL','obrasoc','Monto del Aporte a la Obra Social','otro_obra_soc','',false,true),
	 ('AFOEMPL','gastosmovviat','Gastos de Movilidad y Viáticos','otro_gs_viatic','',false,true),
	 ('AFOEMPL','horasextex','Importe Horas Extras Exentas','otro_hs_extr','',false,true),
	 ('AFOEMPL','horasextgr','Importe Horas Extras Gravadas','otro_hs_extgr','',false,true),
	 ('AFOEMPL','matdid','Importe Material Didáctico','otro_mat_didac','',false,true),
	 ('AFOEMPL','retribnohab','Monto de Retribuciones no habituales','otro_no_habit','',false,true);
INSERT INTO siradig.f572_relacionatributos (grupo,codigoafip,descripafip,atributo,atributo_50,porc,active) VALUES
	 ('AFPAR17','1','Cónyuge','FECDEVDESDE','fam_conyuge',true,true);
