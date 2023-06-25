--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: siradig; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA siradig;


ALTER SCHEMA siradig OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: extra_cargo; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.extra_cargo (
    anio integer NOT NULL,
    mes integer NOT NULL,
    nro_legajo integer NOT NULL,
    nro_cargo integer NOT NULL,
    extraccion jsonb,
    fecha_ingreso date,
    fecha_egreso date,
    planta_personal integer,
    id_convenio integer
);


ALTER TABLE siradig.extra_cargo OWNER TO postgres;

--
-- Name: extra_siradig; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.extra_siradig (
    legajo integer NOT NULL,
    cuit bigint NOT NULL,
    anio integer NOT NULL,
    mes bigint NOT NULL,
    nrover integer NOT NULL,
    atributo character varying(30) NOT NULL,
    valoracum numeric(10,2),
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone NOT NULL,
    estadoliq character varying(1)
);


ALTER TABLE siradig.extra_siradig OWNER TO postgres;

--
-- Name: f572_archivos; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_archivos (
    id integer NOT NULL,
    filename character varying(100),
    periodo integer,
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone NOT NULL
);


ALTER TABLE siradig.f572_archivos OWNER TO postgres;

--
-- Name: f572_archivos_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_archivos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_archivos_id_seq OWNER TO postgres;

--
-- Name: f572_archivos_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_archivos_id_seq OWNED BY siradig.f572_archivos.id;


--
-- Name: f572_cargasfamilia; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_cargasfamilia (
    id integer NOT NULL,
    presentacion_id integer,
    tipodoc integer,
    nrodoc character varying(15),
    apellido character varying(100),
    nombre character varying(100),
    fechanac character varying(10),
    mesdesde integer,
    meshasta integer,
    parentesco integer,
    vigenteproxper character varying(1),
    fechalimite character varying(10),
    porcdeduccion integer
);


ALTER TABLE siradig.f572_cargasfamilia OWNER TO postgres;

--
-- Name: f572_cargasfamilia_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_cargasfamilia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_cargasfamilia_id_seq OWNER TO postgres;

--
-- Name: f572_cargasfamilia_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_cargasfamilia_id_seq OWNED BY siradig.f572_cargasfamilia.id;


--
-- Name: f572_datadicional; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_datadicional (
    id integer NOT NULL,
    presentacion_id integer,
    nombre character varying(300),
    mesdesde integer,
    meshasta integer,
    valor character varying(100)
);


ALTER TABLE siradig.f572_datadicional OWNER TO postgres;

--
-- Name: f572_datadicional_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_datadicional_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_datadicional_id_seq OWNER TO postgres;

--
-- Name: f572_datadicional_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_datadicional_id_seq OWNED BY siradig.f572_datadicional.id;


--
-- Name: f572_deducciones; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_deducciones (
    id integer NOT NULL,
    presentacion_id integer,
    tipo integer,
    tipodoc integer,
    nrodoc character varying(11),
    denominacion character varying(200),
    descbasica character varying(300),
    descadicional character varying(300),
    montototal numeric(13,2)
);


ALTER TABLE siradig.f572_deducciones OWNER TO postgres;

--
-- Name: f572_deducciones_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_deducciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_deducciones_id_seq OWNER TO postgres;

--
-- Name: f572_deducciones_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_deducciones_id_seq OWNED BY siradig.f572_deducciones.id;


--
-- Name: f572_deduccionesdetalle; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_deduccionesdetalle (
    id integer NOT NULL,
    deduccion_id integer,
    nombre character varying(300),
    valor character varying(300)
);


ALTER TABLE siradig.f572_deduccionesdetalle OWNER TO postgres;

--
-- Name: f572_deduccionesdetalle_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_deduccionesdetalle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_deduccionesdetalle_id_seq OWNER TO postgres;

--
-- Name: f572_deduccionesdetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_deduccionesdetalle_id_seq OWNED BY siradig.f572_deduccionesdetalle.id;


--
-- Name: f572_deduccionesperiodo; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_deduccionesperiodo (
    id integer NOT NULL,
    deduccion_id integer,
    mesdesde integer,
    meshasta integer,
    montomensual numeric(13,2)
);


ALTER TABLE siradig.f572_deduccionesperiodo OWNER TO postgres;

--
-- Name: f572_deduccionesperiodo_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_deduccionesperiodo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_deduccionesperiodo_id_seq OWNER TO postgres;

--
-- Name: f572_deduccionesperiodo_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_deduccionesperiodo_id_seq OWNED BY siradig.f572_deduccionesperiodo.id;


--
-- Name: f572_otrosempl; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_otrosempl (
    id integer NOT NULL,
    cuit bigint,
    denominacion character varying(100),
    presentacion_id integer
);


ALTER TABLE siradig.f572_otrosempl OWNER TO postgres;

--
-- Name: f572_otrosempl_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_otrosempl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_otrosempl_id_seq OWNER TO postgres;

--
-- Name: f572_otrosempl_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_otrosempl_id_seq OWNED BY siradig.f572_otrosempl.id;


--
-- Name: f572_otrosemplingaporte; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_otrosemplingaporte (
    id integer NOT NULL,
    otrosemp_id integer,
    mes integer,
    obrasoc numeric(13,2),
    segsoc numeric(13,2),
    sind numeric(13,2),
    ganbrut numeric(13,2),
    retgan numeric(13,2),
    retribnohab numeric(13,2),
    ajuste numeric(13,2),
    exenoalc numeric(13,2),
    sac numeric(13,2),
    horasextgr numeric(13,2),
    horasextex numeric(13,2),
    matdid numeric(13,2),
    gastosmovviat numeric(13,2)
);


ALTER TABLE siradig.f572_otrosemplingaporte OWNER TO postgres;

--
-- Name: f572_otrosemplingaporte_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_otrosemplingaporte_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_otrosemplingaporte_id_seq OWNER TO postgres;

--
-- Name: f572_otrosemplingaporte_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_otrosemplingaporte_id_seq OWNED BY siradig.f572_otrosemplingaporte.id;


--
-- Name: f572_presentacion; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_presentacion (
    id integer NOT NULL,
    cuit bigint,
    periodo integer,
    envio integer,
    nropresentacion integer,
    fechapresentacion character varying(11),
    emplcuit character varying(11),
    empltipodoc character varying(3),
    emplapellido character varying(100),
    emplnombre character varying(100),
    dirprovincia integer,
    dircp character varying(8),
    dirlocalidad character varying(60),
    dircalle character varying(40),
    dirnro character varying(6),
    dirpiso character varying(5),
    dirdpto character varying(5),
    file_id integer,
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone NOT NULL
);


ALTER TABLE siradig.f572_presentacion OWNER TO postgres;

--
-- Name: f572_presentacion_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_presentacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_presentacion_id_seq OWNER TO postgres;

--
-- Name: f572_presentacion_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_presentacion_id_seq OWNED BY siradig.f572_presentacion.id;


--
-- Name: f572_presentacionb; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_presentacionb (
    id integer NOT NULL,
    cuit bigint,
    periodo integer,
    envio integer,
    nropresentacion integer,
    fechapresentacion character varying(11),
    emplcuit character varying(11),
    empltipodoc character varying(3),
    emplapellido character varying(100),
    emplnombre character varying(100),
    dirprovincia integer,
    dircp character varying(8),
    dirlocalidad character varying(60),
    dircalle character varying(40),
    dirnro character varying(6),
    dirpiso character varying(5),
    dirdpto character varying(5),
    agretcuit character varying(11),
    agretdenominacion character varying(200),
    file_id integer,
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone NOT NULL
);


ALTER TABLE siradig.f572_presentacionb OWNER TO postgres;

--
-- Name: f572_presentacionb_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_presentacionb_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_presentacionb_id_seq OWNER TO postgres;

--
-- Name: f572_presentacionb_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_presentacionb_id_seq OWNED BY siradig.f572_presentacionb.id;


--
-- Name: f572_relacionatributos; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_relacionatributos (
    grupo character varying(10) NOT NULL,
    codigoafip character varying(25) NOT NULL,
    descripafip character varying(300),
    atributo character varying(25) DEFAULT ''::character varying NOT NULL,
    atributo_50 character varying(25) DEFAULT ''::character varying NOT NULL,
    porc boolean,
    active boolean DEFAULT true NOT NULL
);


ALTER TABLE siradig.f572_relacionatributos OWNER TO postgres;

--
-- Name: f572_relacionatributosgrp; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_relacionatributosgrp (
    obj character varying(7) NOT NULL,
    name character varying(100) NOT NULL,
    orderlist integer NOT NULL,
    property character varying(255),
    active boolean
);


ALTER TABLE siradig.f572_relacionatributosgrp OWNER TO postgres;

--
-- Name: f572_retperpagos; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_retperpagos (
    id integer NOT NULL,
    presentacion_id integer,
    tipo character varying(2),
    tipodoc integer,
    nrodoc character varying(15),
    denominacion character varying(200),
    descbasica character varying(300),
    descadicional character varying(300),
    montototal numeric(13,2)
);


ALTER TABLE siradig.f572_retperpagos OWNER TO postgres;

--
-- Name: f572_retperpagos_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_retperpagos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_retperpagos_id_seq OWNER TO postgres;

--
-- Name: f572_retperpagos_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_retperpagos_id_seq OWNED BY siradig.f572_retperpagos.id;


--
-- Name: f572_retperpagosdetalle; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_retperpagosdetalle (
    id integer NOT NULL,
    retperpago_id integer,
    nombre character varying(300),
    valor character varying(300)
);


ALTER TABLE siradig.f572_retperpagosdetalle OWNER TO postgres;

--
-- Name: f572_retperpagosdetalle_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_retperpagosdetalle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_retperpagosdetalle_id_seq OWNER TO postgres;

--
-- Name: f572_retperpagosdetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_retperpagosdetalle_id_seq OWNED BY siradig.f572_retperpagosdetalle.id;


--
-- Name: f572_retperpagosperiodo; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_retperpagosperiodo (
    id integer NOT NULL,
    retperpago_id integer,
    mesdesde integer,
    meshasta integer,
    montomensual numeric(13,2)
);


ALTER TABLE siradig.f572_retperpagosperiodo OWNER TO postgres;

--
-- Name: f572_retperpagosperiodo_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_retperpagosperiodo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_retperpagosperiodo_id_seq OWNER TO postgres;

--
-- Name: f572_retperpagosperiodo_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_retperpagosperiodo_id_seq OWNED BY siradig.f572_retperpagosperiodo.id;


--
-- Name: f572_sajustes; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_sajustes (
    id integer NOT NULL,
    presentacion_id integer,
    tipo character varying(2),
    cuit bigint,
    denominacion character varying(200),
    descbasica character varying(300),
    descadicional character varying(300),
    montototal numeric(13,2)
);


ALTER TABLE siradig.f572_sajustes OWNER TO postgres;

--
-- Name: f572_sajustes_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_sajustes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_sajustes_id_seq OWNER TO postgres;

--
-- Name: f572_sajustes_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_sajustes_id_seq OWNED BY siradig.f572_sajustes.id;


--
-- Name: f572_sajustesdetalle; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_sajustesdetalle (
    id integer NOT NULL,
    ajuste_id integer,
    nombre character varying(300),
    valor character varying(300)
);


ALTER TABLE siradig.f572_sajustesdetalle OWNER TO postgres;

--
-- Name: f572_sajustesdetalle_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_sajustesdetalle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_sajustesdetalle_id_seq OWNER TO postgres;

--
-- Name: f572_sajustesdetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_sajustesdetalle_id_seq OWNED BY siradig.f572_sajustesdetalle.id;


--
-- Name: f572_siradigconceptos; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_siradigconceptos (
    id integer NOT NULL,
    legajo bigint DEFAULT 0 NOT NULL,
    cuit bigint NOT NULL,
    anio integer NOT NULL,
    mes smallint NOT NULL,
    nrover integer NOT NULL,
    atributo character varying(30) NOT NULL,
    valor numeric(10,2),
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone NOT NULL,
    estadoliq character varying(1)
);


ALTER TABLE siradig.f572_siradigconceptos OWNER TO postgres;

--
-- Name: f572_siradigconceptos_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_siradigconceptos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_siradigconceptos_id_seq OWNER TO postgres;

--
-- Name: f572_siradigconceptos_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_siradigconceptos_id_seq OWNED BY siradig.f572_siradigconceptos.id;


--
-- Name: f572_siradiglogs; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_siradiglogs (
    id integer NOT NULL,
    fechahora timestamp without time zone NOT NULL,
    tipo character varying(5) NOT NULL,
    descripcion character varying(255),
    referencia character varying(100),
    sessid character varying(100)
);


ALTER TABLE siradig.f572_siradiglogs OWNER TO postgres;

--
-- Name: f572_siradiglogs_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_siradiglogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_siradiglogs_id_seq OWNER TO postgres;

--
-- Name: f572_siradiglogs_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_siradiglogs_id_seq OWNED BY siradig.f572_siradiglogs.id;


--
-- Name: f572_archivos id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_archivos ALTER COLUMN id SET DEFAULT nextval('siradig.f572_archivos_id_seq'::regclass);


--
-- Name: f572_cargasfamilia id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_cargasfamilia ALTER COLUMN id SET DEFAULT nextval('siradig.f572_cargasfamilia_id_seq'::regclass);


--
-- Name: f572_datadicional id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_datadicional ALTER COLUMN id SET DEFAULT nextval('siradig.f572_datadicional_id_seq'::regclass);


--
-- Name: f572_deducciones id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deducciones ALTER COLUMN id SET DEFAULT nextval('siradig.f572_deducciones_id_seq'::regclass);


--
-- Name: f572_deduccionesdetalle id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deduccionesdetalle ALTER COLUMN id SET DEFAULT nextval('siradig.f572_deduccionesdetalle_id_seq'::regclass);


--
-- Name: f572_deduccionesperiodo id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deduccionesperiodo ALTER COLUMN id SET DEFAULT nextval('siradig.f572_deduccionesperiodo_id_seq'::regclass);


--
-- Name: f572_otrosempl id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_otrosempl ALTER COLUMN id SET DEFAULT nextval('siradig.f572_otrosempl_id_seq'::regclass);


--
-- Name: f572_otrosemplingaporte id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_otrosemplingaporte ALTER COLUMN id SET DEFAULT nextval('siradig.f572_otrosemplingaporte_id_seq'::regclass);


--
-- Name: f572_presentacion id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_presentacion ALTER COLUMN id SET DEFAULT nextval('siradig.f572_presentacion_id_seq'::regclass);


--
-- Name: f572_presentacionb id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_presentacionb ALTER COLUMN id SET DEFAULT nextval('siradig.f572_presentacionb_id_seq'::regclass);


--
-- Name: f572_retperpagos id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagos ALTER COLUMN id SET DEFAULT nextval('siradig.f572_retperpagos_id_seq'::regclass);


--
-- Name: f572_retperpagosdetalle id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagosdetalle ALTER COLUMN id SET DEFAULT nextval('siradig.f572_retperpagosdetalle_id_seq'::regclass);


--
-- Name: f572_retperpagosperiodo id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagosperiodo ALTER COLUMN id SET DEFAULT nextval('siradig.f572_retperpagosperiodo_id_seq'::regclass);


--
-- Name: f572_sajustes id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_sajustes ALTER COLUMN id SET DEFAULT nextval('siradig.f572_sajustes_id_seq'::regclass);


--
-- Name: f572_sajustesdetalle id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_sajustesdetalle ALTER COLUMN id SET DEFAULT nextval('siradig.f572_sajustesdetalle_id_seq'::regclass);


--
-- Name: f572_siradigconceptos id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_siradigconceptos ALTER COLUMN id SET DEFAULT nextval('siradig.f572_siradigconceptos_id_seq'::regclass);


--
-- Name: f572_siradiglogs id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_siradiglogs ALTER COLUMN id SET DEFAULT nextval('siradig.f572_siradiglogs_id_seq'::regclass);


--
-- Data for Name: extra_cargo; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.extra_cargo (anio, mes, nro_legajo, nro_cargo, extraccion, fecha_ingreso, fecha_egreso, planta_personal, id_convenio) FROM stdin;
\.


--
-- Data for Name: extra_siradig; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.extra_siradig (legajo, cuit, anio, mes, nrover, atributo, valoracum, createdat, updatedat, estadoliq) FROM stdin;
14397	20145571708	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:34:41.068329	2023-06-25 00:34:41.068329	N
14397	20145571708	2022	2	1	fam_hijos_100	200.00	2023-06-25 00:34:41.07096	2023-06-25 00:34:41.07096	N
14397	20145571708	2022	3	1	fam_hijos_100	300.00	2023-06-25 00:34:41.072103	2023-06-25 00:34:41.072103	N
14397	20145571708	2022	4	1	fam_hijos_100	400.00	2023-06-25 00:34:41.073137	2023-06-25 00:34:41.073137	N
14823	27172609800	2022	1	3	ded_cuota_medica	28892.24	2023-06-25 00:34:41.074105	2023-06-25 00:34:41.074105	N
14823	27172609800	2022	2	3	ded_cuota_medica	65054.48	2023-06-25 00:34:41.074805	2023-06-25 00:34:41.074805	N
15392	20183568958	2022	1	1	ded_retiro	4800.00	2023-06-25 00:34:41.075565	2023-06-25 00:34:41.075565	N
15392	20183568958	2022	2	1	ded_retiro	9600.00	2023-06-25 00:34:41.076216	2023-06-25 00:34:41.076216	N
15485	20106503134	2022	1	3	ded_cuota_medica	120700.02	2023-06-25 00:34:41.076915	2023-06-25 00:34:41.076915	N
15485	20106503134	2022	2	3	ded_cuota_medica	241400.04	2023-06-25 00:34:41.077684	2023-06-25 00:34:41.077684	N
15485	20106503134	2022	3	3	ded_cuota_medica	369340.04	2023-06-25 00:34:41.078647	2023-06-25 00:34:41.078647	N
15591	27171033247	2022	1	2	ded_domestica	22328.52	2023-06-25 00:34:41.079367	2023-06-25 00:34:41.079367	N
15591	27171033247	2022	2	2	ded_domestica	44216.28	2023-06-25 00:34:41.080088	2023-06-25 00:34:41.080088	N
15591	27171033247	2022	3	2	ded_domestica	67855.28	2023-06-25 00:34:41.080842	2023-06-25 00:34:41.080842	N
16409	27172130327	2022	1	5	ded_cuota_medica	12515.86	2023-06-25 00:34:41.081551	2023-06-25 00:34:41.081551	N
16409	27172130327	2022	1	5	otro_ex_nogan	57000.00	2023-06-25 00:34:41.08224	2023-06-25 00:34:41.08224	N
16409	27172130327	2022	1	5	otro_gan_brut	36750.00	2023-06-25 00:34:41.082982	2023-06-25 00:34:41.082982	N
16409	27172130327	2022	2	5	ded_cuota_medica	26785.14	2023-06-25 00:34:41.083706	2023-06-25 00:34:41.083706	N
16409	27172130327	2022	2	5	otro_ex_nogan	114000.00	2023-06-25 00:34:41.084426	2023-06-25 00:34:41.084426	N
16409	27172130327	2022	2	5	otro_gan_brut	73500.00	2023-06-25 00:34:41.085131	2023-06-25 00:34:41.085131	N
16409	27172130327	2022	3	5	ded_cuota_medica	40195.50	2023-06-25 00:34:41.085871	2023-06-25 00:34:41.085871	N
16409	27172130327	2022	3	5	otro_ex_nogan	171000.00	2023-06-25 00:34:41.086568	2023-06-25 00:34:41.086568	N
16409	27172130327	2022	3	5	otro_gan_brut	110250.00	2023-06-25 00:34:41.087283	2023-06-25 00:34:41.087283	N
16409	27172130327	2022	4	5	ded_cuota_medica	49552.48	2023-06-25 00:34:41.088032	2023-06-25 00:34:41.088032	N
17174	20148364215	2022	1	1	fam_hijos_100	200.00	2023-06-25 00:34:41.088874	2023-06-25 00:34:41.088874	N
17174	20148364215	2022	2	1	fam_hijos_100	400.00	2023-06-25 00:34:41.089656	2023-06-25 00:34:41.089656	N
17174	20148364215	2022	3	1	fam_hijos_100	600.00	2023-06-25 00:34:41.090774	2023-06-25 00:34:41.090774	N
17174	20148364215	2022	4	1	fam_hijos_100	800.00	2023-06-25 00:34:41.091841	2023-06-25 00:34:41.091841	N
17174	20148364215	2022	5	1	fam_hijos_100	1000.00	2023-06-25 00:34:41.092897	2023-06-25 00:34:41.092897	N
17174	20148364215	2022	6	1	fam_hijos_100	1200.00	2023-06-25 00:34:41.094018	2023-06-25 00:34:41.094018	N
17174	20148364215	2022	7	1	fam_hijos_100	1400.00	2023-06-25 00:34:41.094747	2023-06-25 00:34:41.094747	N
17174	20148364215	2022	8	1	fam_hijos_100	1600.00	2023-06-25 00:34:41.095584	2023-06-25 00:34:41.095584	N
17174	20148364215	2022	9	1	fam_hijos_100	1800.00	2023-06-25 00:34:41.096312	2023-06-25 00:34:41.096312	N
17174	20148364215	2022	10	1	fam_hijos_100	2000.00	2023-06-25 00:34:41.097089	2023-06-25 00:34:41.097089	N
17174	20148364215	2022	11	1	fam_hijos_100	2200.00	2023-06-25 00:34:41.09782	2023-06-25 00:34:41.09782	N
17346	27183191530	2022	1	3	ded_cuota_medica	14038.00	2023-06-25 00:34:41.098562	2023-06-25 00:34:41.098562	N
17346	27183191530	2022	2	3	ded_cuota_medica	29712.00	2023-06-25 00:34:41.099273	2023-06-25 00:34:41.099273	N
17346	27183191530	2022	3	3	ded_cuota_medica	48432.00	2023-06-25 00:34:41.10003	2023-06-25 00:34:41.10003	N
17430	27166775006	2022	1	5	ded_cuota_medica	4388.52	2023-06-25 00:34:41.100725	2023-06-25 00:34:41.100725	N
17430	27166775006	2022	2	5	ded_cuota_medica	6773.36	2023-06-25 00:34:41.101446	2023-06-25 00:34:41.101446	N
17602	27168933105	2022	1	4	ded_cuota_medica	22155.30	2023-06-25 00:34:41.102175	2023-06-25 00:34:41.102175	N
17602	27168933105	2022	2	4	ded_cuota_medica	41120.40	2023-06-25 00:34:41.103214	2023-06-25 00:34:41.103214	N
17602	27168933105	2022	3	4	ded_cuota_medica	42208.08	2023-06-25 00:34:41.103971	2023-06-25 00:34:41.103971	N
17602	27168933105	2022	4	4	ded_cuota_medica	69465.40	2023-06-25 00:34:41.10467	2023-06-25 00:34:41.10467	N
17608	27148204530	2022	1	1	otro_gan_brut	57495.36	2023-06-25 00:34:41.105482	2023-06-25 00:34:41.105482	N
17608	27148204530	2022	1	1	otro_seg_soc	8552.20	2023-06-25 00:34:41.106318	2023-06-25 00:34:41.106318	N
17681	27163213287	2022	1	4	ded_gastos_medicos	2400.00	2023-06-25 00:34:41.107083	2023-06-25 00:34:41.107083	N
17681	27163213287	2022	2	4	ded_gastos_medicos	5600.00	2023-06-25 00:34:41.107823	2023-06-25 00:34:41.107823	N
17681	27163213287	2022	3	4	ded_gastos_medicos	8800.00	2023-06-25 00:34:41.108521	2023-06-25 00:34:41.108521	N
17714	20166806330	2022	1	1	ded_cuota_medica	21585.02	2023-06-25 00:34:41.10927	2023-06-25 00:34:41.10927	N
17714	20166806330	2022	2	1	ded_cuota_medica	42981.46	2023-06-25 00:34:41.109987	2023-06-25 00:34:41.109987	N
17714	20166806330	2022	3	1	ded_cuota_medica	62233.72	2023-06-25 00:34:41.11068	2023-06-25 00:34:41.11068	N
17730	27168506568	2022	1	3	ded_cuota_medica	39720.74	2023-06-25 00:34:41.111383	2023-06-25 00:34:41.111383	N
17730	27168506568	2022	1	3	ded_gastos_medicos	4000.00	2023-06-25 00:34:41.112128	2023-06-25 00:34:41.112128	N
17730	27168506568	2022	2	3	ded_cuota_medica	79441.48	2023-06-25 00:34:41.112811	2023-06-25 00:34:41.112811	N
17730	27168506568	2022	3	3	ded_gastos_medicos	6240.00	2023-06-25 00:34:41.113411	2023-06-25 00:34:41.113411	N
17730	27168506568	2022	4	3	ded_gastos_medicos	6464.00	2023-06-25 00:34:41.114098	2023-06-25 00:34:41.114098	N
18146	27140426879	2022	1	3	ded_domestica	40960.00	2023-06-25 00:34:41.11475	2023-06-25 00:34:41.11475	N
18146	27140426879	2022	1	3	otro_gan_brut	374179.74	2023-06-25 00:34:41.115419	2023-06-25 00:34:41.115419	N
18146	27140426879	2022	1	3	otro_seg_soc	28465.36	2023-06-25 00:34:41.116074	2023-06-25 00:34:41.116074	N
18146	27140426879	2022	1	3	otro_sindicato	9794.62	2023-06-25 00:34:41.116825	2023-06-25 00:34:41.116825	N
18146	27140426879	2022	2	3	ded_cuota_medica	25132.90	2023-06-25 00:34:41.117446	2023-06-25 00:34:41.117446	N
18146	27140426879	2022	2	3	ded_domestica	103174.00	2023-06-25 00:34:41.118147	2023-06-25 00:34:41.118147	N
18146	27140426879	2022	2	3	otro_gan_brut	748359.38	2023-06-25 00:34:41.11884	2023-06-25 00:34:41.11884	N
18146	27140426879	2022	2	3	otro_seg_soc	56930.72	2023-06-25 00:34:41.119584	2023-06-25 00:34:41.119584	N
18146	27140426879	2022	2	3	otro_sindicato	19589.24	2023-06-25 00:34:41.120307	2023-06-25 00:34:41.120307	N
18146	27140426879	2022	3	3	ded_cuota_medica	56165.60	2023-06-25 00:34:41.120993	2023-06-25 00:34:41.120993	N
18146	27140426879	2022	3	3	ded_domestica	156550.00	2023-06-25 00:34:41.121684	2023-06-25 00:34:41.121684	N
18146	27140426879	2022	3	3	otro_gan_brut	1062605.90	2023-06-25 00:34:41.122426	2023-06-25 00:34:41.122426	N
18146	27140426879	2022	3	3	otro_seg_soc	83494.02	2023-06-25 00:34:41.123218	2023-06-25 00:34:41.123218	N
18146	27140426879	2022	3	3	otro_sindicato	29477.16	2023-06-25 00:34:41.123889	2023-06-25 00:34:41.123889	N
18191	27208638934	2022	1	1	ded_cuota_medica	0.02	2023-06-25 00:34:41.124584	2023-06-25 00:34:41.124584	N
18191	27208638934	2022	1	1	fam_hijos_100	200.00	2023-06-25 00:34:41.125371	2023-06-25 00:34:41.125371	N
18191	27208638934	2022	1	1	fam_hijos_disc_50	200.00	2023-06-25 00:34:41.126096	2023-06-25 00:34:41.126096	N
18191	27208638934	2022	2	1	fam_hijos_100	400.00	2023-06-25 00:34:41.127152	2023-06-25 00:34:41.127152	N
18191	27208638934	2022	2	1	fam_hijos_disc_50	400.00	2023-06-25 00:34:41.128196	2023-06-25 00:34:41.128196	N
18191	27208638934	2022	3	1	fam_hijos_100	600.00	2023-06-25 00:34:41.129265	2023-06-25 00:34:41.129265	N
18191	27208638934	2022	3	1	fam_hijos_disc_50	600.00	2023-06-25 00:34:41.130338	2023-06-25 00:34:41.130338	N
18191	27208638934	2022	4	1	fam_hijos_100	800.00	2023-06-25 00:34:41.131077	2023-06-25 00:34:41.131077	N
18191	27208638934	2022	4	1	fam_hijos_disc_50	800.00	2023-06-25 00:34:41.131733	2023-06-25 00:34:41.131733	N
18191	27208638934	2022	5	1	fam_hijos_100	1000.00	2023-06-25 00:34:41.132408	2023-06-25 00:34:41.132408	N
18191	27208638934	2022	5	1	fam_hijos_disc_50	1000.00	2023-06-25 00:34:41.133098	2023-06-25 00:34:41.133098	N
18191	27208638934	2022	6	1	fam_hijos_100	1200.00	2023-06-25 00:34:41.133802	2023-06-25 00:34:41.133802	N
18191	27208638934	2022	6	1	fam_hijos_disc_50	1200.00	2023-06-25 00:34:41.134506	2023-06-25 00:34:41.134506	N
18191	27208638934	2022	7	1	fam_hijos_100	1400.00	2023-06-25 00:34:41.135256	2023-06-25 00:34:41.135256	N
18191	27208638934	2022	7	1	fam_hijos_disc_50	1400.00	2023-06-25 00:34:41.136016	2023-06-25 00:34:41.136016	N
18191	27208638934	2022	8	1	fam_hijos_100	1600.00	2023-06-25 00:34:41.136726	2023-06-25 00:34:41.136726	N
18191	27208638934	2022	8	1	fam_hijos_disc_50	1600.00	2023-06-25 00:34:41.137346	2023-06-25 00:34:41.137346	N
18191	27208638934	2022	9	1	fam_hijos_100	1800.00	2023-06-25 00:34:41.138011	2023-06-25 00:34:41.138011	N
18191	27208638934	2022	9	1	fam_hijos_disc_50	1800.00	2023-06-25 00:34:41.138688	2023-06-25 00:34:41.138688	N
18191	27208638934	2022	10	1	fam_hijos_100	2000.00	2023-06-25 00:34:41.139383	2023-06-25 00:34:41.139383	N
18191	27208638934	2022	10	1	fam_hijos_disc_50	2000.00	2023-06-25 00:34:41.14006	2023-06-25 00:34:41.14006	N
18191	27208638934	2022	11	1	fam_hijos_100	2200.00	2023-06-25 00:34:41.140788	2023-06-25 00:34:41.140788	N
18191	27208638934	2022	11	1	fam_hijos_disc_50	2200.00	2023-06-25 00:34:41.141438	2023-06-25 00:34:41.141438	N
18191	27208638934	2022	12	1	fam_hijos_100	2400.00	2023-06-25 00:34:41.14215	2023-06-25 00:34:41.14215	N
18191	27208638934	2022	12	1	fam_hijos_disc_50	2400.00	2023-06-25 00:34:41.142837	2023-06-25 00:34:41.142837	N
18540	20170309430	2022	1	3	otro_gan_brut	398606.80	2023-06-25 00:34:41.143543	2023-06-25 00:34:41.143543	N
18540	20170309430	2022	1	3	otro_obra_soc	11958.20	2023-06-25 00:34:41.144253	2023-06-25 00:34:41.144253	N
18540	20170309430	2022	1	3	otro_sac	2024.06	2023-06-25 00:34:41.144973	2023-06-25 00:34:41.144973	N
18540	20170309430	2022	1	3	otro_seg_soc	63777.08	2023-06-25 00:34:41.145685	2023-06-25 00:34:41.145685	N
18540	20170309430	2022	1	3	otro_sindicato	17937.30	2023-06-25 00:34:41.146381	2023-06-25 00:34:41.146381	N
18540	20170309430	2022	2	3	otro_gan_brut	817533.60	2023-06-25 00:34:41.147077	2023-06-25 00:34:41.147077	N
18540	20170309430	2022	2	3	otro_obra_soc	23916.40	2023-06-25 00:34:41.147801	2023-06-25 00:34:41.147801	N
18540	20170309430	2022	2	3	otro_seg_soc	127554.16	2023-06-25 00:34:41.14854	2023-06-25 00:34:41.14854	N
18540	20170309430	2022	2	3	otro_sindicato	35874.60	2023-06-25 00:34:41.149251	2023-06-25 00:34:41.149251	N
18540	20170309430	2022	3	3	otro_gan_brut	1236460.40	2023-06-25 00:34:41.149938	2023-06-25 00:34:41.149938	N
18540	20170309430	2022	3	3	otro_obra_soc	35874.60	2023-06-25 00:34:41.150633	2023-06-25 00:34:41.150633	N
18540	20170309430	2022	3	3	otro_seg_soc	191331.24	2023-06-25 00:34:41.151315	2023-06-25 00:34:41.151315	N
18540	20170309430	2022	3	3	otro_sindicato	53811.90	2023-06-25 00:34:41.152054	2023-06-25 00:34:41.152054	N
18769	20142476089	2022	1	5	ded_cuota_medica	11550.00	2023-06-25 00:34:41.152716	2023-06-25 00:34:41.152716	N
18769	20142476089	2022	1	5	ded_domestica	47982.72	2023-06-25 00:34:41.153348	2023-06-25 00:34:41.153348	N
18769	20142476089	2022	1	5	fam_hijos_100	200.00	2023-06-25 00:34:41.154051	2023-06-25 00:34:41.154051	N
18769	20142476089	2022	2	5	ded_domestica	71006.72	2023-06-25 00:34:41.154722	2023-06-25 00:34:41.154722	N
18769	20142476089	2022	2	5	fam_hijos_100	400.00	2023-06-25 00:34:41.155428	2023-06-25 00:34:41.155428	N
18769	20142476089	2022	3	5	ded_domestica	102790.62	2023-06-25 00:34:41.156165	2023-06-25 00:34:41.156165	N
18769	20142476089	2022	3	5	fam_hijos_100	600.00	2023-06-25 00:34:41.156841	2023-06-25 00:34:41.156841	N
18769	20142476089	2022	4	5	ded_domestica	182790.62	2023-06-25 00:34:41.157455	2023-06-25 00:34:41.157455	N
18769	20142476089	2022	4	5	fam_hijos_100	800.00	2023-06-25 00:34:41.158158	2023-06-25 00:34:41.158158	N
18769	20142476089	2022	5	5	fam_hijos_100	1000.00	2023-06-25 00:34:41.159268	2023-06-25 00:34:41.159268	N
18769	20142476089	2022	6	5	fam_hijos_100	1200.00	2023-06-25 00:34:41.160512	2023-06-25 00:34:41.160512	N
18769	20142476089	2022	7	5	fam_hijos_100	1400.00	2023-06-25 00:34:41.161296	2023-06-25 00:34:41.161296	N
18958	20120856511	2022	1	1	FECDEVDESDE	200.00	2023-06-25 00:34:41.162009	2023-06-25 00:34:41.162009	N
18958	20120856511	2022	2	1	FECDEVDESDE	400.00	2023-06-25 00:34:41.163024	2023-06-25 00:34:41.163024	N
18958	20120856511	2022	3	1	FECDEVDESDE	600.00	2023-06-25 00:34:41.164044	2023-06-25 00:34:41.164044	N
18958	20120856511	2022	4	1	FECDEVDESDE	800.00	2023-06-25 00:34:41.165087	2023-06-25 00:34:41.165087	N
18958	20120856511	2022	5	1	FECDEVDESDE	1000.00	2023-06-25 00:34:41.166119	2023-06-25 00:34:41.166119	N
18958	20120856511	2022	6	1	FECDEVDESDE	1200.00	2023-06-25 00:34:41.166891	2023-06-25 00:34:41.166891	N
18958	20120856511	2022	7	1	FECDEVDESDE	1400.00	2023-06-25 00:34:41.167646	2023-06-25 00:34:41.167646	N
18958	20120856511	2022	8	1	FECDEVDESDE	1600.00	2023-06-25 00:34:41.168364	2023-06-25 00:34:41.168364	N
18958	20120856511	2022	9	1	FECDEVDESDE	1800.00	2023-06-25 00:34:41.169189	2023-06-25 00:34:41.169189	N
18958	20120856511	2022	10	1	FECDEVDESDE	2000.00	2023-06-25 00:34:41.170067	2023-06-25 00:34:41.170067	N
18958	20120856511	2022	11	1	FECDEVDESDE	2200.00	2023-06-25 00:34:41.170819	2023-06-25 00:34:41.170819	N
18958	20120856511	2022	12	1	FECDEVDESDE	2400.00	2023-06-25 00:34:41.171562	2023-06-25 00:34:41.171562	N
19199	27219725529	2022	1	1	ded_cuota_medica	37270.00	2023-06-25 00:34:41.172343	2023-06-25 00:34:41.172343	N
19199	27219725529	2022	1	1	ded_donaciones	10400.00	2023-06-25 00:34:41.173118	2023-06-25 00:34:41.173118	N
19199	27219725529	2022	1	1	ded_int_hipotecarios	4910.00	2023-06-25 00:34:41.173929	2023-06-25 00:34:41.173929	N
19199	27219725529	2022	1	1	ded_retiro	4100.00	2023-06-25 00:34:41.174719	2023-06-25 00:34:41.174719	N
19199	27219725529	2022	1	1	ded_seguros	4100.00	2023-06-25 00:34:41.175464	2023-06-25 00:34:41.175464	N
19199	27219725529	2022	2	1	ded_cuota_medica	74540.00	2023-06-25 00:34:41.176201	2023-06-25 00:34:41.176201	N
19199	27219725529	2022	2	1	ded_donaciones	20800.00	2023-06-25 00:34:41.176915	2023-06-25 00:34:41.176915	N
19199	27219725529	2022	2	1	ded_int_hipotecarios	9820.00	2023-06-25 00:34:41.177655	2023-06-25 00:34:41.177655	N
19199	27219725529	2022	2	1	ded_retiro	8200.00	2023-06-25 00:34:41.178372	2023-06-25 00:34:41.178372	N
19199	27219725529	2022	2	1	ded_seguros	8200.00	2023-06-25 00:34:41.179054	2023-06-25 00:34:41.179054	N
19199	27219725529	2022	3	1	ded_cuota_medica	111810.00	2023-06-25 00:34:41.179756	2023-06-25 00:34:41.179756	N
19199	27219725529	2022	3	1	ded_donaciones	31200.00	2023-06-25 00:34:41.180514	2023-06-25 00:34:41.180514	N
19199	27219725529	2022	3	1	ded_int_hipotecarios	14730.00	2023-06-25 00:34:41.181205	2023-06-25 00:34:41.181205	N
19199	27219725529	2022	3	1	ded_retiro	12300.00	2023-06-25 00:34:41.181885	2023-06-25 00:34:41.181885	N
19199	27219725529	2022	3	1	ded_seguros	12300.00	2023-06-25 00:34:41.182574	2023-06-25 00:34:41.182574	N
19199	27219725529	2022	4	1	ded_cuota_medica	149080.00	2023-06-25 00:34:41.183243	2023-06-25 00:34:41.183243	N
19199	27219725529	2022	4	1	ded_donaciones	41600.00	2023-06-25 00:34:41.183956	2023-06-25 00:34:41.183956	N
19199	27219725529	2022	4	1	ded_int_hipotecarios	19640.00	2023-06-25 00:34:41.18463	2023-06-25 00:34:41.18463	N
19199	27219725529	2022	4	1	ded_retiro	16400.00	2023-06-25 00:34:41.185351	2023-06-25 00:34:41.185351	N
19199	27219725529	2022	4	1	ded_seguros	16400.00	2023-06-25 00:34:41.186147	2023-06-25 00:34:41.186147	N
19263	27124036548	2022	1	1	ded_cuota_medica	2760.00	2023-06-25 00:34:41.186844	2023-06-25 00:34:41.186844	N
19263	27124036548	2022	2	1	ded_cuota_medica	5520.00	2023-06-25 00:34:41.18752	2023-06-25 00:34:41.18752	N
19263	27124036548	2022	3	1	ded_cuota_medica	8280.00	2023-06-25 00:34:41.188296	2023-06-25 00:34:41.188296	N
19326	20173160144	2022	1	4	ded_domestica	9534.16	2023-06-25 00:34:41.188978	2023-06-25 00:34:41.188978	N
19326	20173160144	2022	2	4	ded_domestica	21206.48	2023-06-25 00:34:41.189745	2023-06-25 00:34:41.189745	N
19326	20173160144	2022	3	4	ded_domestica	27878.48	2023-06-25 00:34:41.19047	2023-06-25 00:34:41.19047	N
19326	20173160144	2022	4	4	ded_domestica	35223.68	2023-06-25 00:34:41.191203	2023-06-25 00:34:41.191203	N
19652	20230085723	2022	1	2	fam_hijos_100	200.00	2023-06-25 00:34:41.192052	2023-06-25 00:34:41.192052	N
19652	20230085723	2022	1	2	FECDEVDESDE	200.00	2023-06-25 00:34:41.192731	2023-06-25 00:34:41.192731	N
19652	20230085723	2022	1	2	otro_gan_brut	148152.12	2023-06-25 00:34:41.193676	2023-06-25 00:34:41.193676	N
19652	20230085723	2022	1	2	otro_obra_soc	7990.20	2023-06-25 00:34:41.194399	2023-06-25 00:34:41.194399	N
19652	20230085723	2022	1	2	otro_seg_soc	23704.34	2023-06-25 00:34:41.19509	2023-06-25 00:34:41.19509	N
19652	20230085723	2022	2	2	fam_hijos_100	400.00	2023-06-25 00:34:41.195804	2023-06-25 00:34:41.195804	N
19652	20230085723	2022	2	2	FECDEVDESDE	400.00	2023-06-25 00:34:41.196498	2023-06-25 00:34:41.196498	N
19652	20230085723	2022	2	2	otro_gan_brut	296366.88	2023-06-25 00:34:41.197184	2023-06-25 00:34:41.197184	N
19652	20230085723	2022	2	2	otro_obra_soc	15412.78	2023-06-25 00:34:41.19792	2023-06-25 00:34:41.19792	N
19652	20230085723	2022	2	2	otro_seg_soc	47418.70	2023-06-25 00:34:41.198664	2023-06-25 00:34:41.198664	N
19652	20230085723	2022	3	2	fam_hijos_100	600.00	2023-06-25 00:34:41.199699	2023-06-25 00:34:41.199699	N
19652	20230085723	2022	3	2	FECDEVDESDE	600.00	2023-06-25 00:34:41.200719	2023-06-25 00:34:41.200719	N
19652	20230085723	2022	4	2	fam_hijos_100	800.00	2023-06-25 00:34:41.201728	2023-06-25 00:34:41.201728	N
19652	20230085723	2022	4	2	FECDEVDESDE	800.00	2023-06-25 00:34:41.202847	2023-06-25 00:34:41.202847	N
19652	20230085723	2022	5	2	fam_hijos_100	1000.00	2023-06-25 00:34:41.203518	2023-06-25 00:34:41.203518	N
19652	20230085723	2022	5	2	FECDEVDESDE	1000.00	2023-06-25 00:34:41.204301	2023-06-25 00:34:41.204301	N
19652	20230085723	2022	6	2	fam_hijos_100	1200.00	2023-06-25 00:34:41.205107	2023-06-25 00:34:41.205107	N
19652	20230085723	2022	6	2	FECDEVDESDE	1200.00	2023-06-25 00:34:41.205854	2023-06-25 00:34:41.205854	N
19652	20230085723	2022	7	2	fam_hijos_100	1400.00	2023-06-25 00:34:41.206585	2023-06-25 00:34:41.206585	N
19652	20230085723	2022	7	2	FECDEVDESDE	1400.00	2023-06-25 00:34:41.207266	2023-06-25 00:34:41.207266	N
19652	20230085723	2022	8	2	fam_hijos_100	1600.00	2023-06-25 00:34:41.208121	2023-06-25 00:34:41.208121	N
19652	20230085723	2022	8	2	FECDEVDESDE	1600.00	2023-06-25 00:34:41.20898	2023-06-25 00:34:41.20898	N
19652	20230085723	2022	9	2	fam_hijos_100	1800.00	2023-06-25 00:34:41.209719	2023-06-25 00:34:41.209719	N
19652	20230085723	2022	9	2	FECDEVDESDE	1800.00	2023-06-25 00:34:41.210401	2023-06-25 00:34:41.210401	N
19652	20230085723	2022	10	2	fam_hijos_100	2000.00	2023-06-25 00:34:41.21111	2023-06-25 00:34:41.21111	N
19652	20230085723	2022	10	2	FECDEVDESDE	2000.00	2023-06-25 00:34:41.211789	2023-06-25 00:34:41.211789	N
19652	20230085723	2022	11	2	fam_hijos_100	2200.00	2023-06-25 00:34:41.212495	2023-06-25 00:34:41.212495	N
19652	20230085723	2022	11	2	FECDEVDESDE	2200.00	2023-06-25 00:34:41.213157	2023-06-25 00:34:41.213157	N
19652	20230085723	2022	12	2	fam_hijos_100	2400.00	2023-06-25 00:34:41.213924	2023-06-25 00:34:41.213924	N
19652	20230085723	2022	12	2	FECDEVDESDE	2400.00	2023-06-25 00:34:41.214877	2023-06-25 00:34:41.214877	N
19832	27227082424	2022	1	1	fam_hijos_100	400.00	2023-06-25 00:34:41.215562	2023-06-25 00:34:41.215562	N
19832	27227082424	2022	2	1	fam_hijos_100	800.00	2023-06-25 00:34:41.216194	2023-06-25 00:34:41.216194	N
19832	27227082424	2022	3	1	fam_hijos_100	1200.00	2023-06-25 00:34:41.216917	2023-06-25 00:34:41.216917	N
19832	27227082424	2022	4	1	fam_hijos_100	1600.00	2023-06-25 00:34:41.217627	2023-06-25 00:34:41.217627	N
19832	27227082424	2022	5	1	fam_hijos_100	2000.00	2023-06-25 00:34:41.218302	2023-06-25 00:34:41.218302	N
19832	27227082424	2022	6	1	fam_hijos_100	2400.00	2023-06-25 00:34:41.218999	2023-06-25 00:34:41.218999	N
19832	27227082424	2022	7	1	fam_hijos_100	2800.00	2023-06-25 00:34:41.219676	2023-06-25 00:34:41.219676	N
19832	27227082424	2022	8	1	fam_hijos_100	3200.00	2023-06-25 00:34:41.220394	2023-06-25 00:34:41.220394	N
19832	27227082424	2022	9	1	fam_hijos_100	3600.00	2023-06-25 00:34:41.221102	2023-06-25 00:34:41.221102	N
19832	27227082424	2022	10	1	fam_hijos_100	4000.00	2023-06-25 00:34:41.22184	2023-06-25 00:34:41.22184	N
19832	27227082424	2022	11	1	fam_hijos_100	4400.00	2023-06-25 00:34:41.222564	2023-06-25 00:34:41.222564	N
19832	27227082424	2022	12	1	fam_hijos_100	4800.00	2023-06-25 00:34:41.223279	2023-06-25 00:34:41.223279	N
19851	27925229070	2022	1	3	ded_int_hipotecarios	4503.66	2023-06-25 00:34:41.223983	2023-06-25 00:34:41.223983	N
19851	27925229070	2022	1	3	ded_seguros	146.40	2023-06-25 00:34:41.224671	2023-06-25 00:34:41.224671	N
19851	27925229070	2022	2	3	ded_int_hipotecarios	9160.88	2023-06-25 00:34:41.22536	2023-06-25 00:34:41.22536	N
19851	27925229070	2022	2	3	ded_seguros	292.44	2023-06-25 00:34:41.226058	2023-06-25 00:34:41.226058	N
33392	27230605578	2022	1	2	ded_cuota_medica	20981.74	2023-06-25 00:34:41.226785	2023-06-25 00:34:41.226785	N
33392	27230605578	2022	1	2	fam_hijos_100	200.00	2023-06-25 00:34:41.227513	2023-06-25 00:34:41.227513	N
33392	27230605578	2022	2	2	ded_cuota_medica	41963.48	2023-06-25 00:34:41.228225	2023-06-25 00:34:41.228225	N
33392	27230605578	2022	2	2	ded_indumentaria	7617.50	2023-06-25 00:34:41.22893	2023-06-25 00:34:41.22893	N
33392	27230605578	2022	2	2	fam_hijos_100	400.00	2023-06-25 00:34:41.229588	2023-06-25 00:34:41.229588	N
33392	27230605578	2022	3	2	ded_cuota_medica	62945.22	2023-06-25 00:34:41.230297	2023-06-25 00:34:41.230297	N
33392	27230605578	2022	3	2	ded_indumentaria	37810.78	2023-06-25 00:34:41.230981	2023-06-25 00:34:41.230981	N
33392	27230605578	2022	3	2	fam_hijos_100	600.00	2023-06-25 00:34:41.23169	2023-06-25 00:34:41.23169	N
33392	27230605578	2022	4	2	fam_hijos_100	800.00	2023-06-25 00:34:41.232423	2023-06-25 00:34:41.232423	N
33392	27230605578	2022	5	2	fam_hijos_100	1000.00	2023-06-25 00:34:41.23311	2023-06-25 00:34:41.23311	N
33392	27230605578	2022	6	2	fam_hijos_100	1200.00	2023-06-25 00:34:41.233834	2023-06-25 00:34:41.233834	N
33392	27230605578	2022	7	2	fam_hijos_100	1400.00	2023-06-25 00:34:41.234562	2023-06-25 00:34:41.234562	N
33392	27230605578	2022	8	2	fam_hijos_100	1600.00	2023-06-25 00:34:41.235589	2023-06-25 00:34:41.235589	N
33392	27230605578	2022	9	2	fam_hijos_100	1800.00	2023-06-25 00:34:41.236594	2023-06-25 00:34:41.236594	N
33392	27230605578	2022	10	2	fam_hijos_100	2000.00	2023-06-25 00:34:41.237564	2023-06-25 00:34:41.237564	N
33392	27230605578	2022	11	2	fam_hijos_100	2200.00	2023-06-25 00:34:41.238623	2023-06-25 00:34:41.238623	N
33392	27230605578	2022	12	2	fam_hijos_100	2400.00	2023-06-25 00:34:41.239418	2023-06-25 00:34:41.239418	N
33424	20214556430	2022	1	3	ded_cuota_medica	54941.82	2023-06-25 00:34:41.240173	2023-06-25 00:34:41.240173	N
33424	20214556430	2022	1	3	fam_hijos_100	400.00	2023-06-25 00:34:41.240854	2023-06-25 00:34:41.240854	N
33424	20214556430	2022	2	3	ded_cuota_medica	112429.64	2023-06-25 00:34:41.241466	2023-06-25 00:34:41.241466	N
33424	20214556430	2022	2	3	fam_hijos_100	800.00	2023-06-25 00:34:41.242261	2023-06-25 00:34:41.242261	N
33424	20214556430	2022	3	3	fam_hijos_100	1200.00	2023-06-25 00:34:41.242979	2023-06-25 00:34:41.242979	N
33424	20214556430	2022	4	3	fam_hijos_100	1600.00	2023-06-25 00:34:41.243662	2023-06-25 00:34:41.243662	N
33424	20214556430	2022	5	3	fam_hijos_100	2000.00	2023-06-25 00:34:41.244339	2023-06-25 00:34:41.244339	N
33424	20214556430	2022	6	3	fam_hijos_100	2400.00	2023-06-25 00:34:41.245143	2023-06-25 00:34:41.245143	N
33424	20214556430	2022	7	3	fam_hijos_100	2800.00	2023-06-25 00:34:41.245857	2023-06-25 00:34:41.245857	N
33424	20214556430	2022	8	3	fam_hijos_100	3200.00	2023-06-25 00:34:41.246576	2023-06-25 00:34:41.246576	N
33424	20214556430	2022	9	3	fam_hijos_100	3600.00	2023-06-25 00:34:41.24731	2023-06-25 00:34:41.24731	N
33424	20214556430	2022	10	3	fam_hijos_100	4000.00	2023-06-25 00:34:41.247992	2023-06-25 00:34:41.247992	N
33424	20214556430	2022	11	3	fam_hijos_100	4400.00	2023-06-25 00:34:41.248676	2023-06-25 00:34:41.248676	N
33424	20214556430	2022	12	3	fam_hijos_100	4800.00	2023-06-25 00:34:41.249356	2023-06-25 00:34:41.249356	N
34953	20171720967	2022	1	3	ded_cuota_medica	37725.32	2023-06-25 00:34:41.250012	2023-06-25 00:34:41.250012	N
34953	20171720967	2022	1	3	ded_domestica	29903.90	2023-06-25 00:34:41.25078	2023-06-25 00:34:41.25078	N
34953	20171720967	2022	2	3	ded_cuota_medica	79037.96	2023-06-25 00:34:41.251483	2023-06-25 00:34:41.251483	N
34953	20171720967	2022	2	3	ded_domestica	59917.14	2023-06-25 00:34:41.252188	2023-06-25 00:34:41.252188	N
34953	20171720967	2022	3	3	ded_cuota_medica	120350.60	2023-06-25 00:34:41.252892	2023-06-25 00:34:41.252892	N
34953	20171720967	2022	3	3	ded_domestica	89925.80	2023-06-25 00:34:41.253696	2023-06-25 00:34:41.253696	N
34953	20171720967	2022	4	3	ded_cuota_medica	163899.30	2023-06-25 00:34:41.254394	2023-06-25 00:34:41.254394	N
35774	27238794027	2022	1	3	ded_cuota_medica	8361.94	2023-06-25 00:34:41.25512	2023-06-25 00:34:41.25512	N
35774	27238794027	2022	1	3	ded_indumentaria	7800.00	2023-06-25 00:34:41.255843	2023-06-25 00:34:41.255843	N
35774	27238794027	2022	1	3	fam_hijos_100	200.00	2023-06-25 00:34:41.256598	2023-06-25 00:34:41.256598	N
35774	27238794027	2022	2	3	ded_indumentaria	37236.00	2023-06-25 00:34:41.257303	2023-06-25 00:34:41.257303	N
35774	27238794027	2022	2	3	fam_hijos_100	400.00	2023-06-25 00:34:41.258005	2023-06-25 00:34:41.258005	N
35774	27238794027	2022	3	3	ded_cuota_medica	11361.94	2023-06-25 00:34:41.258687	2023-06-25 00:34:41.258687	N
35774	27238794027	2022	3	3	fam_hijos_100	600.00	2023-06-25 00:34:41.259462	2023-06-25 00:34:41.259462	N
35774	27238794027	2022	4	3	fam_hijos_100	800.00	2023-06-25 00:34:41.260174	2023-06-25 00:34:41.260174	N
35774	27238794027	2022	5	3	fam_hijos_100	1000.00	2023-06-25 00:34:41.260915	2023-06-25 00:34:41.260915	N
35774	27238794027	2022	6	3	fam_hijos_100	1200.00	2023-06-25 00:34:41.261554	2023-06-25 00:34:41.261554	N
35774	27238794027	2022	7	3	fam_hijos_100	1400.00	2023-06-25 00:34:41.262364	2023-06-25 00:34:41.262364	N
35774	27238794027	2022	8	3	fam_hijos_100	1600.00	2023-06-25 00:34:41.263064	2023-06-25 00:34:41.263064	N
35774	27238794027	2022	9	3	fam_hijos_100	1800.00	2023-06-25 00:34:41.263726	2023-06-25 00:34:41.263726	N
35774	27238794027	2022	10	3	fam_hijos_100	2000.00	2023-06-25 00:34:41.26447	2023-06-25 00:34:41.26447	N
35774	27238794027	2022	11	3	fam_hijos_100	2200.00	2023-06-25 00:34:41.265272	2023-06-25 00:34:41.265272	N
35774	27238794027	2022	12	3	fam_hijos_100	2400.00	2023-06-25 00:34:41.265973	2023-06-25 00:34:41.265973	N
35799	27215526491	2022	1	2	ded_alquiler	16000.00	2023-06-25 00:34:41.26667	2023-06-25 00:34:41.26667	N
35799	27215526491	2022	2	2	ded_alquiler	32000.00	2023-06-25 00:34:41.267362	2023-06-25 00:34:41.267362	N
35799	27215526491	2022	3	2	ded_alquiler	48000.00	2023-06-25 00:34:41.26819	2023-06-25 00:34:41.26819	N
36498	27250276422	2022	1	1	ded_cuota_medica	15708.64	2023-06-25 00:34:41.268989	2023-06-25 00:34:41.268989	N
36498	27250276422	2022	1	1	fam_hijos_100	400.00	2023-06-25 00:34:41.270014	2023-06-25 00:34:41.270014	N
36498	27250276422	2022	2	1	fam_hijos_100	800.00	2023-06-25 00:34:41.270822	2023-06-25 00:34:41.270822	N
36498	27250276422	2022	3	1	fam_hijos_100	1200.00	2023-06-25 00:34:41.271887	2023-06-25 00:34:41.271887	N
36498	27250276422	2022	4	1	fam_hijos_100	1600.00	2023-06-25 00:34:41.272939	2023-06-25 00:34:41.272939	N
36498	27250276422	2022	5	1	fam_hijos_100	2000.00	2023-06-25 00:34:41.274039	2023-06-25 00:34:41.274039	N
36498	27250276422	2022	6	1	fam_hijos_100	2400.00	2023-06-25 00:34:41.275121	2023-06-25 00:34:41.275121	N
36498	27250276422	2022	7	1	fam_hijos_100	2800.00	2023-06-25 00:34:41.27599	2023-06-25 00:34:41.27599	N
36498	27250276422	2022	8	1	fam_hijos_100	3200.00	2023-06-25 00:34:41.276681	2023-06-25 00:34:41.276681	N
36498	27250276422	2022	9	1	fam_hijos_100	3600.00	2023-06-25 00:34:41.277384	2023-06-25 00:34:41.277384	N
36498	27250276422	2022	10	1	fam_hijos_100	4000.00	2023-06-25 00:34:41.278097	2023-06-25 00:34:41.278097	N
36498	27250276422	2022	11	1	fam_hijos_100	4400.00	2023-06-25 00:34:41.27897	2023-06-25 00:34:41.27897	N
36498	27250276422	2022	12	1	fam_hijos_100	4800.00	2023-06-25 00:34:41.27965	2023-06-25 00:34:41.27965	N
37222	27225268938	2022	1	2	ded_cuota_medica	3375.12	2023-06-25 00:34:41.28042	2023-06-25 00:34:41.28042	N
37222	27225268938	2022	1	2	ded_gastos_medicos	2400.00	2023-06-25 00:34:41.281118	2023-06-25 00:34:41.281118	N
37222	27225268938	2022	1	2	fam_hijos_100	200.00	2023-06-25 00:34:41.281921	2023-06-25 00:34:41.281921	N
37222	27225268938	2022	1	2	fam_hijos_disc_50	200.00	2023-06-25 00:34:41.282629	2023-06-25 00:34:41.282629	N
37222	27225268938	2022	1	2	FECDEVDESDE	200.00	2023-06-25 00:34:41.283312	2023-06-25 00:34:41.283312	N
37222	27225268938	2022	2	2	ded_cuota_medica	6346.42	2023-06-25 00:34:41.284011	2023-06-25 00:34:41.284011	N
37222	27225268938	2022	2	2	fam_hijos_disc_50	400.00	2023-06-25 00:34:41.284776	2023-06-25 00:34:41.284776	N
37222	27225268938	2022	2	2	FECDEVDESDE	400.00	2023-06-25 00:34:41.285377	2023-06-25 00:34:41.285377	N
37222	27225268938	2022	3	2	ded_cuota_medica	8324.02	2023-06-25 00:34:41.286078	2023-06-25 00:34:41.286078	N
37222	27225268938	2022	3	2	fam_hijos_disc_50	600.00	2023-06-25 00:34:41.287081	2023-06-25 00:34:41.287081	N
37222	27225268938	2022	3	2	FECDEVDESDE	600.00	2023-06-25 00:34:41.287851	2023-06-25 00:34:41.287851	N
37222	27225268938	2022	4	2	fam_hijos_disc_50	800.00	2023-06-25 00:34:41.288544	2023-06-25 00:34:41.288544	N
37222	27225268938	2022	4	2	FECDEVDESDE	800.00	2023-06-25 00:34:41.289285	2023-06-25 00:34:41.289285	N
37222	27225268938	2022	5	2	fam_hijos_disc_50	1000.00	2023-06-25 00:34:41.289985	2023-06-25 00:34:41.289985	N
37222	27225268938	2022	5	2	FECDEVDESDE	1000.00	2023-06-25 00:34:41.290875	2023-06-25 00:34:41.290875	N
37222	27225268938	2022	6	2	fam_hijos_disc_50	1200.00	2023-06-25 00:34:41.291543	2023-06-25 00:34:41.291543	N
37222	27225268938	2022	6	2	FECDEVDESDE	1200.00	2023-06-25 00:34:41.292252	2023-06-25 00:34:41.292252	N
37222	27225268938	2022	7	2	fam_hijos_disc_50	1400.00	2023-06-25 00:34:41.292933	2023-06-25 00:34:41.292933	N
37222	27225268938	2022	7	2	FECDEVDESDE	1400.00	2023-06-25 00:34:41.293767	2023-06-25 00:34:41.293767	N
37222	27225268938	2022	8	2	fam_hijos_disc_50	1600.00	2023-06-25 00:34:41.294454	2023-06-25 00:34:41.294454	N
37222	27225268938	2022	8	2	FECDEVDESDE	1600.00	2023-06-25 00:34:41.295142	2023-06-25 00:34:41.295142	N
37222	27225268938	2022	9	2	fam_hijos_disc_50	1800.00	2023-06-25 00:34:41.295929	2023-06-25 00:34:41.295929	N
37222	27225268938	2022	9	2	FECDEVDESDE	1800.00	2023-06-25 00:34:41.296736	2023-06-25 00:34:41.296736	N
37222	27225268938	2022	10	2	fam_hijos_disc_50	2000.00	2023-06-25 00:34:41.297443	2023-06-25 00:34:41.297443	N
37222	27225268938	2022	10	2	FECDEVDESDE	2000.00	2023-06-25 00:34:41.298149	2023-06-25 00:34:41.298149	N
37222	27225268938	2022	11	2	fam_hijos_disc_50	2200.00	2023-06-25 00:34:41.298891	2023-06-25 00:34:41.298891	N
37222	27225268938	2022	11	2	FECDEVDESDE	2200.00	2023-06-25 00:34:41.299657	2023-06-25 00:34:41.299657	N
37222	27225268938	2022	12	2	fam_hijos_disc_50	2400.00	2023-06-25 00:34:41.300331	2023-06-25 00:34:41.300331	N
37222	27225268938	2022	12	2	FECDEVDESDE	2400.00	2023-06-25 00:34:41.301137	2023-06-25 00:34:41.301137	N
38128	27275650590	2022	1	1	fam_hijos_100	400.00	2023-06-25 00:34:41.301834	2023-06-25 00:34:41.301834	N
38128	27275650590	2022	2	1	fam_hijos_100	800.00	2023-06-25 00:34:41.302601	2023-06-25 00:34:41.302601	N
38128	27275650590	2022	3	1	fam_hijos_100	1200.00	2023-06-25 00:34:41.303268	2023-06-25 00:34:41.303268	N
38128	27275650590	2022	4	1	fam_hijos_100	1600.00	2023-06-25 00:34:41.303986	2023-06-25 00:34:41.303986	N
38128	27275650590	2022	5	1	fam_hijos_100	2000.00	2023-06-25 00:34:41.304664	2023-06-25 00:34:41.304664	N
38128	27275650590	2022	6	1	fam_hijos_100	2400.00	2023-06-25 00:34:41.305425	2023-06-25 00:34:41.305425	N
38128	27275650590	2022	7	1	fam_hijos_100	2800.00	2023-06-25 00:34:41.306217	2023-06-25 00:34:41.306217	N
38128	27275650590	2022	8	1	fam_hijos_100	3200.00	2023-06-25 00:34:41.306926	2023-06-25 00:34:41.306926	N
38128	27275650590	2022	9	1	fam_hijos_100	3600.00	2023-06-25 00:34:41.307665	2023-06-25 00:34:41.307665	N
38128	27275650590	2022	10	1	fam_hijos_100	4000.00	2023-06-25 00:34:41.308727	2023-06-25 00:34:41.308727	N
38128	27275650590	2022	11	1	fam_hijos_100	4400.00	2023-06-25 00:34:41.309798	2023-06-25 00:34:41.309798	N
38128	27275650590	2022	12	1	fam_hijos_100	4800.00	2023-06-25 00:34:41.310869	2023-06-25 00:34:41.310869	N
39187	20114928233	2022	1	4	ded_cuota_medica	69169.28	2023-06-25 00:34:41.311921	2023-06-25 00:34:41.311921	N
39187	20114928233	2022	2	4	ded_cuota_medica	138266.56	2023-06-25 00:34:41.312766	2023-06-25 00:34:41.312766	N
39187	20114928233	2022	3	4	ded_cuota_medica	207363.84	2023-06-25 00:34:41.313396	2023-06-25 00:34:41.313396	N
39187	20114928233	2022	4	4	ded_cuota_medica	289147.40	2023-06-25 00:34:41.314106	2023-06-25 00:34:41.314106	N
40082	20325658356	2022	1	1	ded_cuota_medica	3000.00	2023-06-25 00:34:41.314926	2023-06-25 00:34:41.314926	N
40082	20325658356	2022	1	1	ded_domestica	64482.08	2023-06-25 00:34:41.315748	2023-06-25 00:34:41.315748	N
40082	20325658356	2022	2	1	ded_cuota_medica	6000.00	2023-06-25 00:34:41.316419	2023-06-25 00:34:41.316419	N
40082	20325658356	2022	2	1	ded_domestica	129013.92	2023-06-25 00:34:41.317114	2023-06-25 00:34:41.317114	N
40082	20325658356	2022	3	1	ded_cuota_medica	9000.00	2023-06-25 00:34:41.317862	2023-06-25 00:34:41.317862	N
40082	20325658356	2022	3	1	ded_domestica	199009.76	2023-06-25 00:34:41.318629	2023-06-25 00:34:41.318629	N
40359	27260108072	2022	1	1	ded_cuota_medica	42936.00	2023-06-25 00:34:41.319331	2023-06-25 00:34:41.319331	N
41231	27237809152	2022	1	1	ded_indumentaria	9528.00	2023-06-25 00:34:41.320027	2023-06-25 00:34:41.320027	N
41231	27237809152	2022	1	1	ded_seguros	5000.00	2023-06-25 00:34:41.320714	2023-06-25 00:34:41.320714	N
41231	27237809152	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:34:41.321438	2023-06-25 00:34:41.321438	N
41231	27237809152	2022	2	1	ded_seguros	10000.00	2023-06-25 00:34:41.322158	2023-06-25 00:34:41.322158	N
41231	27237809152	2022	2	1	fam_hijos_100	200.00	2023-06-25 00:34:41.323004	2023-06-25 00:34:41.323004	N
41231	27237809152	2022	3	1	ded_indumentaria	43922.00	2023-06-25 00:34:41.323721	2023-06-25 00:34:41.323721	N
41231	27237809152	2022	3	1	ded_seguros	15000.00	2023-06-25 00:34:41.324476	2023-06-25 00:34:41.324476	N
41231	27237809152	2022	3	1	fam_hijos_100	300.00	2023-06-25 00:34:41.3252	2023-06-25 00:34:41.3252	N
41231	27237809152	2022	4	1	fam_hijos_100	400.00	2023-06-25 00:34:41.325879	2023-06-25 00:34:41.325879	N
41231	27237809152	2022	5	1	fam_hijos_100	500.00	2023-06-25 00:34:41.326572	2023-06-25 00:34:41.326572	N
41231	27237809152	2022	6	1	fam_hijos_100	600.00	2023-06-25 00:34:41.327379	2023-06-25 00:34:41.327379	N
41231	27237809152	2022	7	1	fam_hijos_100	700.00	2023-06-25 00:34:41.328082	2023-06-25 00:34:41.328082	N
41231	27237809152	2022	8	1	fam_hijos_100	800.00	2023-06-25 00:34:41.328815	2023-06-25 00:34:41.328815	N
41231	27237809152	2022	9	1	fam_hijos_100	900.00	2023-06-25 00:34:41.329486	2023-06-25 00:34:41.329486	N
41231	27237809152	2022	10	1	fam_hijos_100	1000.00	2023-06-25 00:34:41.330305	2023-06-25 00:34:41.330305	N
41231	27237809152	2022	11	1	fam_hijos_100	1100.00	2023-06-25 00:34:41.330995	2023-06-25 00:34:41.330995	N
41231	27237809152	2022	12	1	fam_hijos_100	1200.00	2023-06-25 00:34:41.331667	2023-06-25 00:34:41.331667	N
41266	27251216652	2022	1	3	ded_indumentaria	49998.00	2023-06-25 00:34:41.332377	2023-06-25 00:34:41.332377	N
41544	20371039660	2022	1	5	ded_domestica	48138.00	2023-06-25 00:34:41.333157	2023-06-25 00:34:41.333157	N
41544	20371039660	2022	2	5	ded_domestica	78858.00	2023-06-25 00:34:41.33384	2023-06-25 00:34:41.33384	N
41544	20371039660	2022	3	5	ded_domestica	112218.00	2023-06-25 00:34:41.334466	2023-06-25 00:34:41.334466	N
41544	20371039660	2022	4	5	ded_domestica	145578.00	2023-06-25 00:34:41.335207	2023-06-25 00:34:41.335207	N
41544	20371039660	2022	4	5	ded_gastos_medicos	8000.00	2023-06-25 00:34:41.335965	2023-06-25 00:34:41.335965	N
42168	20173919914	2022	1	3	fam_hijos_100	200.00	2023-06-25 00:34:41.336763	2023-06-25 00:34:41.336763	N
42168	20173919914	2022	1	3	otro_gan_brut	102437.90	2023-06-25 00:34:41.337372	2023-06-25 00:34:41.337372	N
42168	20173919914	2022	1	3	otro_obra_soc	4414.60	2023-06-25 00:34:41.338036	2023-06-25 00:34:41.338036	N
42168	20173919914	2022	1	3	otro_seg_soc	16390.06	2023-06-25 00:34:41.338876	2023-06-25 00:34:41.338876	N
42168	20173919914	2022	1	3	otro_sindicato	2048.76	2023-06-25 00:34:41.339585	2023-06-25 00:34:41.339585	N
42168	20173919914	2022	2	3	fam_hijos_100	400.00	2023-06-25 00:34:41.340339	2023-06-25 00:34:41.340339	N
42168	20173919914	2022	2	3	otro_gan_brut	1059689.10	2023-06-25 00:34:41.341043	2023-06-25 00:34:41.341043	N
42168	20173919914	2022	2	3	otro_obra_soc	40030.98	2023-06-25 00:34:41.341852	2023-06-25 00:34:41.341852	N
42168	20173919914	2022	2	3	otro_seg_soc	159918.94	2023-06-25 00:34:41.342548	2023-06-25 00:34:41.342548	N
42168	20173919914	2022	3	3	fam_hijos_100	600.00	2023-06-25 00:34:41.343321	2023-06-25 00:34:41.343321	N
42168	20173919914	2022	3	3	otro_gan_brut	2163016.96	2023-06-25 00:34:41.343998	2023-06-25 00:34:41.343998	N
42168	20173919914	2022	3	3	otro_obra_soc	77808.58	2023-06-25 00:34:41.345044	2023-06-25 00:34:41.345044	N
42168	20173919914	2022	3	3	otro_seg_soc	324781.58	2023-06-25 00:34:41.346185	2023-06-25 00:34:41.346185	N
42168	20173919914	2022	4	3	fam_hijos_100	800.00	2023-06-25 00:34:41.347265	2023-06-25 00:34:41.347265	N
42168	20173919914	2022	5	3	fam_hijos_100	1000.00	2023-06-25 00:34:41.348323	2023-06-25 00:34:41.348323	N
42168	20173919914	2022	6	3	fam_hijos_100	1200.00	2023-06-25 00:34:41.349096	2023-06-25 00:34:41.349096	N
42168	20173919914	2022	7	3	fam_hijos_100	1400.00	2023-06-25 00:34:41.349812	2023-06-25 00:34:41.349812	N
42168	20173919914	2022	8	3	fam_hijos_100	1600.00	2023-06-25 00:34:41.350495	2023-06-25 00:34:41.350495	N
42168	20173919914	2022	9	3	fam_hijos_100	1800.00	2023-06-25 00:34:41.351218	2023-06-25 00:34:41.351218	N
42168	20173919914	2022	10	3	fam_hijos_100	2000.00	2023-06-25 00:34:41.351967	2023-06-25 00:34:41.351967	N
42168	20173919914	2022	11	3	fam_hijos_100	2200.00	2023-06-25 00:34:41.352663	2023-06-25 00:34:41.352663	N
42168	20173919914	2022	12	3	fam_hijos_100	2400.00	2023-06-25 00:34:41.353359	2023-06-25 00:34:41.353359	N
42480	20281965973	2022	1	1	ded_cuota_medica	0.02	2023-06-25 00:34:41.354039	2023-06-25 00:34:41.354039	N
42480	20281965973	2022	1	1	fam_hijos_100	400.00	2023-06-25 00:34:41.354835	2023-06-25 00:34:41.354835	N
42480	20281965973	2022	2	1	fam_hijos_100	800.00	2023-06-25 00:34:41.355567	2023-06-25 00:34:41.355567	N
42480	20281965973	2022	3	1	fam_hijos_100	1200.00	2023-06-25 00:34:41.356318	2023-06-25 00:34:41.356318	N
42480	20281965973	2022	4	1	fam_hijos_100	1600.00	2023-06-25 00:34:41.356998	2023-06-25 00:34:41.356998	N
42480	20281965973	2022	5	1	fam_hijos_100	2000.00	2023-06-25 00:34:41.35775	2023-06-25 00:34:41.35775	N
42480	20281965973	2022	6	1	fam_hijos_100	2400.00	2023-06-25 00:34:41.358465	2023-06-25 00:34:41.358465	N
42480	20281965973	2022	7	1	fam_hijos_100	2800.00	2023-06-25 00:34:41.35921	2023-06-25 00:34:41.35921	N
42480	20281965973	2022	8	1	fam_hijos_100	3200.00	2023-06-25 00:34:41.35993	2023-06-25 00:34:41.35993	N
42480	20281965973	2022	9	1	fam_hijos_100	3600.00	2023-06-25 00:34:41.360707	2023-06-25 00:34:41.360707	N
42480	20281965973	2022	10	1	fam_hijos_100	4000.00	2023-06-25 00:34:41.361372	2023-06-25 00:34:41.361372	N
42480	20281965973	2022	11	1	fam_hijos_100	4400.00	2023-06-25 00:34:41.362055	2023-06-25 00:34:41.362055	N
42480	20281965973	2022	12	1	fam_hijos_100	4600.00	2023-06-25 00:34:41.362751	2023-06-25 00:34:41.362751	N
42789	23307781174	2022	1	1	fam_hijos_100	400.00	2023-06-25 00:34:41.363534	2023-06-25 00:34:41.363534	N
42789	23307781174	2022	2	1	fam_hijos_100	800.00	2023-06-25 00:34:41.364218	2023-06-25 00:34:41.364218	N
42789	23307781174	2022	3	1	fam_hijos_100	1200.00	2023-06-25 00:34:41.364936	2023-06-25 00:34:41.364936	N
42789	23307781174	2022	4	1	fam_hijos_100	1600.00	2023-06-25 00:34:41.365684	2023-06-25 00:34:41.365684	N
42789	23307781174	2022	5	1	fam_hijos_100	2000.00	2023-06-25 00:34:41.36643	2023-06-25 00:34:41.36643	N
42789	23307781174	2022	6	1	fam_hijos_100	2400.00	2023-06-25 00:34:41.367111	2023-06-25 00:34:41.367111	N
42789	23307781174	2022	7	1	fam_hijos_100	2800.00	2023-06-25 00:34:41.367802	2023-06-25 00:34:41.367802	N
42789	23307781174	2022	8	1	fam_hijos_100	3200.00	2023-06-25 00:34:41.368514	2023-06-25 00:34:41.368514	N
42789	23307781174	2022	9	1	fam_hijos_100	3600.00	2023-06-25 00:34:41.369925	2023-06-25 00:34:41.369925	N
42789	23307781174	2022	10	1	fam_hijos_100	4000.00	2023-06-25 00:34:41.370995	2023-06-25 00:34:41.370995	N
42789	23307781174	2022	11	1	fam_hijos_100	4400.00	2023-06-25 00:34:41.371814	2023-06-25 00:34:41.371814	N
42789	23307781174	2022	12	1	fam_hijos_100	4800.00	2023-06-25 00:34:41.372557	2023-06-25 00:34:41.372557	N
43095	20287462477	2022	1	1	ded_cuota_medica	10872.08	2023-06-25 00:34:41.37336	2023-06-25 00:34:41.37336	N
43095	20287462477	2022	1	1	fam_hijos_100	200.00	2023-06-25 00:34:41.374115	2023-06-25 00:34:41.374115	N
43095	20287462477	2022	1	1	FECDEVDESDE	200.00	2023-06-25 00:34:41.3748	2023-06-25 00:34:41.3748	N
43095	20287462477	2022	2	1	ded_cuota_medica	19880.80	2023-06-25 00:34:41.375571	2023-06-25 00:34:41.375571	N
43095	20287462477	2022	2	1	fam_hijos_100	400.00	2023-06-25 00:34:41.376388	2023-06-25 00:34:41.376388	N
43095	20287462477	2022	2	1	FECDEVDESDE	400.00	2023-06-25 00:34:41.37712	2023-06-25 00:34:41.37712	N
43095	20287462477	2022	3	1	fam_hijos_100	600.00	2023-06-25 00:34:41.37787	2023-06-25 00:34:41.37787	N
43095	20287462477	2022	3	1	FECDEVDESDE	600.00	2023-06-25 00:34:41.378667	2023-06-25 00:34:41.378667	N
43095	20287462477	2022	4	1	fam_hijos_100	800.00	2023-06-25 00:34:41.379633	2023-06-25 00:34:41.379633	N
43095	20287462477	2022	4	1	FECDEVDESDE	800.00	2023-06-25 00:34:41.380325	2023-06-25 00:34:41.380325	N
43095	20287462477	2022	5	1	fam_hijos_100	1000.00	2023-06-25 00:34:41.381088	2023-06-25 00:34:41.381088	N
43095	20287462477	2022	5	1	FECDEVDESDE	1000.00	2023-06-25 00:34:41.381755	2023-06-25 00:34:41.381755	N
43095	20287462477	2022	6	1	fam_hijos_100	1200.00	2023-06-25 00:34:41.382866	2023-06-25 00:34:41.382866	N
43095	20287462477	2022	6	1	FECDEVDESDE	1200.00	2023-06-25 00:34:41.383886	2023-06-25 00:34:41.383886	N
43095	20287462477	2022	7	1	fam_hijos_100	1400.00	2023-06-25 00:34:41.384923	2023-06-25 00:34:41.384923	N
43095	20287462477	2022	7	1	FECDEVDESDE	1400.00	2023-06-25 00:34:41.386079	2023-06-25 00:34:41.386079	N
43095	20287462477	2022	8	1	fam_hijos_100	1600.00	2023-06-25 00:34:41.386939	2023-06-25 00:34:41.386939	N
43095	20287462477	2022	8	1	FECDEVDESDE	1600.00	2023-06-25 00:34:41.387662	2023-06-25 00:34:41.387662	N
43095	20287462477	2022	9	1	fam_hijos_100	1800.00	2023-06-25 00:34:41.388328	2023-06-25 00:34:41.388328	N
43095	20287462477	2022	9	1	FECDEVDESDE	1800.00	2023-06-25 00:34:41.38921	2023-06-25 00:34:41.38921	N
43095	20287462477	2022	10	1	fam_hijos_100	2000.00	2023-06-25 00:34:41.390109	2023-06-25 00:34:41.390109	N
43095	20287462477	2022	10	1	FECDEVDESDE	2000.00	2023-06-25 00:34:41.390851	2023-06-25 00:34:41.390851	N
43095	20287462477	2022	11	1	fam_hijos_100	2200.00	2023-06-25 00:34:41.391604	2023-06-25 00:34:41.391604	N
43095	20287462477	2022	11	1	FECDEVDESDE	2200.00	2023-06-25 00:34:41.392324	2023-06-25 00:34:41.392324	N
43095	20287462477	2022	12	1	fam_hijos_100	2400.00	2023-06-25 00:34:41.393064	2023-06-25 00:34:41.393064	N
43095	20287462477	2022	12	1	FECDEVDESDE	2400.00	2023-06-25 00:34:41.393756	2023-06-25 00:34:41.393756	N
43250	27361629731	2022	3	2	ded_gastos_medicos	29600.00	2023-06-25 00:34:41.394466	2023-06-25 00:34:41.394466	N
43250	27361629731	2022	4	2	ded_gastos_medicos	53600.00	2023-06-25 00:34:41.395144	2023-06-25 00:34:41.395144	N
43517	27177107382	2022	1	2	ded_cuota_medica	3662.00	2023-06-25 00:34:41.395899	2023-06-25 00:34:41.395899	N
43517	27177107382	2022	1	2	ded_domestica	40000.00	2023-06-25 00:34:41.396608	2023-06-25 00:34:41.396608	N
43517	27177107382	2022	2	2	ded_cuota_medica	7324.00	2023-06-25 00:34:41.39735	2023-06-25 00:34:41.39735	N
43517	27177107382	2022	2	2	ded_domestica	88000.00	2023-06-25 00:34:41.398072	2023-06-25 00:34:41.398072	N
43910	20352712990	2022	1	2	ded_gastos_medicos	6480.00	2023-06-25 00:34:41.398844	2023-06-25 00:34:41.398844	N
43910	20352712990	2022	3	2	ded_gastos_medicos	11120.00	2023-06-25 00:34:41.39952	2023-06-25 00:34:41.39952	N
44139	20323948918	2022	1	1	ded_cuota_medica	0.02	2023-06-25 00:34:41.400199	2023-06-25 00:34:41.400199	N
44139	20323948918	2022	1	1	fam_hijos_100	200.00	2023-06-25 00:34:41.400935	2023-06-25 00:34:41.400935	N
44139	20323948918	2022	2	1	fam_hijos_100	400.00	2023-06-25 00:34:41.401731	2023-06-25 00:34:41.401731	N
44139	20323948918	2022	3	1	fam_hijos_100	600.00	2023-06-25 00:34:41.402415	2023-06-25 00:34:41.402415	N
44139	20323948918	2022	4	1	fam_hijos_100	800.00	2023-06-25 00:34:41.403135	2023-06-25 00:34:41.403135	N
44139	20323948918	2022	5	1	fam_hijos_100	1000.00	2023-06-25 00:34:41.403904	2023-06-25 00:34:41.403904	N
44139	20323948918	2022	6	1	fam_hijos_100	1200.00	2023-06-25 00:34:41.404696	2023-06-25 00:34:41.404696	N
44139	20323948918	2022	7	1	fam_hijos_100	1400.00	2023-06-25 00:34:41.405353	2023-06-25 00:34:41.405353	N
44139	20323948918	2022	8	1	fam_hijos_100	1600.00	2023-06-25 00:34:41.406062	2023-06-25 00:34:41.406062	N
44139	20323948918	2022	9	1	fam_hijos_100	1800.00	2023-06-25 00:34:41.40676	2023-06-25 00:34:41.40676	N
44139	20323948918	2022	10	1	fam_hijos_100	2000.00	2023-06-25 00:34:41.407559	2023-06-25 00:34:41.407559	N
44139	20323948918	2022	11	1	fam_hijos_100	2200.00	2023-06-25 00:34:41.408248	2023-06-25 00:34:41.408248	N
44139	20323948918	2022	12	1	fam_hijos_100	2400.00	2023-06-25 00:34:41.408943	2023-06-25 00:34:41.408943	N
44223	20307785197	2022	1	1	fam_hijos_100	200.00	2023-06-25 00:34:41.409689	2023-06-25 00:34:41.409689	N
44223	20307785197	2022	2	1	fam_hijos_100	400.00	2023-06-25 00:34:41.410476	2023-06-25 00:34:41.410476	N
44223	20307785197	2022	3	1	fam_hijos_100	600.00	2023-06-25 00:34:41.411206	2023-06-25 00:34:41.411206	N
44223	20307785197	2022	4	1	fam_hijos_100	800.00	2023-06-25 00:34:41.411955	2023-06-25 00:34:41.411955	N
44223	20307785197	2022	5	1	fam_hijos_100	1000.00	2023-06-25 00:34:41.412647	2023-06-25 00:34:41.412647	N
44223	20307785197	2022	6	1	fam_hijos_100	1200.00	2023-06-25 00:34:41.413355	2023-06-25 00:34:41.413355	N
44223	20307785197	2022	7	1	fam_hijos_100	1400.00	2023-06-25 00:34:41.414036	2023-06-25 00:34:41.414036	N
44223	20307785197	2022	8	1	fam_hijos_100	1600.00	2023-06-25 00:34:41.414752	2023-06-25 00:34:41.414752	N
44223	20307785197	2022	9	1	fam_hijos_100	1800.00	2023-06-25 00:34:41.415536	2023-06-25 00:34:41.415536	N
44223	20307785197	2022	10	1	fam_hijos_100	2000.00	2023-06-25 00:34:41.416393	2023-06-25 00:34:41.416393	N
44223	20307785197	2022	11	1	fam_hijos_100	2200.00	2023-06-25 00:34:41.41712	2023-06-25 00:34:41.41712	N
44223	20307785197	2022	12	1	fam_hijos_100	2400.00	2023-06-25 00:34:41.417826	2023-06-25 00:34:41.417826	N
45548	27277784675	2022	1	1	ded_cuota_medica	26228.96	2023-06-25 00:34:41.418527	2023-06-25 00:34:41.418527	N
45548	27277784675	2022	1	1	fam_hijos_100	400.00	2023-06-25 00:34:41.419556	2023-06-25 00:34:41.419556	N
45548	27277784675	2022	2	1	fam_hijos_100	800.00	2023-06-25 00:34:41.420645	2023-06-25 00:34:41.420645	N
45548	27277784675	2022	3	1	fam_hijos_100	1200.00	2023-06-25 00:34:41.4216	2023-06-25 00:34:41.4216	N
45548	27277784675	2022	4	1	fam_hijos_100	1600.00	2023-06-25 00:34:41.422675	2023-06-25 00:34:41.422675	N
45548	27277784675	2022	5	1	fam_hijos_100	2000.00	2023-06-25 00:34:41.423386	2023-06-25 00:34:41.423386	N
45548	27277784675	2022	6	1	fam_hijos_100	2400.00	2023-06-25 00:34:41.424184	2023-06-25 00:34:41.424184	N
45548	27277784675	2022	7	1	fam_hijos_100	2800.00	2023-06-25 00:34:41.42491	2023-06-25 00:34:41.42491	N
45548	27277784675	2022	8	1	fam_hijos_100	3200.00	2023-06-25 00:34:41.425552	2023-06-25 00:34:41.425552	N
45548	27277784675	2022	9	1	fam_hijos_100	3600.00	2023-06-25 00:34:41.426312	2023-06-25 00:34:41.426312	N
45548	27277784675	2022	10	1	fam_hijos_100	4000.00	2023-06-25 00:34:41.426983	2023-06-25 00:34:41.426983	N
45548	27277784675	2022	11	1	fam_hijos_100	4400.00	2023-06-25 00:34:41.427698	2023-06-25 00:34:41.427698	N
45548	27277784675	2022	12	1	fam_hijos_100	4800.00	2023-06-25 00:34:41.428425	2023-06-25 00:34:41.428425	N
46718	27264662872	2022	1	2	ded_cuota_medica	3404.50	2023-06-25 00:34:41.429121	2023-06-25 00:34:41.429121	N
46718	27264662872	2022	1	2	fam_hijos_100	200.00	2023-06-25 00:34:41.429856	2023-06-25 00:34:41.429856	N
46718	27264662872	2022	2	2	ded_cuota_medica	5721.48	2023-06-25 00:34:41.430575	2023-06-25 00:34:41.430575	N
46718	27264662872	2022	2	2	fam_hijos_100	400.00	2023-06-25 00:34:41.431262	2023-06-25 00:34:41.431262	N
46718	27264662872	2022	3	2	ded_cuota_medica	6181.28	2023-06-25 00:34:41.431944	2023-06-25 00:34:41.431944	N
46718	27264662872	2022	3	2	fam_hijos_100	600.00	2023-06-25 00:34:41.432654	2023-06-25 00:34:41.432654	N
46718	27264662872	2022	4	2	fam_hijos_100	800.00	2023-06-25 00:34:41.433379	2023-06-25 00:34:41.433379	N
46718	27264662872	2022	5	2	fam_hijos_100	1000.00	2023-06-25 00:34:41.434154	2023-06-25 00:34:41.434154	N
46718	27264662872	2022	6	2	fam_hijos_100	1200.00	2023-06-25 00:34:41.434868	2023-06-25 00:34:41.434868	N
46718	27264662872	2022	7	2	fam_hijos_100	1400.00	2023-06-25 00:34:41.435614	2023-06-25 00:34:41.435614	N
46718	27264662872	2022	8	2	fam_hijos_100	1600.00	2023-06-25 00:34:41.436352	2023-06-25 00:34:41.436352	N
46718	27264662872	2022	9	2	fam_hijos_100	1800.00	2023-06-25 00:34:41.437106	2023-06-25 00:34:41.437106	N
46718	27264662872	2022	10	2	fam_hijos_100	2000.00	2023-06-25 00:34:41.437815	2023-06-25 00:34:41.437815	N
46718	27264662872	2022	11	2	fam_hijos_100	2200.00	2023-06-25 00:34:41.438538	2023-06-25 00:34:41.438538	N
46718	27264662872	2022	12	2	fam_hijos_100	2400.00	2023-06-25 00:34:41.439229	2023-06-25 00:34:41.439229	N
47457	20286436995	2022	1	1	ded_domestica	72786.72	2023-06-25 00:34:41.439931	2023-06-25 00:34:41.439931	N
47457	20286436995	2022	1	1	fam_hijos_100	200.00	2023-06-25 00:34:41.440642	2023-06-25 00:34:41.440642	N
47457	20286436995	2022	2	1	ded_domestica	146633.54	2023-06-25 00:34:41.441398	2023-06-25 00:34:41.441398	N
47457	20286436995	2022	2	1	fam_hijos_100	400.00	2023-06-25 00:34:41.442152	2023-06-25 00:34:41.442152	N
47457	20286436995	2022	3	1	fam_hijos_100	600.00	2023-06-25 00:34:41.442864	2023-06-25 00:34:41.442864	N
47457	20286436995	2022	4	1	fam_hijos_100	800.00	2023-06-25 00:34:41.44357	2023-06-25 00:34:41.44357	N
47457	20286436995	2022	5	1	fam_hijos_100	1000.00	2023-06-25 00:34:41.444365	2023-06-25 00:34:41.444365	N
47457	20286436995	2022	6	1	fam_hijos_100	1200.00	2023-06-25 00:34:41.445065	2023-06-25 00:34:41.445065	N
47457	20286436995	2022	7	1	fam_hijos_100	1400.00	2023-06-25 00:34:41.445793	2023-06-25 00:34:41.445793	N
47457	20286436995	2022	8	1	fam_hijos_100	1600.00	2023-06-25 00:34:41.446504	2023-06-25 00:34:41.446504	N
47457	20286436995	2022	9	1	fam_hijos_100	1800.00	2023-06-25 00:34:41.447454	2023-06-25 00:34:41.447454	N
47457	20286436995	2022	10	1	fam_hijos_100	2000.00	2023-06-25 00:34:41.448162	2023-06-25 00:34:41.448162	N
47457	20286436995	2022	11	1	fam_hijos_100	2200.00	2023-06-25 00:34:41.448868	2023-06-25 00:34:41.448868	N
47457	20286436995	2022	12	1	fam_hijos_100	2400.00	2023-06-25 00:34:41.449543	2023-06-25 00:34:41.449543	N
48353	27175432650	2022	1	1	ded_cuota_medica	50361.48	2023-06-25 00:34:41.450317	2023-06-25 00:34:41.450317	N
48353	27175432650	2022	1	1	ded_donaciones	1600.00	2023-06-25 00:34:41.451008	2023-06-25 00:34:41.451008	N
48353	27175432650	2022	1	1	ded_seguros	1667.10	2023-06-25 00:34:41.451709	2023-06-25 00:34:41.451709	N
48353	27175432650	2022	2	1	ded_cuota_medica	100722.96	2023-06-25 00:34:41.452426	2023-06-25 00:34:41.452426	N
48353	27175432650	2022	2	1	ded_donaciones	3200.00	2023-06-25 00:34:41.453122	2023-06-25 00:34:41.453122	N
48353	27175432650	2022	2	1	ded_seguros	3334.20	2023-06-25 00:34:41.453842	2023-06-25 00:34:41.453842	N
48394	27340209929	2022	1	4	ded_alquiler	19248.00	2023-06-25 00:34:41.454551	2023-06-25 00:34:41.454551	N
48394	27340209929	2022	2	4	ded_alquiler	40496.00	2023-06-25 00:34:41.455643	2023-06-25 00:34:41.455643	N
48394	27340209929	2022	3	4	ded_alquiler	61744.00	2023-06-25 00:34:41.456746	2023-06-25 00:34:41.456746	N
48394	27340209929	2022	4	4	ded_alquiler	82992.00	2023-06-25 00:34:41.457824	2023-06-25 00:34:41.457824	N
48462	27290066242	2022	1	1	fam_hijos_100	200.00	2023-06-25 00:34:41.458891	2023-06-25 00:34:41.458891	N
48462	27290066242	2022	2	1	fam_hijos_100	400.00	2023-06-25 00:34:41.459574	2023-06-25 00:34:41.459574	N
48462	27290066242	2022	3	1	fam_hijos_100	600.00	2023-06-25 00:34:41.460271	2023-06-25 00:34:41.460271	N
48462	27290066242	2022	4	1	fam_hijos_100	800.00	2023-06-25 00:34:41.461015	2023-06-25 00:34:41.461015	N
48462	27290066242	2022	5	1	fam_hijos_100	1000.00	2023-06-25 00:34:41.461717	2023-06-25 00:34:41.461717	N
48462	27290066242	2022	6	1	fam_hijos_100	1200.00	2023-06-25 00:34:41.462403	2023-06-25 00:34:41.462403	N
48462	27290066242	2022	7	1	fam_hijos_100	1400.00	2023-06-25 00:34:41.463123	2023-06-25 00:34:41.463123	N
48462	27290066242	2022	8	1	fam_hijos_100	1600.00	2023-06-25 00:34:41.463869	2023-06-25 00:34:41.463869	N
48462	27290066242	2022	9	1	fam_hijos_100	1800.00	2023-06-25 00:34:41.464561	2023-06-25 00:34:41.464561	N
48462	27290066242	2022	10	1	fam_hijos_100	2000.00	2023-06-25 00:34:41.465257	2023-06-25 00:34:41.465257	N
48462	27290066242	2022	11	1	fam_hijos_100	2200.00	2023-06-25 00:34:41.465956	2023-06-25 00:34:41.465956	N
48462	27290066242	2022	12	1	fam_hijos_100	2400.00	2023-06-25 00:34:41.466706	2023-06-25 00:34:41.466706	N
\.


--
-- Data for Name: f572_archivos; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_archivos (id, filename, periodo, createdat, updatedat) FROM stdin;
\.


--
-- Data for Name: f572_cargasfamilia; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_cargasfamilia (id, presentacion_id, tipodoc, nrodoc, apellido, nombre, fechanac, mesdesde, meshasta, parentesco, vigenteproxper, fechalimite, porcdeduccion) FROM stdin;
1	4	0	27162585725	PEREZ DINA NOEMI		1963-02-04	1	12	1	S		100
2	8	0	20459123963	MONZON	MARTIN NICOLAS	2004-07-13	1	12	3	S		100
3	9	0	20459123963	MONZON	MARTIN NICOLAS	2004-07-13	1	7	3	N		100
4	10	0	23456892159	GUIJO	JUAN MANUEL	2004-04-13	1	4	3	N		50
5	11	0	27462620891	ACEVEDO	LUCIANA MILAGROS	2004-11-23	1	11	3	N		100
6	18	0	23226040544	MENDEZ CLAUDIA ESTELA		1971-08-10	1	12	1	S		100
7	18	0	20459109138	AGUIRRE	LAUTARO FACUNDO	2004-07-23	1	12	3	S		100
8	21	0	27474194448	GIMENEZ MILAGROS		2006-07-08	1	12	3	S		100
9	22	0	27474194448	GIMENEZ MILAGROS		2006-07-08	1	12	3	S		100
10	24	0	27462073289	CEBALLOS JUANA LUJAN		2004-11-30	1	12	3	S		100
11	24	0	27479403851	CEBALLOS	EMILIA DEL PILAR	2007-02-08	1	12	3	S		100
12	25	0	27239276461	SUAREZ	CARINA NOEMI	1974-05-05	1	12	1	S		100
13	25	0	20523952588	FERNANDEZ SUAREZ	NAHUEL JUAN PABLO	2012-04-10	1	12	3	S		100
14	26	0	27255132631	GUZZI	NADIA VERONICA	1976-09-15	1	12	1	S		100
15	26	0	27481598929	FERRE GUZZI MICAELA VALENTINA		2007-07-11	1	12	3	S		100
16	26	0	23508425694	FERRE GUZZI GIULIANA MARTINA		2011-09-07	1	12	3	S		100
17	27	0	23490676759	BEVEGNI	LUCIANO JOAQUIN	2008-11-07	1	12	3	S		100
18	27	0	20462071966	BEVEGNI	JUAN PABLO	2004-11-01	1	11	3	N		100
19	28	0	27557642086	GREGORIC	LUCIA	2016-08-22	1	12	3	S		50
20	28	0	20586361903	GREGORIC	BRUNO	2020-11-19	1	12	3	S		50
21	29	0	27287477096	FRANCES	YUDITH YANINA	1980-10-06	1	12	1	S		100
22	29	0	20511349150	LERICI	SANTINO	2011-06-28	1	12	3	S		100
23	30	0	27287477096	FRANCES	YUDITH YANINA	1980-10-06	1	12	1	S		100
24	30	0	20511349150	LERICI	SANTINO	2011-06-28	1	12	3	S		100
25	31	0	20585137147	BELTRAN SANCHEZ	JUAN MANUEL	2020-08-20	1	12	3	S		100
26	32	0	27582097300	ALBORNOZ SARAVIA	MAIA	2020-03-09	1	12	3	S		100
27	40	0	27528576848	SEVILLA LOLA ISABELA		2012-11-28	1	12	3	S		100
28	41	0	24473417967	GUILLET	VALENTIN NAHUEL	2006-09-08	1	12	3	S		100
29	42	0	20557574426	CISCO	FELIPE MANUEL	2016-07-30	1	12	3	S		100
30	42	0	27581363155	CISCO	CAMILA MAITE	2019-12-10	1	12	3	S		100
31	43	0	20557574426	CISCO	FELIPE MANUEL	2016-07-30	1	12	3	S		100
32	43	0	27581363155	CISCO	CAMILA MAITE	2019-12-10	1	12	3	S		100
33	58	0	20386136859	PELOSI	FRANCISCO	1994-11-28	1	4	31	N		100
34	72	0	20174882089	OJEDA	RAMON AGUSTIN	1965-04-23	1	12	1	S		100
35	76	0	27490051274	MARTIN CAMILA ZOE		2008-11-18	1	12	3	S		100
36	76	0	20450737411	MARTIN	JUAN CRUZ	2003-09-27	1	12	31	S		100
37	77	0	27490051274	MARTIN CAMILA ZOE		2008-11-18	1	12	3	S		100
38	77	0	20450737411	MARTIN	JUAN CRUZ	2003-09-27	1	12	31	S		100
39	85	0	20453020062	KERNC	MARTIN JAVA	2004-01-21	1	12	3	S		100
40	85	0	20241679471	KERNC	HUGO ARNALDO	1975-01-17	1	12	1	S		100
41	85	0	20498909060	KERNC	ARIAN JOAQUIN	2009-11-18	1	12	31	S		100
42	86	0	20453020062	KERNC	MARTIN JAVA	2004-01-21	1	1	3	N		100
43	86	0	20241679471	KERNC	HUGO ARNALDO	1975-01-17	1	12	1	S		100
44	86	0	20498909060	KERNC	ARIAN JOAQUIN	2009-11-18	1	12	31	S		100
45	87	0	20496105304	LEIS	SANTIAGO BORIS	2009-11-05	1	12	3	S		100
46	87	0	27486781314	LEIS	MIA	2008-03-29	1	12	3	S		100
47	88	0	27468757708	SISO CLAUDINA		2005-08-08	1	12	3	S		100
48	90	0	27470666078	REPETTO SOL VALENTINA		2005-11-04	1	12	3	S		50
49	91	0	27470666078	REPETTO SOL VALENTINA		2005-11-04	1	12	3	S		50
50	92	0	27508952509	RAMOS DE SALAZAR	TRIANA IRINA	2011-04-12	1	12	3	S		100
51	93	0	27508952509	RAMOS DE SALAZAR	TRIANA IRINA	2011-04-12	1	12	3	S		100
52	94	0	27551673389	SAGOT DUVAUROUX	HELENA	2015-11-17	1	12	3	S		100
53	94	0	23500306874	SAGOT DUVAUROUX TRINIDAD NATALIA		2010-02-07	1	12	3	S		100
54	97	0	20467589300	GIMENEZ ANGEL GABRIEL		2005-10-18	1	12	3	S		100
55	99	0	27471685386	SANTAMARIA DELFINA		2006-02-09	1	12	3	S		100
56	100	0	23458224749	PENAYO VALDEZ	SANTINO	2007-07-08	1	12	3	S		100
57	100	0	20526463243	PENAYO VALDEZ	LAUTARO	2012-08-02	1	12	3	S		100
58	101	0	27557603617	RODRIGUEZ URROZ	EMILIA	2016-08-21	1	12	3	S		100
59	101	0	27580273012	RODRIGUEZ URROZ	LUCIA	2019-10-24	1	12	3	S		100
60	102	0	27557603617	RODRIGUEZ URROZ	EMILIA	2016-08-21	1	12	3	S		100
61	102	0	27580273012	RODRIGUEZ URROZ	LUCIA	2019-10-24	1	12	3	S		100
62	103	0	27486442102	TRONCOSO	MIA SOLEDAD	2008-04-26	1	12	3	S		100
63	103	0	23536750444	DELA FUENTE TRONCOSO	AMBAR	2014-04-08	1	12	3	S		100
64	106	0	27558125026	RUIZ	SOFIA AGUSTINA	2016-09-03	1	12	3	S		100
65	122	0	27162585725	PEREZ DINA NOEMI		1963-02-04	1	12	1	S		100
66	126	0	20459123963	MONZON	MARTIN NICOLAS	2004-07-13	1	12	3	S		100
67	127	0	20459123963	MONZON	MARTIN NICOLAS	2004-07-13	1	7	3	N		100
68	128	0	23456892159	GUIJO	JUAN MANUEL	2004-04-13	1	4	3	N		50
69	129	0	27462620891	ACEVEDO	LUCIANA MILAGROS	2004-11-23	1	11	3	N		100
70	136	0	23226040544	MENDEZ CLAUDIA ESTELA		1971-08-10	1	12	1	S		100
71	136	0	20459109138	AGUIRRE	LAUTARO FACUNDO	2004-07-23	1	12	3	S		100
72	139	0	27474194448	GIMENEZ MILAGROS		2006-07-08	1	12	3	S		100
73	140	0	27474194448	GIMENEZ MILAGROS		2006-07-08	1	12	3	S		100
74	142	0	27462073289	CEBALLOS JUANA LUJAN		2004-11-30	1	12	3	S		100
75	142	0	27479403851	CEBALLOS	EMILIA DEL PILAR	2007-02-08	1	12	3	S		100
76	143	0	27239276461	SUAREZ	CARINA NOEMI	1974-05-05	1	12	1	S		100
77	143	0	20523952588	FERNANDEZ SUAREZ	NAHUEL JUAN PABLO	2012-04-10	1	12	3	S		100
78	144	0	27255132631	GUZZI	NADIA VERONICA	1976-09-15	1	12	1	S		100
79	144	0	27481598929	FERRE GUZZI MICAELA VALENTINA		2007-07-11	1	12	3	S		100
80	144	0	23508425694	FERRE GUZZI GIULIANA MARTINA		2011-09-07	1	12	3	S		100
81	145	0	23490676759	BEVEGNI	LUCIANO JOAQUIN	2008-11-07	1	12	3	S		100
82	145	0	20462071966	BEVEGNI	JUAN PABLO	2004-11-01	1	11	3	N		100
83	146	0	27557642086	GREGORIC	LUCIA	2016-08-22	1	12	3	S		50
84	146	0	20586361903	GREGORIC	BRUNO	2020-11-19	1	12	3	S		50
85	147	0	27287477096	FRANCES	YUDITH YANINA	1980-10-06	1	12	1	S		100
86	147	0	20511349150	LERICI	SANTINO	2011-06-28	1	12	3	S		100
87	148	0	27287477096	FRANCES	YUDITH YANINA	1980-10-06	1	12	1	S		100
88	148	0	20511349150	LERICI	SANTINO	2011-06-28	1	12	3	S		100
89	149	0	20585137147	BELTRAN SANCHEZ	JUAN MANUEL	2020-08-20	1	12	3	S		100
90	150	0	27582097300	ALBORNOZ SARAVIA	MAIA	2020-03-09	1	12	3	S		100
91	158	0	27528576848	SEVILLA LOLA ISABELA		2012-11-28	1	12	3	S		100
92	159	0	24473417967	GUILLET	VALENTIN NAHUEL	2006-09-08	1	12	3	S		100
93	160	0	20557574426	CISCO	FELIPE MANUEL	2016-07-30	1	12	3	S		100
94	160	0	27581363155	CISCO	CAMILA MAITE	2019-12-10	1	12	3	S		100
95	161	0	20557574426	CISCO	FELIPE MANUEL	2016-07-30	1	12	3	S		100
96	161	0	27581363155	CISCO	CAMILA MAITE	2019-12-10	1	12	3	S		100
97	176	0	20386136859	PELOSI	FRANCISCO	1994-11-28	1	4	31	N		100
98	190	0	20174882089	OJEDA	RAMON AGUSTIN	1965-04-23	1	12	1	S		100
99	194	0	27490051274	MARTIN CAMILA ZOE		2008-11-18	1	12	3	S		100
100	194	0	20450737411	MARTIN	JUAN CRUZ	2003-09-27	1	12	31	S		100
101	195	0	27490051274	MARTIN CAMILA ZOE		2008-11-18	1	12	3	S		100
102	195	0	20450737411	MARTIN	JUAN CRUZ	2003-09-27	1	12	31	S		100
103	203	0	20453020062	KERNC	MARTIN JAVA	2004-01-21	1	12	3	S		100
104	203	0	20241679471	KERNC	HUGO ARNALDO	1975-01-17	1	12	1	S		100
105	203	0	20498909060	KERNC	ARIAN JOAQUIN	2009-11-18	1	12	31	S		100
106	204	0	20453020062	KERNC	MARTIN JAVA	2004-01-21	1	1	3	N		100
107	204	0	20241679471	KERNC	HUGO ARNALDO	1975-01-17	1	12	1	S		100
108	204	0	20498909060	KERNC	ARIAN JOAQUIN	2009-11-18	1	12	31	S		100
109	205	0	20496105304	LEIS	SANTIAGO BORIS	2009-11-05	1	12	3	S		100
110	205	0	27486781314	LEIS	MIA	2008-03-29	1	12	3	S		100
111	206	0	27468757708	SISO CLAUDINA		2005-08-08	1	12	3	S		100
112	208	0	27470666078	REPETTO SOL VALENTINA		2005-11-04	1	12	3	S		50
113	209	0	27470666078	REPETTO SOL VALENTINA		2005-11-04	1	12	3	S		50
114	210	0	27508952509	RAMOS DE SALAZAR	TRIANA IRINA	2011-04-12	1	12	3	S		100
115	211	0	27508952509	RAMOS DE SALAZAR	TRIANA IRINA	2011-04-12	1	12	3	S		100
116	212	0	27551673389	SAGOT DUVAUROUX	HELENA	2015-11-17	1	12	3	S		100
117	212	0	23500306874	SAGOT DUVAUROUX TRINIDAD NATALIA		2010-02-07	1	12	3	S		100
118	215	0	20467589300	GIMENEZ ANGEL GABRIEL		2005-10-18	1	12	3	S		100
119	217	0	27471685386	SANTAMARIA DELFINA		2006-02-09	1	12	3	S		100
120	218	0	23458224749	PENAYO VALDEZ	SANTINO	2007-07-08	1	12	3	S		100
121	218	0	20526463243	PENAYO VALDEZ	LAUTARO	2012-08-02	1	12	3	S		100
122	219	0	27557603617	RODRIGUEZ URROZ	EMILIA	2016-08-21	1	12	3	S		100
123	219	0	27580273012	RODRIGUEZ URROZ	LUCIA	2019-10-24	1	12	3	S		100
124	220	0	27557603617	RODRIGUEZ URROZ	EMILIA	2016-08-21	1	12	3	S		100
125	220	0	27580273012	RODRIGUEZ URROZ	LUCIA	2019-10-24	1	12	3	S		100
126	221	0	27486442102	TRONCOSO	MIA SOLEDAD	2008-04-26	1	12	3	S		100
127	221	0	23536750444	DELA FUENTE TRONCOSO	AMBAR	2014-04-08	1	12	3	S		100
128	224	0	27558125026	RUIZ	SOFIA AGUSTINA	2016-09-03	1	12	3	S		100
\.


--
-- Data for Name: f572_datadicional; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_datadicional (id, presentacion_id, nombre, mesdesde, meshasta, valor) FROM stdin;
1	82	jubPensRegPatagonica	1	12	N
2	82	jubPensOtrosIngresos	1	12	N
3	82	jubPensTribBienes	0	0	N
4	82	jubPensTribOtrosBienes	0	0	N
5	88	trabRegPatagonica	1	3	N
6	88	jubPensRegPatagonica	1	3	N
7	88	jubPensOtrosIngresos	1	3	N
8	88	jubPensTribBienes	0	0	N
9	88	jubPensTribOtrosBienes	0	0	N
10	200	jubPensRegPatagonica	1	12	N
11	200	jubPensOtrosIngresos	1	12	N
12	200	jubPensTribBienes	0	0	N
13	200	jubPensTribOtrosBienes	0	0	N
14	206	trabRegPatagonica	1	3	N
15	206	jubPensRegPatagonica	1	3	N
16	206	jubPensOtrosIngresos	1	3	N
17	206	jubPensTribBienes	0	0	N
18	206	jubPensTribOtrosBienes	0	0	N
\.


--
-- Data for Name: f572_deducciones; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_deducciones (id, presentacion_id, tipo, tipodoc, nrodoc, denominacion, descbasica, descadicional, montototal) FROM stdin;
1	1	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		184670.02
2	3	1	80	30654855168	SWISS MEDICAL S A	30654855168 - SWISS MEDICAL S A		144573.70
3	7	3	80	30717237184	FRENTE DE TODOS A. P. - ALIANZA	30717237184 - FRENTE DE TODOS A. P. - ALIANZA		60000.00
4	8	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		7416.30
5	8	3	80	30717237184	FRENTE DE TODOS A. P. - ALIANZA	30717237184 - FRENTE DE TODOS A. P. - ALIANZA		65000.00
6	8	8	80	23140713759	RODRIGUEZ ALFREDO RAMON	23140713759 - RODRIGUEZ ALFREDO RAMON		92416.16
7	8	8	80	27950851398	GONZALEZ VILLALBA AURELIA	27950851398 - GONZALEZ VILLALBA AURELIA		111000.00
8	9	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		5775.00
9	9	8	86	27320092944	PEDROLINI YESICA DANIELA	27320092944 - PEDROLINI YESICA DANIELA		55891.95
10	9	8	80	27950851398	GONZALEZ VILLALBA AURELIA	27950851398 - GONZALEZ VILLALBA AURELIA		35503.36
11	12	1	80	30707972552	BRISTOL MEDICINE SRL	30707972552 - BRISTOL MEDICINE SRL		31116.86
12	12	99	80	30554492211	CAJA DE SEGURIDAD SOCIAL PARA ODONTOLOGOS DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30554492211 - CAJA DE SEGURIDAD SOCIAL PARA ODONTOLOGOS DE LA PROVINCIA DE BUENOS AIRES	9073.60
13	12	99	80	30554492211	CAJA DE SEGURIDAD SOCIAL PARA ODONTOLOGOS DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30554492211 - CAJA DE SEGURIDAD SOCIAL PARA ODONTOLOGOS DE LA PROVINCIA DE BUENOS AIRES	9073.60
14	12	99	80	30554492211	CAJA DE SEGURIDAD SOCIAL PARA ODONTOLOGOS DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30554492211 - CAJA DE SEGURIDAD SOCIAL PARA ODONTOLOGOS DE LA PROVINCIA DE BUENOS AIRES	9073.60
15	13	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12425.00
16	14	99	80	30532708059	CAJA DE PREVISION SOCIAL PARA ABOGADOS  DE LA PROVINCIA  DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Diciembre - 30532708059 - CAJA DE PREVISION SOCIAL PARA ABOGADOS  DE LA PROVINCIA  DE BUENOS AIRES	61170.00
17	14	99	80	30533874912	COLEGIO DE ABOGADOS DE LA PCIA DE BS AS	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30533874912 - COLEGIO DE ABOGADOS DE LA PCIA DE BS AS	38544.00
18	16	1	80	33677781489	SWISS MEDICAL GROUP S A	33677781489 - SWISS MEDICAL GROUP S A		134785.36
19	16	8	86	27226945496	SAAVEDRA PATRICIA MONICA	27226945496 - SAAVEDRA PATRICIA MONICA		186010.50
20	17	1	80	33677781489	SWISS MEDICAL GROUP S A	33677781489 - SWISS MEDICAL GROUP S A		81949.65
21	17	8	86	27226945496	SAAVEDRA PATRICIA MONICA	27226945496 - SAAVEDRA PATRICIA MONICA		44962.90
22	19	1	80	30522428163	GALENO ARGENTINA SOCIEDAD ANONIMA	30522428163 - GALENO ARGENTINA SOCIEDAD ANONIMA		18097.53
23	19	7	80	20140701786	EXPOSITO CRISTIAN ALBERTO	20140701786 - EXPOSITO CRISTIAN ALBERTO		24800.00
24	19	7	80	23250961529	EXPOSITO HERNAN	23250961529 - EXPOSITO HERNAN		3680.00
25	20	8	86	27300987481	MARTINEZ MAIRA ELIZABET	27300987481 - MARTINEZ MAIRA ELIZABET		17611.84
26	21	7	80	27142773924	GIURGIOVICH ALEJANDRA JULIA	27142773924 - GIURGIOVICH ALEJANDRA JULIA		680.00
27	21	7	80	27147016307	ALDINGER ELISABET SUSANA	27147016307 - ALDINGER ELISABET SUSANA		2560.00
28	23	24	80	30716030438	PREVENCION SEGUROS DE RETIRO S.A.	30716030438 - PREVENCION SEGUROS DE RETIRO S.A.		4800.00
29	24	1	80	30654855168	SWISS MEDICAL S A	30654855168 - SWISS MEDICAL S A		56214.82
30	27	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		0.01
31	28	8	86	27222983148	DIAZ MIRTA LILIANA	27222983148 - DIAZ MIRTA LILIANA		73316.77
32	29	1	80	30707573690	PRIVAMED  SA	30707573690 - PRIVAMED  SA		8166.17
33	30	1	80	30707573690	PRIVAMED  SA	30707573690 - PRIVAMED  SA		9940.40
34	32	1	80	30715272071	OSCOSALUD S.A.	30715272071 - OSCOSALUD S.A.		0.01
35	33	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		4317.00
36	33	8	80	27115416524	LEGUIZA MARIA INES	27115416524 - LEGUIZA MARIA INES		335791.92
37	34	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		4500.00
38	34	8	80	27115416524	LEGUIZA MARIA INES	27115416524 - LEGUIZA MARIA INES		99504.88
39	35	3	80	30717237184	FRENTE DE TODOS A. P. - ALIANZA	30717237184 - FRENTE DE TODOS A. P. - ALIANZA		55000.00
40	35	7	80	23228584819	ROLDAN GUIDO	23228584819 - ROLDAN GUIDO		5400.00
41	36	7	80	23228584819	ROLDAN GUIDO	23228584819 - ROLDAN GUIDO		5560.00
42	37	7	80	27119987143	PAOLANTONIO MIRTA	27119987143 - PAOLANTONIO MIRTA		4000.00
43	37	8	86	27930413793	OVELAR GIMENEZ ROSA EVANGELINA	27930413793 - OVELAR GIMENEZ ROSA EVANGELINA		72789.00
44	38	1	80	30657314974	OBRA SOCIAL DEL PERSONAL DEL ORGANISMO DE CONTROL EXTERNO	30657314974 - OBRA SOCIAL DEL PERSONAL DEL ORGANISMO DE CONTROL EXTERNO		24206.03
45	39	1	80	30654855168	SWISS MEDICAL S A	30654855168 - SWISS MEDICAL S A		139621.99
46	40	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		64224.67
47	41	1	80	30522428163	GALENO ARGENTINA SOCIEDAD ANONIMA	30522428163 - GALENO ARGENTINA SOCIEDAD ANONIMA		65020.00
48	41	1	80	30590354798	ASOCIACION MUTUAL SANCOR SALUD	30590354798 - ASOCIACION MUTUAL SANCOR SALUD		26628.44
49	45	8	86	27942746674	HUAILLA TURPO MARIA 	27942746674 - HUAILLA TURPO MARIA 		135000.00
50	47	3	80	30717237184	FRENTE DE TODOS A. P. - ALIANZA	30717237184 - FRENTE DE TODOS A. P. - ALIANZA		15000.00
51	47	8	80	27132352556	NAVARRO ESTELA DEL VALLE	27132352556 - NAVARRO ESTELA DEL VALLE		346714.47
52	47	8	80	27928579846	GNEZ NEBOR ELENA ANASTASIA	27928579846 - GNEZ NEBOR ELENA ANASTASIA		436510.28
53	48	1	80	30683032227	OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION	30683032227 - OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION		4140.00
54	48	99	80	30540780028	COLEGIO DE MEDICOS DE LA PROVINCIA DE   BUENOS AIRES    DISTRITO I	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Enero - 30540780028 - COLEGIO DE MEDICOS DE LA PROVINCIA DE   BUENOS AIRES    DISTRITO I	1800.00
55	48	99	80	30540780028	COLEGIO DE MEDICOS DE LA PROVINCIA DE   BUENOS AIRES    DISTRITO I	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Febrero - 30540780028 - COLEGIO DE MEDICOS DE LA PROVINCIA DE   BUENOS AIRES    DISTRITO I	1800.00
56	48	99	80	30540780028	COLEGIO DE MEDICOS DE LA PROVINCIA DE   BUENOS AIRES    DISTRITO I	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Febrero - 30540780028 - COLEGIO DE MEDICOS DE LA PROVINCIA DE   BUENOS AIRES    DISTRITO I	1800.00
57	48	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12425.00
58	48	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12425.00
59	48	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12425.00
60	49	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		179481.45
61	50	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		118587.87
62	50	8	86	27261585788	REYES SANDRA MABEL	27261585788 - REYES SANDRA MABEL		263336.00
63	50	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	7699.95
64	50	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	7699.95
65	50	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	7699.95
66	50	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	7699.95
67	50	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Mayo - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	7699.95
68	50	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Junio - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	7699.95
69	50	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	7699.95
70	50	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Agosto - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	7699.95
71	50	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Septiembre - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	11045.83
72	50	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12474.19
73	50	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	11085.43
74	50	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Diciembre - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12425.00
75	50	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Enero - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	6838.38
76	50	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Enero - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	6838.38
77	50	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Febrero - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	6838.38
78	50	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Marzo - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	7390.25
79	50	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Abril - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	7390.25
80	50	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Mayo - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	7390.25
81	50	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Junio - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	8285.94
166	84	3	80	30517312904	CONFERENCIA EPISCOPAL ARGENTINA	30517312904 - CONFERENCIA EPISCOPAL ARGENTINA		20800.00
82	50	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Julio - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	8285.94
83	50	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Agosto - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	8285.94
84	50	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Septiembre - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	9312.58
85	50	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Octubre - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	9312.58
86	50	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Noviembre - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	9312.58
87	51	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		28082.80
88	51	8	86	27261585788	REYES SANDRA MABEL	27261585788 - REYES SANDRA MABEL		78275.00
89	51	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12425.00
90	51	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12425.00
91	51	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12425.00
92	51	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Enero - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	10440.32
93	51	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Febrero - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	10440.32
94	54	7	80	27207231113	KOKKINIS ANA MARIA	27207231113 - KOKKINIS ANA MARIA		4400.00
95	55	1	80	30683032227	OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION	30683032227 - OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION		8513.80
96	56	1	80	30683032227	OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION	30683032227 - OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION		3386.68
97	58	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		138335.88
98	58	7	80	27250718522	NEGROTTO MARIA JIMENA	27250718522 - NEGROTTO MARIA JIMENA		6000.00
99	59	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		39720.74
100	59	7	80	27250718522	NEGROTTO MARIA JIMENA	27250718522 - NEGROTTO MARIA JIMENA		3232.00
101	60	1	80	30545933566	HOSPITAL BRITANICO DE BUENOS AIRES ASOCIACION CIVIL	30545933566 - HOSPITAL BRITANICO DE BUENOS AIRES ASOCIACION CIVIL		70694.70
102	61	1	80	30545933566	HOSPITAL BRITANICO DE BUENOS AIRES ASOCIACION CIVIL	30545933566 - HOSPITAL BRITANICO DE BUENOS AIRES ASOCIACION CIVIL		34732.70
103	62	3	80	30717237184	FRENTE DE TODOS A. P. - ALIANZA	30717237184 - FRENTE DE TODOS A. P. - ALIANZA		15000.00
104	62	8	86	27929759074	FLECHA TORALES FERMINA	27929759074 - FLECHA TORALES FERMINA		117075.49
105	63	8	86	27929759074	FLECHA TORALES FERMINA	27929759074 - FLECHA TORALES FERMINA		33927.64
106	64	1	80	30707972552	BRISTOL MEDICINE SRL	30707972552 - BRISTOL MEDICINE SRL		44525.16
107	65	1	80	30707972552	BRISTOL MEDICINE SRL	30707972552 - BRISTOL MEDICINE SRL		24776.24
108	66	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		112305.90
109	67	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		32527.24
110	68	1	80	30683032227	OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION	30683032227 - OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION		50361.48
111	68	2	80	30687145522	GALICIA SEGUROS S.A.U.	30687145522 - GALICIA SEGUROS S.A.U.		1667.10
112	68	3	80	30662117273	FONDO DE LAS NACIONES UNIDAS PARA LA INFANCIA UNICEF	30662117273 - FONDO DE LAS NACIONES UNIDAS PARA LA INFANCIA UNICEF		1600.00
113	69	1	80	30602010437	UNIDAD CORONARIA MOVIL QUILMES S.A	30602010437 - UNIDAD CORONARIA MOVIL QUILMES S.A		9019.00
114	70	1	80	30602010437	UNIDAD CORONARIA MOVIL QUILMES S.A	30602010437 - UNIDAD CORONARIA MOVIL QUILMES S.A		3662.00
115	70	8	86	27337941392	ABADIE ROMINA VALERIA	27337941392 - ABADIE ROMINA VALERIA		44000.00
116	72	1	80	30602010437	UNIDAD CORONARIA MOVIL QUILMES S.A	30602010437 - UNIDAD CORONARIA MOVIL QUILMES S.A		44500.00
117	72	7	80	30707651977	CENTRO DE OJOS QUILMES S A	30707651977 - CENTRO DE OJOS QUILMES S A		6360.00
118	72	7	80	30712198156	TWEENS HEARTS S.A.	30712198156 - TWEENS HEARTS S.A.		1000.00
119	72	7	80	33684308969	CENTRO MEDICO LAMADRID                  S R L	33684308969 - CENTRO MEDICO LAMADRID                  S R L		3208.00
120	73	1	80	30522428163	GALENO ARGENTINA SOCIEDAD ANONIMA	30522428163 - GALENO ARGENTINA SOCIEDAD ANONIMA		55154.36
121	73	1	80	30683032227	OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION	30683032227 - OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION		5584.24
122	74	1	80	30657314974	OBRA SOCIAL DEL PERSONAL DEL ORGANISMO DE CONTROL EXTERNO	30657314974 - OBRA SOCIAL DEL PERSONAL DEL ORGANISMO DE CONTROL EXTERNO		56790.00
123	75	1	80	30657314974	OBRA SOCIAL DEL PERSONAL DEL ORGANISMO DE CONTROL EXTERNO	30657314974 - OBRA SOCIAL DEL PERSONAL DEL ORGANISMO DE CONTROL EXTERNO		24216.00
124	76	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		1.00
125	76	3	80	30717237184	FRENTE DE TODOS A. P. - ALIANZA	30717237184 - FRENTE DE TODOS A. P. - ALIANZA		40000.00
126	77	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		0.01
127	78	1	80	30708049928	FUNDACION INSTITUTO QUIRURGICO DEL CALLAO	30708049928 - FUNDACION INSTITUTO QUIRURGICO DEL CALLAO		1590.00
128	78	99	80	30531183491	CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30531183491 - CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA PROVINCIA DE BUENOS AIRES	3803.82
129	78	99	80	30531183491	CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Junio - 30531183491 - CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA PROVINCIA DE BUENOS AIRES	4184.16
130	78	99	80	30531183491	CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30531183491 - CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA PROVINCIA DE BUENOS AIRES	4924.70
131	78	99	80	30531183491	CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Diciembre - 30531183491 - CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA PROVINCIA DE BUENOS AIRES	4924.70
132	78	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	3803.82
133	78	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	3803.82
134	78	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4184.16
135	78	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Mayo - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4184.16
136	78	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4602.56
137	78	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Agosto - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4602.56
138	78	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Septiembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4602.56
139	78	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4924.70
140	79	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	5515.66
141	79	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	5515.66
142	80	22	80	20220213111	RODRIGUEZ JULIO CESAR	20220213111 - RODRIGUEZ JULIO CESAR		64000.00
143	80	22	80	27170622427	RAMIREZ NORMA BEATRIZ	27170622427 - RAMIREZ NORMA BEATRIZ		16000.00
144	81	22	80	20220213111	RODRIGUEZ JULIO CESAR	20220213111 - RODRIGUEZ JULIO CESAR		24000.00
145	82	7	80	20216020872	BARRIOS GUSTAVO ARIEL	20216020872 - BARRIOS GUSTAVO ARIEL		28800.00
146	82	21	80	20216020872	BARRIOS GUSTAVO ARIEL	20216020872 - BARRIOS GUSTAVO ARIEL		34000.00
147	82	21	80	20227191474	SENLLE ADRIAN ALEJANDRO	20227191474 - SENLLE ADRIAN ALEJANDRO		8000.00
148	83	1	80	30545847473	CENTRO GALLEGO DE BUENOS AIRES MUTUALIDAD CULTURA ACCION SOCIAL	30545847473 - CENTRO GALLEGO DE BUENOS AIRES MUTUALIDAD CULTURA ACCION SOCIAL		114951.00
149	83	1	80	30633156200	GRUPO PARAMEDIC  S.A.	30633156200 - GRUPO PARAMEDIC  S.A.		25040.00
150	83	2	80	30500064230	BBVA SEGUROS ARGENTINA S.A.	30500064230 - BBVA SEGUROS ARGENTINA S.A.		24375.00
151	83	3	80	30517312904	CONFERENCIA EPISCOPAL ARGENTINA	30517312904 - CONFERENCIA EPISCOPAL ARGENTINA		75000.00
152	83	3	80	30562113289	CENTRO DE INTEGRACION LIBRE Y SOLIDARIO DE ARGENTINA ( C I L S A )	30562113289 - CENTRO DE INTEGRACION LIBRE Y SOLIDARIO DE ARGENTINA ( C I L S A )		14400.00
153	83	4	80	30617275801	INMOBILIARIA Y FINANCIERA LA CAPITAL SA	30617275801 - INMOBILIARIA Y FINANCIERA LA CAPITAL SA		29700.00
154	83	7	80	20112015419	PANETTA JUAN JOSE	20112015419 - PANETTA JUAN JOSE		9160.00
155	83	7	80	20171324956	CHIARADIA PABLO ALBERTO	20171324956 - CHIARADIA PABLO ALBERTO		19600.00
156	83	7	80	20367627973	FONTANA IGNACIO JOSE	20367627973 - FONTANA IGNACIO JOSE		2400.00
157	83	7	80	23217629934	VILLANI MARIA EMILIA	23217629934 - VILLANI MARIA EMILIA		25800.00
158	83	7	80	27163364943	DOS REIS NORA MARCELA	27163364943 - DOS REIS NORA MARCELA		40000.00
159	83	7	80	27244360322	PEREZ GISELA PAULA	27244360322 - PEREZ GISELA PAULA		3360.00
160	83	7	80	27264206265	GARCIA VILLAVERDE MAGDALENA	27264206265 - GARCIA VILLAVERDE MAGDALENA		18600.00
161	83	7	80	27279870196	LEONE HEBE LAURA	27279870196 - LEONE HEBE LAURA		4200.00
162	83	24	80	30678574097	CONSOLIDAR COMPAÑIA DE SEGUROS DE RETIRO S A	30678574097 - CONSOLIDAR COMPAÑIA DE SEGUROS DE RETIRO S A		24600.00
163	84	1	80	30545847473	CENTRO GALLEGO DE BUENOS AIRES MUTUALIDAD CULTURA ACCION SOCIAL	30545847473 - CENTRO GALLEGO DE BUENOS AIRES MUTUALIDAD CULTURA ACCION SOCIAL		49500.00
164	84	1	80	30633156200	GRUPO PARAMEDIC  S.A.	30633156200 - GRUPO PARAMEDIC  S.A.		25040.00
165	84	2	80	30500064230	BBVA SEGUROS ARGENTINA S.A.	30500064230 - BBVA SEGUROS ARGENTINA S.A.		8200.00
167	84	4	80	30617275801	INMOBILIARIA Y FINANCIERA LA CAPITAL SA	30617275801 - INMOBILIARIA Y FINANCIERA LA CAPITAL SA		9820.00
168	84	24	80	30678574097	CONSOLIDAR COMPAÑIA DE SEGUROS DE RETIRO S A	30678574097 - CONSOLIDAR COMPAÑIA DE SEGUROS DE RETIRO S A		8200.00
169	85	1	80	30707972552	BRISTOL MEDICINE SRL	30707972552 - BRISTOL MEDICINE SRL		3728.24
170	85	2	80	33700893729	MAPFRE ARGENTINA SEGUROS DE VIDA  S A	33700893729 - MAPFRE ARGENTINA SEGUROS DE VIDA  S A		1715.88
171	85	7	80	20272249661	ACTIS JUAN ESTEBAN	20272249661 - ACTIS JUAN ESTEBAN		5600.00
172	85	7	80	20286018719	PARABUE EMILIO MARCOS	20286018719 - PARABUE EMILIO MARCOS		11200.00
173	85	7	80	23077668349	IRAOLA JORGE JULIO ELIAS	23077668349 - IRAOLA JORGE JULIO ELIAS		2920.00
174	85	7	80	33610954699	CENTRO DE TOMOGRAFIA COMPUTADA ADROGUE SA	33610954699 - CENTRO DE TOMOGRAFIA COMPUTADA ADROGUE SA		856.52
175	85	21	80	30707219293	PHYNX S A	30707219293 - PHYNX S A		34203.40
176	86	1	80	30707972552	BRISTOL MEDICINE SRL	30707972552 - BRISTOL MEDICINE SRL		4162.01
177	86	7	80	23077668349	IRAOLA JORGE JULIO ELIAS	23077668349 - IRAOLA JORGE JULIO ELIAS		1200.00
178	88	1	80	30683032227	OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION	30683032227 - OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION		31472.61
179	88	21	80	30548083156	COTO CENTRO INTEGRAL DE COMERCIALIZACION SOCIEDAD ANONIMA	30548083156 - COTO CENTRO INTEGRAL DE COMERCIALIZACION SOCIEDAD ANONIMA		6018.71
180	88	21	80	30678138300	DORINKA S.R.L.	30678138300 - DORINKA S.R.L.		6103.89
181	88	21	80	30711264937	UOM GERLI  S.C.S.	30711264937 - UOM GERLI  S.C.S.		6782.79
182	90	2	80	30682408622	CNP ASSURANCES CIA DE SEGUROS SA	30682408622 - CNP ASSURANCES CIA DE SEGUROS SA		26500.00
183	90	7	80	27260382875	PELAYO LAURA NAIR	27260382875 - PELAYO LAURA NAIR		920.00
184	90	21	80	20125487484	ARIAS JOSE MARIA	20125487484 - ARIAS JOSE MARIA		5940.00
185	90	21	80	30500781293	GRIMOLDI SOCIEDAD ANONIMA	30500781293 - GRIMOLDI SOCIEDAD ANONIMA		11800.00
186	90	21	80	30679202045	LEADER ELECTRONIC S A	30679202045 - LEADER ELECTRONIC S A		1699.90
187	90	21	80	30707917128	THIRD TIME S.A.	30707917128 - THIRD TIME S.A.		6580.00
188	90	21	80	30708225548	TRAZ SOCIEDAD ANONIMA	30708225548 - TRAZ SOCIEDAD ANONIMA		48090.00
189	90	21	80	30708402911	GAX S.A.	30708402911 - GAX S.A.		10900.00
190	90	21	80	30714324167	DESARTEX S.A.	30714324167 - DESARTEX S.A.		9400.00
191	90	99	80	33709714339	COLEGIO DE DIETISTAS NUTRICIONISTA - DIETISTA Y LICENCIADOS EN NUTRICION DE LA PCIA. DE BS.AS.	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 33709714339 - COLEGIO DE DIETISTAS NUTRICIONISTA - DIETISTA Y LICENCIADOS EN NUTRICION DE LA PCIA. DE BS.AS.	6600.00
192	91	2	80	30682408622	CNP ASSURANCES CIA DE SEGUROS SA	30682408622 - CNP ASSURANCES CIA DE SEGUROS SA		7500.00
193	91	21	80	30638485733	DABRA SOCIEDAD ANONIMA	30638485733 - DABRA SOCIEDAD ANONIMA		17197.00
194	91	21	80	30640897267	TELECENTRO S A	30640897267 - TELECENTRO S A		4764.00
195	92	1	80	30590354798	ASOCIACION MUTUAL SANCOR SALUD	30590354798 - ASOCIACION MUTUAL SANCOR SALUD		36044.69
196	92	1	80	30628249527	INSTITUTO DE OBRA MEDICO ASISTENCIAL	30628249527 - INSTITUTO DE OBRA MEDICO ASISTENCIAL		8619.48
197	92	1	80	30697752222	SOY MAGA SOL WILDE S C S	30697752222 - SOY MAGA SOL WILDE S C S		6963.53
198	92	1	80	30707972552	BRISTOL MEDICINE SRL	30707972552 - BRISTOL MEDICINE SRL		3203.85
199	92	1	80	33709139369	SOY MAGA EL ALTO A  SCS	33709139369 - SOY MAGA EL ALTO A  SCS		1127.97
200	92	7	80	20179212294	MARQUEZ GRAND DANIEL	20179212294 - MARQUEZ GRAND DANIEL		800.00
201	92	21	80	20260234693	VESPASIANO LEONARDO	20260234693 - VESPASIANO LEONARDO		9630.00
202	92	21	80	30500781293	GRIMOLDI SOCIEDAD ANONIMA	30500781293 - GRIMOLDI SOCIEDAD ANONIMA		22488.00
203	92	21	80	30714792810	OCEAN CUL S.R.L.	30714792810 - OCEAN CUL S.R.L.		1500.00
204	92	21	80	30717060225	LOS BULFE S.R.L.	30717060225 - LOS BULFE S.R.L.		2750.00
205	92	21	80	33542082459	TOPYED SA	33542082459 - TOPYED SA		2990.00
206	93	1	80	30628249527	INSTITUTO DE OBRA MEDICO ASISTENCIAL	30628249527 - INSTITUTO DE OBRA MEDICO ASISTENCIAL		2512.98
207	93	1	80	30697752222	SOY MAGA SOL WILDE S C S	30697752222 - SOY MAGA SOL WILDE S C S		1467.99
208	93	1	80	30707651977	CENTRO DE OJOS QUILMES S A	30707651977 - CENTRO DE OJOS QUILMES S A		1500.00
209	93	1	80	33710854969	LABORATORIO WILDE S.R.L.	33710854969 - LABORATORIO WILDE S.R.L.		200.00
210	93	21	80	30500781293	GRIMOLDI SOCIEDAD ANONIMA	30500781293 - GRIMOLDI SOCIEDAD ANONIMA		3920.00
211	93	21	80	30708157054	MDQ LE SPORT S.A.	30708157054 - MDQ LE SPORT S.A.		10798.00
212	93	21	80	30708365366	DEPORTES PIZZUTI S.R.L.	30708365366 - DEPORTES PIZZUTI S.R.L.		3900.00
213	94	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		7854.32
214	95	21	80	30710403526	FELER GROUP S.A.	30710403526 - FELER GROUP S.A.		24999.00
215	95	99	80	30541314241	COLEGIO DE MEDICOS DE LA PCIA  DE BS  AS	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30541314241 - COLEGIO DE MEDICOS DE LA PCIA  DE BS  AS	13595.00
216	95	99	80	30541314241	COLEGIO DE MEDICOS DE LA PCIA  DE BS  AS	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30541314241 - COLEGIO DE MEDICOS DE LA PCIA  DE BS  AS	13595.00
217	95	99	80	30541314241	COLEGIO DE MEDICOS DE LA PCIA  DE BS  AS	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30541314241 - COLEGIO DE MEDICOS DE LA PCIA  DE BS  AS	13595.00
218	95	99	80	30541314241	COLEGIO DE MEDICOS DE LA PCIA  DE BS  AS	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30541314241 - COLEGIO DE MEDICOS DE LA PCIA  DE BS  AS	13595.00
219	96	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		23727.52
220	98	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		21468.00
221	99	1	80	30590354798	ASOCIACION MUTUAL SANCOR SALUD	30590354798 - ASOCIACION MUTUAL SANCOR SALUD		3090.64
222	99	99	80	30532708059	CAJA DE PREVISION SOCIAL PARA ABOGADOS  DE LA PROVINCIA  DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30532708059 - CAJA DE PREVISION SOCIAL PARA ABOGADOS  DE LA PROVINCIA  DE BUENOS AIRES	6465.55
223	99	99	80	30532708059	CAJA DE PREVISION SOCIAL PARA ABOGADOS  DE LA PROVINCIA  DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30532708059 - CAJA DE PREVISION SOCIAL PARA ABOGADOS  DE LA PROVINCIA  DE BUENOS AIRES	3060.00
224	99	99	80	30532708059	CAJA DE PREVISION SOCIAL PARA ABOGADOS  DE LA PROVINCIA  DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30532708059 - CAJA DE PREVISION SOCIAL PARA ABOGADOS  DE LA PROVINCIA  DE BUENOS AIRES	6982.90
225	101	1	80	30546771314	MEDICUS SOCIEDAD ANONIMA DE ASISTENCIA MEDICA Y CIENTIFICA	30546771314 - MEDICUS SOCIEDAD ANONIMA DE ASISTENCIA MEDICA Y CIENTIFICA		99949.49
226	102	1	80	30546771314	MEDICUS SOCIEDAD ANONIMA DE ASISTENCIA MEDICA Y CIENTIFICA	30546771314 - MEDICUS SOCIEDAD ANONIMA DE ASISTENCIA MEDICA Y CIENTIFICA		13114.48
227	107	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		37557.16
228	107	3	80	30717237184	FRENTE DE TODOS A. P. - ALIANZA	30717237184 - FRENTE DE TODOS A. P. - ALIANZA		50000.00
229	107	7	80	27264164066	SCE MARIELA ALEJANDRA	27264164066 - SCE MARIELA ALEJANDRA		6080.00
230	107	8	80	27262279605	APESTEGUIA ELIZABETH EULALIA	27262279605 - APESTEGUIA ELIZABETH EULALIA		64932.23
231	109	22	80	27061517826	SANTAMARIA ALICIA CRISTINA	27061517826 - SANTAMARIA ALICIA CRISTINA		104190.40
232	110	22	80	27061517826	SANTAMARIA ALICIA CRISTINA	27061517826 - SANTAMARIA ALICIA CRISTINA		41496.00
233	112	7	80	20214310180	VELA FERREIRA ATILIO	20214310180 - VELA FERREIRA ATILIO		12000.00
234	112	7	80	27323950712	SALZANO ROXANA LAURA	27323950712 - SALZANO ROXANA LAURA		14800.00
235	116	2	80	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		891.64
236	116	3	80	30717237184	FRENTE DE TODOS A. P. - ALIANZA	30717237184 - FRENTE DE TODOS A. P. - ALIANZA		8000.00
237	116	4	80	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		27397.62
238	116	7	80	30588092468	ENRIQUE MARTIN ROSSI S A	30588092468 - ENRIQUE MARTIN ROSSI S A		3120.00
239	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	237.31
240	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	237.31
241	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	237.31
242	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	237.31
243	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	237.31
244	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	2726.39
245	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	1036.27
246	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	3193.12
247	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	265.43
248	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	3914.82
249	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	265.43
250	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	265.43
251	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	1073.28
252	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	265.23
253	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	2496.92
254	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Mayo - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4184.16
255	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Junio - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4686.24
256	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	1490.67
257	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	1620.21
258	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	298.13
259	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	298.13
260	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	298.13
261	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	199.03
262	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Agosto - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4638.75
263	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Septiembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	343.78
264	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	327.95
265	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	327.95
266	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	1637.47
267	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	1637.47
268	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	327.95
269	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	2137.31
270	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	326.70
271	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	326.70
272	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	326.70
273	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	326.70
274	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	326.70
275	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	326.70
276	116	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	326.70
277	117	2	80	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		146.22
278	117	4	80	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		4580.44
279	117	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	358.16
280	117	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	358.16
281	117	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	358.16
282	118	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	3253.50
283	118	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	3253.50
284	118	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	3253.50
285	118	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	471.50
400	180	8	86	27929759074	FLECHA TORALES FERMINA	27929759074 - FLECHA TORALES FERMINA		117075.49
286	118	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	3253.50
287	118	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	471.50
288	118	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Mayo - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	3750.00
289	118	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Mayo - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	471.50
290	118	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Junio - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	3750.00
291	118	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	3750.00
292	118	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Agosto - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	4125.00
293	118	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Septiembre - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	4125.00
294	118	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	4125.00
295	118	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	4984.38
296	118	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Diciembre - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	6343.75
297	119	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		184670.02
298	121	1	80	30654855168	SWISS MEDICAL S A	30654855168 - SWISS MEDICAL S A		144573.70
299	125	3	80	30717237184	FRENTE DE TODOS A. P. - ALIANZA	30717237184 - FRENTE DE TODOS A. P. - ALIANZA		60000.00
300	126	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		7416.30
301	126	3	80	30717237184	FRENTE DE TODOS A. P. - ALIANZA	30717237184 - FRENTE DE TODOS A. P. - ALIANZA		65000.00
302	126	8	80	23140713759	RODRIGUEZ ALFREDO RAMON	23140713759 - RODRIGUEZ ALFREDO RAMON		92416.16
303	126	8	80	27950851398	GONZALEZ VILLALBA AURELIA	27950851398 - GONZALEZ VILLALBA AURELIA		111000.00
304	127	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		5775.00
305	127	8	86	27320092944	PEDROLINI YESICA DANIELA	27320092944 - PEDROLINI YESICA DANIELA		55891.95
306	127	8	80	27950851398	GONZALEZ VILLALBA AURELIA	27950851398 - GONZALEZ VILLALBA AURELIA		35503.36
307	130	1	80	30707972552	BRISTOL MEDICINE SRL	30707972552 - BRISTOL MEDICINE SRL		31116.86
308	130	99	80	30554492211	CAJA DE SEGURIDAD SOCIAL PARA ODONTOLOGOS DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30554492211 - CAJA DE SEGURIDAD SOCIAL PARA ODONTOLOGOS DE LA PROVINCIA DE BUENOS AIRES	9073.60
309	130	99	80	30554492211	CAJA DE SEGURIDAD SOCIAL PARA ODONTOLOGOS DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30554492211 - CAJA DE SEGURIDAD SOCIAL PARA ODONTOLOGOS DE LA PROVINCIA DE BUENOS AIRES	9073.60
310	130	99	80	30554492211	CAJA DE SEGURIDAD SOCIAL PARA ODONTOLOGOS DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30554492211 - CAJA DE SEGURIDAD SOCIAL PARA ODONTOLOGOS DE LA PROVINCIA DE BUENOS AIRES	9073.60
311	131	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12425.00
312	132	99	80	30532708059	CAJA DE PREVISION SOCIAL PARA ABOGADOS  DE LA PROVINCIA  DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Diciembre - 30532708059 - CAJA DE PREVISION SOCIAL PARA ABOGADOS  DE LA PROVINCIA  DE BUENOS AIRES	61170.00
313	132	99	80	30533874912	COLEGIO DE ABOGADOS DE LA PCIA DE BS AS	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30533874912 - COLEGIO DE ABOGADOS DE LA PCIA DE BS AS	38544.00
314	134	1	80	33677781489	SWISS MEDICAL GROUP S A	33677781489 - SWISS MEDICAL GROUP S A		134785.36
315	134	8	86	27226945496	SAAVEDRA PATRICIA MONICA	27226945496 - SAAVEDRA PATRICIA MONICA		186010.50
316	135	1	80	33677781489	SWISS MEDICAL GROUP S A	33677781489 - SWISS MEDICAL GROUP S A		81949.65
317	135	8	86	27226945496	SAAVEDRA PATRICIA MONICA	27226945496 - SAAVEDRA PATRICIA MONICA		44962.90
318	137	1	80	30522428163	GALENO ARGENTINA SOCIEDAD ANONIMA	30522428163 - GALENO ARGENTINA SOCIEDAD ANONIMA		18097.53
319	137	7	80	20140701786	EXPOSITO CRISTIAN ALBERTO	20140701786 - EXPOSITO CRISTIAN ALBERTO		24800.00
320	137	7	80	23250961529	EXPOSITO HERNAN	23250961529 - EXPOSITO HERNAN		3680.00
321	138	8	86	27300987481	MARTINEZ MAIRA ELIZABET	27300987481 - MARTINEZ MAIRA ELIZABET		17611.84
322	139	7	80	27142773924	GIURGIOVICH ALEJANDRA JULIA	27142773924 - GIURGIOVICH ALEJANDRA JULIA		680.00
323	139	7	80	27147016307	ALDINGER ELISABET SUSANA	27147016307 - ALDINGER ELISABET SUSANA		2560.00
324	141	24	80	30716030438	PREVENCION SEGUROS DE RETIRO S.A.	30716030438 - PREVENCION SEGUROS DE RETIRO S.A.		4800.00
325	142	1	80	30654855168	SWISS MEDICAL S A	30654855168 - SWISS MEDICAL S A		56214.82
326	145	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		0.01
327	146	8	86	27222983148	DIAZ MIRTA LILIANA	27222983148 - DIAZ MIRTA LILIANA		73316.77
328	147	1	80	30707573690	PRIVAMED  SA	30707573690 - PRIVAMED  SA		8166.17
329	148	1	80	30707573690	PRIVAMED  SA	30707573690 - PRIVAMED  SA		9940.40
330	150	1	80	30715272071	OSCOSALUD S.A.	30715272071 - OSCOSALUD S.A.		0.01
331	151	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		4317.00
332	151	8	80	27115416524	LEGUIZA MARIA INES	27115416524 - LEGUIZA MARIA INES		335791.92
333	152	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		4500.00
334	152	8	80	27115416524	LEGUIZA MARIA INES	27115416524 - LEGUIZA MARIA INES		99504.88
335	153	3	80	30717237184	FRENTE DE TODOS A. P. - ALIANZA	30717237184 - FRENTE DE TODOS A. P. - ALIANZA		55000.00
336	153	7	80	23228584819	ROLDAN GUIDO	23228584819 - ROLDAN GUIDO		5400.00
337	154	7	80	23228584819	ROLDAN GUIDO	23228584819 - ROLDAN GUIDO		5560.00
338	155	7	80	27119987143	PAOLANTONIO MIRTA	27119987143 - PAOLANTONIO MIRTA		4000.00
339	155	8	86	27930413793	OVELAR GIMENEZ ROSA EVANGELINA	27930413793 - OVELAR GIMENEZ ROSA EVANGELINA		72789.00
340	156	1	80	30657314974	OBRA SOCIAL DEL PERSONAL DEL ORGANISMO DE CONTROL EXTERNO	30657314974 - OBRA SOCIAL DEL PERSONAL DEL ORGANISMO DE CONTROL EXTERNO		24206.03
341	157	1	80	30654855168	SWISS MEDICAL S A	30654855168 - SWISS MEDICAL S A		139621.99
342	158	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		64224.67
343	159	1	80	30522428163	GALENO ARGENTINA SOCIEDAD ANONIMA	30522428163 - GALENO ARGENTINA SOCIEDAD ANONIMA		65020.00
344	159	1	80	30590354798	ASOCIACION MUTUAL SANCOR SALUD	30590354798 - ASOCIACION MUTUAL SANCOR SALUD		26628.44
345	163	8	86	27942746674	HUAILLA TURPO MARIA 	27942746674 - HUAILLA TURPO MARIA 		135000.00
346	165	3	80	30717237184	FRENTE DE TODOS A. P. - ALIANZA	30717237184 - FRENTE DE TODOS A. P. - ALIANZA		15000.00
347	165	8	80	27132352556	NAVARRO ESTELA DEL VALLE	27132352556 - NAVARRO ESTELA DEL VALLE		346714.47
348	165	8	80	27928579846	GNEZ NEBOR ELENA ANASTASIA	27928579846 - GNEZ NEBOR ELENA ANASTASIA		436510.28
349	166	1	80	30683032227	OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION	30683032227 - OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION		4140.00
350	166	99	80	30540780028	COLEGIO DE MEDICOS DE LA PROVINCIA DE   BUENOS AIRES    DISTRITO I	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Enero - 30540780028 - COLEGIO DE MEDICOS DE LA PROVINCIA DE   BUENOS AIRES    DISTRITO I	1800.00
351	166	99	80	30540780028	COLEGIO DE MEDICOS DE LA PROVINCIA DE   BUENOS AIRES    DISTRITO I	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Febrero - 30540780028 - COLEGIO DE MEDICOS DE LA PROVINCIA DE   BUENOS AIRES    DISTRITO I	1800.00
352	166	99	80	30540780028	COLEGIO DE MEDICOS DE LA PROVINCIA DE   BUENOS AIRES    DISTRITO I	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Febrero - 30540780028 - COLEGIO DE MEDICOS DE LA PROVINCIA DE   BUENOS AIRES    DISTRITO I	1800.00
353	166	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12425.00
354	166	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12425.00
355	166	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12425.00
356	167	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		179481.45
357	168	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		118587.87
358	168	8	86	27261585788	REYES SANDRA MABEL	27261585788 - REYES SANDRA MABEL		263336.00
359	168	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	7699.95
360	168	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	7699.95
361	168	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	7699.95
362	168	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	7699.95
363	168	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Mayo - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	7699.95
364	168	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Junio - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	7699.95
365	168	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	7699.95
366	168	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Agosto - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	7699.95
401	181	8	86	27929759074	FLECHA TORALES FERMINA	27929759074 - FLECHA TORALES FERMINA		33927.64
367	168	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Septiembre - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	11045.83
368	168	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12474.19
369	168	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	11085.43
370	168	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Diciembre - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12425.00
371	168	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Enero - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	6838.38
372	168	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Enero - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	6838.38
373	168	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Febrero - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	6838.38
374	168	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Marzo - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	7390.25
375	168	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Abril - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	7390.25
376	168	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Mayo - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	7390.25
377	168	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Junio - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	8285.94
378	168	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Julio - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	8285.94
379	168	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Agosto - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	8285.94
380	168	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Septiembre - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	9312.58
381	168	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Octubre - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	9312.58
382	168	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Noviembre - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	9312.58
383	169	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		28082.80
384	169	8	86	27261585788	REYES SANDRA MABEL	27261585788 - REYES SANDRA MABEL		78275.00
385	169	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12425.00
386	169	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12425.00
387	169	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	12425.00
388	169	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Enero - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	10440.32
389	169	99	80	33637617449	ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES	Febrero - 33637617449 - ADMINISTRACION NACIONAL DE LA SEGURIDAD SOCIAL ANSES	10440.32
390	172	7	80	27207231113	KOKKINIS ANA MARIA	27207231113 - KOKKINIS ANA MARIA		4400.00
391	173	1	80	30683032227	OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION	30683032227 - OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION		8513.80
392	174	1	80	30683032227	OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION	30683032227 - OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION		3386.68
393	176	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		138335.88
394	176	7	80	27250718522	NEGROTTO MARIA JIMENA	27250718522 - NEGROTTO MARIA JIMENA		6000.00
395	177	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		39720.74
396	177	7	80	27250718522	NEGROTTO MARIA JIMENA	27250718522 - NEGROTTO MARIA JIMENA		3232.00
397	178	1	80	30545933566	HOSPITAL BRITANICO DE BUENOS AIRES ASOCIACION CIVIL	30545933566 - HOSPITAL BRITANICO DE BUENOS AIRES ASOCIACION CIVIL		70694.70
398	179	1	80	30545933566	HOSPITAL BRITANICO DE BUENOS AIRES ASOCIACION CIVIL	30545933566 - HOSPITAL BRITANICO DE BUENOS AIRES ASOCIACION CIVIL		34732.70
399	180	3	80	30717237184	FRENTE DE TODOS A. P. - ALIANZA	30717237184 - FRENTE DE TODOS A. P. - ALIANZA		15000.00
402	182	1	80	30707972552	BRISTOL MEDICINE SRL	30707972552 - BRISTOL MEDICINE SRL		44525.16
403	183	1	80	30707972552	BRISTOL MEDICINE SRL	30707972552 - BRISTOL MEDICINE SRL		24776.24
404	184	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		112305.90
405	185	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		32527.24
406	186	1	80	30683032227	OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION	30683032227 - OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION		50361.48
407	186	2	80	30687145522	GALICIA SEGUROS S.A.U.	30687145522 - GALICIA SEGUROS S.A.U.		1667.10
408	186	3	80	30662117273	FONDO DE LAS NACIONES UNIDAS PARA LA INFANCIA UNICEF	30662117273 - FONDO DE LAS NACIONES UNIDAS PARA LA INFANCIA UNICEF		1600.00
409	187	1	80	30602010437	UNIDAD CORONARIA MOVIL QUILMES S.A	30602010437 - UNIDAD CORONARIA MOVIL QUILMES S.A		9019.00
410	188	1	80	30602010437	UNIDAD CORONARIA MOVIL QUILMES S.A	30602010437 - UNIDAD CORONARIA MOVIL QUILMES S.A		3662.00
411	188	8	86	27337941392	ABADIE ROMINA VALERIA	27337941392 - ABADIE ROMINA VALERIA		44000.00
412	190	1	80	30602010437	UNIDAD CORONARIA MOVIL QUILMES S.A	30602010437 - UNIDAD CORONARIA MOVIL QUILMES S.A		44500.00
413	190	7	80	30707651977	CENTRO DE OJOS QUILMES S A	30707651977 - CENTRO DE OJOS QUILMES S A		6360.00
414	190	7	80	30712198156	TWEENS HEARTS S.A.	30712198156 - TWEENS HEARTS S.A.		1000.00
415	190	7	80	33684308969	CENTRO MEDICO LAMADRID                  S R L	33684308969 - CENTRO MEDICO LAMADRID                  S R L		3208.00
416	191	1	80	30522428163	GALENO ARGENTINA SOCIEDAD ANONIMA	30522428163 - GALENO ARGENTINA SOCIEDAD ANONIMA		55154.36
417	191	1	80	30683032227	OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION	30683032227 - OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION		5584.24
418	192	1	80	30657314974	OBRA SOCIAL DEL PERSONAL DEL ORGANISMO DE CONTROL EXTERNO	30657314974 - OBRA SOCIAL DEL PERSONAL DEL ORGANISMO DE CONTROL EXTERNO		56790.00
419	193	1	80	30657314974	OBRA SOCIAL DEL PERSONAL DEL ORGANISMO DE CONTROL EXTERNO	30657314974 - OBRA SOCIAL DEL PERSONAL DEL ORGANISMO DE CONTROL EXTERNO		24216.00
420	194	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		1.00
421	194	3	80	30717237184	FRENTE DE TODOS A. P. - ALIANZA	30717237184 - FRENTE DE TODOS A. P. - ALIANZA		40000.00
422	195	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		0.01
423	196	1	80	30708049928	FUNDACION INSTITUTO QUIRURGICO DEL CALLAO	30708049928 - FUNDACION INSTITUTO QUIRURGICO DEL CALLAO		1590.00
424	196	99	80	30531183491	CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30531183491 - CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA PROVINCIA DE BUENOS AIRES	3803.82
425	196	99	80	30531183491	CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Junio - 30531183491 - CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA PROVINCIA DE BUENOS AIRES	4184.16
426	196	99	80	30531183491	CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30531183491 - CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA PROVINCIA DE BUENOS AIRES	4924.70
427	196	99	80	30531183491	CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Diciembre - 30531183491 - CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA PROVINCIA DE BUENOS AIRES	4924.70
428	196	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	3803.82
429	196	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	3803.82
430	196	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4184.16
431	196	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Mayo - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4184.16
432	196	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4602.56
433	196	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Agosto - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4602.56
434	196	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Septiembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4602.56
435	196	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4924.70
436	197	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	5515.66
437	197	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	5515.66
438	198	22	80	20220213111	RODRIGUEZ JULIO CESAR	20220213111 - RODRIGUEZ JULIO CESAR		64000.00
439	198	22	80	27170622427	RAMIREZ NORMA BEATRIZ	27170622427 - RAMIREZ NORMA BEATRIZ		16000.00
440	199	22	80	20220213111	RODRIGUEZ JULIO CESAR	20220213111 - RODRIGUEZ JULIO CESAR		24000.00
441	200	7	80	20216020872	BARRIOS GUSTAVO ARIEL	20216020872 - BARRIOS GUSTAVO ARIEL		28800.00
442	200	21	80	20216020872	BARRIOS GUSTAVO ARIEL	20216020872 - BARRIOS GUSTAVO ARIEL		34000.00
443	200	21	80	20227191474	SENLLE ADRIAN ALEJANDRO	20227191474 - SENLLE ADRIAN ALEJANDRO		8000.00
444	201	1	80	30545847473	CENTRO GALLEGO DE BUENOS AIRES MUTUALIDAD CULTURA ACCION SOCIAL	30545847473 - CENTRO GALLEGO DE BUENOS AIRES MUTUALIDAD CULTURA ACCION SOCIAL		114951.00
445	201	1	80	30633156200	GRUPO PARAMEDIC  S.A.	30633156200 - GRUPO PARAMEDIC  S.A.		25040.00
446	201	2	80	30500064230	BBVA SEGUROS ARGENTINA S.A.	30500064230 - BBVA SEGUROS ARGENTINA S.A.		24375.00
447	201	3	80	30517312904	CONFERENCIA EPISCOPAL ARGENTINA	30517312904 - CONFERENCIA EPISCOPAL ARGENTINA		75000.00
448	201	3	80	30562113289	CENTRO DE INTEGRACION LIBRE Y SOLIDARIO DE ARGENTINA ( C I L S A )	30562113289 - CENTRO DE INTEGRACION LIBRE Y SOLIDARIO DE ARGENTINA ( C I L S A )		14400.00
449	201	4	80	30617275801	INMOBILIARIA Y FINANCIERA LA CAPITAL SA	30617275801 - INMOBILIARIA Y FINANCIERA LA CAPITAL SA		29700.00
450	201	7	80	20112015419	PANETTA JUAN JOSE	20112015419 - PANETTA JUAN JOSE		9160.00
451	201	7	80	20171324956	CHIARADIA PABLO ALBERTO	20171324956 - CHIARADIA PABLO ALBERTO		19600.00
452	201	7	80	20367627973	FONTANA IGNACIO JOSE	20367627973 - FONTANA IGNACIO JOSE		2400.00
453	201	7	80	23217629934	VILLANI MARIA EMILIA	23217629934 - VILLANI MARIA EMILIA		25800.00
454	201	7	80	27163364943	DOS REIS NORA MARCELA	27163364943 - DOS REIS NORA MARCELA		40000.00
455	201	7	80	27244360322	PEREZ GISELA PAULA	27244360322 - PEREZ GISELA PAULA		3360.00
456	201	7	80	27264206265	GARCIA VILLAVERDE MAGDALENA	27264206265 - GARCIA VILLAVERDE MAGDALENA		18600.00
457	201	7	80	27279870196	LEONE HEBE LAURA	27279870196 - LEONE HEBE LAURA		4200.00
458	201	24	80	30678574097	CONSOLIDAR COMPAÑIA DE SEGUROS DE RETIRO S A	30678574097 - CONSOLIDAR COMPAÑIA DE SEGUROS DE RETIRO S A		24600.00
459	202	1	80	30545847473	CENTRO GALLEGO DE BUENOS AIRES MUTUALIDAD CULTURA ACCION SOCIAL	30545847473 - CENTRO GALLEGO DE BUENOS AIRES MUTUALIDAD CULTURA ACCION SOCIAL		49500.00
460	202	1	80	30633156200	GRUPO PARAMEDIC  S.A.	30633156200 - GRUPO PARAMEDIC  S.A.		25040.00
461	202	2	80	30500064230	BBVA SEGUROS ARGENTINA S.A.	30500064230 - BBVA SEGUROS ARGENTINA S.A.		8200.00
462	202	3	80	30517312904	CONFERENCIA EPISCOPAL ARGENTINA	30517312904 - CONFERENCIA EPISCOPAL ARGENTINA		20800.00
463	202	4	80	30617275801	INMOBILIARIA Y FINANCIERA LA CAPITAL SA	30617275801 - INMOBILIARIA Y FINANCIERA LA CAPITAL SA		9820.00
464	202	24	80	30678574097	CONSOLIDAR COMPAÑIA DE SEGUROS DE RETIRO S A	30678574097 - CONSOLIDAR COMPAÑIA DE SEGUROS DE RETIRO S A		8200.00
465	203	1	80	30707972552	BRISTOL MEDICINE SRL	30707972552 - BRISTOL MEDICINE SRL		3728.24
466	203	2	80	33700893729	MAPFRE ARGENTINA SEGUROS DE VIDA  S A	33700893729 - MAPFRE ARGENTINA SEGUROS DE VIDA  S A		1715.88
467	203	7	80	20272249661	ACTIS JUAN ESTEBAN	20272249661 - ACTIS JUAN ESTEBAN		5600.00
468	203	7	80	20286018719	PARABUE EMILIO MARCOS	20286018719 - PARABUE EMILIO MARCOS		11200.00
469	203	7	80	23077668349	IRAOLA JORGE JULIO ELIAS	23077668349 - IRAOLA JORGE JULIO ELIAS		2920.00
470	203	7	80	33610954699	CENTRO DE TOMOGRAFIA COMPUTADA ADROGUE SA	33610954699 - CENTRO DE TOMOGRAFIA COMPUTADA ADROGUE SA		856.52
471	203	21	80	30707219293	PHYNX S A	30707219293 - PHYNX S A		34203.40
472	204	1	80	30707972552	BRISTOL MEDICINE SRL	30707972552 - BRISTOL MEDICINE SRL		4162.01
473	204	7	80	23077668349	IRAOLA JORGE JULIO ELIAS	23077668349 - IRAOLA JORGE JULIO ELIAS		1200.00
474	206	1	80	30683032227	OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION	30683032227 - OBRA SOCIAL UNION PERSONAL DE LA UNION  DEL PERSONAL CIVIL DE LA NACION		31472.61
475	206	21	80	30548083156	COTO CENTRO INTEGRAL DE COMERCIALIZACION SOCIEDAD ANONIMA	30548083156 - COTO CENTRO INTEGRAL DE COMERCIALIZACION SOCIEDAD ANONIMA		6018.71
476	206	21	80	30678138300	DORINKA S.R.L.	30678138300 - DORINKA S.R.L.		6103.89
477	206	21	80	30711264937	UOM GERLI  S.C.S.	30711264937 - UOM GERLI  S.C.S.		6782.79
478	208	2	80	30682408622	CNP ASSURANCES CIA DE SEGUROS SA	30682408622 - CNP ASSURANCES CIA DE SEGUROS SA		26500.00
479	208	7	80	27260382875	PELAYO LAURA NAIR	27260382875 - PELAYO LAURA NAIR		920.00
480	208	21	80	20125487484	ARIAS JOSE MARIA	20125487484 - ARIAS JOSE MARIA		5940.00
481	208	21	80	30500781293	GRIMOLDI SOCIEDAD ANONIMA	30500781293 - GRIMOLDI SOCIEDAD ANONIMA		11800.00
482	208	21	80	30679202045	LEADER ELECTRONIC S A	30679202045 - LEADER ELECTRONIC S A		1699.90
483	208	21	80	30707917128	THIRD TIME S.A.	30707917128 - THIRD TIME S.A.		6580.00
484	208	21	80	30708225548	TRAZ SOCIEDAD ANONIMA	30708225548 - TRAZ SOCIEDAD ANONIMA		48090.00
485	208	21	80	30708402911	GAX S.A.	30708402911 - GAX S.A.		10900.00
486	208	21	80	30714324167	DESARTEX S.A.	30714324167 - DESARTEX S.A.		9400.00
487	208	99	80	33709714339	COLEGIO DE DIETISTAS NUTRICIONISTA - DIETISTA Y LICENCIADOS EN NUTRICION DE LA PCIA. DE BS.AS.	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 33709714339 - COLEGIO DE DIETISTAS NUTRICIONISTA - DIETISTA Y LICENCIADOS EN NUTRICION DE LA PCIA. DE BS.AS.	6600.00
488	209	2	80	30682408622	CNP ASSURANCES CIA DE SEGUROS SA	30682408622 - CNP ASSURANCES CIA DE SEGUROS SA		7500.00
489	209	21	80	30638485733	DABRA SOCIEDAD ANONIMA	30638485733 - DABRA SOCIEDAD ANONIMA		17197.00
490	209	21	80	30640897267	TELECENTRO S A	30640897267 - TELECENTRO S A		4764.00
491	210	1	80	30590354798	ASOCIACION MUTUAL SANCOR SALUD	30590354798 - ASOCIACION MUTUAL SANCOR SALUD		36044.69
492	210	1	80	30628249527	INSTITUTO DE OBRA MEDICO ASISTENCIAL	30628249527 - INSTITUTO DE OBRA MEDICO ASISTENCIAL		8619.48
493	210	1	80	30697752222	SOY MAGA SOL WILDE S C S	30697752222 - SOY MAGA SOL WILDE S C S		6963.53
494	210	1	80	30707972552	BRISTOL MEDICINE SRL	30707972552 - BRISTOL MEDICINE SRL		3203.85
495	210	1	80	33709139369	SOY MAGA EL ALTO A  SCS	33709139369 - SOY MAGA EL ALTO A  SCS		1127.97
496	210	7	80	20179212294	MARQUEZ GRAND DANIEL	20179212294 - MARQUEZ GRAND DANIEL		800.00
497	210	21	80	20260234693	VESPASIANO LEONARDO	20260234693 - VESPASIANO LEONARDO		9630.00
498	210	21	80	30500781293	GRIMOLDI SOCIEDAD ANONIMA	30500781293 - GRIMOLDI SOCIEDAD ANONIMA		22488.00
499	210	21	80	30714792810	OCEAN CUL S.R.L.	30714792810 - OCEAN CUL S.R.L.		1500.00
500	210	21	80	30717060225	LOS BULFE S.R.L.	30717060225 - LOS BULFE S.R.L.		2750.00
501	210	21	80	33542082459	TOPYED SA	33542082459 - TOPYED SA		2990.00
502	211	1	80	30628249527	INSTITUTO DE OBRA MEDICO ASISTENCIAL	30628249527 - INSTITUTO DE OBRA MEDICO ASISTENCIAL		2512.98
503	211	1	80	30697752222	SOY MAGA SOL WILDE S C S	30697752222 - SOY MAGA SOL WILDE S C S		1467.99
504	211	1	80	30707651977	CENTRO DE OJOS QUILMES S A	30707651977 - CENTRO DE OJOS QUILMES S A		1500.00
505	211	1	80	33710854969	LABORATORIO WILDE S.R.L.	33710854969 - LABORATORIO WILDE S.R.L.		200.00
506	211	21	80	30500781293	GRIMOLDI SOCIEDAD ANONIMA	30500781293 - GRIMOLDI SOCIEDAD ANONIMA		3920.00
507	211	21	80	30708157054	MDQ LE SPORT S.A.	30708157054 - MDQ LE SPORT S.A.		10798.00
508	211	21	80	30708365366	DEPORTES PIZZUTI S.R.L.	30708365366 - DEPORTES PIZZUTI S.R.L.		3900.00
509	212	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		7854.32
510	213	21	80	30710403526	FELER GROUP S.A.	30710403526 - FELER GROUP S.A.		24999.00
511	213	99	80	30541314241	COLEGIO DE MEDICOS DE LA PCIA  DE BS  AS	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30541314241 - COLEGIO DE MEDICOS DE LA PCIA  DE BS  AS	13595.00
512	213	99	80	30541314241	COLEGIO DE MEDICOS DE LA PCIA  DE BS  AS	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30541314241 - COLEGIO DE MEDICOS DE LA PCIA  DE BS  AS	13595.00
513	213	99	80	30541314241	COLEGIO DE MEDICOS DE LA PCIA  DE BS  AS	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30541314241 - COLEGIO DE MEDICOS DE LA PCIA  DE BS  AS	13595.00
514	213	99	80	30541314241	COLEGIO DE MEDICOS DE LA PCIA  DE BS  AS	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30541314241 - COLEGIO DE MEDICOS DE LA PCIA  DE BS  AS	13595.00
515	214	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		23727.52
516	216	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		21468.00
517	217	1	80	30590354798	ASOCIACION MUTUAL SANCOR SALUD	30590354798 - ASOCIACION MUTUAL SANCOR SALUD		3090.64
518	217	99	80	30532708059	CAJA DE PREVISION SOCIAL PARA ABOGADOS  DE LA PROVINCIA  DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30532708059 - CAJA DE PREVISION SOCIAL PARA ABOGADOS  DE LA PROVINCIA  DE BUENOS AIRES	6465.55
519	217	99	80	30532708059	CAJA DE PREVISION SOCIAL PARA ABOGADOS  DE LA PROVINCIA  DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30532708059 - CAJA DE PREVISION SOCIAL PARA ABOGADOS  DE LA PROVINCIA  DE BUENOS AIRES	3060.00
520	217	99	80	30532708059	CAJA DE PREVISION SOCIAL PARA ABOGADOS  DE LA PROVINCIA  DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30532708059 - CAJA DE PREVISION SOCIAL PARA ABOGADOS  DE LA PROVINCIA  DE BUENOS AIRES	6982.90
521	219	1	80	30546771314	MEDICUS SOCIEDAD ANONIMA DE ASISTENCIA MEDICA Y CIENTIFICA	30546771314 - MEDICUS SOCIEDAD ANONIMA DE ASISTENCIA MEDICA Y CIENTIFICA		99949.49
522	220	1	80	30546771314	MEDICUS SOCIEDAD ANONIMA DE ASISTENCIA MEDICA Y CIENTIFICA	30546771314 - MEDICUS SOCIEDAD ANONIMA DE ASISTENCIA MEDICA Y CIENTIFICA		13114.48
523	225	1	80	30546741253	OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS	30546741253 - OSDE ORGANIZACION DE SERVICIOS DIRECTOS EMPRESARIOS		37557.16
524	225	3	80	30717237184	FRENTE DE TODOS A. P. - ALIANZA	30717237184 - FRENTE DE TODOS A. P. - ALIANZA		50000.00
525	225	7	80	27264164066	SCE MARIELA ALEJANDRA	27264164066 - SCE MARIELA ALEJANDRA		6080.00
526	225	8	80	27262279605	APESTEGUIA ELIZABETH EULALIA	27262279605 - APESTEGUIA ELIZABETH EULALIA		64932.23
527	227	22	80	27061517826	SANTAMARIA ALICIA CRISTINA	27061517826 - SANTAMARIA ALICIA CRISTINA		104190.40
528	228	22	80	27061517826	SANTAMARIA ALICIA CRISTINA	27061517826 - SANTAMARIA ALICIA CRISTINA		41496.00
529	230	7	80	20214310180	VELA FERREIRA ATILIO	20214310180 - VELA FERREIRA ATILIO		12000.00
530	230	7	80	27323950712	SALZANO ROXANA LAURA	27323950712 - SALZANO ROXANA LAURA		14800.00
531	234	2	80	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		891.64
532	234	3	80	30717237184	FRENTE DE TODOS A. P. - ALIANZA	30717237184 - FRENTE DE TODOS A. P. - ALIANZA		8000.00
533	234	4	80	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		27397.62
534	234	7	80	30588092468	ENRIQUE MARTIN ROSSI S A	30588092468 - ENRIQUE MARTIN ROSSI S A		3120.00
535	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	237.31
536	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	237.31
537	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	237.31
538	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	237.31
539	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	237.31
540	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	2726.39
541	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	1036.27
542	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	3193.12
543	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	265.43
544	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	3914.82
545	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	265.43
546	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	265.43
547	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	1073.28
548	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	265.23
549	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	2496.92
550	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Mayo - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4184.16
551	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Junio - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4686.24
552	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	1490.67
553	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	1620.21
554	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	298.13
555	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	298.13
556	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	298.13
557	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	199.03
558	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Agosto - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	4638.75
559	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Septiembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	343.78
560	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	327.95
561	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	327.95
562	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	1637.47
563	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	1637.47
564	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	327.95
565	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	2137.31
566	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	326.70
567	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	326.70
568	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	326.70
569	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	326.70
570	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	326.70
571	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	326.70
572	234	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	326.70
573	235	2	80	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		146.22
574	235	4	80	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		4580.44
575	235	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	358.16
576	235	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	358.16
577	235	99	80	30599421846	CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30599421846 - CAJA DE SEGURIDAD SOCIAL PARA LOS PROFESIONALES EN CIENCIAS EC	358.16
578	236	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Enero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	3253.50
579	236	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Febrero - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	3253.50
580	236	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	3253.50
581	236	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Marzo - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	471.50
582	236	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	3253.50
583	236	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Abril - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	471.50
584	236	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Mayo - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	3750.00
585	236	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Mayo - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	471.50
586	236	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Junio - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	3750.00
587	236	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Julio - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	3750.00
588	236	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Agosto - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	4125.00
589	236	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Septiembre - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	4125.00
590	236	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Octubre - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	4125.00
591	236	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Noviembre - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	4984.38
592	236	99	80	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	Cajas Provinciales o Municipales o de Previsión para Profesionales	Diciembre - 30542265317 - CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	6343.75
\.


--
-- Data for Name: f572_deduccionesdetalle; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_deduccionesdetalle (id, deduccion_id, nombre, valor) FROM stdin;
1	12	motivo	2
2	12	mes	1
3	13	motivo	2
4	13	mes	2
5	14	motivo	2
6	14	mes	3
7	15	motivo	2
8	15	mes	1
9	16	motivo	2
10	16	mes	12
11	17	motivo	2
12	17	mes	1
13	54	motivo	1
14	54	mes	1
15	55	motivo	1
16	55	mes	2
17	56	motivo	1
18	56	mes	2
19	57	motivo	2
20	57	mes	1
21	58	motivo	2
22	58	mes	2
23	59	motivo	2
24	59	mes	3
25	63	motivo	2
26	63	mes	1
27	64	motivo	2
28	64	mes	2
29	65	motivo	2
30	65	mes	2
31	66	motivo	2
32	66	mes	4
33	67	motivo	2
34	67	mes	5
35	68	motivo	2
36	68	mes	6
37	69	motivo	2
38	69	mes	7
39	70	motivo	2
40	70	mes	8
41	71	motivo	2
42	71	mes	9
43	72	motivo	2
44	72	mes	10
45	73	motivo	2
46	73	mes	11
47	74	motivo	2
48	74	mes	12
49	75	motivo	1
50	75	mes	1
51	76	motivo	1
52	76	mes	1
53	77	motivo	1
54	77	mes	2
55	78	motivo	1
56	78	mes	3
57	79	motivo	1
58	79	mes	4
59	80	motivo	1
60	80	mes	5
61	81	motivo	1
62	81	mes	6
63	82	motivo	1
64	82	mes	7
65	83	motivo	1
66	83	mes	8
67	84	motivo	1
68	84	mes	9
69	85	motivo	1
70	85	mes	10
71	86	motivo	1
72	86	mes	11
73	89	motivo	2
74	89	mes	1
75	90	motivo	2
76	90	mes	2
77	91	motivo	2
78	91	mes	3
79	92	motivo	1
80	92	mes	1
81	93	motivo	1
82	93	mes	2
83	128	motivo	2
84	128	mes	1
85	129	motivo	2
86	129	mes	6
87	130	motivo	2
88	130	mes	11
89	131	motivo	2
90	131	mes	12
91	132	motivo	2
92	132	mes	2
93	133	motivo	2
94	133	mes	3
95	134	motivo	2
96	134	mes	4
97	135	motivo	2
98	135	mes	5
99	136	motivo	2
100	136	mes	7
101	137	motivo	2
102	137	mes	8
103	138	motivo	2
104	138	mes	9
105	139	motivo	2
106	139	mes	10
107	140	motivo	2
108	140	mes	1
109	141	motivo	2
110	141	mes	2
111	191	motivo	2
112	191	mes	4
113	215	motivo	2
114	215	mes	1
115	216	motivo	2
116	216	mes	2
117	217	motivo	2
118	217	mes	3
119	218	motivo	2
120	218	mes	4
121	222	motivo	2
122	222	mes	1
123	223	motivo	2
124	223	mes	2
125	224	motivo	2
126	224	mes	3
127	239	motivo	2
128	239	mes	1
129	240	motivo	2
130	240	mes	1
131	241	motivo	2
132	241	mes	1
133	242	motivo	2
134	242	mes	1
135	243	motivo	2
136	243	mes	1
137	244	motivo	2
138	244	mes	1
139	245	motivo	2
140	245	mes	2
141	246	motivo	2
142	246	mes	2
143	247	motivo	2
144	247	mes	3
145	248	motivo	2
146	248	mes	3
147	249	motivo	2
148	249	mes	4
149	250	motivo	2
150	250	mes	4
151	251	motivo	2
152	251	mes	4
153	252	motivo	2
154	252	mes	4
155	253	motivo	2
156	253	mes	4
157	254	motivo	2
158	254	mes	5
159	255	motivo	2
160	255	mes	6
161	256	motivo	2
162	256	mes	7
163	257	motivo	2
164	257	mes	7
165	258	motivo	2
166	258	mes	7
167	259	motivo	2
168	259	mes	7
169	260	motivo	2
170	260	mes	7
171	261	motivo	2
172	261	mes	7
173	262	motivo	2
174	262	mes	8
175	263	motivo	2
176	263	mes	9
177	264	motivo	2
178	264	mes	10
179	265	motivo	2
180	265	mes	10
181	266	motivo	2
182	266	mes	10
183	267	motivo	2
184	267	mes	10
185	268	motivo	2
186	268	mes	10
187	269	motivo	2
188	269	mes	10
189	270	motivo	2
190	270	mes	11
191	271	motivo	2
192	271	mes	11
193	272	motivo	2
194	272	mes	11
195	273	motivo	2
196	273	mes	11
197	274	motivo	2
198	274	mes	11
199	275	motivo	2
200	275	mes	11
201	276	motivo	2
202	276	mes	11
203	279	motivo	2
204	279	mes	1
205	280	motivo	2
206	280	mes	1
207	281	motivo	2
208	281	mes	1
209	282	motivo	2
210	282	mes	1
211	283	motivo	2
212	283	mes	2
213	284	motivo	2
214	284	mes	3
215	285	motivo	2
216	285	mes	3
217	286	motivo	2
218	286	mes	4
219	287	motivo	2
220	287	mes	4
221	288	motivo	2
222	288	mes	5
223	289	motivo	2
224	289	mes	5
225	290	motivo	2
226	290	mes	6
227	291	motivo	2
228	291	mes	7
229	292	motivo	2
230	292	mes	8
231	293	motivo	2
232	293	mes	9
233	294	motivo	2
234	294	mes	10
235	295	motivo	2
236	295	mes	11
237	296	motivo	2
238	296	mes	12
239	308	motivo	2
240	308	mes	1
241	309	motivo	2
242	309	mes	2
243	310	motivo	2
244	310	mes	3
245	311	motivo	2
246	311	mes	1
247	312	motivo	2
248	312	mes	12
249	313	motivo	2
250	313	mes	1
251	350	motivo	1
252	350	mes	1
253	351	motivo	1
254	351	mes	2
255	352	motivo	1
256	352	mes	2
257	353	motivo	2
258	353	mes	1
259	354	motivo	2
260	354	mes	2
261	355	motivo	2
262	355	mes	3
263	359	motivo	2
264	359	mes	1
265	360	motivo	2
266	360	mes	2
267	361	motivo	2
268	361	mes	2
269	362	motivo	2
270	362	mes	4
271	363	motivo	2
272	363	mes	5
273	364	motivo	2
274	364	mes	6
275	365	motivo	2
276	365	mes	7
277	366	motivo	2
278	366	mes	8
279	367	motivo	2
280	367	mes	9
281	368	motivo	2
282	368	mes	10
283	369	motivo	2
284	369	mes	11
285	370	motivo	2
286	370	mes	12
287	371	motivo	1
288	371	mes	1
289	372	motivo	1
290	372	mes	1
291	373	motivo	1
292	373	mes	2
293	374	motivo	1
294	374	mes	3
295	375	motivo	1
296	375	mes	4
297	376	motivo	1
298	376	mes	5
299	377	motivo	1
300	377	mes	6
301	378	motivo	1
302	378	mes	7
303	379	motivo	1
304	379	mes	8
305	380	motivo	1
306	380	mes	9
307	381	motivo	1
308	381	mes	10
309	382	motivo	1
310	382	mes	11
311	385	motivo	2
312	385	mes	1
313	386	motivo	2
314	386	mes	2
315	387	motivo	2
316	387	mes	3
317	388	motivo	1
318	388	mes	1
319	389	motivo	1
320	389	mes	2
321	424	motivo	2
322	424	mes	1
323	425	motivo	2
324	425	mes	6
325	426	motivo	2
326	426	mes	11
327	427	motivo	2
328	427	mes	12
329	428	motivo	2
330	428	mes	2
331	429	motivo	2
332	429	mes	3
333	430	motivo	2
334	430	mes	4
335	431	motivo	2
336	431	mes	5
337	432	motivo	2
338	432	mes	7
339	433	motivo	2
340	433	mes	8
341	434	motivo	2
342	434	mes	9
343	435	motivo	2
344	435	mes	10
345	436	motivo	2
346	436	mes	1
347	437	motivo	2
348	437	mes	2
349	487	motivo	2
350	487	mes	4
351	511	motivo	2
352	511	mes	1
353	512	motivo	2
354	512	mes	2
355	513	motivo	2
356	513	mes	3
357	514	motivo	2
358	514	mes	4
359	518	motivo	2
360	518	mes	1
361	519	motivo	2
362	519	mes	2
363	520	motivo	2
364	520	mes	3
365	535	motivo	2
366	535	mes	1
367	536	motivo	2
368	536	mes	1
369	537	motivo	2
370	537	mes	1
371	538	motivo	2
372	538	mes	1
373	539	motivo	2
374	539	mes	1
375	540	motivo	2
376	540	mes	1
377	541	motivo	2
378	541	mes	2
379	542	motivo	2
380	542	mes	2
381	543	motivo	2
382	543	mes	3
383	544	motivo	2
384	544	mes	3
385	545	motivo	2
386	545	mes	4
387	546	motivo	2
388	546	mes	4
389	547	motivo	2
390	547	mes	4
391	548	motivo	2
392	548	mes	4
393	549	motivo	2
394	549	mes	4
395	550	motivo	2
396	550	mes	5
397	551	motivo	2
398	551	mes	6
399	552	motivo	2
400	552	mes	7
401	553	motivo	2
402	553	mes	7
403	554	motivo	2
404	554	mes	7
405	555	motivo	2
406	555	mes	7
407	556	motivo	2
408	556	mes	7
409	557	motivo	2
410	557	mes	7
411	558	motivo	2
412	558	mes	8
413	559	motivo	2
414	559	mes	9
415	560	motivo	2
416	560	mes	10
417	561	motivo	2
418	561	mes	10
419	562	motivo	2
420	562	mes	10
421	563	motivo	2
422	563	mes	10
423	564	motivo	2
424	564	mes	10
425	565	motivo	2
426	565	mes	10
427	566	motivo	2
428	566	mes	11
429	567	motivo	2
430	567	mes	11
431	568	motivo	2
432	568	mes	11
433	569	motivo	2
434	569	mes	11
435	570	motivo	2
436	570	mes	11
437	571	motivo	2
438	571	mes	11
439	572	motivo	2
440	572	mes	11
441	575	motivo	2
442	575	mes	1
443	576	motivo	2
444	576	mes	1
445	577	motivo	2
446	577	mes	1
447	578	motivo	2
448	578	mes	1
449	579	motivo	2
450	579	mes	2
451	580	motivo	2
452	580	mes	3
453	581	motivo	2
454	581	mes	3
455	582	motivo	2
456	582	mes	4
457	583	motivo	2
458	583	mes	4
459	584	motivo	2
460	584	mes	5
461	585	motivo	2
462	585	mes	5
463	586	motivo	2
464	586	mes	6
465	587	motivo	2
466	587	mes	7
467	588	motivo	2
468	588	mes	8
469	589	motivo	2
470	589	mes	9
471	590	motivo	2
472	590	mes	10
473	591	motivo	2
474	591	mes	11
475	592	motivo	2
476	592	mes	12
\.


--
-- Data for Name: f572_deduccionesperiodo; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_deduccionesperiodo (id, deduccion_id, mesdesde, meshasta, montomensual) FROM stdin;
1	1	1	2	60350.01
2	1	3	3	63970.00
3	2	1	1	34584.64
4	2	2	3	34548.64
5	2	4	4	40891.78
6	3	10	10	60000.00
7	4	12	12	7416.30
8	5	9	9	15000.00
9	5	10	10	50000.00
10	6	1	1	12363.25
11	6	2	2	12363.35
12	6	3	4	12363.00
13	6	5	5	12464.22
14	6	6	6	18499.34
15	6	7	7	12000.00
16	7	10	10	28500.00
17	7	11	11	33000.00
18	7	12	12	49500.00
19	8	1	1	5775.00
20	9	3	3	15891.95
21	9	4	4	40000.00
22	10	1	1	23991.36
23	10	2	2	11512.00
24	11	1	1	10792.51
25	11	2	2	10698.22
26	11	3	3	9626.13
27	18	1	1	10295.57
28	18	2	2	10046.93
29	18	3	3	10007.41
30	18	4	4	10282.61
31	18	5	5	6262.13
32	18	6	6	11657.11
33	18	7	7	10960.59
34	18	8	8	10917.59
35	18	9	9	11904.10
36	18	10	10	13522.44
37	18	11	11	10066.22
38	18	12	12	18862.66
39	19	1	1	14097.55
40	19	2	2	14099.96
41	19	3	4	14170.81
42	19	5	5	14253.84
43	19	6	6	20989.24
44	19	7	7	14303.34
45	19	8	8	14364.18
46	19	9	9	14634.18
47	19	10	10	14666.47
48	19	11	11	14694.57
49	19	12	12	21565.55
50	20	1	1	18862.66
51	20	2	3	20656.32
52	20	4	4	21774.35
53	21	1	1	14951.95
54	21	2	2	15006.62
55	21	3	3	15004.33
56	22	1	1	1776.74
57	22	4	4	1609.97
58	22	5	5	2124.25
59	22	6	7	1622.54
60	22	9	9	2652.42
61	22	10	10	3707.26
62	22	11	11	2981.81
63	23	3	3	9600.00
64	23	12	12	15200.00
65	24	11	11	3680.00
66	25	1	1	4767.08
67	25	2	2	5836.16
68	25	3	3	3336.00
69	25	4	4	3672.60
70	26	3	3	680.00
71	27	1	1	1440.00
72	27	8	8	1120.00
73	28	1	2	2400.00
74	29	1	1	27470.91
75	29	2	2	28743.91
76	30	1	1	0.01
77	31	1	1	36393.36
78	31	2	2	36923.41
79	32	1	1	2412.82
80	32	11	11	317.31
81	32	12	12	5436.04
82	33	1	1	5436.04
83	33	2	2	4504.36
84	34	1	1	0.01
85	35	2	3	197.00
86	35	4	4	650.00
87	35	5	5	1252.00
88	35	6	6	2021.00
89	36	1	1	18243.50
90	36	2	2	21445.10
91	36	3	3	23296.76
92	36	4	4	23300.09
93	36	5	5	23328.19
94	36	6	6	37660.56
95	36	7	8	26334.01
96	36	9	10	29123.05
97	36	11	11	30549.55
98	36	12	12	47054.05
99	37	1	3	1500.00
100	38	1	1	32241.04
101	38	2	2	32265.92
102	38	3	3	34997.92
103	39	10	10	30000.00
104	39	11	11	25000.00
105	40	11	11	3240.00
106	40	12	12	2160.00
107	41	1	1	3240.00
108	41	3	3	2320.00
109	42	4	4	4000.00
110	43	1	1	24069.00
111	43	2	2	15360.00
112	43	3	4	16680.00
113	44	1	1	2050.03
114	44	2	2	1656.00
115	44	3	3	5957.00
116	44	4	4	6009.00
117	44	5	5	2311.00
118	44	6	6	1940.00
119	44	7	7	4283.00
120	45	1	1	8543.10
121	45	2	2	8469.05
122	45	3	3	8625.90
123	45	4	4	5145.67
124	45	5	5	12765.63
125	45	6	7	11668.51
126	45	8	8	11239.57
127	45	9	9	16414.33
128	45	10	10	12982.96
129	45	11	11	16121.86
130	45	12	12	15976.90
131	46	1	1	6067.62
132	46	2	2	5587.24
133	46	3	3	5940.57
134	46	4	4	6093.03
135	46	5	5	7193.08
136	46	7	7	6040.06
137	46	8	8	7676.16
138	46	9	9	8485.88
139	46	10	10	11141.03
140	47	1	3	7500.00
141	47	4	4	8200.00
142	47	5	5	8270.00
143	47	6	6	8630.00
144	47	7	8	8710.00
145	48	9	12	6657.11
146	49	1	2	8000.00
147	49	3	5	10000.00
148	49	6	6	15000.00
149	49	7	8	10000.00
150	49	9	11	12000.00
151	49	12	12	18000.00
152	50	9	9	15000.00
153	51	1	2	20266.39
154	51	3	3	21741.20
155	51	4	5	23558.90
156	51	6	6	39412.36
157	51	7	7	26636.34
158	51	8	8	26642.01
159	51	9	10	30876.39
160	51	11	11	32310.69
161	51	12	12	50568.51
162	52	1	2	25986.61
163	52	3	3	27802.62
164	52	4	5	30045.62
165	52	6	6	50050.73
166	52	7	7	34198.21
167	52	8	8	34203.88
168	52	9	10	38013.61
169	52	11	11	40101.55
170	52	12	12	62061.61
171	53	1	3	1380.00
172	60	1	2	12289.59
173	60	3	3	12719.46
174	60	4	4	13706.79
175	60	5	7	14021.72
176	60	8	8	15283.26
177	60	9	9	16657.92
178	60	10	12	18156.56
179	61	1	1	1329.97
180	61	2	2	8889.61
181	61	3	3	9881.26
182	61	4	4	5888.34
183	61	5	5	10319.43
184	61	6	6	9094.37
185	61	7	7	12527.26
186	61	8	8	4728.46
187	61	9	9	11296.47
188	61	10	10	12755.84
189	61	11	12	15938.43
190	62	1	2	14400.00
191	62	3	3	20772.00
192	62	4	4	18549.00
193	62	5	5	17680.00
194	62	6	6	30580.00
195	62	7	7	19800.00
196	62	8	8	21760.00
197	62	9	9	23270.00
198	62	10	10	23420.00
199	62	11	11	24300.00
200	62	12	12	34405.00
201	87	2	2	12566.45
202	87	3	3	15516.35
203	88	1	1	20480.00
204	88	2	2	31107.00
205	88	3	3	26688.00
206	94	1	1	1200.00
207	94	2	2	1600.00
208	94	3	3	1600.00
209	95	1	1	1662.72
210	95	2	2	1142.76
211	95	5	5	296.28
212	95	6	6	1233.94
213	95	7	8	596.66
214	95	9	9	1023.00
215	95	11	11	1075.44
216	95	12	12	886.34
217	96	1	1	2194.26
218	96	2	2	1192.42
219	97	1	1	12749.41
220	97	2	2	11993.94
221	97	3	3	12890.31
222	97	4	4	12766.45
223	97	5	5	14308.87
224	97	6	6	7158.76
225	97	7	7	11002.38
226	97	8	8	14460.92
227	97	9	9	15264.82
228	97	11	11	17582.98
229	97	12	12	8157.04
230	98	6	6	2000.00
231	98	8	8	1000.00
232	98	9	9	1000.00
233	98	10	10	1000.00
234	98	11	11	1000.00
235	99	1	2	19860.37
236	100	1	1	2000.00
237	100	3	3	1120.00
238	100	4	4	112.00
239	101	1	1	6097.95
240	101	2	2	5376.87
241	101	4	4	12711.38
242	101	5	5	846.53
243	101	6	6	6528.67
244	101	7	7	5602.84
245	101	8	8	5278.14
246	101	9	9	4593.30
247	101	10	10	8271.37
248	101	11	11	8311.39
249	101	12	12	7076.26
250	102	1	1	11077.65
251	102	2	2	9482.55
252	102	3	3	543.84
253	102	4	4	13628.66
254	103	9	9	15000.00
255	104	1	1	6721.35
256	104	2	2	7203.35
257	104	3	3	7263.86
258	104	4	4	7823.86
259	104	5	5	7864.22
260	104	6	6	13069.34
261	104	7	7	8879.34
262	104	8	8	9168.82
263	104	9	10	10816.82
264	104	11	11	10856.25
265	104	12	12	16591.46
266	105	1	1	11164.26
267	105	2	2	10943.88
268	105	3	3	11819.50
269	106	1	1	3224.04
270	106	2	2	3246.11
271	106	3	3	3170.89
272	106	5	5	4325.72
273	106	6	6	3335.71
274	106	7	7	3280.28
275	106	8	8	2787.70
276	106	9	9	6465.83
277	106	10	10	1956.48
278	106	11	11	6474.47
279	106	12	12	6257.93
280	107	1	1	6257.93
281	107	2	2	7134.64
282	107	3	3	6705.18
283	107	4	4	4678.49
284	108	2	2	5935.41
285	108	3	3	9599.81
286	108	4	4	9098.36
287	108	5	5	9533.98
288	108	6	6	9723.51
289	108	7	7	11311.55
290	108	8	8	6685.96
291	108	9	9	9969.52
292	108	10	10	11730.92
293	108	11	11	13003.02
294	108	12	12	15713.86
295	109	1	1	14446.12
296	109	2	2	18081.12
297	110	1	2	25180.74
298	111	1	2	833.55
299	112	1	2	800.00
300	113	1	1	759.00
301	113	2	4	1077.00
302	113	6	6	1845.00
303	113	10	11	1592.00
304	114	1	2	1831.00
305	115	1	1	20000.00
306	115	2	2	24000.00
307	116	1	6	3500.00
308	116	7	7	5000.00
309	116	8	10	3500.00
310	116	11	12	4000.00
311	117	6	6	6360.00
312	118	5	5	1000.00
313	119	10	10	2340.00
314	119	11	11	868.00
315	120	5	5	5022.58
316	120	6	6	6880.84
317	120	7	7	6373.66
318	120	8	8	2777.72
319	120	9	9	8161.38
320	120	10	10	8995.47
321	120	11	11	8662.74
322	120	12	12	8279.97
323	121	1	1	2122.90
324	121	2	2	2606.61
325	121	4	4	854.73
326	122	1	1	4116.00
327	122	2	2	3798.00
328	122	4	4	8008.00
329	122	5	5	4685.00
330	122	6	6	4296.00
331	122	7	7	3305.00
332	122	8	8	5802.00
333	122	9	9	1044.00
334	122	10	10	6973.00
335	122	11	11	7744.00
336	122	12	12	7019.00
337	123	1	1	7019.00
338	123	2	2	7837.00
339	123	3	3	9360.00
340	124	1	1	1.00
341	125	9	9	10000.00
342	125	10	10	30000.00
343	126	1	1	0.01
344	127	7	7	640.00
345	127	8	8	290.00
346	127	9	9	80.00
347	127	10	10	440.00
348	127	12	12	140.00
349	142	5	12	8000.00
350	143	1	4	4000.00
351	144	1	3	8000.00
352	145	2	2	14000.00
353	145	4	4	4000.00
354	145	8	8	4800.00
355	145	9	9	6000.00
356	146	12	12	34000.00
357	147	3	3	8000.00
358	148	1	4	7736.00
359	148	5	6	8665.00
360	148	7	8	9964.00
361	148	9	11	11458.00
362	148	12	12	12375.00
363	149	9	12	6260.00
364	150	1	9	2025.00
365	150	10	12	2050.00
366	151	12	12	75000.00
367	152	1	12	1200.00
368	153	1	12	2475.00
369	154	2	2	2000.00
370	154	3	3	4240.00
371	154	4	4	1520.00
372	154	6	6	600.00
373	154	9	9	800.00
374	155	7	7	9600.00
375	155	9	9	10000.00
376	156	7	7	2400.00
377	157	1	1	8200.00
378	157	3	3	8600.00
379	157	5	5	9000.00
380	158	2	2	9400.00
381	158	4	4	9800.00
382	158	6	6	10200.00
383	158	8	8	10600.00
384	159	8	8	1120.00
385	159	9	9	1120.00
386	159	10	10	1120.00
387	160	10	10	9200.00
388	160	12	12	9400.00
389	161	11	11	4200.00
390	162	1	12	2050.00
391	163	1	4	12375.00
392	164	1	4	6260.00
393	165	1	4	2050.00
394	166	1	4	5200.00
395	167	1	4	2455.00
396	168	1	4	2050.00
397	169	5	5	778.12
398	169	9	9	1322.32
399	169	11	11	976.81
400	169	12	12	650.99
401	170	1	7	135.00
402	170	8	8	155.00
403	170	10	10	306.88
404	170	11	11	154.00
405	170	12	12	155.00
406	171	3	3	2600.00
407	171	8	8	3000.00
408	172	2	2	1200.00
409	172	4	4	1200.00
410	172	7	7	1600.00
411	172	9	9	1600.00
412	172	10	10	3800.00
413	172	12	12	1800.00
414	173	3	3	800.00
415	173	6	6	1000.00
416	173	9	9	1120.00
417	174	9	9	856.52
418	175	1	1	30642.00
419	175	11	11	3561.40
420	176	1	1	1687.56
421	176	2	2	1485.65
422	176	3	3	988.80
423	177	1	1	1200.00
424	178	1	3	10490.87
425	179	3	3	6018.71
426	180	3	3	6103.89
427	181	2	2	3808.75
428	181	3	3	2974.04
429	182	1	7	2000.00
430	182	8	12	2500.00
431	183	10	10	920.00
432	184	3	3	5940.00
433	185	7	7	11800.00
434	186	10	10	1699.90
435	187	1	1	6580.00
436	188	4	4	4899.00
437	188	6	6	28594.00
438	188	9	9	14597.00
439	189	9	9	10900.00
440	190	10	10	9400.00
441	192	1	3	2500.00
442	193	3	3	17197.00
443	194	1	1	4764.00
444	195	5	5	4562.00
445	195	6	6	5877.00
446	195	8	8	5798.43
447	195	9	9	9583.02
448	195	10	10	10224.24
449	196	9	10	2045.30
450	196	11	12	2264.44
451	197	1	1	912.22
452	197	3	3	986.57
453	197	4	4	1072.21
454	197	8	8	1236.47
455	197	9	9	1345.07
456	197	10	10	1410.99
457	198	1	1	903.32
458	198	2	2	1375.48
459	198	3	3	0.01
460	198	4	4	925.04
461	199	6	6	1127.97
462	200	8	8	800.00
463	201	12	12	9630.00
464	202	2	2	22488.00
465	203	12	12	1500.00
466	204	12	12	2750.00
467	205	12	12	2990.00
468	206	1	1	2512.98
469	207	1	1	1467.99
470	208	3	3	1500.00
471	209	1	1	200.00
472	210	2	2	3920.00
473	211	2	2	10798.00
474	212	1	1	3900.00
475	213	1	1	7854.32
476	214	1	1	24999.00
477	219	1	1	4236.74
478	219	2	2	895.05
479	219	3	3	4757.55
480	219	4	4	4405.29
481	219	5	5	4601.72
482	219	6	6	4831.17
483	220	1	1	21468.00
484	221	1	1	1702.25
485	221	2	2	1158.49
486	221	3	3	229.90
487	225	1	1	8304.97
488	225	2	2	8001.51
489	225	3	3	7269.28
490	225	4	4	337.83
491	225	5	5	10286.58
492	225	6	6	2261.84
493	225	7	7	7587.61
494	225	8	8	6992.06
495	225	9	9	13390.13
496	225	10	10	4191.20
497	225	11	11	19236.85
498	225	12	12	12089.63
499	226	1	1	13114.48
500	227	1	1	4421.00
501	227	2	4	2524.71
502	227	5	6	3120.00
503	227	8	8	2437.29
504	227	9	9	4311.58
505	227	10	10	7001.48
506	227	11	11	5571.68
507	228	9	9	20000.00
508	228	11	11	30000.00
509	229	3	3	1280.00
510	229	7	7	600.00
511	229	8	8	600.00
512	229	9	9	600.00
513	229	10	10	600.00
514	229	11	11	1200.00
515	229	12	12	1200.00
516	230	6	7	7999.34
517	230	8	8	8905.01
518	230	9	10	8937.42
519	230	11	11	8976.85
520	230	12	12	13176.85
521	231	1	1	7349.20
522	231	2	7	8349.20
523	231	8	12	9349.20
524	232	1	1	9624.00
525	232	2	4	10624.00
526	233	4	4	12000.00
527	234	3	3	14800.00
528	235	1	1	75.13
529	235	2	2	75.00
530	235	3	3	74.86
531	235	4	4	74.71
532	235	5	5	74.56
533	235	6	6	74.41
534	235	7	7	74.25
535	235	8	8	74.09
536	235	9	9	73.92
537	235	10	10	73.75
538	235	11	11	73.57
539	235	12	12	73.39
540	236	9	9	8000.00
541	237	1	1	2308.72
542	237	2	2	2304.08
543	237	3	3	2302.40
544	237	4	4	2295.65
545	237	5	5	2291.24
546	237	6	6	2286.08
547	237	7	7	2275.26
548	237	8	8	2277.14
549	237	9	9	2267.89
550	237	10	10	2265.17
551	237	11	11	2264.12
552	237	12	12	2259.87
553	238	4	4	3120.00
554	277	1	1	73.20
555	277	2	2	73.02
556	278	1	1	2251.83
557	278	2	2	2328.61
558	297	1	2	60350.01
559	297	3	3	63970.00
560	298	1	1	34584.64
561	298	2	3	34548.64
562	298	4	4	40891.78
563	299	10	10	60000.00
564	300	12	12	7416.30
565	301	9	9	15000.00
566	301	10	10	50000.00
567	302	1	1	12363.25
568	302	2	2	12363.35
569	302	3	4	12363.00
570	302	5	5	12464.22
571	302	6	6	18499.34
572	302	7	7	12000.00
573	303	10	10	28500.00
574	303	11	11	33000.00
575	303	12	12	49500.00
576	304	1	1	5775.00
577	305	3	3	15891.95
578	305	4	4	40000.00
579	306	1	1	23991.36
580	306	2	2	11512.00
581	307	1	1	10792.51
582	307	2	2	10698.22
583	307	3	3	9626.13
584	314	1	1	10295.57
585	314	2	2	10046.93
586	314	3	3	10007.41
587	314	4	4	10282.61
588	314	5	5	6262.13
589	314	6	6	11657.11
590	314	7	7	10960.59
591	314	8	8	10917.59
592	314	9	9	11904.10
593	314	10	10	13522.44
594	314	11	11	10066.22
595	314	12	12	18862.66
596	315	1	1	14097.55
597	315	2	2	14099.96
598	315	3	4	14170.81
599	315	5	5	14253.84
600	315	6	6	20989.24
601	315	7	7	14303.34
602	315	8	8	14364.18
603	315	9	9	14634.18
604	315	10	10	14666.47
605	315	11	11	14694.57
606	315	12	12	21565.55
607	316	1	1	18862.66
608	316	2	3	20656.32
609	316	4	4	21774.35
610	317	1	1	14951.95
611	317	2	2	15006.62
612	317	3	3	15004.33
613	318	1	1	1776.74
614	318	4	4	1609.97
615	318	5	5	2124.25
616	318	6	7	1622.54
617	318	9	9	2652.42
618	318	10	10	3707.26
619	318	11	11	2981.81
620	319	3	3	9600.00
621	319	12	12	15200.00
622	320	11	11	3680.00
623	321	1	1	4767.08
624	321	2	2	5836.16
625	321	3	3	3336.00
626	321	4	4	3672.60
627	322	3	3	680.00
628	323	1	1	1440.00
629	323	8	8	1120.00
630	324	1	2	2400.00
631	325	1	1	27470.91
632	325	2	2	28743.91
633	326	1	1	0.01
634	327	1	1	36393.36
635	327	2	2	36923.41
636	328	1	1	2412.82
637	328	11	11	317.31
638	328	12	12	5436.04
639	329	1	1	5436.04
640	329	2	2	4504.36
641	330	1	1	0.01
642	331	2	3	197.00
643	331	4	4	650.00
644	331	5	5	1252.00
645	331	6	6	2021.00
646	332	1	1	18243.50
647	332	2	2	21445.10
648	332	3	3	23296.76
649	332	4	4	23300.09
650	332	5	5	23328.19
651	332	6	6	37660.56
652	332	7	8	26334.01
653	332	9	10	29123.05
654	332	11	11	30549.55
655	332	12	12	47054.05
656	333	1	3	1500.00
657	334	1	1	32241.04
658	334	2	2	32265.92
659	334	3	3	34997.92
660	335	10	10	30000.00
661	335	11	11	25000.00
662	336	11	11	3240.00
663	336	12	12	2160.00
664	337	1	1	3240.00
665	337	3	3	2320.00
666	338	4	4	4000.00
667	339	1	1	24069.00
668	339	2	2	15360.00
669	339	3	4	16680.00
670	340	1	1	2050.03
671	340	2	2	1656.00
672	340	3	3	5957.00
673	340	4	4	6009.00
674	340	5	5	2311.00
675	340	6	6	1940.00
676	340	7	7	4283.00
677	341	1	1	8543.10
678	341	2	2	8469.05
679	341	3	3	8625.90
680	341	4	4	5145.67
681	341	5	5	12765.63
682	341	6	7	11668.51
683	341	8	8	11239.57
684	341	9	9	16414.33
685	341	10	10	12982.96
686	341	11	11	16121.86
687	341	12	12	15976.90
688	342	1	1	6067.62
689	342	2	2	5587.24
690	342	3	3	5940.57
691	342	4	4	6093.03
692	342	5	5	7193.08
693	342	7	7	6040.06
694	342	8	8	7676.16
695	342	9	9	8485.88
696	342	10	10	11141.03
697	343	1	3	7500.00
698	343	4	4	8200.00
699	343	5	5	8270.00
700	343	6	6	8630.00
701	343	7	8	8710.00
702	344	9	12	6657.11
703	345	1	2	8000.00
704	345	3	5	10000.00
705	345	6	6	15000.00
706	345	7	8	10000.00
707	345	9	11	12000.00
708	345	12	12	18000.00
709	346	9	9	15000.00
710	347	1	2	20266.39
711	347	3	3	21741.20
712	347	4	5	23558.90
713	347	6	6	39412.36
714	347	7	7	26636.34
715	347	8	8	26642.01
716	347	9	10	30876.39
717	347	11	11	32310.69
718	347	12	12	50568.51
719	348	1	2	25986.61
720	348	3	3	27802.62
721	348	4	5	30045.62
722	348	6	6	50050.73
723	348	7	7	34198.21
724	348	8	8	34203.88
725	348	9	10	38013.61
726	348	11	11	40101.55
727	348	12	12	62061.61
728	349	1	3	1380.00
729	356	1	2	12289.59
730	356	3	3	12719.46
731	356	4	4	13706.79
732	356	5	7	14021.72
733	356	8	8	15283.26
734	356	9	9	16657.92
735	356	10	12	18156.56
736	357	1	1	1329.97
737	357	2	2	8889.61
738	357	3	3	9881.26
739	357	4	4	5888.34
740	357	5	5	10319.43
741	357	6	6	9094.37
742	357	7	7	12527.26
743	357	8	8	4728.46
744	357	9	9	11296.47
745	357	10	10	12755.84
746	357	11	12	15938.43
747	358	1	2	14400.00
748	358	3	3	20772.00
749	358	4	4	18549.00
750	358	5	5	17680.00
751	358	6	6	30580.00
752	358	7	7	19800.00
753	358	8	8	21760.00
754	358	9	9	23270.00
755	358	10	10	23420.00
756	358	11	11	24300.00
757	358	12	12	34405.00
758	383	2	2	12566.45
759	383	3	3	15516.35
760	384	1	1	20480.00
761	384	2	2	31107.00
762	384	3	3	26688.00
763	390	1	1	1200.00
764	390	2	2	1600.00
765	390	3	3	1600.00
766	391	1	1	1662.72
767	391	2	2	1142.76
768	391	5	5	296.28
769	391	6	6	1233.94
770	391	7	8	596.66
771	391	9	9	1023.00
772	391	11	11	1075.44
773	391	12	12	886.34
774	392	1	1	2194.26
775	392	2	2	1192.42
776	393	1	1	12749.41
777	393	2	2	11993.94
778	393	3	3	12890.31
779	393	4	4	12766.45
780	393	5	5	14308.87
781	393	6	6	7158.76
782	393	7	7	11002.38
783	393	8	8	14460.92
784	393	9	9	15264.82
785	393	11	11	17582.98
786	393	12	12	8157.04
787	394	6	6	2000.00
788	394	8	8	1000.00
789	394	9	9	1000.00
790	394	10	10	1000.00
791	394	11	11	1000.00
792	395	1	2	19860.37
793	396	1	1	2000.00
794	396	3	3	1120.00
795	396	4	4	112.00
796	397	1	1	6097.95
797	397	2	2	5376.87
798	397	4	4	12711.38
799	397	5	5	846.53
800	397	6	6	6528.67
801	397	7	7	5602.84
802	397	8	8	5278.14
803	397	9	9	4593.30
804	397	10	10	8271.37
805	397	11	11	8311.39
806	397	12	12	7076.26
807	398	1	1	11077.65
808	398	2	2	9482.55
809	398	3	3	543.84
810	398	4	4	13628.66
811	399	9	9	15000.00
812	400	1	1	6721.35
813	400	2	2	7203.35
814	400	3	3	7263.86
815	400	4	4	7823.86
816	400	5	5	7864.22
817	400	6	6	13069.34
818	400	7	7	8879.34
819	400	8	8	9168.82
820	400	9	10	10816.82
821	400	11	11	10856.25
822	400	12	12	16591.46
823	401	1	1	11164.26
824	401	2	2	10943.88
825	401	3	3	11819.50
826	402	1	1	3224.04
827	402	2	2	3246.11
828	402	3	3	3170.89
829	402	5	5	4325.72
830	402	6	6	3335.71
831	402	7	7	3280.28
832	402	8	8	2787.70
833	402	9	9	6465.83
834	402	10	10	1956.48
835	402	11	11	6474.47
836	402	12	12	6257.93
837	403	1	1	6257.93
838	403	2	2	7134.64
839	403	3	3	6705.18
840	403	4	4	4678.49
841	404	2	2	5935.41
842	404	3	3	9599.81
843	404	4	4	9098.36
844	404	5	5	9533.98
845	404	6	6	9723.51
846	404	7	7	11311.55
847	404	8	8	6685.96
848	404	9	9	9969.52
849	404	10	10	11730.92
850	404	11	11	13003.02
851	404	12	12	15713.86
852	405	1	1	14446.12
853	405	2	2	18081.12
854	406	1	2	25180.74
855	407	1	2	833.55
856	408	1	2	800.00
857	409	1	1	759.00
858	409	2	4	1077.00
859	409	6	6	1845.00
860	409	10	11	1592.00
861	410	1	2	1831.00
862	411	1	1	20000.00
863	411	2	2	24000.00
864	412	1	6	3500.00
865	412	7	7	5000.00
866	412	8	10	3500.00
867	412	11	12	4000.00
868	413	6	6	6360.00
869	414	5	5	1000.00
870	415	10	10	2340.00
871	415	11	11	868.00
872	416	5	5	5022.58
873	416	6	6	6880.84
874	416	7	7	6373.66
875	416	8	8	2777.72
876	416	9	9	8161.38
877	416	10	10	8995.47
878	416	11	11	8662.74
879	416	12	12	8279.97
880	417	1	1	2122.90
881	417	2	2	2606.61
882	417	4	4	854.73
883	418	1	1	4116.00
884	418	2	2	3798.00
885	418	4	4	8008.00
886	418	5	5	4685.00
887	418	6	6	4296.00
888	418	7	7	3305.00
889	418	8	8	5802.00
890	418	9	9	1044.00
891	418	10	10	6973.00
892	418	11	11	7744.00
893	418	12	12	7019.00
894	419	1	1	7019.00
895	419	2	2	7837.00
896	419	3	3	9360.00
897	420	1	1	1.00
898	421	9	9	10000.00
899	421	10	10	30000.00
900	422	1	1	0.01
901	423	7	7	640.00
902	423	8	8	290.00
903	423	9	9	80.00
904	423	10	10	440.00
905	423	12	12	140.00
906	438	5	12	8000.00
907	439	1	4	4000.00
908	440	1	3	8000.00
909	441	2	2	14000.00
910	441	4	4	4000.00
911	441	8	8	4800.00
912	441	9	9	6000.00
913	442	12	12	34000.00
914	443	3	3	8000.00
915	444	1	4	7736.00
916	444	5	6	8665.00
917	444	7	8	9964.00
918	444	9	11	11458.00
919	444	12	12	12375.00
920	445	9	12	6260.00
921	446	1	9	2025.00
922	446	10	12	2050.00
923	447	12	12	75000.00
924	448	1	12	1200.00
925	449	1	12	2475.00
926	450	2	2	2000.00
927	450	3	3	4240.00
928	450	4	4	1520.00
929	450	6	6	600.00
930	450	9	9	800.00
931	451	7	7	9600.00
932	451	9	9	10000.00
933	452	7	7	2400.00
934	453	1	1	8200.00
935	453	3	3	8600.00
936	453	5	5	9000.00
937	454	2	2	9400.00
938	454	4	4	9800.00
939	454	6	6	10200.00
940	454	8	8	10600.00
941	455	8	8	1120.00
942	455	9	9	1120.00
943	455	10	10	1120.00
944	456	10	10	9200.00
945	456	12	12	9400.00
946	457	11	11	4200.00
947	458	1	12	2050.00
948	459	1	4	12375.00
949	460	1	4	6260.00
950	461	1	4	2050.00
951	462	1	4	5200.00
952	463	1	4	2455.00
953	464	1	4	2050.00
954	465	5	5	778.12
955	465	9	9	1322.32
956	465	11	11	976.81
957	465	12	12	650.99
958	466	1	7	135.00
959	466	8	8	155.00
960	466	10	10	306.88
961	466	11	11	154.00
962	466	12	12	155.00
963	467	3	3	2600.00
964	467	8	8	3000.00
965	468	2	2	1200.00
966	468	4	4	1200.00
967	468	7	7	1600.00
968	468	9	9	1600.00
969	468	10	10	3800.00
970	468	12	12	1800.00
971	469	3	3	800.00
972	469	6	6	1000.00
973	469	9	9	1120.00
974	470	9	9	856.52
975	471	1	1	30642.00
976	471	11	11	3561.40
977	472	1	1	1687.56
978	472	2	2	1485.65
979	472	3	3	988.80
980	473	1	1	1200.00
981	474	1	3	10490.87
982	475	3	3	6018.71
983	476	3	3	6103.89
984	477	2	2	3808.75
985	477	3	3	2974.04
986	478	1	7	2000.00
987	478	8	12	2500.00
988	479	10	10	920.00
989	480	3	3	5940.00
990	481	7	7	11800.00
991	482	10	10	1699.90
992	483	1	1	6580.00
993	484	4	4	4899.00
994	484	6	6	28594.00
995	484	9	9	14597.00
996	485	9	9	10900.00
997	486	10	10	9400.00
998	488	1	3	2500.00
999	489	3	3	17197.00
1000	490	1	1	4764.00
1001	491	5	5	4562.00
1002	491	6	6	5877.00
1003	491	8	8	5798.43
1004	491	9	9	9583.02
1005	491	10	10	10224.24
1006	492	9	10	2045.30
1007	492	11	12	2264.44
1008	493	1	1	912.22
1009	493	3	3	986.57
1010	493	4	4	1072.21
1011	493	8	8	1236.47
1012	493	9	9	1345.07
1013	493	10	10	1410.99
1014	494	1	1	903.32
1015	494	2	2	1375.48
1016	494	3	3	0.01
1017	494	4	4	925.04
1018	495	6	6	1127.97
1019	496	8	8	800.00
1020	497	12	12	9630.00
1021	498	2	2	22488.00
1022	499	12	12	1500.00
1023	500	12	12	2750.00
1024	501	12	12	2990.00
1025	502	1	1	2512.98
1026	503	1	1	1467.99
1027	504	3	3	1500.00
1028	505	1	1	200.00
1029	506	2	2	3920.00
1030	507	2	2	10798.00
1031	508	1	1	3900.00
1032	509	1	1	7854.32
1033	510	1	1	24999.00
1034	515	1	1	4236.74
1035	515	2	2	895.05
1036	515	3	3	4757.55
1037	515	4	4	4405.29
1038	515	5	5	4601.72
1039	515	6	6	4831.17
1040	516	1	1	21468.00
1041	517	1	1	1702.25
1042	517	2	2	1158.49
1043	517	3	3	229.90
1044	521	1	1	8304.97
1045	521	2	2	8001.51
1046	521	3	3	7269.28
1047	521	4	4	337.83
1048	521	5	5	10286.58
1049	521	6	6	2261.84
1050	521	7	7	7587.61
1051	521	8	8	6992.06
1052	521	9	9	13390.13
1053	521	10	10	4191.20
1054	521	11	11	19236.85
1055	521	12	12	12089.63
1056	522	1	1	13114.48
1057	523	1	1	4421.00
1058	523	2	4	2524.71
1059	523	5	6	3120.00
1060	523	8	8	2437.29
1061	523	9	9	4311.58
1062	523	10	10	7001.48
1063	523	11	11	5571.68
1064	524	9	9	20000.00
1065	524	11	11	30000.00
1066	525	3	3	1280.00
1067	525	7	7	600.00
1068	525	8	8	600.00
1069	525	9	9	600.00
1070	525	10	10	600.00
1071	525	11	11	1200.00
1072	525	12	12	1200.00
1073	526	6	7	7999.34
1074	526	8	8	8905.01
1075	526	9	10	8937.42
1076	526	11	11	8976.85
1077	526	12	12	13176.85
1078	527	1	1	7349.20
1079	527	2	7	8349.20
1080	527	8	12	9349.20
1081	528	1	1	9624.00
1082	528	2	4	10624.00
1083	529	4	4	12000.00
1084	530	3	3	14800.00
1085	531	1	1	75.13
1086	531	2	2	75.00
1087	531	3	3	74.86
1088	531	4	4	74.71
1089	531	5	5	74.56
1090	531	6	6	74.41
1091	531	7	7	74.25
1092	531	8	8	74.09
1093	531	9	9	73.92
1094	531	10	10	73.75
1095	531	11	11	73.57
1096	531	12	12	73.39
1097	532	9	9	8000.00
1098	533	1	1	2308.72
1099	533	2	2	2304.08
1100	533	3	3	2302.40
1101	533	4	4	2295.65
1102	533	5	5	2291.24
1103	533	6	6	2286.08
1104	533	7	7	2275.26
1105	533	8	8	2277.14
1106	533	9	9	2267.89
1107	533	10	10	2265.17
1108	533	11	11	2264.12
1109	533	12	12	2259.87
1110	534	4	4	3120.00
1111	573	1	1	73.20
1112	573	2	2	73.02
1113	574	1	1	2251.83
1114	574	2	2	2328.61
\.


--
-- Data for Name: f572_otrosempl; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_otrosempl (id, cuit, denominacion, presentacion_id) FROM stdin;
1	30702849515	INSTITUTO DEL PROFESORADO VERBO         DIVINO	14
2	30538521848	INSTITUTO NTRA SRA DEL PERPETUO SOCORRO	14
3	30702849515	INSTITUTO DEL PROFESORADO VERBO         DIVINO	15
4	30538521848	INSTITUTO NTRA SRA DEL PERPETUO SOCORRO	15
5	30648722563	EMEZETA S. A.	16
6	30627393713	DIRECCION GENERAL DE CULTURA Y EDUCACIONDE LA PROVINCIA DE BS AS	19
7	30546671166	UNIVERSIDAD TECNOLOGICA NACIONAL	21
8	30546671166	UNIVERSIDAD TECNOLOGICA NACIONAL	22
9	30546671166	UNIVERSIDAD TECNOLOGICA NACIONAL	25
10	30627393713	DIRECCION GENERAL DE CULTURA Y EDUCACIONDE LA PROVINCIA DE BS AS	26
11	30711424861	UNIVERSIDAD NACIONAL DE AVELLANEDA	27
12	30632072607	HONORABLE CAMARA DE SENADORES PCIA BS AS	45
13	34999032089	GOBIERNO DE LA CIUDAD DE BUENOS AIRES	50
14	34999032089	GOBIERNO DE LA CIUDAD DE BUENOS AIRES	51
15	30546666561	UNIVERSIDAD DE BUENOS AIRES	52
16	30546666561	UNIVERSIDAD DE BUENOS AIRES	53
17	30536216584	FUNDACION UNIVERSIDAD CATOLICA ARGENTINA	54
18	30546666561	UNIVERSIDAD DE BUENOS AIRES	54
19	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	64
20	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	65
21	30682873864	UNIVERSIDAD NACIONAL DE LANUS	90
22	30682873864	UNIVERSIDAD NACIONAL DE LANUS	91
23	34999032089	GOBIERNO DE LA CIUDAD DE BUENOS AIRES	118
24	30702849515	INSTITUTO DEL PROFESORADO VERBO         DIVINO	132
25	30538521848	INSTITUTO NTRA SRA DEL PERPETUO SOCORRO	132
26	30702849515	INSTITUTO DEL PROFESORADO VERBO         DIVINO	133
27	30538521848	INSTITUTO NTRA SRA DEL PERPETUO SOCORRO	133
28	30648722563	EMEZETA S. A.	134
29	30627393713	DIRECCION GENERAL DE CULTURA Y EDUCACIONDE LA PROVINCIA DE BS AS	137
30	30546671166	UNIVERSIDAD TECNOLOGICA NACIONAL	139
31	30546671166	UNIVERSIDAD TECNOLOGICA NACIONAL	140
32	30546671166	UNIVERSIDAD TECNOLOGICA NACIONAL	143
33	30627393713	DIRECCION GENERAL DE CULTURA Y EDUCACIONDE LA PROVINCIA DE BS AS	144
34	30711424861	UNIVERSIDAD NACIONAL DE AVELLANEDA	145
35	30632072607	HONORABLE CAMARA DE SENADORES PCIA BS AS	163
36	34999032089	GOBIERNO DE LA CIUDAD DE BUENOS AIRES	168
37	34999032089	GOBIERNO DE LA CIUDAD DE BUENOS AIRES	169
38	30546666561	UNIVERSIDAD DE BUENOS AIRES	170
39	30546666561	UNIVERSIDAD DE BUENOS AIRES	171
40	30536216584	FUNDACION UNIVERSIDAD CATOLICA ARGENTINA	172
41	30546666561	UNIVERSIDAD DE BUENOS AIRES	172
42	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	182
43	30542265317	CAJA DE PREVISION Y SEGURO MEDICO DE LA PROVINCIA DE BUENOS AIRES	183
44	30682873864	UNIVERSIDAD NACIONAL DE LANUS	208
45	30682873864	UNIVERSIDAD NACIONAL DE LANUS	209
46	34999032089	GOBIERNO DE LA CIUDAD DE BUENOS AIRES	236
\.


--
-- Data for Name: f572_otrosemplingaporte; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_otrosemplingaporte (id, otrosemp_id, mes, obrasoc, segsoc, sind, ganbrut, retgan, retribnohab, ajuste, exenoalc, sac, horasextgr, horasextex, matdid, gastosmovviat) FROM stdin;
1	1	1	2696.97	14383.84	4045.45	92528.98	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
2	1	2	2696.97	14383.84	4045.45	92528.98	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
3	1	3	3027.87	16148.63	4541.80	104058.93	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
4	1	4	3027.87	16148.63	4541.80	104058.93	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
5	1	5	3027.87	4541.80	4541.80	104058.93	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
6	1	6	4551.80	24222.94	6812.70	104058.93	0.00	0.00	0.00	0.00	50464.46	0.00	0.00	0.00	0.00
7	1	7	3483.60	18579.19	5225.40	119249.93	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
8	1	8	3483.60	18579.19	5225.40	119249.93	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
9	1	9	3611.48	19261.25	5417.23	124212.83	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
10	1	10	3726.81	19876.33	5590.22	128057.08	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
11	1	11	3939.96	21013.10	5909.93	131331.85	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
12	1	12	4101.80	21876.26	6152.70	136726.63	0.00	0.00	0.00	0.00	65665.92	0.00	0.00	0.00	0.00
13	2	1	1245.31	6641.64	1867.96	44140.20	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
14	2	2	1245.31	6641.64	1867.96	44140.20	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
15	2	3	1427.14	7611.39	2140.70	50701.17	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
16	2	4	1427.14	7611.39	2140.70	50701.17	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
17	2	5	1427.17	7611.39	2140.70	48701.17	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
18	2	6	2140.71	11417.08	3240.74	48701.17	0.00	0.00	0.00	0.00	23785.58	0.00	0.00	0.00	0.00
19	2	7	1636.00	8725.31	2453.99	57663.17	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
20	2	8	1636.00	8725.31	2453.99	57663.17	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
21	2	9	1674.63	8931.35	2511.94	59650.96	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
22	2	10	1737.73	9267.92	2606.60	61754.47	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
23	2	11	1816.58	9688.44	2724.84	60552.72	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
24	2	12	2785.50	14856.50	0.00	62576.77	0.00	0.00	0.00	0.00	30276.36	0.00	0.00	0.00	0.00
25	3	1	4101.80	21876.26	6152.70	136726.63	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
26	3	2	4101.80	21876.26	6152.70	141806.63	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
27	3	3	4101.80	21876.26	6152.70	141806.63	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
28	4	1	1877.30	10012.28	2815.95	62576.77	0.00	0.00	0.00	0.00	1012.03	0.00	0.00	0.00	0.00
29	4	2	1877.30	10012.28	2815.95	67656.77	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
30	4	3	1877.30	10012.28	2815.95	67656.77	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
31	5	1	1232.29	5751.14	616.19	41079.58	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
32	5	2	1377.48	6428.22	688.74	45915.89	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
33	5	3	1377.48	6428.22	688.74	45915.89	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
34	5	4	1710.35	7981.65	855.18	57011.83	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
35	5	5	1763.95	8231.78	881.98	58798.44	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
36	5	6	2565.53	11972.46	1282.77	85517.75	0.00	0.00	0.00	0.00	28505.92	0.00	0.00	0.00	0.00
37	5	7	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	12610.29	0.00	0.00	0.00	0.00
38	6	1	3931.60	6749.68	376.19	32193.59	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
39	6	2	3603.16	6749.68	777.73	32193.63	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
40	6	3	3833.24	6815.71	0.00	37034.07	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
41	6	4	3833.24	6815.71	856.10	37034.07	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
42	6	5	3833.24	6815.71	856.10	37034.07	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
43	6	6	6118.01	11558.00	1078.78	42205.18	0.00	0.00	0.00	0.00	17986.30	0.00	0.00	0.00	0.00
44	6	7	4698.82	8845.15	984.80	42205.18	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
45	6	8	4665.39	7822.26	956.84	42205.18	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
46	6	9	4567.45	8184.26	606.38	39322.63	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
47	6	10	4797.79	9412.21	1067.78	45369.69	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
48	6	11	4797.79	8338.35	606.38	39704.85	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
49	6	12	7421.27	13158.29	1491.54	66618.95	0.00	0.00	0.00	0.00	18008.80	0.00	0.00	0.00	0.00
50	7	1	6747.43	29987.69	3748.46	187423.11	33238.71	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
51	7	2	7015.34	31273.63	3909.20	195460.17	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
52	7	3	7283.24	32559.56	4069.94	203497.23	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
53	7	4	7283.24	32559.56	4069.94	203497.23	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
54	7	5	8872.59	39408.25	5023.55	251177.70	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
55	7	6	15053.71	66361.36	8461.62	282054.11	0.00	0.00	0.00	0.00	141027.06	0.00	0.00	0.00	0.00
56	7	7	12625.18	54862.07	7275.11	363755.32	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
57	7	8	13050.62	56521.31	7530.37	376518.69	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
58	7	9	13688.79	59948.56	7913.27	395663.73	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
59	7	10	14433.32	62852.23	8359.99	417999.64	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
60	7	11	14433.32	62852.23	8359.99	417999.64	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
61	7	12	18592.99	80712.13	10215.00	301749.91	0.00	0.00	0.00	0.00	208999.82	0.00	0.00	0.00	0.00
62	8	1	2207.30	8195.03	1024.38	51218.95	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
63	8	2	17808.19	71764.44	0.00	478625.60	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
64	8	3	18888.80	82431.32	0.00	551663.93	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
65	9	1	3995.10	11852.17	0.00	74076.06	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
66	9	2	3711.29	11857.18	0.00	74107.38	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
67	10	1	167.14	557.12	0.00	3965.00	0.00	0.00	0.00	484.00	3481.98	0.00	0.00	0.00	0.00
68	10	2	260.00	867.00	0.00	5000.00	0.00	0.00	0.00	484.00	0.00	0.00	0.00	0.00	0.00
69	10	3	300.00	1000.31	0.00	6650.00	0.00	0.00	0.00	404.00	828.79	0.00	0.00	0.00	0.00
70	10	4	0.00	0.00	0.00	322.00	0.00	0.00	0.00	322.00	0.00	0.00	0.00	0.00	0.00
71	10	5	0.00	0.00	0.00	322.00	0.00	0.00	0.00	322.00	0.00	0.00	0.00	0.00	0.00
72	10	6	0.00	0.00	0.00	165.00	0.00	0.00	0.00	165.00	0.00	0.00	0.00	0.00	0.00
73	10	7	5948.00	19826.94	0.00	127048.00	0.00	0.00	0.00	2420.00	10638.00	0.00	0.00	0.00	0.00
74	10	8	2337.92	7793.07	0.00	51836.00	0.00	0.00	0.00	2420.00	0.00	0.00	0.00	0.00	0.00
75	10	9	2337.92	7793.07	0.00	50598.56	0.00	0.00	0.00	1181.86	0.00	0.00	0.00	0.00	0.00
76	10	10	2385.75	7952.50	0.00	53533.10	0.00	0.00	0.00	2830.00	0.00	0.00	0.00	0.00	0.00
77	10	11	2478.50	8261.00	0.00	55466.00	0.00	0.00	0.00	2830.00	0.00	0.00	0.00	0.00	0.00
78	10	12	2586.46	8261.54	0.00	57714.00	0.00	0.00	0.00	2830.00	0.00	0.00	0.00	0.00	0.00
79	13	1	0.00	9152.88	1889.64	0.00	1295.04	0.00	0.00	109710.71	0.00	0.00	0.00	0.00	0.00
80	13	2	0.00	10342.01	1889.03	0.00	0.00	0.00	0.00	114862.54	0.00	0.00	0.00	0.00	0.00
81	13	3	0.00	9186.72	3452.11	0.00	0.00	0.00	0.00	133724.16	0.00	0.00	0.00	0.00	0.00
82	13	4	0.00	9186.72	3452.11	0.00	0.00	0.00	0.00	116770.64	0.00	0.00	0.00	0.00	0.00
83	13	5	0.00	9186.72	3452.11	0.00	0.00	0.00	0.00	123889.64	0.00	0.00	0.00	0.00	0.00
84	13	6	0.00	11122.50	6899.69	0.00	0.00	0.00	0.00	159072.38	0.00	0.00	0.00	0.00	0.00
85	13	7	0.00	9574.58	4660.55	0.00	0.00	0.00	0.00	118397.11	0.00	0.00	0.00	0.00	0.00
86	13	8	0.00	8597.14	4091.17	0.00	0.00	0.00	0.00	102695.35	0.00	0.00	0.00	0.00	0.00
87	13	9	0.00	9056.81	6774.62	0.00	0.00	0.00	0.00	153750.68	0.00	0.00	0.00	0.00	0.00
88	13	10	0.00	12696.92	4740.83	133691.70	0.00	0.00	0.00	7188.00	0.00	0.00	0.00	0.00	0.00
89	13	11	0.00	12655.02	4740.83	150437.45	0.00	0.00	0.00	7188.00	0.00	0.00	0.00	0.00	0.00
90	13	12	0.00	13957.04	4665.10	162998.06	0.00	0.00	0.00	7188.00	0.00	0.00	0.00	0.00	0.00
91	14	1	0.00	14232.68	4897.31	187089.87	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
92	14	2	0.00	14232.68	4897.31	187089.82	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
93	14	3	0.00	13281.65	4943.96	157123.26	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
94	15	1	0.00	5584.64	0.00	34948.04	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
95	15	2	0.00	5803.66	0.00	36316.84	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
96	15	3	0.00	6022.66	0.00	37685.64	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
97	15	4	0.00	6224.38	0.00	38946.40	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
98	15	5	0.00	6885.44	0.00	44077.98	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
99	15	6	0.00	10298.77	0.00	43411.28	0.00	0.00	0.00	0.00	22000.00	0.00	0.00	0.00	0.00
100	15	7	0.00	3432.72	0.00	22477.76	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
101	15	8	0.00	3553.38	0.00	23230.61	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
102	15	9	0.00	3734.97	0.00	24359.87	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
103	15	10	0.00	3944.86	0.00	26677.36	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
104	15	11	0.00	3944.86	0.00	26677.36	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
105	15	12	0.00	6233.49	0.00	26677.36	0.00	0.00	0.00	0.00	13900.00	0.00	0.00	0.00	0.00
106	16	1	0.00	4276.10	0.00	28747.68	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
107	19	1	0.00	0.00	0.00	15887.25	0.00	0.00	0.00	17736.00	0.00	0.00	0.00	0.00	0.00
108	19	2	0.00	0.00	0.00	15887.25	0.00	0.00	0.00	17736.00	0.00	0.00	0.00	0.00	0.00
109	19	3	0.00	0.00	0.00	15887.25	0.00	0.00	0.00	17736.00	0.00	0.00	0.00	0.00	0.00
110	19	4	0.00	0.00	0.00	13125.00	0.00	0.00	0.00	24750.00	0.00	0.00	0.00	0.00	0.00
111	19	5	0.00	0.00	0.00	13125.00	0.00	0.00	0.00	24750.00	0.00	0.00	0.00	0.00	0.00
112	19	6	0.00	0.00	0.00	13125.00	0.00	0.00	0.00	43687.50	0.00	0.00	0.00	0.00	0.00
113	19	7	0.00	0.00	0.00	14437.50	0.00	0.00	0.00	26250.00	0.00	0.00	0.00	0.00	0.00
114	19	8	0.00	0.00	0.00	16687.50	0.00	0.00	0.00	26250.00	0.00	0.00	0.00	0.00	0.00
115	19	9	0.00	0.00	0.00	16687.50	0.00	0.00	0.00	26250.00	0.00	0.00	0.00	0.00	0.00
116	19	10	0.00	0.00	0.00	16687.50	0.00	0.00	0.00	26250.00	0.00	0.00	0.00	0.00	0.00
117	19	11	0.00	0.00	0.00	18375.00	0.00	0.00	0.00	28500.00	0.00	0.00	0.00	0.00	0.00
118	19	12	0.00	0.00	0.00	18375.00	0.00	0.00	0.00	51937.50	0.00	0.00	0.00	0.00	0.00
119	20	1	0.00	0.00	0.00	18375.00	0.00	0.00	0.00	28500.00	0.00	0.00	0.00	0.00	0.00
120	20	2	0.00	0.00	0.00	18375.00	0.00	0.00	0.00	28500.00	0.00	0.00	0.00	0.00	0.00
121	20	3	0.00	0.00	0.00	18375.00	0.00	0.00	0.00	28500.00	0.00	0.00	0.00	0.00	0.00
122	21	1	833.18	4443.64	0.00	28772.75	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
123	21	2	865.25	4613.44	0.00	28833.99	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
124	21	3	896.96	4783.23	0.00	29895.22	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
125	23	1	2996.02	5492.71	990.76	95431.94	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
126	24	1	2696.97	14383.84	4045.45	92528.98	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
127	24	2	2696.97	14383.84	4045.45	92528.98	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
128	24	3	3027.87	16148.63	4541.80	104058.93	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
129	24	4	3027.87	16148.63	4541.80	104058.93	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
130	24	5	3027.87	4541.80	4541.80	104058.93	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
131	24	6	4551.80	24222.94	6812.70	104058.93	0.00	0.00	0.00	0.00	50464.46	0.00	0.00	0.00	0.00
132	24	7	3483.60	18579.19	5225.40	119249.93	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
133	24	8	3483.60	18579.19	5225.40	119249.93	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
134	24	9	3611.48	19261.25	5417.23	124212.83	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
135	24	10	3726.81	19876.33	5590.22	128057.08	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
136	24	11	3939.96	21013.10	5909.93	131331.85	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
137	24	12	4101.80	21876.26	6152.70	136726.63	0.00	0.00	0.00	0.00	65665.92	0.00	0.00	0.00	0.00
138	25	1	1245.31	6641.64	1867.96	44140.20	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
139	25	2	1245.31	6641.64	1867.96	44140.20	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
140	25	3	1427.14	7611.39	2140.70	50701.17	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
141	25	4	1427.14	7611.39	2140.70	50701.17	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
142	25	5	1427.17	7611.39	2140.70	48701.17	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
143	25	6	2140.71	11417.08	3240.74	48701.17	0.00	0.00	0.00	0.00	23785.58	0.00	0.00	0.00	0.00
144	25	7	1636.00	8725.31	2453.99	57663.17	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
145	25	8	1636.00	8725.31	2453.99	57663.17	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
146	25	9	1674.63	8931.35	2511.94	59650.96	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
147	25	10	1737.73	9267.92	2606.60	61754.47	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
148	25	11	1816.58	9688.44	2724.84	60552.72	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
149	25	12	2785.50	14856.50	0.00	62576.77	0.00	0.00	0.00	0.00	30276.36	0.00	0.00	0.00	0.00
150	26	1	4101.80	21876.26	6152.70	136726.63	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
151	26	2	4101.80	21876.26	6152.70	141806.63	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
152	26	3	4101.80	21876.26	6152.70	141806.63	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
153	27	1	1877.30	10012.28	2815.95	62576.77	0.00	0.00	0.00	0.00	1012.03	0.00	0.00	0.00	0.00
154	27	2	1877.30	10012.28	2815.95	67656.77	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
155	27	3	1877.30	10012.28	2815.95	67656.77	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
156	28	1	1232.29	5751.14	616.19	41079.58	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
157	28	2	1377.48	6428.22	688.74	45915.89	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
158	28	3	1377.48	6428.22	688.74	45915.89	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
159	28	4	1710.35	7981.65	855.18	57011.83	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
160	28	5	1763.95	8231.78	881.98	58798.44	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
161	28	6	2565.53	11972.46	1282.77	85517.75	0.00	0.00	0.00	0.00	28505.92	0.00	0.00	0.00	0.00
162	28	7	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	12610.29	0.00	0.00	0.00	0.00
163	29	1	3931.60	6749.68	376.19	32193.59	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
164	29	2	3603.16	6749.68	777.73	32193.63	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
165	29	3	3833.24	6815.71	0.00	37034.07	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
166	29	4	3833.24	6815.71	856.10	37034.07	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
167	29	5	3833.24	6815.71	856.10	37034.07	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
168	29	6	6118.01	11558.00	1078.78	42205.18	0.00	0.00	0.00	0.00	17986.30	0.00	0.00	0.00	0.00
169	29	7	4698.82	8845.15	984.80	42205.18	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
170	29	8	4665.39	7822.26	956.84	42205.18	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
171	29	9	4567.45	8184.26	606.38	39322.63	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
172	29	10	4797.79	9412.21	1067.78	45369.69	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
173	29	11	4797.79	8338.35	606.38	39704.85	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
174	29	12	7421.27	13158.29	1491.54	66618.95	0.00	0.00	0.00	0.00	18008.80	0.00	0.00	0.00	0.00
175	30	1	6747.43	29987.69	3748.46	187423.11	33238.71	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
176	30	2	7015.34	31273.63	3909.20	195460.17	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
177	30	3	7283.24	32559.56	4069.94	203497.23	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
178	30	4	7283.24	32559.56	4069.94	203497.23	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
179	30	5	8872.59	39408.25	5023.55	251177.70	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
180	30	6	15053.71	66361.36	8461.62	282054.11	0.00	0.00	0.00	0.00	141027.06	0.00	0.00	0.00	0.00
181	30	7	12625.18	54862.07	7275.11	363755.32	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
182	30	8	13050.62	56521.31	7530.37	376518.69	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
183	30	9	13688.79	59948.56	7913.27	395663.73	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
184	30	10	14433.32	62852.23	8359.99	417999.64	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
185	30	11	14433.32	62852.23	8359.99	417999.64	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
186	30	12	18592.99	80712.13	10215.00	301749.91	0.00	0.00	0.00	0.00	208999.82	0.00	0.00	0.00	0.00
187	31	1	2207.30	8195.03	1024.38	51218.95	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
188	31	2	17808.19	71764.44	0.00	478625.60	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
189	31	3	18888.80	82431.32	0.00	551663.93	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
190	32	1	3995.10	11852.17	0.00	74076.06	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
191	32	2	3711.29	11857.18	0.00	74107.38	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
192	33	1	167.14	557.12	0.00	3965.00	0.00	0.00	0.00	484.00	3481.98	0.00	0.00	0.00	0.00
193	33	2	260.00	867.00	0.00	5000.00	0.00	0.00	0.00	484.00	0.00	0.00	0.00	0.00	0.00
194	33	3	300.00	1000.31	0.00	6650.00	0.00	0.00	0.00	404.00	828.79	0.00	0.00	0.00	0.00
195	33	4	0.00	0.00	0.00	322.00	0.00	0.00	0.00	322.00	0.00	0.00	0.00	0.00	0.00
196	33	5	0.00	0.00	0.00	322.00	0.00	0.00	0.00	322.00	0.00	0.00	0.00	0.00	0.00
197	33	6	0.00	0.00	0.00	165.00	0.00	0.00	0.00	165.00	0.00	0.00	0.00	0.00	0.00
198	33	7	5948.00	19826.94	0.00	127048.00	0.00	0.00	0.00	2420.00	10638.00	0.00	0.00	0.00	0.00
199	33	8	2337.92	7793.07	0.00	51836.00	0.00	0.00	0.00	2420.00	0.00	0.00	0.00	0.00	0.00
200	33	9	2337.92	7793.07	0.00	50598.56	0.00	0.00	0.00	1181.86	0.00	0.00	0.00	0.00	0.00
201	33	10	2385.75	7952.50	0.00	53533.10	0.00	0.00	0.00	2830.00	0.00	0.00	0.00	0.00	0.00
202	33	11	2478.50	8261.00	0.00	55466.00	0.00	0.00	0.00	2830.00	0.00	0.00	0.00	0.00	0.00
203	33	12	2586.46	8261.54	0.00	57714.00	0.00	0.00	0.00	2830.00	0.00	0.00	0.00	0.00	0.00
204	36	1	0.00	9152.88	1889.64	0.00	1295.04	0.00	0.00	109710.71	0.00	0.00	0.00	0.00	0.00
205	36	2	0.00	10342.01	1889.03	0.00	0.00	0.00	0.00	114862.54	0.00	0.00	0.00	0.00	0.00
206	36	3	0.00	9186.72	3452.11	0.00	0.00	0.00	0.00	133724.16	0.00	0.00	0.00	0.00	0.00
207	36	4	0.00	9186.72	3452.11	0.00	0.00	0.00	0.00	116770.64	0.00	0.00	0.00	0.00	0.00
208	36	5	0.00	9186.72	3452.11	0.00	0.00	0.00	0.00	123889.64	0.00	0.00	0.00	0.00	0.00
209	36	6	0.00	11122.50	6899.69	0.00	0.00	0.00	0.00	159072.38	0.00	0.00	0.00	0.00	0.00
210	36	7	0.00	9574.58	4660.55	0.00	0.00	0.00	0.00	118397.11	0.00	0.00	0.00	0.00	0.00
211	36	8	0.00	8597.14	4091.17	0.00	0.00	0.00	0.00	102695.35	0.00	0.00	0.00	0.00	0.00
212	36	9	0.00	9056.81	6774.62	0.00	0.00	0.00	0.00	153750.68	0.00	0.00	0.00	0.00	0.00
213	36	10	0.00	12696.92	4740.83	133691.70	0.00	0.00	0.00	7188.00	0.00	0.00	0.00	0.00	0.00
214	36	11	0.00	12655.02	4740.83	150437.45	0.00	0.00	0.00	7188.00	0.00	0.00	0.00	0.00	0.00
215	36	12	0.00	13957.04	4665.10	162998.06	0.00	0.00	0.00	7188.00	0.00	0.00	0.00	0.00	0.00
216	37	1	0.00	14232.68	4897.31	187089.87	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
217	37	2	0.00	14232.68	4897.31	187089.82	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
218	37	3	0.00	13281.65	4943.96	157123.26	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
219	38	1	0.00	5584.64	0.00	34948.04	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
220	38	2	0.00	5803.66	0.00	36316.84	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
221	38	3	0.00	6022.66	0.00	37685.64	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
222	38	4	0.00	6224.38	0.00	38946.40	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
223	38	5	0.00	6885.44	0.00	44077.98	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
224	38	6	0.00	10298.77	0.00	43411.28	0.00	0.00	0.00	0.00	22000.00	0.00	0.00	0.00	0.00
225	38	7	0.00	3432.72	0.00	22477.76	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
226	38	8	0.00	3553.38	0.00	23230.61	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
227	38	9	0.00	3734.97	0.00	24359.87	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
228	38	10	0.00	3944.86	0.00	26677.36	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
229	38	11	0.00	3944.86	0.00	26677.36	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
230	38	12	0.00	6233.49	0.00	26677.36	0.00	0.00	0.00	0.00	13900.00	0.00	0.00	0.00	0.00
231	39	1	0.00	4276.10	0.00	28747.68	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
232	42	1	0.00	0.00	0.00	15887.25	0.00	0.00	0.00	17736.00	0.00	0.00	0.00	0.00	0.00
233	42	2	0.00	0.00	0.00	15887.25	0.00	0.00	0.00	17736.00	0.00	0.00	0.00	0.00	0.00
234	42	3	0.00	0.00	0.00	15887.25	0.00	0.00	0.00	17736.00	0.00	0.00	0.00	0.00	0.00
235	42	4	0.00	0.00	0.00	13125.00	0.00	0.00	0.00	24750.00	0.00	0.00	0.00	0.00	0.00
236	42	5	0.00	0.00	0.00	13125.00	0.00	0.00	0.00	24750.00	0.00	0.00	0.00	0.00	0.00
237	42	6	0.00	0.00	0.00	13125.00	0.00	0.00	0.00	43687.50	0.00	0.00	0.00	0.00	0.00
238	42	7	0.00	0.00	0.00	14437.50	0.00	0.00	0.00	26250.00	0.00	0.00	0.00	0.00	0.00
239	42	8	0.00	0.00	0.00	16687.50	0.00	0.00	0.00	26250.00	0.00	0.00	0.00	0.00	0.00
240	42	9	0.00	0.00	0.00	16687.50	0.00	0.00	0.00	26250.00	0.00	0.00	0.00	0.00	0.00
241	42	10	0.00	0.00	0.00	16687.50	0.00	0.00	0.00	26250.00	0.00	0.00	0.00	0.00	0.00
242	42	11	0.00	0.00	0.00	18375.00	0.00	0.00	0.00	28500.00	0.00	0.00	0.00	0.00	0.00
243	42	12	0.00	0.00	0.00	18375.00	0.00	0.00	0.00	51937.50	0.00	0.00	0.00	0.00	0.00
244	43	1	0.00	0.00	0.00	18375.00	0.00	0.00	0.00	28500.00	0.00	0.00	0.00	0.00	0.00
245	43	2	0.00	0.00	0.00	18375.00	0.00	0.00	0.00	28500.00	0.00	0.00	0.00	0.00	0.00
246	43	3	0.00	0.00	0.00	18375.00	0.00	0.00	0.00	28500.00	0.00	0.00	0.00	0.00	0.00
247	44	1	833.18	4443.64	0.00	28772.75	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
248	44	2	865.25	4613.44	0.00	28833.99	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
249	44	3	896.96	4783.23	0.00	29895.22	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
250	46	1	2996.02	5492.71	990.76	95431.94	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- Data for Name: f572_presentacion; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_presentacion (id, cuit, periodo, envio, nropresentacion, fechapresentacion, emplcuit, empltipodoc, emplapellido, emplnombre, dirprovincia, dircp, dirlocalidad, dircalle, dirnro, dirpiso, dirdpto, file_id, createdat, updatedat) FROM stdin;
1	20106503134	2022	3	3	2022-03-28	20106503134	P	GRAIZMAN	ERNESTO RAUL	1	1872	SARANDI	AV BELGRANO	2842			0	2023-06-25 00:24:02.446915	2023-06-25 00:24:02.446915
2	20112872788	2021	1	1	2022-02-02	20112872788	P	MARTINEZ	JUAN VICENTE	1	1870	AVELLANEDA	NAZAR	2020			0	2023-06-25 00:24:02.46741	2023-06-25 00:24:02.46741
3	20114928233	2022	4	4	2022-04-04	20114928233	P	MUZZI	DANIEL ADOLFO	1	1875	WILDE	SAN CARLOS	805			0	2023-06-25 00:24:02.47538	2023-06-25 00:24:02.47538
4	20120856511	2022	1	1	2022-01-04	20120856511	V	MASTRUZZO FRANCISCO ALBERTO		1	1824	LANUS	Manuel Maza	2613	P.A.		0	2023-06-25 00:24:02.480428	2023-06-25 00:24:02.480428
5	20125355901	2021	1	1	2022-02-07	20125355901	V	AZARIO	CARLOS ALBERTO	1	1872	SARANDI	PASAJE 4	1823		182	0	2023-06-25 00:24:02.489589	2023-06-25 00:24:02.489589
6	20127372358	2022	1	1	2022-01-30	20127372358	P	POZZUTO	HORACIO DE LUJAN	1	1879	QUILMES OESTE	JUAN B JUSTO	1771			0	2023-06-25 00:24:02.496461	2023-06-25 00:24:02.496461
7	20128013971	2021	2	2	2022-02-16	20128013971	P	LONARDI	LUIS ERNESTO	1	1643	BECCAR	USPALLATA	2510			0	2023-06-25 00:24:02.500377	2023-06-25 00:24:02.500377
8	20142476089	2021	16	16	2022-01-26	20142476089	P	MONZON	FABIAN ORLANDO	1	1874	VILLA DOMINICO	PUERO DE PALOS	71			0	2023-06-25 00:24:02.509342	2023-06-25 00:24:02.509342
9	20142476089	2022	5	5	2022-04-12	20142476089	P	MONZON	FABIAN ORLANDO	1	1874	VILLA DOMINICO	PUERO DE PALOS	71			0	2023-06-25 00:24:02.523575	2023-06-25 00:24:02.523575
10	20145571708	2022	1	1	2022-03-16	20145571708	V	GUIJO	ALEJANDRO CLAUDIO	1	1875	WILDE	LAS FLORES	1600	PB	C	0	2023-06-25 00:24:02.532101	2023-06-25 00:24:02.532101
11	20148364215	2022	1	1	2022-01-05	20148364215	V	ACEVEDO	LUCIANO	1	1889	BOSQUES	ADDIS ABEBA	1561			0	2023-06-25 00:24:02.538381	2023-06-25 00:24:02.538381
12	20166806330	2022	1	1	2022-03-09	20166806330	P	CASCARINO	JOSE LUIS	1	1875	WILDE	RAQUEL ESPAÑOL	520			0	2023-06-25 00:24:02.544641	2023-06-25 00:24:02.544641
13	20166813671	2022	1	1	2022-01-07	20166813671	P	RIAÑO	HORACIO OSCAR	1	1900	LA PLATA SUDESTE CALLE 50 AMBAS VEREDAS	3	1640			0	2023-06-25 00:24:02.557159	2023-06-25 00:24:02.557159
14	20170309430	2021	4	4	2022-01-04	20170309430	P	PRESTIA	FABIAN HUMBERTO	1	1875	WILDE	RAMON FRANCO	6171		B	0	2023-06-25 00:24:02.562681	2023-06-25 00:24:02.562681
15	20170309430	2022	3	3	2022-03-14	20170309430	P	PRESTIA	FABIAN HUMBERTO	1	1875	WILDE	RAMON FRANCO	6171		B	0	2023-06-25 00:24:02.605546	2023-06-25 00:24:02.605546
16	20171720967	2021	13	13	2022-01-11	20171720967	P	PANTIGA	ALBERTO MARIANO	1	1824	LANUS	CAMINO GRAL BELGRANO	1921			0	2023-06-25 00:24:02.619664	2023-06-25 00:24:02.619664
17	20171720967	2022	3	3	2022-04-09	20171720967	P	PANTIGA	ALBERTO MARIANO	1	1824	LANUS	CAMINO GRAL BELGRANO	1921			0	2023-06-25 00:24:02.642537	2023-06-25 00:24:02.642537
18	20172361758	2021	3	3	2022-01-03	20172361758	P	AGUIRRE	JORGE RAUL	0	1407	Ciudad de Buenos Aires	GARZON EUGENIO GRAL.	4764			0	2023-06-25 00:24:02.650491	2023-06-25 00:24:02.650491
19	20173158549	2021	1	1	2022-02-14	20173158549	P	SALA	JORGE JACINTO	0	1070	Ciudad de Buenos Aires	PIEDRAS	837	5	C	0	2023-06-25 00:24:02.66501	2023-06-25 00:24:02.66501
20	20173160144	2022	4	4	2022-04-12	20173160144	P	SICARI	ROBERTO DAMIAN	1	1872	SARANDI	O HIGGINS	861		003	0	2023-06-25 00:24:02.695138	2023-06-25 00:24:02.695138
21	20173919914	2021	12	12	2022-01-05	20173919914	P	GIMENEZ	LUCAS GABRIEL	1	1874	VILLA DOMINICO	BOLIVAR	4985			0	2023-06-25 00:24:02.700915	2023-06-25 00:24:02.700915
22	20173919914	2022	3	3	2022-04-11	20173919914	P	GIMENEZ	LUCAS GABRIEL	1	1874	VILLA DOMINICO	BOLIVAR	4985			0	2023-06-25 00:24:02.730331	2023-06-25 00:24:02.730331
23	20183568958	2022	1	1	2022-02-18	20183568958	P	BARRIENTOS	DAVID ROBERTO	1	1834	BARRIO SAN JOSE	EL HORNERO	3848			0	2023-06-25 00:24:02.74062	2023-06-25 00:24:02.74062
24	20214556430	2022	3	3	2022-03-18	20214556430	P	CEBALLOS	SERGIO DANIEL	0	1075	Ciudad de Buenos Aires	SANTIAGO DEL ESTERO	454	8	34	0	2023-06-25 00:24:02.748924	2023-06-25 00:24:02.748924
25	20230085723	2022	2	2	2022-04-11	20230085723	P	FERNANDEZ	DAVID DIEGO BARTOLOME	1	1875	WILDE	LAS FLORES	1600	9	a	0	2023-06-25 00:24:02.764241	2023-06-25 00:24:02.764241
26	20233149099	2021	1	1	2022-03-02	20233149099	P	FERRE	SERGIO LUIS	1	1875	WILDE	SAN NICOLAS	6255			0	2023-06-25 00:24:02.778041	2023-06-25 00:24:02.778041
27	20281965973	2022	1	1	2022-01-05	20281965973	P	BEVEGNI	ANGEL PABLO	1	1875	WILDE	HILARIO ASCASUBI	560	10	A	0	2023-06-25 00:24:02.809847	2023-06-25 00:24:02.809847
28	20286436995	2022	1	1	2022-04-01	20286436995	P	GREGORIC	JUAN JOSE	1	1636	OLIVOS	MARIANO MORENO	3841			0	2023-06-25 00:24:02.821742	2023-06-25 00:24:02.821742
29	20287462477	2021	3	3	2022-01-11	20287462477	P	LERICI	ARIEL	1	1870	AVELLANEDA	BLANDENGUES	2572			0	2023-06-25 00:24:02.83179	2023-06-25 00:24:02.83179
30	20287462477	2022	1	1	2022-02-08	20287462477	P	LERICI	ARIEL	1	1870	AVELLANEDA	BLANDENGUES	2572			0	2023-06-25 00:24:02.843813	2023-06-25 00:24:02.843813
31	20307785197	2022	1	1	2022-04-10	20307785197	P	BELTRAN	FEDERICO MARIANO	1	1875	WILDE	VUCETICH	962			0	2023-06-25 00:24:02.854629	2023-06-25 00:24:02.854629
32	20323948918	2022	1	1	2022-01-18	20323948918	P	ALBORÑOZ	EDGARDO MATIAS	1	1874	VILLA DOMINICO	SAN NICOLAS	4814			0	2023-06-25 00:24:02.86159	2023-06-25 00:24:02.86159
33	20325658356	2021	3	3	2022-01-02	20325658356	V	DEGLI INNOCENTI DAMIAN		1	1870	AVELLANEDA	V SARFIELD	143			0	2023-06-25 00:24:02.868778	2023-06-25 00:24:02.868778
34	20325658356	2022	1	1	2022-04-07	20325658356	V	DEGLI INNOCENTI DAMIAN		1	1870	AVELLANEDA	V SARFIELD	143			0	2023-06-25 00:24:02.882026	2023-06-25 00:24:02.882026
35	20352712990	2021	3	3	2022-01-02	20352712990	P	TALENTO	JULIAN IGNACIO	0	1266	Ciudad de Buenos Aires	PATRICIOS REGTO. AV.	1485	2		0	2023-06-25 00:24:02.887593	2023-06-25 00:24:02.887593
36	20352712990	2022	2	2	2022-03-31	20352712990	P	TALENTO	JULIAN IGNACIO	0	1266	Ciudad de Buenos Aires	PATRICIOS REGTO. AV.	1485	2		0	2023-06-25 00:24:02.892571	2023-06-25 00:24:02.892571
37	20371039660	2022	5	5	2022-04-12	20371039660	P	CHORNOBROFF	ALEJO	1	1874	VILLA DOMINICO	Oyuelas	1502			0	2023-06-25 00:24:02.896689	2023-06-25 00:24:02.896689
38	23145545374	2021	5	5	2022-03-14	23145545374	P	DIAZ	MARIA DEL CARMEN	1	1872	SARANDI	CORONEL ESPORA	586			0	2023-06-25 00:24:02.906868	2023-06-25 00:24:02.906868
39	23221670094	2021	3	3	2022-01-25	23221670094	P	FIORENTINO	MARIA LAURA	0	1155	Ciudad de Buenos Aires	BROWN ALMTE AV.	711	04	H	0	2023-06-25 00:24:02.917249	2023-06-25 00:24:02.917249
40	23233379379	2021	10	10	2022-01-25	23233379379	V	SEVILLA GABRIEL HERNAN		1	1870	AVELLANEDA	LIMAY	1470			0	2023-06-25 00:24:02.925636	2023-06-25 00:24:02.925636
41	23270252974	2021	3	3	2022-01-03	23270252974	V	TAGLIATA	MARISA LAURA	1	1872	SARANDI	TENIENTE CNEL MAGAN	1087	01		0	2023-06-25 00:24:02.939441	2023-06-25 00:24:02.939441
42	23307781174	2021	1	1	2022-01-17	23307781174	P	MANUELI	ORNELA ROMINA	1	1874	BARRIO OBRERO	MAGDALENA	443			0	2023-06-25 00:24:02.951475	2023-06-25 00:24:02.951475
43	23307781174	2022	1	1	2022-01-17	23307781174	P	MANUELI	ORNELA ROMINA	1	1874	BARRIO OBRERO	MAGDALENA	443			0	2023-06-25 00:24:02.961188	2023-06-25 00:24:02.961188
44	23364004184	2021	2	2	2022-02-19	23364004184	P	NIEVAS	NANCY VIVIANA	1	1872	SARANDI	ZÁRATE	576			0	2023-06-25 00:24:02.974937	2023-06-25 00:24:02.974937
45	24244360080	2021	2	2	2022-01-17	24244360080	P	BARREIRO	ROMINA MELISA	1	1824	LANUS	SUIPACHA	1853		4	0	2023-06-25 00:24:02.979375	2023-06-25 00:24:02.979375
46	27100098437	2021	1	1	2022-01-25	27100098437	P	GARCIA	ESTHER MABEL	0	1013	Ciudad de Buenos Aires	TALCAHUANO	981	20	j	0	2023-06-25 00:24:02.988822	2023-06-25 00:24:02.988822
47	27106234987	2021	13	13	2022-01-25	27106234987	P	GUTT	SUSANA BEATRIZ	1	1870	AVELLANEDA	GRAL. PAZ	8	7	B	0	2023-06-25 00:24:02.992487	2023-06-25 00:24:02.992487
48	27124036548	2022	1	1	2022-04-06	27124036548	P	ROSA	NORMA ADRIANA	1	1872	SARANDI	ESTRADA	2770			0	2023-06-25 00:24:03.010006	2023-06-25 00:24:03.010006
49	27124623176	2021	1	1	2022-01-21	27124623176	P	ALMIRON	NORA ELENA	0	1268	Ciudad de Buenos Aires	ISABEL LA CATOLICA	160	5	A	0	2023-06-25 00:24:03.017906	2023-06-25 00:24:03.017906
50	27140426879	2021	12	12	2022-01-09	27140426879	P	BIDINOST	LUCIA IRENE	1	1875	WILDE	JOSE E RODO	39			0	2023-06-25 00:24:03.029178	2023-06-25 00:24:03.029178
51	27140426879	2022	3	3	2022-04-04	27140426879	P	BIDINOST	LUCIA IRENE	1	1875	WILDE	JOSE E RODO	39			0	2023-06-25 00:24:03.073668	2023-06-25 00:24:03.073668
52	27148204530	2021	2	2	2022-02-19	27148204530	P	ZUNINO	SANDRA MARCELA	0	1124	Ciudad de Buenos Aires	ARENALES	2245	7		0	2023-06-25 00:24:03.084453	2023-06-25 00:24:03.084453
53	27148204530	2022	1	1	2022-02-19	27148204530	P	ZUNINO	SANDRA MARCELA	0	1124	Ciudad de Buenos Aires	ARENALES	2245	7		0	2023-06-25 00:24:03.101593	2023-06-25 00:24:03.101593
54	27163213287	2022	4	4	2022-03-29	27163213287	P	FUKS	AIDA JULIA	1	1824	LANUS	AV. HIPOLITO YRIGOYEN	4726			0	2023-06-25 00:24:03.107304	2023-06-25 00:24:03.107304
55	27166775006	2021	13	13	2022-01-18	27166775006	P	MENISALE	MONICA GRACIELA	0	1408	Ciudad de Buenos Aires	PALMAR	6611			0	2023-06-25 00:24:03.112714	2023-06-25 00:24:03.112714
56	27166775006	2022	5	5	2022-04-09	27166775006	P	MENISALE	MONICA GRACIELA	0	1408	Ciudad de Buenos Aires	PALMAR	6611			0	2023-06-25 00:24:03.120143	2023-06-25 00:24:03.120143
57	27167300044	2021	1	1	2022-01-13	27167300044	P	RAFUL	ANALIA JORGELINA	0	1155	Ciudad de Buenos Aires	PEREZ GALDOS BENITO	235	1	a	0	2023-06-25 00:24:03.126943	2023-06-25 00:24:03.126943
58	27168506568	2021	8	8	2022-02-14	27168506568	P	ANTIG	ANDREA SUSANA	0	1222	Ciudad de Buenos Aires	SARANDI	922	1	A	0	2023-06-25 00:24:03.131825	2023-06-25 00:24:03.131825
59	27168506568	2022	3	3	2022-04-08	27168506568	P	ANTIG	ANDREA SUSANA	0	1222	Ciudad de Buenos Aires	SARANDI	922	1	A	0	2023-06-25 00:24:03.144138	2023-06-25 00:24:03.144138
60	27168933105	2021	12	12	2022-01-09	27168933105	P	PAZOS	GABRIELA ELVIA	0	1139	Ciudad de Buenos Aires	TACUARI	1319	5	A	0	2023-06-25 00:24:03.150811	2023-06-25 00:24:03.150811
61	27168933105	2022	4	4	2022-04-05	27168933105	P	PAZOS	GABRIELA ELVIA	0	1139	Ciudad de Buenos Aires	TACUARI	1319	5	A	0	2023-06-25 00:24:03.164876	2023-06-25 00:24:03.164876
62	27171033247	2021	14	14	2022-01-25	27171033247	V	CAMPOS VIVIANA SILVIA		1	1870	AVELLANEDA	GRAL PAZ	8	07	B	0	2023-06-25 00:24:03.171593	2023-06-25 00:24:03.171593
63	27171033247	2022	2	2	2022-04-05	27171033247	V	CAMPOS VIVIANA SILVIA		1	1870	AVELLANEDA	GRAL PAZ	8	07	B	0	2023-06-25 00:24:03.181487	2023-06-25 00:24:03.181487
64	27172130327	2021	26	26	2022-01-06	27172130327	P	SORIA	MARIA FABIANA	1	1874	VILLA DOMINICO	avda. belgrano	4040	p b 	3	0	2023-06-25 00:24:03.189284	2023-06-25 00:24:03.189284
65	27172130327	2022	5	5	2022-04-03	27172130327	P	SORIA	MARIA FABIANA	1	1874	VILLA DOMINICO	avda. belgrano	4040	p b 	3	0	2023-06-25 00:24:03.21027	2023-06-25 00:24:03.21027
66	27172609800	2021	12	12	2022-02-08	27172609800	P	LEZCANO	PATRICIA BEATRIZ	1	1881	SAN FRANCISCO SOLANO (QUILMES)	846	2343			0	2023-06-25 00:24:03.220117	2023-06-25 00:24:03.220117
67	27172609800	2022	3	3	2022-03-15	27172609800	P	LEZCANO	PATRICIA BEATRIZ	1	1881	SAN FRANCISCO SOLANO (QUILMES)	846	2343			0	2023-06-25 00:24:03.231678	2023-06-25 00:24:03.231678
68	27175432650	2022	1	1	2022-02-23	27175432650	P	VEGA	MARTA ALICIA	1	1872	SARANDI	CTE. SPURR	368	1	1	0	2023-06-25 00:24:03.23594	2023-06-25 00:24:03.23594
69	27177107382	2021	5	5	2022-01-25	27177107382	P	GHIRELLI	MONICA VIVIANA	1	1875	WILDE	M. FIERRO	1493	0	0	0	2023-06-25 00:24:03.241667	2023-06-25 00:24:03.241667
70	27177107382	2022	2	2	2022-02-26	27177107382	P	GHIRELLI	MONICA VIVIANA	1	1875	WILDE	M. FIERRO	1493	0	0	0	2023-06-25 00:24:03.247056	2023-06-25 00:24:03.247056
71	27177708696	2021	1	1	2022-01-30	27177708696	P	ROCCA	ANDREA SUSANA	1	1871	DOCK SUD	HUERGO	1152			0	2023-06-25 00:24:03.254807	2023-06-25 00:24:03.254807
72	27178240256	2021	8	8	2022-02-23	27178240256	P	LOPEZ	ANDREA FABIANA	1	1876	BERNAL	MIGUEL ANGEL MAURIÑO	132			0	2023-06-25 00:24:03.261381	2023-06-25 00:24:03.261381
73	27179707069	2021	9	9	2022-01-24	27179707069	P	CORVALAN	CLAUDIA MARCELA	1	1822	VALENTIN ALSINA	GUATEMALA	2784			0	2023-06-25 00:24:03.273706	2023-06-25 00:24:03.273706
74	27183191530	2021	15	15	2022-01-04	27183191530	P	YANZON	DELIA MARCELA	1	1875	WILDE	LAS FLORES	1600	6	A	0	2023-06-25 00:24:03.284738	2023-06-25 00:24:03.284738
75	27183191530	2022	3	3	2022-03-31	27183191530	P	YANZON	DELIA MARCELA	1	1875	WILDE	LAS FLORES	1600	6	A	0	2023-06-25 00:24:03.295005	2023-06-25 00:24:03.295005
76	27208638934	2021	4	4	2022-03-14	27208638934	V	FIORENTINO	MARIA EUGENIA	1	1872	SARANDI	SUIPACHA	754			0	2023-06-25 00:24:03.301752	2023-06-25 00:24:03.301752
77	27208638934	2022	1	1	2022-01-05	27208638934	V	FIORENTINO	MARIA EUGENIA	1	1872	SARANDI	SUIPACHA	754			0	2023-06-25 00:24:03.313314	2023-06-25 00:24:03.313314
78	27208670870	2021	11	11	2022-01-04	27208670870	V	GARCIA MYRIAN LILIANA		1	1882	EZPELETA	NAMUNCURA	2020	0	0	0	2023-06-25 00:24:03.326609	2023-06-25 00:24:03.326609
79	27208670870	2022	2	2	2022-03-05	27208670870	V	GARCIA MYRIAN LILIANA		1	1882	EZPELETA	NAMUNCURA	2020	0	0	0	2023-06-25 00:24:03.335732	2023-06-25 00:24:03.335732
80	27215526491	2021	7	7	2022-01-02	27215526491	P	SANCHEZ	GREGORIA ANTONIA	0	1424	Ciudad de Buenos Aires	BEAUCHEF	822	4	C	0	2023-06-25 00:24:03.340034	2023-06-25 00:24:03.340034
81	27215526491	2022	2	2	2022-03-10	27215526491	P	SANCHEZ	GREGORIA ANTONIA	0	1424	Ciudad de Buenos Aires	BEAUCHEF	822	4	C	0	2023-06-25 00:24:03.349621	2023-06-25 00:24:03.349621
82	27218720914	2021	3	3	2022-01-04	27218720914	V	GIMENEZ SILVINA ADRIANA		1	1870	AVELLANEDA	R DE ELIZALDEE	1554			0	2023-06-25 00:24:03.357803	2023-06-25 00:24:03.357803
83	27219725529	2021	11	11	2022-03-11	27219725529	P	CEJAS	MARIA GABRIELA	0	1416	Ciudad de Buenos Aires	RODRIGUEZ M. A. GRAL	1674			0	2023-06-25 00:24:03.368271	2023-06-25 00:24:03.368271
84	27219725529	2022	1	1	2022-04-07	27219725529	P	CEJAS	MARIA GABRIELA	0	1416	Ciudad de Buenos Aires	RODRIGUEZ M. A. GRAL	1674			0	2023-06-25 00:24:03.401656	2023-06-25 00:24:03.401656
85	27225268938	2021	7	7	2022-01-08	27225268938	P	MARTIN	VANESA ANA	1	1870	AVELLANEDA	R GUTIERREZ	827		2	0	2023-06-25 00:24:03.416423	2023-06-25 00:24:03.416423
86	27225268938	2022	2	2	2022-03-08	27225268938	P	MARTIN	VANESA ANA	1	1870	AVELLANEDA	R GUTIERREZ	827		2	0	2023-06-25 00:24:03.443158	2023-06-25 00:24:03.443158
87	27227082424	2022	1	1	2022-03-08	27227082424	V	RULET	ALICIA SUSANA	1	1870	AVELLANEDA	PJE ROBERTO PERFUMO	745			0	2023-06-25 00:24:03.457123	2023-06-25 00:24:03.457123
88	27230605578	2022	2	2	2022-03-21	27230605578	V	GRECCO ADRIANA GABRIELA		1	1824	lanus	Bueras	351			0	2023-06-25 00:24:03.466389	2023-06-25 00:24:03.466389
89	27231370841	2021	1	1	2022-02-16	27231370841	P	MOYANO	GABRIELA NELIDA	1	1872	SARANDI	BARADERO	3960			0	2023-06-25 00:24:03.480694	2023-06-25 00:24:03.480694
90	27237809152	2021	7	7	2022-02-04	27237809152	P	LO FARO	MARIEL CARINA	1	1870	AVELLANEDA	BERUTI	205	15	F	0	2023-06-25 00:24:03.487181	2023-06-25 00:24:03.487181
91	27237809152	2022	1	1	2022-03-20	27237809152	P	LO FARO	MARIEL CARINA	1	1870	AVELLANEDA	BERUTI	205	15	F	0	2023-06-25 00:24:03.509929	2023-06-25 00:24:03.509929
92	27238794027	2021	15	15	2022-03-09	27238794027	V	DE SALAZAR MONICA ELIZABETH		1	1875	Wilde	Merlo	5481	PB		0	2023-06-25 00:24:03.519221	2023-06-25 00:24:03.519221
93	27238794027	2022	3	3	2022-03-09	27238794027	V	DE SALAZAR MONICA ELIZABETH		1	1875	Wilde	Merlo	5481	PB		0	2023-06-25 00:24:03.539035	2023-06-25 00:24:03.539035
94	27250276422	2022	1	1	2022-03-15	27250276422	P	ESPINDOLA	NATALIA SILVINA	1	1824	LANUS	FRAY MAMERTO ESQUIU	1077			0	2023-06-25 00:24:03.550603	2023-06-25 00:24:03.550603
95	27251216652	2022	3	3	2022-04-11	27251216652	P	GUITERA	MARIA DEL ROSARIO	1	1876	BERNAL	DON BOSCO	440			0	2023-06-25 00:24:03.561418	2023-06-25 00:24:03.561418
96	27253986048	2021	7	7	2022-01-17	27253986048	V	CATAFFO MARIA ESTHER		1	1834	SAN JOSE	GABOTO	5628			0	2023-06-25 00:24:03.569158	2023-06-25 00:24:03.569158
97	27255514437	2021	2	2	2022-02-16	27255514437	V	SETRINI	LORENA ANDREA	1	1872	SARANDI	DR CARLOS CASAZZA	836			0	2023-06-25 00:24:03.580204	2023-06-25 00:24:03.580204
98	27260108072	2022	1	1	2022-02-22	27260108072	P	RAMUNDO	LORENA CECILIA	1	1872	SARANDI	PASTEUR	554			0	2023-06-25 00:24:03.587566	2023-06-25 00:24:03.587566
99	27264662872	2022	2	2	2022-03-11	27264662872	P	DOMINGUEZ RUIZ	LAURA MARCELA	1	1870	AVELLANEDA	CABILDO	1987			0	2023-06-25 00:24:03.592088	2023-06-25 00:24:03.592088
100	27275650590	2022	1	1	2022-03-23	27275650590	V	IORGI	SABRINA LILIAN	1	1870	AVELLANEDA	DIAZ VELEZ	499	2	2	0	2023-06-25 00:24:03.605042	2023-06-25 00:24:03.605042
101	27277784675	2021	3	3	2022-01-28	27277784675	P	ARLANDI GRANADOS	NATALIA ANDREA	0	1128	Ciudad de Buenos Aires	LOPEZ VICENTE	2261	4	A	0	2023-06-25 00:24:03.616561	2023-06-25 00:24:03.616561
102	27277784675	2022	1	1	2022-01-28	27277784675	P	ARLANDI GRANADOS	NATALIA ANDREA	0	1128	Ciudad de Buenos Aires	LOPEZ VICENTE	2261	4	A	0	2023-06-25 00:24:03.634703	2023-06-25 00:24:03.634703
103	27280858124	2021	1	1	2022-02-23	27280858124	P	TRONCOSO	ROSA SILVINA	17	9100	TRELEW	EDINSON	1398			0	2023-06-25 00:24:03.647331	2023-06-25 00:24:03.647331
104	27284184039	2021	1	1	2022-02-06	27284184039	V	ROMERO SABRINA VERONICA		1	1824	LANUS	BASAVILBASO	427			0	2023-06-25 00:24:03.660995	2023-06-25 00:24:03.660995
105	27287508072	2021	1	1	2022-01-12	27287508072	P	VALLEJOS	SILVIA ANALIA	1	1822	VALENTIN ALSINA	OSORIO	1600	2	9	0	2023-06-25 00:24:03.666707	2023-06-25 00:24:03.666707
106	27290066242	2022	1	1	2022-04-04	27290066242	P	GANINO	YESICA NADIA	1	1834	TEMPERLEY	CABRED	1490			0	2023-06-25 00:24:03.670957	2023-06-25 00:24:03.670957
107	27292776425	2021	8	8	2022-03-03	27292776425	P	ORTIZ	ANALIA GABRIELA	1	1870	AVELLANEDA	LIMAY	1470			0	2023-06-25 00:24:03.676863	2023-06-25 00:24:03.676863
108	27331485026	2021	1	1	2022-01-17	27331485026	P	GALLARDO	MARISA PAMELA	0	1425	Ciudad de Buenos Aires	ARENALES	2847	5	B	0	2023-06-25 00:24:03.690609	2023-06-25 00:24:03.690609
109	27340209929	2021	15	15	2022-01-26	27340209929	P	MORENO	KARINA	1	1874	VILLA DOMINICO	MERLO	5108			0	2023-06-25 00:24:03.696424	2023-06-25 00:24:03.696424
110	27340209929	2022	4	4	2022-04-05	27340209929	P	MORENO	KARINA	1	1874	VILLA DOMINICO	MERLO	5108			0	2023-06-25 00:24:03.704032	2023-06-25 00:24:03.704032
111	27354247483	2021	1	1	2022-02-07	27354247483	P	AZARIO	DAIANA JAQUELINE	1	1870	AVELLANEDA	Pavon	122			0	2023-06-25 00:24:03.708568	2023-06-25 00:24:03.708568
112	27361629731	2022	2	2	2022-04-11	27361629731	P	CHAMORRO	LORENA TAMARA	1	1874	VILLA DOMINICO	Bolivar	4707			0	2023-06-25 00:24:03.712495	2023-06-25 00:24:03.712495
113	27370537602	2021	1	1	2022-03-14	27370537602	V	SAMANIEGO ROCIO GIULIANA		1	1875	WILDE	CAMACUA	6285			0	2023-06-25 00:24:03.716496	2023-06-25 00:24:03.716496
114	27381551097	2021	1	1	2022-01-23	27381551097	P	MACIA	MACARENA ROCIO	1	1869	GERLI	AGUERO	1415			0	2023-06-25 00:24:03.723296	2023-06-25 00:24:03.723296
115	27410661514	2021	1	1	2022-01-06	27410661514	P	BAÑA	AYELEN LUCIANA	1	1872	SARANDI	LUIS MARIA CAMPOS	2927			0	2023-06-25 00:24:03.729552	2023-06-25 00:24:03.729552
116	27925229070	2021	18	18	2022-01-26	27925229070	P	BENECH	CLAUDIA ANDREA	1	1869	GERLI	CAMPICHUELO	1504			0	2023-06-25 00:24:03.735715	2023-06-25 00:24:03.735715
117	27925229070	2022	3	3	2022-03-02	27925229070	P	BENECH	CLAUDIA ANDREA	1	1869	GERLI	CAMPICHUELO	1504			0	2023-06-25 00:24:03.768409	2023-06-25 00:24:03.768409
118	27947155569	2021	9	9	2022-02-05	27947155569	P	NUNES MANFREDI	SABRINA	0	1153	Ciudad de Buenos Aires	GARAY JUAN DE AV.	737	13	R	0	2023-06-25 00:24:03.775626	2023-06-25 00:24:03.775626
119	20106503134	2022	3	3	2022-03-28	20106503134	P	GRAIZMAN	ERNESTO RAUL	1	1872	SARANDI	AV BELGRANO	2842			0	2023-06-25 00:27:33.160357	2023-06-25 00:27:33.160357
120	20112872788	2021	1	1	2022-02-02	20112872788	P	MARTINEZ	JUAN VICENTE	1	1870	AVELLANEDA	NAZAR	2020			0	2023-06-25 00:27:33.172188	2023-06-25 00:27:33.172188
121	20114928233	2022	4	4	2022-04-04	20114928233	P	MUZZI	DANIEL ADOLFO	1	1875	WILDE	SAN CARLOS	805			0	2023-06-25 00:27:33.182731	2023-06-25 00:27:33.182731
122	20120856511	2022	1	1	2022-01-04	20120856511	V	MASTRUZZO FRANCISCO ALBERTO		1	1824	LANUS	Manuel Maza	2613	P.A.		0	2023-06-25 00:27:33.1903	2023-06-25 00:27:33.1903
123	20125355901	2021	1	1	2022-02-07	20125355901	V	AZARIO	CARLOS ALBERTO	1	1872	SARANDI	PASAJE 4	1823		182	0	2023-06-25 00:27:33.197561	2023-06-25 00:27:33.197561
124	20127372358	2022	1	1	2022-01-30	20127372358	P	POZZUTO	HORACIO DE LUJAN	1	1879	QUILMES OESTE	JUAN B JUSTO	1771			0	2023-06-25 00:27:33.203398	2023-06-25 00:27:33.203398
125	20128013971	2021	2	2	2022-02-16	20128013971	P	LONARDI	LUIS ERNESTO	1	1643	BECCAR	USPALLATA	2510			0	2023-06-25 00:27:33.208433	2023-06-25 00:27:33.208433
126	20142476089	2021	16	16	2022-01-26	20142476089	P	MONZON	FABIAN ORLANDO	1	1874	VILLA DOMINICO	PUERO DE PALOS	71			0	2023-06-25 00:27:33.216489	2023-06-25 00:27:33.216489
127	20142476089	2022	5	5	2022-04-12	20142476089	P	MONZON	FABIAN ORLANDO	1	1874	VILLA DOMINICO	PUERO DE PALOS	71			0	2023-06-25 00:27:33.23126	2023-06-25 00:27:33.23126
128	20145571708	2022	1	1	2022-03-16	20145571708	V	GUIJO	ALEJANDRO CLAUDIO	1	1875	WILDE	LAS FLORES	1600	PB	C	0	2023-06-25 00:27:33.242969	2023-06-25 00:27:33.242969
129	20148364215	2022	1	1	2022-01-05	20148364215	V	ACEVEDO	LUCIANO	1	1889	BOSQUES	ADDIS ABEBA	1561			0	2023-06-25 00:27:33.2495	2023-06-25 00:27:33.2495
130	20166806330	2022	1	1	2022-03-09	20166806330	P	CASCARINO	JOSE LUIS	1	1875	WILDE	RAQUEL ESPAÑOL	520			0	2023-06-25 00:27:33.257551	2023-06-25 00:27:33.257551
131	20166813671	2022	1	1	2022-01-07	20166813671	P	RIAÑO	HORACIO OSCAR	1	1900	LA PLATA SUDESTE CALLE 50 AMBAS VEREDAS	3	1640			0	2023-06-25 00:27:33.264885	2023-06-25 00:27:33.264885
132	20170309430	2021	4	4	2022-01-04	20170309430	P	PRESTIA	FABIAN HUMBERTO	1	1875	WILDE	RAMON FRANCO	6171		B	0	2023-06-25 00:27:33.271479	2023-06-25 00:27:33.271479
133	20170309430	2022	3	3	2022-03-14	20170309430	P	PRESTIA	FABIAN HUMBERTO	1	1875	WILDE	RAMON FRANCO	6171		B	0	2023-06-25 00:27:33.340225	2023-06-25 00:27:33.340225
134	20171720967	2021	13	13	2022-01-11	20171720967	P	PANTIGA	ALBERTO MARIANO	1	1824	LANUS	CAMINO GRAL BELGRANO	1921			0	2023-06-25 00:27:33.359376	2023-06-25 00:27:33.359376
135	20171720967	2022	3	3	2022-04-09	20171720967	P	PANTIGA	ALBERTO MARIANO	1	1824	LANUS	CAMINO GRAL BELGRANO	1921			0	2023-06-25 00:27:33.391108	2023-06-25 00:27:33.391108
136	20172361758	2021	3	3	2022-01-03	20172361758	P	AGUIRRE	JORGE RAUL	0	1407	Ciudad de Buenos Aires	GARZON EUGENIO GRAL.	4764			0	2023-06-25 00:27:33.399839	2023-06-25 00:27:33.399839
137	20173158549	2021	1	1	2022-02-14	20173158549	P	SALA	JORGE JACINTO	0	1070	Ciudad de Buenos Aires	PIEDRAS	837	5	C	0	2023-06-25 00:27:33.412257	2023-06-25 00:27:33.412257
138	20173160144	2022	4	4	2022-04-12	20173160144	P	SICARI	ROBERTO DAMIAN	1	1872	SARANDI	O HIGGINS	861		003	0	2023-06-25 00:27:33.457131	2023-06-25 00:27:33.457131
139	20173919914	2021	12	12	2022-01-05	20173919914	P	GIMENEZ	LUCAS GABRIEL	1	1874	VILLA DOMINICO	BOLIVAR	4985			0	2023-06-25 00:27:33.465353	2023-06-25 00:27:33.465353
140	20173919914	2022	3	3	2022-04-11	20173919914	P	GIMENEZ	LUCAS GABRIEL	1	1874	VILLA DOMINICO	BOLIVAR	4985			0	2023-06-25 00:27:33.505532	2023-06-25 00:27:33.505532
141	20183568958	2022	1	1	2022-02-18	20183568958	P	BARRIENTOS	DAVID ROBERTO	1	1834	BARRIO SAN JOSE	EL HORNERO	3848			0	2023-06-25 00:27:33.516753	2023-06-25 00:27:33.516753
142	20214556430	2022	3	3	2022-03-18	20214556430	P	CEBALLOS	SERGIO DANIEL	0	1075	Ciudad de Buenos Aires	SANTIAGO DEL ESTERO	454	8	34	0	2023-06-25 00:27:33.525343	2023-06-25 00:27:33.525343
143	20230085723	2022	2	2	2022-04-11	20230085723	P	FERNANDEZ	DAVID DIEGO BARTOLOME	1	1875	WILDE	LAS FLORES	1600	9	a	0	2023-06-25 00:27:33.53771	2023-06-25 00:27:33.53771
144	20233149099	2021	1	1	2022-03-02	20233149099	P	FERRE	SERGIO LUIS	1	1875	WILDE	SAN NICOLAS	6255			0	2023-06-25 00:27:33.552949	2023-06-25 00:27:33.552949
145	20281965973	2022	1	1	2022-01-05	20281965973	P	BEVEGNI	ANGEL PABLO	1	1875	WILDE	HILARIO ASCASUBI	560	10	A	0	2023-06-25 00:27:33.596174	2023-06-25 00:27:33.596174
146	20286436995	2022	1	1	2022-04-01	20286436995	P	GREGORIC	JUAN JOSE	1	1636	OLIVOS	MARIANO MORENO	3841			0	2023-06-25 00:27:33.605185	2023-06-25 00:27:33.605185
147	20287462477	2021	3	3	2022-01-11	20287462477	P	LERICI	ARIEL	1	1870	AVELLANEDA	BLANDENGUES	2572			0	2023-06-25 00:27:33.615465	2023-06-25 00:27:33.615465
148	20287462477	2022	1	1	2022-02-08	20287462477	P	LERICI	ARIEL	1	1870	AVELLANEDA	BLANDENGUES	2572			0	2023-06-25 00:27:33.631515	2023-06-25 00:27:33.631515
149	20307785197	2022	1	1	2022-04-10	20307785197	P	BELTRAN	FEDERICO MARIANO	1	1875	WILDE	VUCETICH	962			0	2023-06-25 00:27:33.642713	2023-06-25 00:27:33.642713
150	20323948918	2022	1	1	2022-01-18	20323948918	P	ALBORÑOZ	EDGARDO MATIAS	1	1874	VILLA DOMINICO	SAN NICOLAS	4814			0	2023-06-25 00:27:33.648517	2023-06-25 00:27:33.648517
151	20325658356	2021	3	3	2022-01-02	20325658356	V	DEGLI INNOCENTI DAMIAN		1	1870	AVELLANEDA	V SARFIELD	143			0	2023-06-25 00:27:33.658077	2023-06-25 00:27:33.658077
152	20325658356	2022	1	1	2022-04-07	20325658356	V	DEGLI INNOCENTI DAMIAN		1	1870	AVELLANEDA	V SARFIELD	143			0	2023-06-25 00:27:33.669459	2023-06-25 00:27:33.669459
153	20352712990	2021	3	3	2022-01-02	20352712990	P	TALENTO	JULIAN IGNACIO	0	1266	Ciudad de Buenos Aires	PATRICIOS REGTO. AV.	1485	2		0	2023-06-25 00:27:33.675923	2023-06-25 00:27:33.675923
154	20352712990	2022	2	2	2022-03-31	20352712990	P	TALENTO	JULIAN IGNACIO	0	1266	Ciudad de Buenos Aires	PATRICIOS REGTO. AV.	1485	2		0	2023-06-25 00:27:33.68084	2023-06-25 00:27:33.68084
155	20371039660	2022	5	5	2022-04-12	20371039660	P	CHORNOBROFF	ALEJO	1	1874	VILLA DOMINICO	Oyuelas	1502			0	2023-06-25 00:27:33.686903	2023-06-25 00:27:33.686903
156	23145545374	2021	5	5	2022-03-14	23145545374	P	DIAZ	MARIA DEL CARMEN	1	1872	SARANDI	CORONEL ESPORA	586			0	2023-06-25 00:27:33.69606	2023-06-25 00:27:33.69606
157	23221670094	2021	3	3	2022-01-25	23221670094	P	FIORENTINO	MARIA LAURA	0	1155	Ciudad de Buenos Aires	BROWN ALMTE AV.	711	04	H	0	2023-06-25 00:27:33.704078	2023-06-25 00:27:33.704078
158	23233379379	2021	10	10	2022-01-25	23233379379	V	SEVILLA GABRIEL HERNAN		1	1870	AVELLANEDA	LIMAY	1470			0	2023-06-25 00:27:33.712377	2023-06-25 00:27:33.712377
159	23270252974	2021	3	3	2022-01-03	23270252974	V	TAGLIATA	MARISA LAURA	1	1872	SARANDI	TENIENTE CNEL MAGAN	1087	01		0	2023-06-25 00:27:33.728908	2023-06-25 00:27:33.728908
160	23307781174	2021	1	1	2022-01-17	23307781174	P	MANUELI	ORNELA ROMINA	1	1874	BARRIO OBRERO	MAGDALENA	443			0	2023-06-25 00:27:33.739089	2023-06-25 00:27:33.739089
161	23307781174	2022	1	1	2022-01-17	23307781174	P	MANUELI	ORNELA ROMINA	1	1874	BARRIO OBRERO	MAGDALENA	443			0	2023-06-25 00:27:33.748702	2023-06-25 00:27:33.748702
162	23364004184	2021	2	2	2022-02-19	23364004184	P	NIEVAS	NANCY VIVIANA	1	1872	SARANDI	ZÁRATE	576			0	2023-06-25 00:27:33.76075	2023-06-25 00:27:33.76075
163	24244360080	2021	2	2	2022-01-17	24244360080	P	BARREIRO	ROMINA MELISA	1	1824	LANUS	SUIPACHA	1853		4	0	2023-06-25 00:27:33.765184	2023-06-25 00:27:33.765184
164	27100098437	2021	1	1	2022-01-25	27100098437	P	GARCIA	ESTHER MABEL	0	1013	Ciudad de Buenos Aires	TALCAHUANO	981	20	j	0	2023-06-25 00:27:33.773243	2023-06-25 00:27:33.773243
165	27106234987	2021	13	13	2022-01-25	27106234987	P	GUTT	SUSANA BEATRIZ	1	1870	AVELLANEDA	GRAL. PAZ	8	7	B	0	2023-06-25 00:27:33.776993	2023-06-25 00:27:33.776993
166	27124036548	2022	1	1	2022-04-06	27124036548	P	ROSA	NORMA ADRIANA	1	1872	SARANDI	ESTRADA	2770			0	2023-06-25 00:27:33.794309	2023-06-25 00:27:33.794309
167	27124623176	2021	1	1	2022-01-21	27124623176	P	ALMIRON	NORA ELENA	0	1268	Ciudad de Buenos Aires	ISABEL LA CATOLICA	160	5	A	0	2023-06-25 00:27:33.801123	2023-06-25 00:27:33.801123
168	27140426879	2021	12	12	2022-01-09	27140426879	P	BIDINOST	LUCIA IRENE	1	1875	WILDE	JOSE E RODO	39			0	2023-06-25 00:27:33.814014	2023-06-25 00:27:33.814014
169	27140426879	2022	3	3	2022-04-04	27140426879	P	BIDINOST	LUCIA IRENE	1	1875	WILDE	JOSE E RODO	39			0	2023-06-25 00:27:33.864081	2023-06-25 00:27:33.864081
170	27148204530	2021	2	2	2022-02-19	27148204530	P	ZUNINO	SANDRA MARCELA	0	1124	Ciudad de Buenos Aires	ARENALES	2245	7		0	2023-06-25 00:27:33.879039	2023-06-25 00:27:33.879039
171	27148204530	2022	1	1	2022-02-19	27148204530	P	ZUNINO	SANDRA MARCELA	0	1124	Ciudad de Buenos Aires	ARENALES	2245	7		0	2023-06-25 00:27:33.898859	2023-06-25 00:27:33.898859
172	27163213287	2022	4	4	2022-03-29	27163213287	P	FUKS	AIDA JULIA	1	1824	LANUS	AV. HIPOLITO YRIGOYEN	4726			0	2023-06-25 00:27:33.905755	2023-06-25 00:27:33.905755
173	27166775006	2021	13	13	2022-01-18	27166775006	P	MENISALE	MONICA GRACIELA	0	1408	Ciudad de Buenos Aires	PALMAR	6611			0	2023-06-25 00:27:33.911837	2023-06-25 00:27:33.911837
174	27166775006	2022	5	5	2022-04-09	27166775006	P	MENISALE	MONICA GRACIELA	0	1408	Ciudad de Buenos Aires	PALMAR	6611			0	2023-06-25 00:27:33.923263	2023-06-25 00:27:33.923263
175	27167300044	2021	1	1	2022-01-13	27167300044	P	RAFUL	ANALIA JORGELINA	0	1155	Ciudad de Buenos Aires	PEREZ GALDOS BENITO	235	1	a	0	2023-06-25 00:27:33.928791	2023-06-25 00:27:33.928791
176	27168506568	2021	8	8	2022-02-14	27168506568	P	ANTIG	ANDREA SUSANA	0	1222	Ciudad de Buenos Aires	SARANDI	922	1	A	0	2023-06-25 00:27:33.934239	2023-06-25 00:27:33.934239
177	27168506568	2022	3	3	2022-04-08	27168506568	P	ANTIG	ANDREA SUSANA	0	1222	Ciudad de Buenos Aires	SARANDI	922	1	A	0	2023-06-25 00:27:33.949907	2023-06-25 00:27:33.949907
178	27168933105	2021	12	12	2022-01-09	27168933105	P	PAZOS	GABRIELA ELVIA	0	1139	Ciudad de Buenos Aires	TACUARI	1319	5	A	0	2023-06-25 00:27:33.9575	2023-06-25 00:27:33.9575
179	27168933105	2022	4	4	2022-04-05	27168933105	P	PAZOS	GABRIELA ELVIA	0	1139	Ciudad de Buenos Aires	TACUARI	1319	5	A	0	2023-06-25 00:27:33.966271	2023-06-25 00:27:33.966271
180	27171033247	2021	14	14	2022-01-25	27171033247	V	CAMPOS VIVIANA SILVIA		1	1870	AVELLANEDA	GRAL PAZ	8	07	B	0	2023-06-25 00:27:33.973446	2023-06-25 00:27:33.973446
181	27171033247	2022	2	2	2022-04-05	27171033247	V	CAMPOS VIVIANA SILVIA		1	1870	AVELLANEDA	GRAL PAZ	8	07	B	0	2023-06-25 00:27:33.983295	2023-06-25 00:27:33.983295
182	27172130327	2021	26	26	2022-01-06	27172130327	P	SORIA	MARIA FABIANA	1	1874	VILLA DOMINICO	avda. belgrano	4040	p b 	3	0	2023-06-25 00:27:33.98878	2023-06-25 00:27:33.98878
183	27172130327	2022	5	5	2022-04-03	27172130327	P	SORIA	MARIA FABIANA	1	1874	VILLA DOMINICO	avda. belgrano	4040	p b 	3	0	2023-06-25 00:27:34.015666	2023-06-25 00:27:34.015666
184	27172609800	2021	12	12	2022-02-08	27172609800	P	LEZCANO	PATRICIA BEATRIZ	1	1881	SAN FRANCISCO SOLANO (QUILMES)	846	2343			0	2023-06-25 00:27:34.026264	2023-06-25 00:27:34.026264
185	27172609800	2022	3	3	2022-03-15	27172609800	P	LEZCANO	PATRICIA BEATRIZ	1	1881	SAN FRANCISCO SOLANO (QUILMES)	846	2343			0	2023-06-25 00:27:34.04013	2023-06-25 00:27:34.04013
186	27175432650	2022	1	1	2022-02-23	27175432650	P	VEGA	MARTA ALICIA	1	1872	SARANDI	CTE. SPURR	368	1	1	0	2023-06-25 00:27:34.045243	2023-06-25 00:27:34.045243
187	27177107382	2021	5	5	2022-01-25	27177107382	P	GHIRELLI	MONICA VIVIANA	1	1875	WILDE	M. FIERRO	1493	0	0	0	2023-06-25 00:27:34.051084	2023-06-25 00:27:34.051084
188	27177107382	2022	2	2	2022-02-26	27177107382	P	GHIRELLI	MONICA VIVIANA	1	1875	WILDE	M. FIERRO	1493	0	0	0	2023-06-25 00:27:34.056321	2023-06-25 00:27:34.056321
189	27177708696	2021	1	1	2022-01-30	27177708696	P	ROCCA	ANDREA SUSANA	1	1871	DOCK SUD	HUERGO	1152			0	2023-06-25 00:27:34.062054	2023-06-25 00:27:34.062054
190	27178240256	2021	8	8	2022-02-23	27178240256	P	LOPEZ	ANDREA FABIANA	1	1876	BERNAL	MIGUEL ANGEL MAURIÑO	132			0	2023-06-25 00:27:34.067865	2023-06-25 00:27:34.067865
191	27179707069	2021	9	9	2022-01-24	27179707069	P	CORVALAN	CLAUDIA MARCELA	1	1822	VALENTIN ALSINA	GUATEMALA	2784			0	2023-06-25 00:27:34.079851	2023-06-25 00:27:34.079851
192	27183191530	2021	15	15	2022-01-04	27183191530	P	YANZON	DELIA MARCELA	1	1875	WILDE	LAS FLORES	1600	6	A	0	2023-06-25 00:27:34.089356	2023-06-25 00:27:34.089356
193	27183191530	2022	3	3	2022-03-31	27183191530	P	YANZON	DELIA MARCELA	1	1875	WILDE	LAS FLORES	1600	6	A	0	2023-06-25 00:27:34.099828	2023-06-25 00:27:34.099828
194	27208638934	2021	4	4	2022-03-14	27208638934	V	FIORENTINO	MARIA EUGENIA	1	1872	SARANDI	SUIPACHA	754			0	2023-06-25 00:27:34.105342	2023-06-25 00:27:34.105342
195	27208638934	2022	1	1	2022-01-05	27208638934	V	FIORENTINO	MARIA EUGENIA	1	1872	SARANDI	SUIPACHA	754			0	2023-06-25 00:27:34.115668	2023-06-25 00:27:34.115668
196	27208670870	2021	11	11	2022-01-04	27208670870	V	GARCIA MYRIAN LILIANA		1	1882	EZPELETA	NAMUNCURA	2020	0	0	0	2023-06-25 00:27:34.129369	2023-06-25 00:27:34.129369
197	27208670870	2022	2	2	2022-03-05	27208670870	V	GARCIA MYRIAN LILIANA		1	1882	EZPELETA	NAMUNCURA	2020	0	0	0	2023-06-25 00:27:34.140797	2023-06-25 00:27:34.140797
198	27215526491	2021	7	7	2022-01-02	27215526491	P	SANCHEZ	GREGORIA ANTONIA	0	1424	Ciudad de Buenos Aires	BEAUCHEF	822	4	C	0	2023-06-25 00:27:34.145449	2023-06-25 00:27:34.145449
199	27215526491	2022	2	2	2022-03-10	27215526491	P	SANCHEZ	GREGORIA ANTONIA	0	1424	Ciudad de Buenos Aires	BEAUCHEF	822	4	C	0	2023-06-25 00:27:34.151805	2023-06-25 00:27:34.151805
200	27218720914	2021	3	3	2022-01-04	27218720914	V	GIMENEZ SILVINA ADRIANA		1	1870	AVELLANEDA	R DE ELIZALDEE	1554			0	2023-06-25 00:27:34.157668	2023-06-25 00:27:34.157668
201	27219725529	2021	11	11	2022-03-11	27219725529	P	CEJAS	MARIA GABRIELA	0	1416	Ciudad de Buenos Aires	RODRIGUEZ M. A. GRAL	1674			0	2023-06-25 00:27:34.169155	2023-06-25 00:27:34.169155
202	27219725529	2022	1	1	2022-04-07	27219725529	P	CEJAS	MARIA GABRIELA	0	1416	Ciudad de Buenos Aires	RODRIGUEZ M. A. GRAL	1674			0	2023-06-25 00:27:34.202298	2023-06-25 00:27:34.202298
203	27225268938	2021	7	7	2022-01-08	27225268938	P	MARTIN	VANESA ANA	1	1870	AVELLANEDA	R GUTIERREZ	827		2	0	2023-06-25 00:27:34.21158	2023-06-25 00:27:34.21158
204	27225268938	2022	2	2	2022-03-08	27225268938	P	MARTIN	VANESA ANA	1	1870	AVELLANEDA	R GUTIERREZ	827		2	0	2023-06-25 00:27:34.24266	2023-06-25 00:27:34.24266
205	27227082424	2022	1	1	2022-03-08	27227082424	V	RULET	ALICIA SUSANA	1	1870	AVELLANEDA	PJE ROBERTO PERFUMO	745			0	2023-06-25 00:27:34.257296	2023-06-25 00:27:34.257296
206	27230605578	2022	2	2	2022-03-21	27230605578	V	GRECCO ADRIANA GABRIELA		1	1824	lanus	Bueras	351			0	2023-06-25 00:27:34.267997	2023-06-25 00:27:34.267997
207	27231370841	2021	1	1	2022-02-16	27231370841	P	MOYANO	GABRIELA NELIDA	1	1872	SARANDI	BARADERO	3960			0	2023-06-25 00:27:34.277751	2023-06-25 00:27:34.277751
208	27237809152	2021	7	7	2022-02-04	27237809152	P	LO FARO	MARIEL CARINA	1	1870	AVELLANEDA	BERUTI	205	15	F	0	2023-06-25 00:27:34.285285	2023-06-25 00:27:34.285285
209	27237809152	2022	1	1	2022-03-20	27237809152	P	LO FARO	MARIEL CARINA	1	1870	AVELLANEDA	BERUTI	205	15	F	0	2023-06-25 00:27:34.306365	2023-06-25 00:27:34.306365
210	27238794027	2021	15	15	2022-03-09	27238794027	V	DE SALAZAR MONICA ELIZABETH		1	1875	Wilde	Merlo	5481	PB		0	2023-06-25 00:27:34.317863	2023-06-25 00:27:34.317863
211	27238794027	2022	3	3	2022-03-09	27238794027	V	DE SALAZAR MONICA ELIZABETH		1	1875	Wilde	Merlo	5481	PB		0	2023-06-25 00:27:34.336676	2023-06-25 00:27:34.336676
212	27250276422	2022	1	1	2022-03-15	27250276422	P	ESPINDOLA	NATALIA SILVINA	1	1824	LANUS	FRAY MAMERTO ESQUIU	1077			0	2023-06-25 00:27:34.350168	2023-06-25 00:27:34.350168
213	27251216652	2022	3	3	2022-04-11	27251216652	P	GUITERA	MARIA DEL ROSARIO	1	1876	BERNAL	DON BOSCO	440			0	2023-06-25 00:27:34.360442	2023-06-25 00:27:34.360442
214	27253986048	2021	7	7	2022-01-17	27253986048	V	CATAFFO MARIA ESTHER		1	1834	SAN JOSE	GABOTO	5628			0	2023-06-25 00:27:34.36538	2023-06-25 00:27:34.36538
215	27255514437	2021	2	2	2022-02-16	27255514437	V	SETRINI	LORENA ANDREA	1	1872	SARANDI	DR CARLOS CASAZZA	836			0	2023-06-25 00:27:34.374387	2023-06-25 00:27:34.374387
216	27260108072	2022	1	1	2022-02-22	27260108072	P	RAMUNDO	LORENA CECILIA	1	1872	SARANDI	PASTEUR	554			0	2023-06-25 00:27:34.383671	2023-06-25 00:27:34.383671
217	27264662872	2022	2	2	2022-03-11	27264662872	P	DOMINGUEZ RUIZ	LAURA MARCELA	1	1870	AVELLANEDA	CABILDO	1987			0	2023-06-25 00:27:34.388767	2023-06-25 00:27:34.388767
218	27275650590	2022	1	1	2022-03-23	27275650590	V	IORGI	SABRINA LILIAN	1	1870	AVELLANEDA	DIAZ VELEZ	499	2	2	0	2023-06-25 00:27:34.397734	2023-06-25 00:27:34.397734
219	27277784675	2021	3	3	2022-01-28	27277784675	P	ARLANDI GRANADOS	NATALIA ANDREA	0	1128	Ciudad de Buenos Aires	LOPEZ VICENTE	2261	4	A	0	2023-06-25 00:27:34.409546	2023-06-25 00:27:34.409546
220	27277784675	2022	1	1	2022-01-28	27277784675	P	ARLANDI GRANADOS	NATALIA ANDREA	0	1128	Ciudad de Buenos Aires	LOPEZ VICENTE	2261	4	A	0	2023-06-25 00:27:34.428408	2023-06-25 00:27:34.428408
221	27280858124	2021	1	1	2022-02-23	27280858124	P	TRONCOSO	ROSA SILVINA	17	9100	TRELEW	EDINSON	1398			0	2023-06-25 00:27:34.439529	2023-06-25 00:27:34.439529
222	27284184039	2021	1	1	2022-02-06	27284184039	V	ROMERO SABRINA VERONICA		1	1824	LANUS	BASAVILBASO	427			0	2023-06-25 00:27:34.451629	2023-06-25 00:27:34.451629
223	27287508072	2021	1	1	2022-01-12	27287508072	P	VALLEJOS	SILVIA ANALIA	1	1822	VALENTIN ALSINA	OSORIO	1600	2	9	0	2023-06-25 00:27:34.45639	2023-06-25 00:27:34.45639
224	27290066242	2022	1	1	2022-04-04	27290066242	P	GANINO	YESICA NADIA	1	1834	TEMPERLEY	CABRED	1490			0	2023-06-25 00:27:34.459793	2023-06-25 00:27:34.459793
225	27292776425	2021	8	8	2022-03-03	27292776425	P	ORTIZ	ANALIA GABRIELA	1	1870	AVELLANEDA	LIMAY	1470			0	2023-06-25 00:27:34.468266	2023-06-25 00:27:34.468266
226	27331485026	2021	1	1	2022-01-17	27331485026	P	GALLARDO	MARISA PAMELA	0	1425	Ciudad de Buenos Aires	ARENALES	2847	5	B	0	2023-06-25 00:27:34.482021	2023-06-25 00:27:34.482021
227	27340209929	2021	15	15	2022-01-26	27340209929	P	MORENO	KARINA	1	1874	VILLA DOMINICO	MERLO	5108			0	2023-06-25 00:27:34.486298	2023-06-25 00:27:34.486298
228	27340209929	2022	4	4	2022-04-05	27340209929	P	MORENO	KARINA	1	1874	VILLA DOMINICO	MERLO	5108			0	2023-06-25 00:27:34.493526	2023-06-25 00:27:34.493526
229	27354247483	2021	1	1	2022-02-07	27354247483	P	AZARIO	DAIANA JAQUELINE	1	1870	AVELLANEDA	Pavon	122			0	2023-06-25 00:27:34.499759	2023-06-25 00:27:34.499759
230	27361629731	2022	2	2	2022-04-11	27361629731	P	CHAMORRO	LORENA TAMARA	1	1874	VILLA DOMINICO	Bolivar	4707			0	2023-06-25 00:27:34.504882	2023-06-25 00:27:34.504882
231	27370537602	2021	1	1	2022-03-14	27370537602	V	SAMANIEGO ROCIO GIULIANA		1	1875	WILDE	CAMACUA	6285			0	2023-06-25 00:27:34.50998	2023-06-25 00:27:34.50998
232	27381551097	2021	1	1	2022-01-23	27381551097	P	MACIA	MACARENA ROCIO	1	1869	GERLI	AGUERO	1415			0	2023-06-25 00:27:34.515059	2023-06-25 00:27:34.515059
233	27410661514	2021	1	1	2022-01-06	27410661514	P	BAÑA	AYELEN LUCIANA	1	1872	SARANDI	LUIS MARIA CAMPOS	2927			0	2023-06-25 00:27:34.5204	2023-06-25 00:27:34.5204
234	27925229070	2021	18	18	2022-01-26	27925229070	P	BENECH	CLAUDIA ANDREA	1	1869	GERLI	CAMPICHUELO	1504			0	2023-06-25 00:27:34.527191	2023-06-25 00:27:34.527191
235	27925229070	2022	3	3	2022-03-02	27925229070	P	BENECH	CLAUDIA ANDREA	1	1869	GERLI	CAMPICHUELO	1504			0	2023-06-25 00:27:34.557266	2023-06-25 00:27:34.557266
236	27947155569	2021	9	9	2022-02-05	27947155569	P	NUNES MANFREDI	SABRINA	0	1153	Ciudad de Buenos Aires	GARAY JUAN DE AV.	737	13	R	0	2023-06-25 00:27:34.567908	2023-06-25 00:27:34.567908
\.


--
-- Data for Name: f572_presentacionb; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_presentacionb (id, cuit, periodo, envio, nropresentacion, fechapresentacion, emplcuit, empltipodoc, emplapellido, emplnombre, dirprovincia, dircp, dirlocalidad, dircalle, dirnro, dirpiso, dirdpto, agretcuit, agretdenominacion, file_id, createdat, updatedat) FROM stdin;
1	20184900689	2022	1	1	2022-04-13	20184900689	P	VALENTE	OSVALDO OSCAR	0	1268	Ciudad de Buenos Aires	ISABEL LA CATOLICA	1107	16	B			0	2023-06-25 00:24:02.742986	2023-06-25 00:24:02.742986
2	20273299190	2021	12	12	2022-02-09	20273299190	P	NUÑEZ	MARTIN SEBASTIAN	1	1874	VILLA DOMINICO	ALTOLAGUIRRE	38					0	2023-06-25 00:24:02.804489	2023-06-25 00:24:02.804489
3	20273299190	2022	3	3	2022-04-12	20273299190	P	NUÑEZ	MARTIN SEBASTIAN	1	1874	VILLA DOMINICO	ALTOLAGUIRRE	38					0	2023-06-25 00:24:02.805029	2023-06-25 00:24:02.805029
4	20952898184	2021	2	2	2022-02-05	20952898184	V	SILVA ABREU RIBEIRO DOS SANTOS ALEXANDRE		0	1091	Ciudad de Buenos Aires	PJE CARLOS GARDEL	3131					0	2023-06-25 00:24:02.899395	2023-06-25 00:24:02.899395
5	20952898184	2022	3	3	2022-03-25	20952898184	V	SILVA ABREU RIBEIRO DOS SANTOS ALEXANDRE		0	1091	Ciudad de Buenos Aires	PJE CARLOS GARDEL	3131					0	2023-06-25 00:24:02.899998	2023-06-25 00:24:02.899998
6	23076078149	2021	13	13	2022-01-18	23076078149	P	FARIÑA	OSCAR ALBERTO	1	1870	AVELLANEDA	E ZEBALLOS	2479					0	2023-06-25 00:24:02.900704	2023-06-25 00:24:02.900704
7	23076078149	2022	3	3	2022-04-12	23076078149	P	FARIÑA	OSCAR ALBERTO	1	1870	AVELLANEDA	E ZEBALLOS	2479					0	2023-06-25 00:24:02.901847	2023-06-25 00:24:02.901847
8	23162997564	2021	15	15	2022-01-08	23162997564	P	CESPEDES	MERCEDES ESTELA	0	1406	Ciudad de Buenos Aires	DIAZ AVELINO	1757		B			0	2023-06-25 00:24:02.911926	2023-06-25 00:24:02.911926
9	23162997564	2022	5	5	2022-04-04	23162997564	P	CESPEDES	MERCEDES ESTELA	0	1406	Ciudad de Buenos Aires	DIAZ AVELINO	1757		B			0	2023-06-25 00:24:02.912312	2023-06-25 00:24:02.912312
10	23175353119	2021	10	10	2022-03-04	23175353119	V	DEGLI ALBERTI OMAR		1	1826	REMEDIOS DE ESCALADA	29 de septiembre	3658	0	0			0	2023-06-25 00:24:02.912734	2023-06-25 00:24:02.912734
11	23175353119	2022	2	2	2022-04-01	23175353119	V	DEGLI ALBERTI OMAR		1	1826	REMEDIOS DE ESCALADA	29 de septiembre	3658	0	0			0	2023-06-25 00:24:02.913034	2023-06-25 00:24:02.913034
12	27132142969	2021	12	12	2022-01-06	27132142969	P	BRAWER	LAURA	0	1259	Ciudad de Buenos Aires	SALCEDO	3265		1			0	2023-06-25 00:24:03.02287	2023-06-25 00:24:03.02287
13	27132142969	2022	3	3	2022-04-05	27132142969	P	BRAWER	LAURA	0	1259	Ciudad de Buenos Aires	SALCEDO	3265		1			0	2023-06-25 00:24:03.023246	2023-06-25 00:24:03.023246
14	27161619421	2021	12	12	2022-01-05	27161619421	P	RIDOLFI	ROSA CARMEN	0	1427	Ciudad de Buenos Aires	CALDAS	180					0	2023-06-25 00:24:03.103692	2023-06-25 00:24:03.103692
15	27161619421	2022	4	4	2022-04-08	27161619421	P	RIDOLFI	ROSA CARMEN	0	1427	Ciudad de Buenos Aires	CALDAS	180					0	2023-06-25 00:24:03.104077	2023-06-25 00:24:03.104077
16	27179516212	2021	5	5	2022-03-09	27179516212	P	LOMBA	ANDREA FABIANA	1	1875	WILDE	LOBOS	358					0	2023-06-25 00:24:03.27012	2023-06-25 00:24:03.27012
17	27200232157	2021	12	12	2022-01-04	27200232157	P	BARRACCHIA	NANCI CLAUDIA	1	1870	AVELLANEDA	CARABELAS	1885					0	2023-06-25 00:24:03.296992	2023-06-25 00:24:03.296992
18	27200232157	2022	4	4	2022-04-13	27200232157	P	BARRACCHIA	NANCI CLAUDIA	1	1870	AVELLANEDA	CARABELAS	1885					0	2023-06-25 00:24:03.298041	2023-06-25 00:24:03.298041
19	27254739656	2021	10	10	2022-01-04	27254739656	P	BRULLO	LUCIANA YANINA	1	1874	VILLA DOMINICO	CHASCOMUS	1589					0	2023-06-25 00:24:03.576177	2023-06-25 00:24:03.576177
20	27254739656	2022	2	2	2022-04-03	27254739656	P	BRULLO	LUCIANA YANINA	1	1874	VILLA DOMINICO	CHASCOMUS	1589					0	2023-06-25 00:24:03.576632	2023-06-25 00:24:03.576632
21	27265810891	2022	3	3	2022-04-10	27265810891	P	DASSO	ADRIANA SILVIA	1	1872	SARANDI	DORREGO	2781					0	2023-06-25 00:24:03.600224	2023-06-25 00:24:03.600224
22	27948623035	2021	3	3	2022-01-18	27948623035	P	DONATO FERNANDES SOUZA	INARE	0	1153	Ciudad de Buenos Aires	GARAY JUAN DE AV.	737	1	1			0	2023-06-25 00:24:03.790495	2023-06-25 00:24:03.790495
\.


--
-- Data for Name: f572_relacionatributos; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_relacionatributos (grupo, codigoafip, descripafip, atributo, atributo_50, porc, active) FROM stdin;
AFPAR17	3	Hijo/a Menor de 18 Años	fam_hijos_100	fam_hijos_50	t	t
AFPAR17	33	Hijastro/a Incapacitado para el Trabajo	fam_hijos_disc_100	fam_hijos_disc_100	t	t
AFPAR17	31	Hijo/a Incapacitado para el Trabajo	fam_hijos_disc_50	fam_hijos_disc_50	t	t
AFPAR17	30	Hijastro/a Menor de 18 Años	fam_hijastros_100	fam_hijastros_50	t	t
AFPAR16	1	Cónyuge	fam_conyuge	fam_conyuge	t	t
AFPAR16	32	Hijastro/a Incapcacitado para el Trabajo	fam_hijos_disc_100	fam_hijos_disc_50	t	t
AFDEDUC	2	Primas de Seguro para el caso de muerte / riesgo de muerte	ded_seguros		f	t
AFDEDUC	1	Cuotas Médico-Asistenciales	ded_cuota_medica		f	t
AFDEDUC	3	Donaciones	ded_donaciones		f	t
AFDEDUC	4	Intereses Préstamo Hipotecario	ded_int_hipotecarios		f	t
AFDEDUC	5	Gastos de Sepelio	ded_gastos_sepelio		f	t
AFDEDUC	7	Gastos Médicos y Paramédicos	ded_gastos_medicos		f	t
AFDEDUC	8	Deducción del Personal Doméstico	ded_domestica		f	t
AFDEDUC	10	Vehiculos de Corredores y Viajantes de Comercio	ded_viajantes		f	t
AFDEDUC	22	Alquiler de Inmuebles destinados a casa habitación	ded_alquiler		f	t
AFDEDUC	23	Primas de Ahorro correspondientes a Seguros Mixtos	ded_seguros		f	t
AFDEDUC	24	Aportes correspondientes a Planes de Seguro de Retiro Privado	ded_retiro		f	t
AFDEDUC	25	Adquisición de Cuotapartes de Fondos Comunes de Retiro	ded_fondo_inversion		f	t
AFDEDUC	99	Otras deducciones	ded_otras		f	t
AFAJUST	1	Montos Retroactivos			f	t
AFTDOC	80	CUIT			f	t
AFPAR16	3	Hijo/a Menor de 24 Años	fam_hijos_100	fam_hijos_50	t	t
AFRPPAC	6	Impuestos sobre Créditos y Débitos en cuenta Bancaria	ret_imp_movim		f	t
AFRPPAC	20	Pago a Cuenta - Compra de Pasajes en efectivo	ret_pasajes_efec		f	t
AFRPPAC	12	Retenciones y Percepciones Aduaneras	ret_aduana		f	t
AFRPPAC	13	Pago a Cuenta - Compras en el Exterior	ret_compras_ext		f	t
AFRPPAC	14	Impuesto sobre los Movimientos de Fondos Propios o de Terceros	ret_imp_movim		f	t
AFRPPAC	15	Pago a Cuenta - Compra de Paquetes Turísticos	ret_turismo		f	t
AFRPPAC	16	Pago a Cuenta - Compra de Pasajes	ret_pasajes		f	t
AFRPPAC	17	Pago a Cuenta - Compra de Moneda Extranjera para Turismo / Transf. al Exterior	ret_compras_ext		f	t
AFRPPAC	18	Pago a Cuenta - Adquisición de moneda extranjera para tenencia de billetes extranjeros en el país	ret_dolares_tenencia		f	t
AFRPPAC	19	Pago a Cuenta - Compra de Paquetes Turísticos en efectivo	ret_pasajes_efec		f	t
AFPAR16	31	Hijo/a Incapacitado para el Trabajo	fam_hijos_disc_100	fam_hijos_disc_50	t	t
AFOEMPL	sac	Sueldo Anual Complementario	otro_sac		f	t
AFOEMPL	ajuste	Ajustes	otro_ajuste		f	t
AFOEMPL	exenoalc	Importe Conceptos Exentos / No Alcanzados en Ganancias	otro_ex_nogan		f	t
AFDEDUC	9	Aporte a Sociedades de Garantía Recíproca	ded_sociedades		f	t
AFDEDUC	21	Gastos de Adquisición de Indumentaria y Equipamiento para uso Exclusivo en el Lugar de Trabajo	ded_indumentaria		f	t
AFDEDUC	11	Períodos 2018 y anteriores: Gastos de Movilidad, Viáticos y Representaciones e Intereses de Corredores y Viajantes de Comercio Período 2019 en adelante: Gastos de Movilidad e Intereses de Corredores y Viajantes de Comercio	ded_viajantes		f	t
AFOEMPL	sind	Monto de Aportes Sindicales	otro_sindicato		f	t
AFTDOC	86	CUIL			f	t
AFOEMPL	ganbrut	Monto Ganancias Bruto	otro_gan_brut		f	t
AFOEMPL	retgan	Monto Retenciones del Impuesto a las Ganancias	otro_ret_gan		f	t
AFAJUST	2	Reintegros de Soc. de Garantia Recíprocas Art. 79 Párrafo 2 y Párrafo 3			f	t
AFTDOC	87	CDI			f	t
AFTDOC	96	DNI			f	t
AFTDOC	89	LC			f	t
AFTDOC	90	LE			f	t
AFTDOC	92	En Trámite			f	t
AFPROVI	1	Buenos Aires			f	t
AFPROVI	2	Catamarca			f	t
AFPROVI	3	Córdoba			f	t
AFPROVI	4	Corrientes			f	t
AFPROVI	5	Entre Ríos			f	t
AFPROVI	6	Jujuy			f	t
AFPROVI	7	Mendoza			f	t
AFPROVI	8	La Rioja			f	t
AFPROVI	9	Salta			f	t
AFPROVI	10	San Juan			f	t
AFPROVI	11	San Luis			f	t
AFPROVI	12	Santa Fe			f	t
AFPROVI	13	Santiago del Estero			f	t
AFPROVI	14	Tucumán			f	t
AFPROVI	16	Chaco			f	t
AFPROVI	17	Chubut			f	t
AFPROVI	18	Formosa			f	t
AFPROVI	19	Misiones			f	t
AFPROVI	20	Neuquén			f	t
AFPROVI	21	La Pampa			f	t
AFPROVI	22	Río Negro			f	t
AFPROVI	23	Santa Cruz			f	t
AFPROVI	24	Tierra del Fuego			f	t
AFPROVI	25	xxx			f	t
AFPROVI	0	Ciudad Autónoma de Buenos Aires			f	t
AFMODED	1	Aportes para fondos de Jubilación, Retiros, Pensiones o Subsidios destinados al ANSES			f	t
AFMODED	2	Cajas Provinciales o Municipales			f	t
AFMODED	3	Impuesto sobre los Créditos y Débitos en Cuenta Bancaria sin CBU [nota: reemplazado por Pago a Cuenta Cód. 14 – ver Tabla 9]			f	t
AFMODED	4	Beneficios Derivados de Regímenes que impliquen tratamientos Preferenciales que se Efectivicen Mediante Deducciones			f	t
AFMODED	5	Beneficios Derivados de Regímenes que impliquen tratamientos Preferenciales que No se Efectivicen Mediante Deducciones			f	t
AFMODED	6	Actores - Retribuciones Abonadas a Representantes - R.G. N° 2442/08			f	t
AFMODED	7	Cajas Complementarias de Previsión			f	t
AFMODED	8	Fondos Compensadores de Previsión			f	t
AFMODED	9	Otros			f	t
AFTTARJ	1	Tarjeta de Crédito / Compra			f	t
AFTTARJ	2	Tarjeta de Débito			f	t
AFIDTAR	1	MasterCard			f	t
AFIDTAR	2	Visa			f	t
AFIDTAR	3	American Express			f	t
AFIDTAR	4	Cabal			f	t
AFIDTAR	5	Italcred			f	t
AFIDTAR	6	Naranja			f	t
AFIDTAR	7	Nativa			f	t
AFIDTAR	8	Diners Club			f	t
AFIDTAR	99	Otra			f	t
AFTNORM	0	Ley			f	t
AFTNORM	1	Decreto			f	t
AFTNORM	2	RG			f	t
ADDADIC	1	x			f	t
AFPAR16	33	Padre			t	t
AFPAR16	34	Madre			t	t
AFPAR16	35	Nieto/a Meneor de 24 Años			t	t
AFPAR16	36	Nieto/a Incapacitado para el Trabajo			t	t
AFPAR16	37	Bisnieto/a Meneor de 24 Años			t	t
AFPAR16	38	Bisnieto/a Incapacitado para el Trabajo			t	t
AFPAR16	39	Abuelo/a			t	t
AFPAR16	40	Bisabuelo/a			t	t
AFPAR16	41	Padrastro/Madrastra			t	t
AFPAR16	42	Hermano/a Menor de 24 Años			t	t
AFPAR16	43	Hermano/a Incapacitado para el Trabajo			t	t
AFPAR16	44	Suegro/a			t	t
AFPAR16	45	Yerno/Nuera Menor de 24 Años			t	t
AFPAR16	46	Yerno/Nuera Incapacitado para el Trabajo			t	t
AFPAR16	30	Hijastro/a Menor de 24 Años			t	t
AFOEMPL	segsoc	Monto del Aporte a Seguridad Social	otro_seg_soc		f	t
AFOEMPL	obrasoc	Monto del Aporte a la Obra Social	otro_obra_soc		f	t
AFOEMPL	gastosmovviat	Gastos de Movilidad y Viáticos	otro_gs_viatic		f	t
AFOEMPL	horasextex	Importe Horas Extras Exentas	otro_hs_extr		f	t
AFOEMPL	horasextgr	Importe Horas Extras Gravadas	otro_hs_extgr		f	t
AFOEMPL	matdid	Importe Material Didáctico	otro_mat_didac		f	t
AFOEMPL	retribnohab	Monto de Retribuciones no habituales	otro_no_habit		f	t
AFPAR17	1	Cónyuge	FECDEVDESDE	fam_conyuge	t	t
\.


--
-- Data for Name: f572_relacionatributosgrp; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_relacionatributosgrp (obj, name, orderlist, property, active) FROM stdin;
AFPROVI	Provincias segun AFIP	1	\N	t
AFTDOC	Tipos de documento segun AFIP	2	\N	t
AFPAR16	Parentesco AFIP 2016	3	\N	t
AFPAR17	Parentesco AFIP 2017	4	\N	t
AFDEDUC	Deducciones AFIP 	5	\N	t
AFAJUST	Ajustes AFIP	7	\N	t
AFMODED	Motivos (deducciones) AFIP	6	\N	t
AFTTARJ	Tipos tarjetas AFIP	8	\N	t
AFIDTAR	ID  de tarjetas AFIP	9	\N	t
AFRPPAC	Retenciones, Percepciones y Pagos a Cuenta AFIP	10	\N	t
AFTNORM	Tipos de Norma AFIP	11	\N	t
ADDADIC	Datos Adicionales AFIP	12	\N	t
AFOEMPL	Campos Otros empleadores	13	\N	t
\.


--
-- Data for Name: f572_retperpagos; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_retperpagos (id, presentacion_id, tipo, tipodoc, nrodoc, denominacion, descbasica, descadicional, montototal) FROM stdin;
1	2	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		56646.53
2	5	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		70288.75
3	7	28	0	33537186009	HSBC BANK ARGENTINA SA	33537186009 - HSBC BANK ARGENTINA SA		790.68
4	8	27	0	30500008454	BANCO SANTANDER RIO SOCIEDAD ANONIMA	30500008454 - BANCO SANTANDER RIO SOCIEDAD ANONIMA		7352.10
5	18	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		28437.50
6	19	27	0	30500008454	BANCO SANTANDER RIO SOCIEDAD ANONIMA	30500008454 - BANCO SANTANDER RIO SOCIEDAD ANONIMA		19813.16
7	38	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		7297.50
8	39	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		14798.43
9	40	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		49245.00
10	44	27	0	30715949373	GLOBAL FINTECH S.A.	30715949373 - GLOBAL FINTECH S.A.		14028.00
11	45	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		14840.00
12	46	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		7542.50
13	47	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		13301.13
14	49	27	0	30500010912	BANCO DE LA NACION ARGENTINA	30500010912 - BANCO DE LA NACION ARGENTINA		77863.48
15	55	27	0	30500001735	BANCO DE GALICIA Y BUENOS AIRES S A U	30500001735 - BANCO DE GALICIA Y BUENOS AIRES S A U		27036.63
16	55	28	0	30500001735	BANCO DE GALICIA Y BUENOS AIRES S A U	30500001735 - BANCO DE GALICIA Y BUENOS AIRES S A U		813.75
17	57	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		7402.50
18	60	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		41842.50
19	62	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		68354.63
20	64	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		25086.25
21	64	28	0	30715778722	DLOCAL ARGENTINA S.A.	30715778722 - DLOCAL ARGENTINA S.A.		4739.63
22	66	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		69702.50
23	71	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		28656.25
24	73	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		56000.00
25	73	31	0	33710745159	AVANTRIP.COM S.R.L.	33710745159 - AVANTRIP.COM S.R.L.		51818.00
26	76	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		2007.60
27	82	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		62700.29
28	83	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		28140.00
29	85	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		14805.00
30	85	28	0	30712039295	NETFLIX ARGENTINA S.R.L.	30712039295 - NETFLIX ARGENTINA S.R.L.	Tarjeta de Crédito/Compra - Visa - Nro. ************3059	2788.80
31	85	28	0	30715446266	PPRO ARGENTINA S.A.	30715446266 - PPRO ARGENTINA S.A.		3526.25
32	89	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		44355.89
33	89	28	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		526.33
34	90	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		62877.50
35	96	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		83580.00
36	97	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		12687.50
37	101	27	0	30500008454	BANCO SANTANDER RIO SOCIEDAD ANONIMA	30500008454 - BANCO SANTANDER RIO SOCIEDAD ANONIMA		26472.25
38	101	28	0	30500008454	BANCO SANTANDER RIO SOCIEDAD ANONIMA	30500008454 - BANCO SANTANDER RIO SOCIEDAD ANONIMA		13831.83
39	103	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		63192.50
40	104	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		53932.36
41	105	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		7350.00
42	108	27	0	30999032083	BANCO DE LA CIUDAD DE BUENOS AIRES	30999032083 - BANCO DE LA CIUDAD DE BUENOS AIRES		43676.50
43	109	27	0	30500001735	BANCO DE GALICIA Y BUENOS AIRES S A U	30500001735 - BANCO DE GALICIA Y BUENOS AIRES S A U		7112.00
44	109	28	0	30500001735	BANCO DE GALICIA Y BUENOS AIRES S A U	30500001735 - BANCO DE GALICIA Y BUENOS AIRES S A U		4043.31
45	111	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		21971.25
46	113	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		22854.30
47	114	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		61811.79
48	115	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		21647.50
49	116	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		6247.50
50	118	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		7209.99
51	118	28	0	30641405554	AEROLINEAS ARGENTINAS SOCIEDAD ANONIMA	30641405554 - AEROLINEAS ARGENTINAS SOCIEDAD ANONIMA		21763.40
52	118	28	0	30999032083	BANCO DE LA CIUDAD DE BUENOS AIRES	30999032083 - BANCO DE LA CIUDAD DE BUENOS AIRES		12395.61
53	118	28	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		3577.66
54	118	29	0	30999032083	BANCO DE LA CIUDAD DE BUENOS AIRES	30999032083 - BANCO DE LA CIUDAD DE BUENOS AIRES		8736.44
55	120	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		56646.53
56	123	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		70288.75
57	125	28	0	33537186009	HSBC BANK ARGENTINA SA	33537186009 - HSBC BANK ARGENTINA SA		790.68
58	126	27	0	30500008454	BANCO SANTANDER RIO SOCIEDAD ANONIMA	30500008454 - BANCO SANTANDER RIO SOCIEDAD ANONIMA		7352.10
59	136	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		28437.50
60	137	27	0	30500008454	BANCO SANTANDER RIO SOCIEDAD ANONIMA	30500008454 - BANCO SANTANDER RIO SOCIEDAD ANONIMA		19813.16
61	156	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		7297.50
62	157	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		14798.43
63	158	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		49245.00
64	162	27	0	30715949373	GLOBAL FINTECH S.A.	30715949373 - GLOBAL FINTECH S.A.		14028.00
65	163	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		14840.00
66	164	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		7542.50
67	165	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		13301.13
68	167	27	0	30500010912	BANCO DE LA NACION ARGENTINA	30500010912 - BANCO DE LA NACION ARGENTINA		77863.48
69	173	27	0	30500001735	BANCO DE GALICIA Y BUENOS AIRES S A U	30500001735 - BANCO DE GALICIA Y BUENOS AIRES S A U		27036.63
70	173	28	0	30500001735	BANCO DE GALICIA Y BUENOS AIRES S A U	30500001735 - BANCO DE GALICIA Y BUENOS AIRES S A U		813.75
71	175	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		7402.50
72	178	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		41842.50
73	180	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		68354.63
74	182	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		25086.25
75	182	28	0	30715778722	DLOCAL ARGENTINA S.A.	30715778722 - DLOCAL ARGENTINA S.A.		4739.63
76	184	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		69702.50
77	189	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		28656.25
78	191	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		56000.00
79	191	31	0	33710745159	AVANTRIP.COM S.R.L.	33710745159 - AVANTRIP.COM S.R.L.		51818.00
80	194	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		2007.60
81	200	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		62700.29
82	201	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		28140.00
83	203	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		14805.00
84	203	28	0	30712039295	NETFLIX ARGENTINA S.R.L.	30712039295 - NETFLIX ARGENTINA S.R.L.	Tarjeta de Crédito/Compra - Visa - Nro. ************3059	2788.80
85	203	28	0	30715446266	PPRO ARGENTINA S.A.	30715446266 - PPRO ARGENTINA S.A.		3526.25
86	207	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		44355.89
87	207	28	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		526.33
88	208	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		62877.50
89	214	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		83580.00
90	215	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		12687.50
91	219	27	0	30500008454	BANCO SANTANDER RIO SOCIEDAD ANONIMA	30500008454 - BANCO SANTANDER RIO SOCIEDAD ANONIMA		26472.25
92	219	28	0	30500008454	BANCO SANTANDER RIO SOCIEDAD ANONIMA	30500008454 - BANCO SANTANDER RIO SOCIEDAD ANONIMA		13831.83
93	221	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		63192.50
94	222	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		53932.36
95	223	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		7350.00
96	226	27	0	30999032083	BANCO DE LA CIUDAD DE BUENOS AIRES	30999032083 - BANCO DE LA CIUDAD DE BUENOS AIRES		43676.50
97	227	27	0	30500001735	BANCO DE GALICIA Y BUENOS AIRES S A U	30500001735 - BANCO DE GALICIA Y BUENOS AIRES S A U		7112.00
98	227	28	0	30500001735	BANCO DE GALICIA Y BUENOS AIRES S A U	30500001735 - BANCO DE GALICIA Y BUENOS AIRES S A U		4043.31
99	229	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		21971.25
100	231	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		22854.30
101	232	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		61811.79
102	233	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		21647.50
103	234	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		6247.50
104	236	27	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		7209.99
105	236	28	0	30641405554	AEROLINEAS ARGENTINAS SOCIEDAD ANONIMA	30641405554 - AEROLINEAS ARGENTINAS SOCIEDAD ANONIMA		21763.40
106	236	28	0	30999032083	BANCO DE LA CIUDAD DE BUENOS AIRES	30999032083 - BANCO DE LA CIUDAD DE BUENOS AIRES		12395.61
107	236	28	0	33999242109	BANCO DE LA PROVINCIA DE BUENOS AIRES	33999242109 - BANCO DE LA PROVINCIA DE BUENOS AIRES		3577.66
108	236	29	0	30999032083	BANCO DE LA CIUDAD DE BUENOS AIRES	30999032083 - BANCO DE LA CIUDAD DE BUENOS AIRES		8736.44
\.


--
-- Data for Name: f572_retperpagosdetalle; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_retperpagosdetalle (id, retperpago_id, nombre, valor) FROM stdin;
1	3	tipoTarjeta	0
2	16	tipoTarjeta	0
3	21	tipoTarjeta	0
4	30	tipoTarjeta	1
5	30	idTarjeta	2
6	30	descripcionTarjeta	Visa
7	30	nroTarjeta	************3059
8	31	tipoTarjeta	0
9	33	tipoTarjeta	0
10	38	tipoTarjeta	0
11	44	tipoTarjeta	0
12	51	tipoTarjeta	0
13	52	tipoTarjeta	0
14	53	tipoTarjeta	0
15	54	tipoTarjeta	0
16	57	tipoTarjeta	0
17	70	tipoTarjeta	0
18	75	tipoTarjeta	0
19	84	tipoTarjeta	1
20	84	idTarjeta	2
21	84	descripcionTarjeta	Visa
22	84	nroTarjeta	************3059
23	85	tipoTarjeta	0
24	87	tipoTarjeta	0
25	92	tipoTarjeta	0
26	98	tipoTarjeta	0
27	105	tipoTarjeta	0
28	106	tipoTarjeta	0
29	107	tipoTarjeta	0
30	108	tipoTarjeta	0
\.


--
-- Data for Name: f572_retperpagosperiodo; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_retperpagosperiodo (id, retperpago_id, mesdesde, meshasta, montomensual) FROM stdin;
1	1	1	1	1.00
2	1	6	6	6.00
3	1	7	7	7.00
4	1	8	8	8.00
5	1	9	9	9.00
6	1	10	10	10.00
7	1	11	11	11.00
8	1	12	12	12.00
9	2	1	1	1.00
10	2	2	2	2.00
11	2	3	3	3.00
12	2	5	5	5.00
13	2	6	6	6.00
14	2	7	7	7.00
15	2	8	8	8.00
16	2	9	9	9.00
17	2	10	10	10.00
18	2	11	11	11.00
19	2	12	12	12.00
20	3	1	1	1.00
21	3	9	9	9.00
22	4	10	10	10.00
23	5	5	5	5.00
24	5	7	7	7.00
25	5	8	8	8.00
26	5	10	10	10.00
27	6	1	1	1.00
28	6	2	2	2.00
29	6	4	4	4.00
30	6	5	5	5.00
31	6	6	6	6.00
32	6	8	8	8.00
33	6	9	9	9.00
34	6	10	10	10.00
35	6	12	12	12.00
36	7	9	9	9.00
37	7	11	11	11.00
38	8	1	1	1.00
39	8	2	2	2.00
40	8	4	4	4.00
41	8	7	7	7.00
42	8	10	10	10.00
43	8	12	12	12.00
44	9	2	2	2.00
45	9	3	3	3.00
46	9	5	5	5.00
47	9	6	6	6.00
48	9	7	7	7.00
49	9	8	8	8.00
50	9	11	11	11.00
51	9	12	12	12.00
52	10	8	8	8.00
53	10	11	11	11.00
54	11	11	11	11.00
55	11	12	12	12.00
56	12	12	12	12.00
57	13	1	1	1.00
58	13	7	7	7.00
59	13	12	12	12.00
60	14	1	1	1.00
61	14	2	2	2.00
62	14	8	8	8.00
63	14	10	10	10.00
64	14	11	11	11.00
65	14	12	12	12.00
66	15	3	3	3.00
67	15	7	7	7.00
68	15	8	8	8.00
69	15	10	10	10.00
70	15	11	11	11.00
71	16	1	1	1.00
72	16	3	3	3.00
73	16	4	4	4.00
74	16	7	7	7.00
75	16	8	8	8.00
76	17	11	11	11.00
77	18	1	1	1.00
78	18	2	2	2.00
79	18	7	7	7.00
80	18	9	9	9.00
81	18	11	11	11.00
82	18	12	12	12.00
83	19	3	3	3.00
84	19	4	4	4.00
85	19	5	5	5.00
86	19	6	6	6.00
87	19	7	7	7.00
88	19	8	8	8.00
89	19	9	9	9.00
90	19	10	10	10.00
91	19	11	11	11.00
92	19	12	12	12.00
93	20	7	7	7.00
94	20	8	8	8.00
95	20	9	9	9.00
96	20	10	10	10.00
97	21	5	5	5.00
98	22	1	1	1.00
99	22	2	2	2.00
100	22	3	3	3.00
101	22	5	5	5.00
102	22	6	6	6.00
103	22	7	7	7.00
104	22	8	8	8.00
105	22	9	9	9.00
106	22	11	11	11.00
107	22	12	12	12.00
108	23	5	5	5.00
109	23	7	7	7.00
110	23	8	8	8.00
111	23	11	11	11.00
112	23	12	12	12.00
113	24	1	1	1.00
114	24	2	2	2.00
115	24	6	6	6.00
116	24	7	7	7.00
117	24	8	8	8.00
118	24	10	10	10.00
119	24	11	11	11.00
120	24	12	12	12.00
121	25	11	11	11.00
122	26	3	3	3.00
123	26	5	5	5.00
124	26	7	7	7.00
125	26	8	8	8.00
126	26	9	9	9.00
127	26	12	12	12.00
128	27	1	1	1.00
129	27	2	2	2.00
130	27	4	4	4.00
131	27	5	5	5.00
132	27	7	7	7.00
133	27	8	8	8.00
134	27	9	9	9.00
135	27	10	10	10.00
136	27	11	11	11.00
137	28	2	2	2.00
138	28	6	6	6.00
139	28	7	7	7.00
140	28	12	12	12.00
141	29	11	11	11.00
142	29	12	12	12.00
143	30	1	1	1.00
144	30	3	3	3.00
145	30	11	11	11.00
146	31	1	1	1.00
147	31	9	9	9.00
148	31	10	10	10.00
149	32	1	1	1.00
150	32	6	6	6.00
151	32	7	7	7.00
152	32	8	8	8.00
153	32	9	9	9.00
154	32	10	10	10.00
155	32	11	11	11.00
156	32	12	12	12.00
157	33	12	12	12.00
158	34	1	1	1.00
159	34	2	2	2.00
160	34	3	3	3.00
161	34	4	4	4.00
162	34	7	7	7.00
163	34	8	8	8.00
164	34	9	9	9.00
165	34	11	11	11.00
166	34	12	12	12.00
167	35	1	1	1.00
168	35	2	2	2.00
169	35	3	3	3.00
170	35	4	4	4.00
171	35	5	5	5.00
172	35	6	6	6.00
173	35	7	7	7.00
174	35	8	8	8.00
175	35	9	9	9.00
176	35	10	10	10.00
177	35	11	11	11.00
178	35	12	12	12.00
179	36	7	7	7.00
180	36	8	8	8.00
181	36	12	12	12.00
182	37	1	1	1.00
183	37	2	2	2.00
184	37	10	10	10.00
185	37	12	12	12.00
186	38	5	5	5.00
187	39	1	1	1.00
188	39	2	2	2.00
189	39	6	6	6.00
190	39	7	7	7.00
191	39	8	8	8.00
192	39	9	9	9.00
193	39	10	10	10.00
194	39	11	11	11.00
195	39	12	12	12.00
196	40	1	1	1.00
197	40	2	2	2.00
198	40	3	3	3.00
199	40	4	4	4.00
200	40	5	5	5.00
201	40	6	6	6.00
202	40	7	7	7.00
203	40	8	8	8.00
204	40	9	9	9.00
205	40	11	11	11.00
206	40	12	12	12.00
207	41	11	11	11.00
208	42	7	7	7.00
209	42	8	8	8.00
210	42	9	9	9.00
211	42	10	10	10.00
212	42	11	11	11.00
213	42	12	12	12.00
214	43	7	7	7.00
215	44	8	8	8.00
216	44	9	9	9.00
217	44	10	10	10.00
218	44	12	12	12.00
219	45	7	7	7.00
220	45	9	9	9.00
221	45	11	11	11.00
222	45	12	12	12.00
223	46	1	1	1.00
224	46	8	8	8.00
225	46	10	10	10.00
226	46	11	11	11.00
227	46	12	12	12.00
228	47	1	1	1.00
229	47	2	2	2.00
230	47	3	3	3.00
231	47	4	4	4.00
232	47	5	5	5.00
233	47	7	7	7.00
234	47	8	8	8.00
235	47	9	9	9.00
236	47	11	11	11.00
237	47	12	12	12.00
238	48	7	7	7.00
239	48	8	8	8.00
240	48	11	11	11.00
241	49	1	1	1.00
242	50	8	8	8.00
243	50	12	12	12.00
244	51	11	11	11.00
245	52	1	1	1.00
246	52	2	2	2.00
247	53	12	12	12.00
248	54	1	1	1.00
249	54	2	2	2.00
250	54	3	3	3.00
251	54	4	4	4.00
252	54	5	5	5.00
253	54	6	6	6.00
254	54	7	7	7.00
255	54	8	8	8.00
256	54	9	9	9.00
257	54	10	10	10.00
258	54	11	11	11.00
259	54	12	12	12.00
260	55	1	1	1.00
261	55	6	6	6.00
262	55	7	7	7.00
263	55	8	8	8.00
264	55	9	9	9.00
265	55	10	10	10.00
266	55	11	11	11.00
267	55	12	12	12.00
268	56	1	1	1.00
269	56	2	2	2.00
270	56	3	3	3.00
271	56	5	5	5.00
272	56	6	6	6.00
273	56	7	7	7.00
274	56	8	8	8.00
275	56	9	9	9.00
276	56	10	10	10.00
277	56	11	11	11.00
278	56	12	12	12.00
279	57	1	1	1.00
280	57	9	9	9.00
281	58	10	10	10.00
282	59	5	5	5.00
283	59	7	7	7.00
284	59	8	8	8.00
285	59	10	10	10.00
286	60	1	1	1.00
287	60	2	2	2.00
288	60	4	4	4.00
289	60	5	5	5.00
290	60	6	6	6.00
291	60	8	8	8.00
292	60	9	9	9.00
293	60	10	10	10.00
294	60	12	12	12.00
295	61	9	9	9.00
296	61	11	11	11.00
297	62	1	1	1.00
298	62	2	2	2.00
299	62	4	4	4.00
300	62	7	7	7.00
301	62	10	10	10.00
302	62	12	12	12.00
303	63	2	2	2.00
304	63	3	3	3.00
305	63	5	5	5.00
306	63	6	6	6.00
307	63	7	7	7.00
308	63	8	8	8.00
309	63	11	11	11.00
310	63	12	12	12.00
311	64	8	8	8.00
312	64	11	11	11.00
313	65	11	11	11.00
314	65	12	12	12.00
315	66	12	12	12.00
316	67	1	1	1.00
317	67	7	7	7.00
318	67	12	12	12.00
319	68	1	1	1.00
320	68	2	2	2.00
321	68	8	8	8.00
322	68	10	10	10.00
323	68	11	11	11.00
324	68	12	12	12.00
325	69	3	3	3.00
326	69	7	7	7.00
327	69	8	8	8.00
328	69	10	10	10.00
329	69	11	11	11.00
330	70	1	1	1.00
331	70	3	3	3.00
332	70	4	4	4.00
333	70	7	7	7.00
334	70	8	8	8.00
335	71	11	11	11.00
336	72	1	1	1.00
337	72	2	2	2.00
338	72	7	7	7.00
339	72	9	9	9.00
340	72	11	11	11.00
341	72	12	12	12.00
342	73	3	3	3.00
343	73	4	4	4.00
344	73	5	5	5.00
345	73	6	6	6.00
346	73	7	7	7.00
347	73	8	8	8.00
348	73	9	9	9.00
349	73	10	10	10.00
350	73	11	11	11.00
351	73	12	12	12.00
352	74	7	7	7.00
353	74	8	8	8.00
354	74	9	9	9.00
355	74	10	10	10.00
356	75	5	5	5.00
357	76	1	1	1.00
358	76	2	2	2.00
359	76	3	3	3.00
360	76	5	5	5.00
361	76	6	6	6.00
362	76	7	7	7.00
363	76	8	8	8.00
364	76	9	9	9.00
365	76	11	11	11.00
366	76	12	12	12.00
367	77	5	5	5.00
368	77	7	7	7.00
369	77	8	8	8.00
370	77	11	11	11.00
371	77	12	12	12.00
372	78	1	1	1.00
373	78	2	2	2.00
374	78	6	6	6.00
375	78	7	7	7.00
376	78	8	8	8.00
377	78	10	10	10.00
378	78	11	11	11.00
379	78	12	12	12.00
380	79	11	11	11.00
381	80	3	3	3.00
382	80	5	5	5.00
383	80	7	7	7.00
384	80	8	8	8.00
385	80	9	9	9.00
386	80	12	12	12.00
387	81	1	1	1.00
388	81	2	2	2.00
389	81	4	4	4.00
390	81	5	5	5.00
391	81	7	7	7.00
392	81	8	8	8.00
393	81	9	9	9.00
394	81	10	10	10.00
395	81	11	11	11.00
396	82	2	2	2.00
397	82	6	6	6.00
398	82	7	7	7.00
399	82	12	12	12.00
400	83	11	11	11.00
401	83	12	12	12.00
402	84	1	1	1.00
403	84	3	3	3.00
404	84	11	11	11.00
405	85	1	1	1.00
406	85	9	9	9.00
407	85	10	10	10.00
408	86	1	1	1.00
409	86	6	6	6.00
410	86	7	7	7.00
411	86	8	8	8.00
412	86	9	9	9.00
413	86	10	10	10.00
414	86	11	11	11.00
415	86	12	12	12.00
416	87	12	12	12.00
417	88	1	1	1.00
418	88	2	2	2.00
419	88	3	3	3.00
420	88	4	4	4.00
421	88	7	7	7.00
422	88	8	8	8.00
423	88	9	9	9.00
424	88	11	11	11.00
425	88	12	12	12.00
426	89	1	1	1.00
427	89	2	2	2.00
428	89	3	3	3.00
429	89	4	4	4.00
430	89	5	5	5.00
431	89	6	6	6.00
432	89	7	7	7.00
433	89	8	8	8.00
434	89	9	9	9.00
435	89	10	10	10.00
436	89	11	11	11.00
437	89	12	12	12.00
438	90	7	7	7.00
439	90	8	8	8.00
440	90	12	12	12.00
441	91	1	1	1.00
442	91	2	2	2.00
443	91	10	10	10.00
444	91	12	12	12.00
445	92	5	5	5.00
446	93	1	1	1.00
447	93	2	2	2.00
448	93	6	6	6.00
449	93	7	7	7.00
450	93	8	8	8.00
451	93	9	9	9.00
452	93	10	10	10.00
453	93	11	11	11.00
454	93	12	12	12.00
455	94	1	1	1.00
456	94	2	2	2.00
457	94	3	3	3.00
458	94	4	4	4.00
459	94	5	5	5.00
460	94	6	6	6.00
461	94	7	7	7.00
462	94	8	8	8.00
463	94	9	9	9.00
464	94	11	11	11.00
465	94	12	12	12.00
466	95	11	11	11.00
467	96	7	7	7.00
468	96	8	8	8.00
469	96	9	9	9.00
470	96	10	10	10.00
471	96	11	11	11.00
472	96	12	12	12.00
473	97	7	7	7.00
474	98	8	8	8.00
475	98	9	9	9.00
476	98	10	10	10.00
477	98	12	12	12.00
478	99	7	7	7.00
479	99	9	9	9.00
480	99	11	11	11.00
481	99	12	12	12.00
482	100	1	1	1.00
483	100	8	8	8.00
484	100	10	10	10.00
485	100	11	11	11.00
486	100	12	12	12.00
487	101	1	1	1.00
488	101	2	2	2.00
489	101	3	3	3.00
490	101	4	4	4.00
491	101	5	5	5.00
492	101	7	7	7.00
493	101	8	8	8.00
494	101	9	9	9.00
495	101	11	11	11.00
496	101	12	12	12.00
497	102	7	7	7.00
498	102	8	8	8.00
499	102	11	11	11.00
500	103	1	1	1.00
501	104	8	8	8.00
502	104	12	12	12.00
503	105	11	11	11.00
504	106	1	1	1.00
505	106	2	2	2.00
506	107	12	12	12.00
507	108	1	1	1.00
508	108	2	2	2.00
509	108	3	3	3.00
510	108	4	4	4.00
511	108	5	5	5.00
512	108	6	6	6.00
513	108	7	7	7.00
514	108	8	8	8.00
515	108	9	9	9.00
516	108	10	10	10.00
517	108	11	11	11.00
518	108	12	12	12.00
\.


--
-- Data for Name: f572_sajustes; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_sajustes (id, presentacion_id, tipo, cuit, denominacion, descbasica, descadicional, montototal) FROM stdin;
\.


--
-- Data for Name: f572_sajustesdetalle; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_sajustesdetalle (id, ajuste_id, nombre, valor) FROM stdin;
\.


--
-- Data for Name: f572_siradigconceptos; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_siradigconceptos (id, legajo, cuit, anio, mes, nrover, atributo, valor, createdat, updatedat, estadoliq) FROM stdin;
1	15485	20106503134	2022	1	3	ded_cuota_medica	60350.01	2023-06-25 00:24:02.459169	2023-06-25 00:24:02.459169	
2	15485	20106503134	2022	2	3	ded_cuota_medica	60350.01	2023-06-25 00:24:02.461158	2023-06-25 00:24:02.461158	
3	15485	20106503134	2022	3	3	ded_cuota_medica	63970.00	2023-06-25 00:24:02.462389	2023-06-25 00:24:02.462389	
4	39187	20114928233	2022	1	4	ded_cuota_medica	34584.64	2023-06-25 00:24:02.476256	2023-06-25 00:24:02.476256	
5	39187	20114928233	2022	2	4	ded_cuota_medica	34548.64	2023-06-25 00:24:02.476687	2023-06-25 00:24:02.476687	
6	39187	20114928233	2022	3	4	ded_cuota_medica	34548.64	2023-06-25 00:24:02.476929	2023-06-25 00:24:02.476929	
7	39187	20114928233	2022	4	4	ded_cuota_medica	40891.78	2023-06-25 00:24:02.477299	2023-06-25 00:24:02.477299	
8	18958	20120856511	2022	1	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.482381	2023-06-25 00:24:02.482381	
9	18958	20120856511	2022	2	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.4827	2023-06-25 00:24:02.4827	
10	18958	20120856511	2022	3	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.482944	2023-06-25 00:24:02.482944	
11	18958	20120856511	2022	4	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.48319	2023-06-25 00:24:02.48319	
12	18958	20120856511	2022	5	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.483407	2023-06-25 00:24:02.483407	
13	18958	20120856511	2022	6	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.483621	2023-06-25 00:24:02.483621	
14	18958	20120856511	2022	7	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.483842	2023-06-25 00:24:02.483842	
15	18958	20120856511	2022	8	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.484058	2023-06-25 00:24:02.484058	
16	18958	20120856511	2022	9	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.484267	2023-06-25 00:24:02.484267	
17	18958	20120856511	2022	10	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.484477	2023-06-25 00:24:02.484477	
18	18958	20120856511	2022	11	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.484688	2023-06-25 00:24:02.484688	
19	18958	20120856511	2022	12	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.484894	2023-06-25 00:24:02.484894	
20	43030	20128013971	2021	10	2	ded_donaciones	60000.00	2023-06-25 00:24:02.501086	2023-06-25 00:24:02.501086	
21	18769	20142476089	2021	12	16	ded_cuota_medica	7416.30	2023-06-25 00:24:02.510327	2023-06-25 00:24:02.510327	
22	18769	20142476089	2021	9	16	ded_donaciones	15000.00	2023-06-25 00:24:02.511131	2023-06-25 00:24:02.511131	
23	18769	20142476089	2021	10	16	ded_donaciones	50000.00	2023-06-25 00:24:02.511479	2023-06-25 00:24:02.511479	
24	18769	20142476089	2021	1	16	ded_domestica	12363.25	2023-06-25 00:24:02.512005	2023-06-25 00:24:02.512005	
25	18769	20142476089	2021	2	16	ded_domestica	12363.35	2023-06-25 00:24:02.512328	2023-06-25 00:24:02.512328	
26	18769	20142476089	2021	3	16	ded_domestica	12363.00	2023-06-25 00:24:02.512612	2023-06-25 00:24:02.512612	
27	18769	20142476089	2021	4	16	ded_domestica	12363.00	2023-06-25 00:24:02.512792	2023-06-25 00:24:02.512792	
28	18769	20142476089	2021	5	16	ded_domestica	12464.22	2023-06-25 00:24:02.513092	2023-06-25 00:24:02.513092	
29	18769	20142476089	2021	6	16	ded_domestica	18499.34	2023-06-25 00:24:02.513396	2023-06-25 00:24:02.513396	
30	18769	20142476089	2021	7	16	ded_domestica	12000.00	2023-06-25 00:24:02.513709	2023-06-25 00:24:02.513709	
31	18769	20142476089	2021	10	16	ded_domestica	28500.00	2023-06-25 00:24:02.514144	2023-06-25 00:24:02.514144	
32	18769	20142476089	2021	11	16	ded_domestica	33000.00	2023-06-25 00:24:02.514443	2023-06-25 00:24:02.514443	
33	18769	20142476089	2021	12	16	ded_domestica	49500.00	2023-06-25 00:24:02.514732	2023-06-25 00:24:02.514732	
34	18769	20142476089	2021	1	16	fam_hijos_100	100.00	2023-06-25 00:24:02.515188	2023-06-25 00:24:02.515188	
35	18769	20142476089	2021	2	16	fam_hijos_100	100.00	2023-06-25 00:24:02.515433	2023-06-25 00:24:02.515433	
36	18769	20142476089	2021	3	16	fam_hijos_100	100.00	2023-06-25 00:24:02.51566	2023-06-25 00:24:02.51566	
37	18769	20142476089	2021	4	16	fam_hijos_100	100.00	2023-06-25 00:24:02.515854	2023-06-25 00:24:02.515854	
38	18769	20142476089	2021	5	16	fam_hijos_100	100.00	2023-06-25 00:24:02.516071	2023-06-25 00:24:02.516071	
39	18769	20142476089	2021	6	16	fam_hijos_100	100.00	2023-06-25 00:24:02.516255	2023-06-25 00:24:02.516255	
40	18769	20142476089	2021	7	16	fam_hijos_100	100.00	2023-06-25 00:24:02.516444	2023-06-25 00:24:02.516444	
41	18769	20142476089	2021	8	16	fam_hijos_100	100.00	2023-06-25 00:24:02.516633	2023-06-25 00:24:02.516633	
42	18769	20142476089	2021	9	16	fam_hijos_100	100.00	2023-06-25 00:24:02.516815	2023-06-25 00:24:02.516815	
43	18769	20142476089	2021	10	16	fam_hijos_100	100.00	2023-06-25 00:24:02.517007	2023-06-25 00:24:02.517007	
44	18769	20142476089	2021	11	16	fam_hijos_100	100.00	2023-06-25 00:24:02.517232	2023-06-25 00:24:02.517232	
45	18769	20142476089	2021	12	16	fam_hijos_100	100.00	2023-06-25 00:24:02.517972	2023-06-25 00:24:02.517972	
46	18769	20142476089	2022	1	5	ded_cuota_medica	5775.00	2023-06-25 00:24:02.524501	2023-06-25 00:24:02.524501	
47	18769	20142476089	2022	3	5	ded_domestica	15891.95	2023-06-25 00:24:02.525296	2023-06-25 00:24:02.525296	
48	18769	20142476089	2022	4	5	ded_domestica	40000.00	2023-06-25 00:24:02.525803	2023-06-25 00:24:02.525803	
49	18769	20142476089	2022	1	5	ded_domestica	23991.36	2023-06-25 00:24:02.526512	2023-06-25 00:24:02.526512	
50	18769	20142476089	2022	2	5	ded_domestica	11512.00	2023-06-25 00:24:02.526962	2023-06-25 00:24:02.526962	
51	18769	20142476089	2022	1	5	fam_hijos_100	100.00	2023-06-25 00:24:02.527633	2023-06-25 00:24:02.527633	
52	18769	20142476089	2022	2	5	fam_hijos_100	100.00	2023-06-25 00:24:02.527897	2023-06-25 00:24:02.527897	
53	18769	20142476089	2022	3	5	fam_hijos_100	100.00	2023-06-25 00:24:02.528077	2023-06-25 00:24:02.528077	
54	18769	20142476089	2022	4	5	fam_hijos_100	100.00	2023-06-25 00:24:02.528281	2023-06-25 00:24:02.528281	
55	18769	20142476089	2022	5	5	fam_hijos_100	100.00	2023-06-25 00:24:02.528486	2023-06-25 00:24:02.528486	
56	18769	20142476089	2022	6	5	fam_hijos_100	100.00	2023-06-25 00:24:02.528658	2023-06-25 00:24:02.528658	
57	18769	20142476089	2022	7	5	fam_hijos_100	100.00	2023-06-25 00:24:02.528832	2023-06-25 00:24:02.528832	
58	14397	20145571708	2022	1	1	fam_hijos_100	50.00	2023-06-25 00:24:02.532553	2023-06-25 00:24:02.532553	
59	14397	20145571708	2022	2	1	fam_hijos_100	50.00	2023-06-25 00:24:02.532772	2023-06-25 00:24:02.532772	
60	14397	20145571708	2022	3	1	fam_hijos_100	50.00	2023-06-25 00:24:02.532943	2023-06-25 00:24:02.532943	
61	14397	20145571708	2022	4	1	fam_hijos_100	50.00	2023-06-25 00:24:02.533117	2023-06-25 00:24:02.533117	
62	17174	20148364215	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:02.539092	2023-06-25 00:24:02.539092	
63	17174	20148364215	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:02.5394	2023-06-25 00:24:02.5394	
64	17174	20148364215	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:02.539673	2023-06-25 00:24:02.539673	
65	17174	20148364215	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:02.539927	2023-06-25 00:24:02.539927	
66	17174	20148364215	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:02.540115	2023-06-25 00:24:02.540115	
67	17174	20148364215	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:02.540298	2023-06-25 00:24:02.540298	
68	17174	20148364215	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:02.540472	2023-06-25 00:24:02.540472	
69	17174	20148364215	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:02.540672	2023-06-25 00:24:02.540672	
70	17174	20148364215	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:02.540842	2023-06-25 00:24:02.540842	
71	17174	20148364215	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:02.541036	2023-06-25 00:24:02.541036	
72	17174	20148364215	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:02.541292	2023-06-25 00:24:02.541292	
73	17714	20166806330	2022	1	1	ded_cuota_medica	10792.51	2023-06-25 00:24:02.545154	2023-06-25 00:24:02.545154	
74	17714	20166806330	2022	2	1	ded_cuota_medica	10698.22	2023-06-25 00:24:02.54614	2023-06-25 00:24:02.54614	
75	17714	20166806330	2022	3	1	ded_cuota_medica	9626.13	2023-06-25 00:24:02.548407	2023-06-25 00:24:02.548407	
76	18540	20170309430	2021	1	4	otro_obra_soc	2696.97	2023-06-25 00:24:02.567106	2023-06-25 00:24:02.567106	
77	18540	20170309430	2021	1	4	otro_seg_soc	14383.84	2023-06-25 00:24:02.567483	2023-06-25 00:24:02.567483	
78	18540	20170309430	2021	1	4	otro_sindicato	4045.45	2023-06-25 00:24:02.567782	2023-06-25 00:24:02.567782	
79	18540	20170309430	2021	1	4	otro_gan_brut	92528.98	2023-06-25 00:24:02.568067	2023-06-25 00:24:02.568067	
80	18540	20170309430	2021	2	4	otro_sindicato	4045.45	2023-06-25 00:24:02.568668	2023-06-25 00:24:02.568668	
81	18540	20170309430	2021	2	4	otro_gan_brut	92528.98	2023-06-25 00:24:02.568951	2023-06-25 00:24:02.568951	
82	18540	20170309430	2021	2	4	otro_obra_soc	2696.97	2023-06-25 00:24:02.569213	2023-06-25 00:24:02.569213	
83	18540	20170309430	2021	2	4	otro_seg_soc	14383.84	2023-06-25 00:24:02.569439	2023-06-25 00:24:02.569439	
84	18540	20170309430	2021	3	4	otro_sindicato	4541.80	2023-06-25 00:24:02.569934	2023-06-25 00:24:02.569934	
85	18540	20170309430	2021	3	4	otro_gan_brut	104058.93	2023-06-25 00:24:02.570198	2023-06-25 00:24:02.570198	
86	18540	20170309430	2021	3	4	otro_obra_soc	3027.87	2023-06-25 00:24:02.57044	2023-06-25 00:24:02.57044	
87	18540	20170309430	2021	3	4	otro_seg_soc	16148.63	2023-06-25 00:24:02.570666	2023-06-25 00:24:02.570666	
88	18540	20170309430	2021	4	4	otro_gan_brut	104058.93	2023-06-25 00:24:02.571122	2023-06-25 00:24:02.571122	
89	18540	20170309430	2021	4	4	otro_sindicato	4541.80	2023-06-25 00:24:02.571329	2023-06-25 00:24:02.571329	
90	18540	20170309430	2021	4	4	otro_obra_soc	3027.87	2023-06-25 00:24:02.571539	2023-06-25 00:24:02.571539	
91	18540	20170309430	2021	4	4	otro_seg_soc	16148.63	2023-06-25 00:24:02.57174	2023-06-25 00:24:02.57174	
92	18540	20170309430	2021	5	4	otro_obra_soc	3027.87	2023-06-25 00:24:02.57218	2023-06-25 00:24:02.57218	
93	18540	20170309430	2021	5	4	otro_seg_soc	4541.80	2023-06-25 00:24:02.572407	2023-06-25 00:24:02.572407	
94	18540	20170309430	2021	5	4	otro_sindicato	4541.80	2023-06-25 00:24:02.572626	2023-06-25 00:24:02.572626	
95	18540	20170309430	2021	5	4	otro_gan_brut	104058.93	2023-06-25 00:24:02.572837	2023-06-25 00:24:02.572837	
96	18540	20170309430	2021	6	4	otro_obra_soc	4551.80	2023-06-25 00:24:02.573289	2023-06-25 00:24:02.573289	
97	18540	20170309430	2021	6	4	otro_seg_soc	24222.94	2023-06-25 00:24:02.573557	2023-06-25 00:24:02.573557	
98	18540	20170309430	2021	6	4	otro_gan_brut	104058.93	2023-06-25 00:24:02.573797	2023-06-25 00:24:02.573797	
99	18540	20170309430	2021	6	4	otro_sac	50464.46	2023-06-25 00:24:02.574029	2023-06-25 00:24:02.574029	
100	18540	20170309430	2021	6	4	otro_sindicato	6812.70	2023-06-25 00:24:02.574254	2023-06-25 00:24:02.574254	
101	18540	20170309430	2021	7	4	otro_sindicato	5225.40	2023-06-25 00:24:02.574685	2023-06-25 00:24:02.574685	
102	18540	20170309430	2021	7	4	otro_gan_brut	119249.93	2023-06-25 00:24:02.574902	2023-06-25 00:24:02.574902	
103	18540	20170309430	2021	7	4	otro_obra_soc	3483.60	2023-06-25 00:24:02.575108	2023-06-25 00:24:02.575108	
104	18540	20170309430	2021	7	4	otro_seg_soc	18579.19	2023-06-25 00:24:02.575324	2023-06-25 00:24:02.575324	
105	18540	20170309430	2021	8	4	otro_gan_brut	119249.93	2023-06-25 00:24:02.575744	2023-06-25 00:24:02.575744	
106	18540	20170309430	2021	8	4	otro_sindicato	5225.40	2023-06-25 00:24:02.575969	2023-06-25 00:24:02.575969	
107	18540	20170309430	2021	8	4	otro_obra_soc	3483.60	2023-06-25 00:24:02.576222	2023-06-25 00:24:02.576222	
108	18540	20170309430	2021	8	4	otro_seg_soc	18579.19	2023-06-25 00:24:02.576457	2023-06-25 00:24:02.576457	
109	18540	20170309430	2021	9	4	otro_obra_soc	3611.48	2023-06-25 00:24:02.576925	2023-06-25 00:24:02.576925	
110	18540	20170309430	2021	9	4	otro_seg_soc	19261.25	2023-06-25 00:24:02.577151	2023-06-25 00:24:02.577151	
111	18540	20170309430	2021	9	4	otro_sindicato	5417.23	2023-06-25 00:24:02.577541	2023-06-25 00:24:02.577541	
112	18540	20170309430	2021	9	4	otro_gan_brut	124212.83	2023-06-25 00:24:02.577851	2023-06-25 00:24:02.577851	
113	18540	20170309430	2021	10	4	otro_sindicato	5590.22	2023-06-25 00:24:02.578303	2023-06-25 00:24:02.578303	
114	18540	20170309430	2021	10	4	otro_gan_brut	128057.08	2023-06-25 00:24:02.578566	2023-06-25 00:24:02.578566	
115	18540	20170309430	2021	10	4	otro_obra_soc	3726.81	2023-06-25 00:24:02.578822	2023-06-25 00:24:02.578822	
116	18540	20170309430	2021	10	4	otro_seg_soc	19876.33	2023-06-25 00:24:02.57908	2023-06-25 00:24:02.57908	
117	18540	20170309430	2021	11	4	otro_sindicato	5909.93	2023-06-25 00:24:02.57953	2023-06-25 00:24:02.57953	
118	18540	20170309430	2021	11	4	otro_gan_brut	131331.85	2023-06-25 00:24:02.579787	2023-06-25 00:24:02.579787	
119	18540	20170309430	2021	11	4	otro_obra_soc	3939.96	2023-06-25 00:24:02.580041	2023-06-25 00:24:02.580041	
120	18540	20170309430	2021	11	4	otro_seg_soc	21013.10	2023-06-25 00:24:02.580276	2023-06-25 00:24:02.580276	
121	18540	20170309430	2021	12	4	otro_sac	65665.92	2023-06-25 00:24:02.580751	2023-06-25 00:24:02.580751	
122	18540	20170309430	2021	12	4	otro_sindicato	6152.70	2023-06-25 00:24:02.581062	2023-06-25 00:24:02.581062	
123	18540	20170309430	2021	12	4	otro_gan_brut	136726.63	2023-06-25 00:24:02.581347	2023-06-25 00:24:02.581347	
124	18540	20170309430	2021	12	4	otro_obra_soc	4101.80	2023-06-25 00:24:02.581637	2023-06-25 00:24:02.581637	
125	18540	20170309430	2021	12	4	otro_seg_soc	21876.26	2023-06-25 00:24:02.581886	2023-06-25 00:24:02.581886	
126	18540	20170309430	2021	1	4	otro_obra_soc	1245.31	2023-06-25 00:24:02.583356	2023-06-25 00:24:02.583356	
127	18540	20170309430	2021	1	4	otro_seg_soc	6641.64	2023-06-25 00:24:02.583679	2023-06-25 00:24:02.583679	
128	18540	20170309430	2021	1	4	otro_sindicato	1867.96	2023-06-25 00:24:02.583952	2023-06-25 00:24:02.583952	
129	18540	20170309430	2021	1	4	otro_gan_brut	44140.20	2023-06-25 00:24:02.584234	2023-06-25 00:24:02.584234	
130	18540	20170309430	2021	2	4	otro_obra_soc	1245.31	2023-06-25 00:24:02.585553	2023-06-25 00:24:02.585553	
131	18540	20170309430	2021	2	4	otro_seg_soc	6641.64	2023-06-25 00:24:02.586139	2023-06-25 00:24:02.586139	
132	18540	20170309430	2021	2	4	otro_gan_brut	44140.20	2023-06-25 00:24:02.586956	2023-06-25 00:24:02.586956	
133	18540	20170309430	2021	2	4	otro_sindicato	1867.96	2023-06-25 00:24:02.587401	2023-06-25 00:24:02.587401	
134	18540	20170309430	2021	3	4	otro_sindicato	2140.70	2023-06-25 00:24:02.588118	2023-06-25 00:24:02.588118	
135	18540	20170309430	2021	3	4	otro_gan_brut	50701.17	2023-06-25 00:24:02.58853	2023-06-25 00:24:02.58853	
136	18540	20170309430	2021	3	4	otro_obra_soc	1427.14	2023-06-25 00:24:02.58894	2023-06-25 00:24:02.58894	
137	18540	20170309430	2021	3	4	otro_seg_soc	7611.39	2023-06-25 00:24:02.589359	2023-06-25 00:24:02.589359	
138	18540	20170309430	2021	4	4	otro_obra_soc	1427.14	2023-06-25 00:24:02.59007	2023-06-25 00:24:02.59007	
139	18540	20170309430	2021	4	4	otro_seg_soc	7611.39	2023-06-25 00:24:02.59044	2023-06-25 00:24:02.59044	
140	18540	20170309430	2021	4	4	otro_gan_brut	50701.17	2023-06-25 00:24:02.590818	2023-06-25 00:24:02.590818	
141	18540	20170309430	2021	4	4	otro_sindicato	2140.70	2023-06-25 00:24:02.591187	2023-06-25 00:24:02.591187	
142	18540	20170309430	2021	5	4	otro_sindicato	2140.70	2023-06-25 00:24:02.591824	2023-06-25 00:24:02.591824	
143	18540	20170309430	2021	5	4	otro_gan_brut	48701.17	2023-06-25 00:24:02.592149	2023-06-25 00:24:02.592149	
144	18540	20170309430	2021	5	4	otro_seg_soc	7611.39	2023-06-25 00:24:02.592418	2023-06-25 00:24:02.592418	
145	18540	20170309430	2021	5	4	otro_obra_soc	1427.17	2023-06-25 00:24:02.592985	2023-06-25 00:24:02.592985	
146	18540	20170309430	2021	6	4	otro_obra_soc	2140.71	2023-06-25 00:24:02.593468	2023-06-25 00:24:02.593468	
147	18540	20170309430	2021	6	4	otro_seg_soc	11417.08	2023-06-25 00:24:02.593724	2023-06-25 00:24:02.593724	
148	18540	20170309430	2021	6	4	otro_sac	23785.58	2023-06-25 00:24:02.593976	2023-06-25 00:24:02.593976	
149	18540	20170309430	2021	6	4	otro_sindicato	3240.74	2023-06-25 00:24:02.594229	2023-06-25 00:24:02.594229	
150	18540	20170309430	2021	6	4	otro_gan_brut	48701.17	2023-06-25 00:24:02.594474	2023-06-25 00:24:02.594474	
151	18540	20170309430	2021	7	4	otro_sindicato	2453.99	2023-06-25 00:24:02.594896	2023-06-25 00:24:02.594896	
152	18540	20170309430	2021	7	4	otro_gan_brut	57663.17	2023-06-25 00:24:02.595157	2023-06-25 00:24:02.595157	
153	18540	20170309430	2021	7	4	otro_seg_soc	8725.31	2023-06-25 00:24:02.595389	2023-06-25 00:24:02.595389	
154	18540	20170309430	2021	7	4	otro_obra_soc	1636.00	2023-06-25 00:24:02.595619	2023-06-25 00:24:02.595619	
155	18540	20170309430	2021	8	4	otro_obra_soc	1636.00	2023-06-25 00:24:02.59604	2023-06-25 00:24:02.59604	
156	18540	20170309430	2021	8	4	otro_seg_soc	8725.31	2023-06-25 00:24:02.596282	2023-06-25 00:24:02.596282	
157	18540	20170309430	2021	8	4	otro_sindicato	2453.99	2023-06-25 00:24:02.596521	2023-06-25 00:24:02.596521	
158	18540	20170309430	2021	8	4	otro_gan_brut	57663.17	2023-06-25 00:24:02.596759	2023-06-25 00:24:02.596759	
159	18540	20170309430	2021	9	4	otro_sindicato	2511.94	2023-06-25 00:24:02.597188	2023-06-25 00:24:02.597188	
160	18540	20170309430	2021	9	4	otro_gan_brut	59650.96	2023-06-25 00:24:02.598006	2023-06-25 00:24:02.598006	
161	18540	20170309430	2021	9	4	otro_obra_soc	1674.63	2023-06-25 00:24:02.59838	2023-06-25 00:24:02.59838	
162	18540	20170309430	2021	9	4	otro_seg_soc	8931.35	2023-06-25 00:24:02.598681	2023-06-25 00:24:02.598681	
163	18540	20170309430	2021	10	4	otro_obra_soc	1737.73	2023-06-25 00:24:02.59927	2023-06-25 00:24:02.59927	
164	18540	20170309430	2021	10	4	otro_seg_soc	9267.92	2023-06-25 00:24:02.599516	2023-06-25 00:24:02.599516	
165	18540	20170309430	2021	10	4	otro_sindicato	2606.60	2023-06-25 00:24:02.59974	2023-06-25 00:24:02.59974	
166	18540	20170309430	2021	10	4	otro_gan_brut	61754.47	2023-06-25 00:24:02.599977	2023-06-25 00:24:02.599977	
167	18540	20170309430	2021	11	4	otro_sindicato	2724.84	2023-06-25 00:24:02.600414	2023-06-25 00:24:02.600414	
168	18540	20170309430	2021	11	4	otro_gan_brut	60552.72	2023-06-25 00:24:02.60064	2023-06-25 00:24:02.60064	
169	18540	20170309430	2021	11	4	otro_obra_soc	1816.58	2023-06-25 00:24:02.600863	2023-06-25 00:24:02.600863	
170	18540	20170309430	2021	11	4	otro_seg_soc	9688.44	2023-06-25 00:24:02.601093	2023-06-25 00:24:02.601093	
171	18540	20170309430	2021	12	4	otro_gan_brut	62576.77	2023-06-25 00:24:02.601567	2023-06-25 00:24:02.601567	
172	18540	20170309430	2021	12	4	otro_sac	30276.36	2023-06-25 00:24:02.60181	2023-06-25 00:24:02.60181	
173	18540	20170309430	2021	12	4	otro_obra_soc	2785.50	2023-06-25 00:24:02.602068	2023-06-25 00:24:02.602068	
174	18540	20170309430	2021	12	4	otro_seg_soc	14856.50	2023-06-25 00:24:02.602293	2023-06-25 00:24:02.602293	
175	18540	20170309430	2022	1	3	otro_seg_soc	21876.26	2023-06-25 00:24:02.606367	2023-06-25 00:24:02.606367	
176	18540	20170309430	2022	1	3	otro_gan_brut	136726.63	2023-06-25 00:24:02.606615	2023-06-25 00:24:02.606615	
177	18540	20170309430	2022	1	3	otro_sindicato	6152.70	2023-06-25 00:24:02.606832	2023-06-25 00:24:02.606832	
178	18540	20170309430	2022	1	3	otro_obra_soc	4101.80	2023-06-25 00:24:02.607057	2023-06-25 00:24:02.607057	
179	18540	20170309430	2022	2	3	otro_seg_soc	21876.26	2023-06-25 00:24:02.607507	2023-06-25 00:24:02.607507	
180	18540	20170309430	2022	2	3	otro_gan_brut	141806.63	2023-06-25 00:24:02.607758	2023-06-25 00:24:02.607758	
181	18540	20170309430	2022	2	3	otro_sindicato	6152.70	2023-06-25 00:24:02.607987	2023-06-25 00:24:02.607987	
182	18540	20170309430	2022	2	3	otro_obra_soc	4101.80	2023-06-25 00:24:02.608215	2023-06-25 00:24:02.608215	
183	18540	20170309430	2022	3	3	otro_obra_soc	4101.80	2023-06-25 00:24:02.608716	2023-06-25 00:24:02.608716	
184	18540	20170309430	2022	3	3	otro_seg_soc	21876.26	2023-06-25 00:24:02.608949	2023-06-25 00:24:02.608949	
185	18540	20170309430	2022	3	3	otro_gan_brut	141806.63	2023-06-25 00:24:02.609795	2023-06-25 00:24:02.609795	
186	18540	20170309430	2022	3	3	otro_sindicato	6152.70	2023-06-25 00:24:02.610138	2023-06-25 00:24:02.610138	
187	18540	20170309430	2022	1	3	otro_obra_soc	1877.30	2023-06-25 00:24:02.610832	2023-06-25 00:24:02.610832	
188	18540	20170309430	2022	1	3	otro_sac	1012.03	2023-06-25 00:24:02.611096	2023-06-25 00:24:02.611096	
189	18540	20170309430	2022	1	3	otro_seg_soc	10012.28	2023-06-25 00:24:02.611324	2023-06-25 00:24:02.611324	
190	18540	20170309430	2022	1	3	otro_gan_brut	62576.77	2023-06-25 00:24:02.611542	2023-06-25 00:24:02.611542	
191	18540	20170309430	2022	1	3	otro_sindicato	2815.95	2023-06-25 00:24:02.611759	2023-06-25 00:24:02.611759	
192	18540	20170309430	2022	2	3	otro_obra_soc	1877.30	2023-06-25 00:24:02.612196	2023-06-25 00:24:02.612196	
193	18540	20170309430	2022	2	3	otro_gan_brut	67656.77	2023-06-25 00:24:02.612438	2023-06-25 00:24:02.612438	
194	18540	20170309430	2022	2	3	otro_seg_soc	10012.28	2023-06-25 00:24:02.612665	2023-06-25 00:24:02.612665	
195	18540	20170309430	2022	2	3	otro_sindicato	2815.95	2023-06-25 00:24:02.612892	2023-06-25 00:24:02.612892	
196	18540	20170309430	2022	3	3	otro_obra_soc	1877.30	2023-06-25 00:24:02.613333	2023-06-25 00:24:02.613333	
197	18540	20170309430	2022	3	3	otro_gan_brut	67656.77	2023-06-25 00:24:02.613623	2023-06-25 00:24:02.613623	
198	18540	20170309430	2022	3	3	otro_seg_soc	10012.28	2023-06-25 00:24:02.613878	2023-06-25 00:24:02.613878	
199	18540	20170309430	2022	3	3	otro_sindicato	2815.95	2023-06-25 00:24:02.61414	2023-06-25 00:24:02.61414	
200	34953	20171720967	2021	1	13	ded_cuota_medica	10295.57	2023-06-25 00:24:02.62085	2023-06-25 00:24:02.62085	
201	34953	20171720967	2021	2	13	ded_cuota_medica	10046.93	2023-06-25 00:24:02.621534	2023-06-25 00:24:02.621534	
202	34953	20171720967	2021	3	13	ded_cuota_medica	10007.41	2023-06-25 00:24:02.622149	2023-06-25 00:24:02.622149	
203	34953	20171720967	2021	4	13	ded_cuota_medica	10282.61	2023-06-25 00:24:02.622657	2023-06-25 00:24:02.622657	
204	34953	20171720967	2021	5	13	ded_cuota_medica	6262.13	2023-06-25 00:24:02.623117	2023-06-25 00:24:02.623117	
205	34953	20171720967	2021	6	13	ded_cuota_medica	11657.11	2023-06-25 00:24:02.623582	2023-06-25 00:24:02.623582	
206	34953	20171720967	2021	7	13	ded_cuota_medica	10960.59	2023-06-25 00:24:02.624125	2023-06-25 00:24:02.624125	
207	34953	20171720967	2021	8	13	ded_cuota_medica	10917.59	2023-06-25 00:24:02.624507	2023-06-25 00:24:02.624507	
208	34953	20171720967	2021	9	13	ded_cuota_medica	11904.10	2023-06-25 00:24:02.624829	2023-06-25 00:24:02.624829	
209	34953	20171720967	2021	10	13	ded_cuota_medica	13522.44	2023-06-25 00:24:02.625154	2023-06-25 00:24:02.625154	
210	34953	20171720967	2021	11	13	ded_cuota_medica	10066.22	2023-06-25 00:24:02.625548	2023-06-25 00:24:02.625548	
211	34953	20171720967	2021	12	13	ded_cuota_medica	18862.66	2023-06-25 00:24:02.625938	2023-06-25 00:24:02.625938	
212	34953	20171720967	2021	1	13	ded_domestica	14097.55	2023-06-25 00:24:02.626391	2023-06-25 00:24:02.626391	
213	34953	20171720967	2021	2	13	ded_domestica	14099.96	2023-06-25 00:24:02.626702	2023-06-25 00:24:02.626702	
214	34953	20171720967	2021	3	13	ded_domestica	14170.81	2023-06-25 00:24:02.627008	2023-06-25 00:24:02.627008	
215	34953	20171720967	2021	4	13	ded_domestica	14170.81	2023-06-25 00:24:02.627203	2023-06-25 00:24:02.627203	
216	34953	20171720967	2021	5	13	ded_domestica	14253.84	2023-06-25 00:24:02.627651	2023-06-25 00:24:02.627651	
217	34953	20171720967	2021	6	13	ded_domestica	20989.24	2023-06-25 00:24:02.627984	2023-06-25 00:24:02.627984	
218	34953	20171720967	2021	7	13	ded_domestica	14303.34	2023-06-25 00:24:02.628291	2023-06-25 00:24:02.628291	
219	34953	20171720967	2021	8	13	ded_domestica	14364.18	2023-06-25 00:24:02.628617	2023-06-25 00:24:02.628617	
220	34953	20171720967	2021	9	13	ded_domestica	14634.18	2023-06-25 00:24:02.62892	2023-06-25 00:24:02.62892	
221	34953	20171720967	2021	10	13	ded_domestica	14666.47	2023-06-25 00:24:02.629223	2023-06-25 00:24:02.629223	
222	34953	20171720967	2021	11	13	ded_domestica	14694.57	2023-06-25 00:24:02.630092	2023-06-25 00:24:02.630092	
223	34953	20171720967	2021	12	13	ded_domestica	21565.55	2023-06-25 00:24:02.630448	2023-06-25 00:24:02.630448	
224	34953	20171720967	2021	1	13	otro_sindicato	616.19	2023-06-25 00:24:02.631161	2023-06-25 00:24:02.631161	
225	34953	20171720967	2021	1	13	otro_gan_brut	41079.58	2023-06-25 00:24:02.63141	2023-06-25 00:24:02.63141	
226	34953	20171720967	2021	1	13	otro_obra_soc	1232.29	2023-06-25 00:24:02.631669	2023-06-25 00:24:02.631669	
227	34953	20171720967	2021	1	13	otro_seg_soc	5751.14	2023-06-25 00:24:02.631895	2023-06-25 00:24:02.631895	
228	34953	20171720967	2021	2	13	otro_obra_soc	1377.48	2023-06-25 00:24:02.632352	2023-06-25 00:24:02.632352	
229	34953	20171720967	2021	2	13	otro_seg_soc	6428.22	2023-06-25 00:24:02.632606	2023-06-25 00:24:02.632606	
230	34953	20171720967	2021	2	13	otro_gan_brut	45915.89	2023-06-25 00:24:02.632859	2023-06-25 00:24:02.632859	
231	34953	20171720967	2021	2	13	otro_sindicato	688.74	2023-06-25 00:24:02.633103	2023-06-25 00:24:02.633103	
232	34953	20171720967	2021	3	13	otro_sindicato	688.74	2023-06-25 00:24:02.633704	2023-06-25 00:24:02.633704	
233	34953	20171720967	2021	3	13	otro_gan_brut	45915.89	2023-06-25 00:24:02.633951	2023-06-25 00:24:02.633951	
234	34953	20171720967	2021	3	13	otro_obra_soc	1377.48	2023-06-25 00:24:02.634221	2023-06-25 00:24:02.634221	
235	34953	20171720967	2021	3	13	otro_seg_soc	6428.22	2023-06-25 00:24:02.634456	2023-06-25 00:24:02.634456	
236	34953	20171720967	2021	4	13	otro_gan_brut	57011.83	2023-06-25 00:24:02.634889	2023-06-25 00:24:02.634889	
237	34953	20171720967	2021	4	13	otro_sindicato	855.18	2023-06-25 00:24:02.635132	2023-06-25 00:24:02.635132	
238	34953	20171720967	2021	4	13	otro_obra_soc	1710.35	2023-06-25 00:24:02.635365	2023-06-25 00:24:02.635365	
239	34953	20171720967	2021	4	13	otro_seg_soc	7981.65	2023-06-25 00:24:02.635598	2023-06-25 00:24:02.635598	
240	34953	20171720967	2021	5	13	otro_sindicato	881.98	2023-06-25 00:24:02.636101	2023-06-25 00:24:02.636101	
241	34953	20171720967	2021	5	13	otro_gan_brut	58798.44	2023-06-25 00:24:02.636339	2023-06-25 00:24:02.636339	
242	34953	20171720967	2021	5	13	otro_obra_soc	1763.95	2023-06-25 00:24:02.636608	2023-06-25 00:24:02.636608	
243	34953	20171720967	2021	5	13	otro_seg_soc	8231.78	2023-06-25 00:24:02.636847	2023-06-25 00:24:02.636847	
244	34953	20171720967	2021	6	13	otro_gan_brut	85517.75	2023-06-25 00:24:02.637306	2023-06-25 00:24:02.637306	
245	34953	20171720967	2021	6	13	otro_sac	28505.92	2023-06-25 00:24:02.637556	2023-06-25 00:24:02.637556	
246	34953	20171720967	2021	6	13	otro_sindicato	1282.77	2023-06-25 00:24:02.63779	2023-06-25 00:24:02.63779	
247	34953	20171720967	2021	6	13	otro_obra_soc	2565.53	2023-06-25 00:24:02.638023	2023-06-25 00:24:02.638023	
248	34953	20171720967	2021	6	13	otro_seg_soc	11972.46	2023-06-25 00:24:02.638262	2023-06-25 00:24:02.638262	
249	34953	20171720967	2021	7	13	otro_sac	12610.29	2023-06-25 00:24:02.63871	2023-06-25 00:24:02.63871	
250	34953	20171720967	2022	1	3	ded_cuota_medica	18862.66	2023-06-25 00:24:02.643268	2023-06-25 00:24:02.643268	
251	34953	20171720967	2022	2	3	ded_cuota_medica	20656.32	2023-06-25 00:24:02.643662	2023-06-25 00:24:02.643662	
252	34953	20171720967	2022	3	3	ded_cuota_medica	20656.32	2023-06-25 00:24:02.643906	2023-06-25 00:24:02.643906	
253	34953	20171720967	2022	4	3	ded_cuota_medica	21774.35	2023-06-25 00:24:02.644263	2023-06-25 00:24:02.644263	
254	34953	20171720967	2022	1	3	ded_domestica	14951.95	2023-06-25 00:24:02.644733	2023-06-25 00:24:02.644733	
255	34953	20171720967	2022	2	3	ded_domestica	15006.62	2023-06-25 00:24:02.645054	2023-06-25 00:24:02.645054	
256	34953	20171720967	2022	3	3	ded_domestica	15004.33	2023-06-25 00:24:02.645427	2023-06-25 00:24:02.645427	
257	43643	20172361758	2021	1	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.65175	2023-06-25 00:24:02.65175	
258	43643	20172361758	2021	2	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.652808	2023-06-25 00:24:02.652808	
259	43643	20172361758	2021	3	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.65341	2023-06-25 00:24:02.65341	
260	43643	20172361758	2021	4	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.654348	2023-06-25 00:24:02.654348	
261	43643	20172361758	2021	5	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.65498	2023-06-25 00:24:02.65498	
262	43643	20172361758	2021	6	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.655577	2023-06-25 00:24:02.655577	
263	43643	20172361758	2021	7	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.656005	2023-06-25 00:24:02.656005	
264	43643	20172361758	2021	8	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.656383	2023-06-25 00:24:02.656383	
265	43643	20172361758	2021	9	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.656746	2023-06-25 00:24:02.656746	
266	43643	20172361758	2021	10	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.657096	2023-06-25 00:24:02.657096	
267	43643	20172361758	2021	11	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.657471	2023-06-25 00:24:02.657471	
268	43643	20172361758	2021	12	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.657786	2023-06-25 00:24:02.657786	
269	43643	20172361758	2021	1	3	fam_hijos_100	100.00	2023-06-25 00:24:02.658181	2023-06-25 00:24:02.658181	
270	43643	20172361758	2021	2	3	fam_hijos_100	100.00	2023-06-25 00:24:02.658381	2023-06-25 00:24:02.658381	
271	43643	20172361758	2021	3	3	fam_hijos_100	100.00	2023-06-25 00:24:02.65866	2023-06-25 00:24:02.65866	
272	43643	20172361758	2021	4	3	fam_hijos_100	100.00	2023-06-25 00:24:02.658928	2023-06-25 00:24:02.658928	
273	43643	20172361758	2021	5	3	fam_hijos_100	100.00	2023-06-25 00:24:02.659162	2023-06-25 00:24:02.659162	
274	43643	20172361758	2021	6	3	fam_hijos_100	100.00	2023-06-25 00:24:02.659347	2023-06-25 00:24:02.659347	
275	43643	20172361758	2021	7	3	fam_hijos_100	100.00	2023-06-25 00:24:02.659535	2023-06-25 00:24:02.659535	
276	43643	20172361758	2021	8	3	fam_hijos_100	100.00	2023-06-25 00:24:02.659717	2023-06-25 00:24:02.659717	
277	43643	20172361758	2021	9	3	fam_hijos_100	100.00	2023-06-25 00:24:02.659894	2023-06-25 00:24:02.659894	
278	43643	20172361758	2021	10	3	fam_hijos_100	100.00	2023-06-25 00:24:02.660071	2023-06-25 00:24:02.660071	
279	43643	20172361758	2021	11	3	fam_hijos_100	100.00	2023-06-25 00:24:02.660248	2023-06-25 00:24:02.660248	
280	43643	20172361758	2021	12	3	fam_hijos_100	100.00	2023-06-25 00:24:02.660453	2023-06-25 00:24:02.660453	
281	16326	20173158549	2021	1	1	ded_cuota_medica	1776.74	2023-06-25 00:24:02.666125	2023-06-25 00:24:02.666125	
282	16326	20173158549	2021	4	1	ded_cuota_medica	1609.97	2023-06-25 00:24:02.666469	2023-06-25 00:24:02.666469	
283	16326	20173158549	2021	5	1	ded_cuota_medica	2124.25	2023-06-25 00:24:02.666799	2023-06-25 00:24:02.666799	
284	16326	20173158549	2021	6	1	ded_cuota_medica	1622.54	2023-06-25 00:24:02.667094	2023-06-25 00:24:02.667094	
285	16326	20173158549	2021	7	1	ded_cuota_medica	1622.54	2023-06-25 00:24:02.667279	2023-06-25 00:24:02.667279	
286	16326	20173158549	2021	9	1	ded_cuota_medica	2652.42	2023-06-25 00:24:02.667564	2023-06-25 00:24:02.667564	
287	16326	20173158549	2021	10	1	ded_cuota_medica	3707.26	2023-06-25 00:24:02.667838	2023-06-25 00:24:02.667838	
288	16326	20173158549	2021	11	1	ded_cuota_medica	2981.81	2023-06-25 00:24:02.668159	2023-06-25 00:24:02.668159	
289	16326	20173158549	2021	3	1	ded_gastos_medicos	9600.00	2023-06-25 00:24:02.668601	2023-06-25 00:24:02.668601	
290	16326	20173158549	2021	12	1	ded_gastos_medicos	15200.00	2023-06-25 00:24:02.668891	2023-06-25 00:24:02.668891	
291	16326	20173158549	2021	11	1	ded_gastos_medicos	3680.00	2023-06-25 00:24:02.669324	2023-06-25 00:24:02.669324	
292	16326	20173158549	2021	1	1	otro_seg_soc	6749.68	2023-06-25 00:24:02.670027	2023-06-25 00:24:02.670027	
293	16326	20173158549	2021	1	1	otro_obra_soc	3931.60	2023-06-25 00:24:02.670257	2023-06-25 00:24:02.670257	
294	16326	20173158549	2021	1	1	otro_gan_brut	32193.59	2023-06-25 00:24:02.67049	2023-06-25 00:24:02.67049	
295	16326	20173158549	2021	1	1	otro_sindicato	376.19	2023-06-25 00:24:02.670702	2023-06-25 00:24:02.670702	
296	16326	20173158549	2021	2	1	otro_seg_soc	6749.68	2023-06-25 00:24:02.671155	2023-06-25 00:24:02.671155	
297	16326	20173158549	2021	2	1	otro_obra_soc	3603.16	2023-06-25 00:24:02.671406	2023-06-25 00:24:02.671406	
298	16326	20173158549	2021	2	1	otro_gan_brut	32193.63	2023-06-25 00:24:02.67162	2023-06-25 00:24:02.67162	
299	16326	20173158549	2021	2	1	otro_sindicato	777.73	2023-06-25 00:24:02.671863	2023-06-25 00:24:02.671863	
300	16326	20173158549	2021	3	1	otro_obra_soc	3833.24	2023-06-25 00:24:02.672307	2023-06-25 00:24:02.672307	
301	16326	20173158549	2021	3	1	otro_gan_brut	37034.07	2023-06-25 00:24:02.672533	2023-06-25 00:24:02.672533	
302	16326	20173158549	2021	3	1	otro_seg_soc	6815.71	2023-06-25 00:24:02.672747	2023-06-25 00:24:02.672747	
303	16326	20173158549	2021	4	1	otro_seg_soc	6815.71	2023-06-25 00:24:02.673183	2023-06-25 00:24:02.673183	
304	16326	20173158549	2021	4	1	otro_gan_brut	37034.07	2023-06-25 00:24:02.67345	2023-06-25 00:24:02.67345	
305	16326	20173158549	2021	4	1	otro_obra_soc	3833.24	2023-06-25 00:24:02.673678	2023-06-25 00:24:02.673678	
306	16326	20173158549	2021	4	1	otro_sindicato	856.10	2023-06-25 00:24:02.673901	2023-06-25 00:24:02.673901	
307	16326	20173158549	2021	5	1	otro_gan_brut	37034.07	2023-06-25 00:24:02.674341	2023-06-25 00:24:02.674341	
308	16326	20173158549	2021	5	1	otro_obra_soc	3833.24	2023-06-25 00:24:02.674744	2023-06-25 00:24:02.674744	
309	16326	20173158549	2021	5	1	otro_sindicato	856.10	2023-06-25 00:24:02.675353	2023-06-25 00:24:02.675353	
310	16326	20173158549	2021	5	1	otro_seg_soc	6815.71	2023-06-25 00:24:02.675705	2023-06-25 00:24:02.675705	
311	16326	20173158549	2021	6	1	otro_sac	17986.30	2023-06-25 00:24:02.676232	2023-06-25 00:24:02.676232	
312	16326	20173158549	2021	6	1	otro_seg_soc	11558.00	2023-06-25 00:24:02.676498	2023-06-25 00:24:02.676498	
313	16326	20173158549	2021	6	1	otro_gan_brut	42205.18	2023-06-25 00:24:02.676752	2023-06-25 00:24:02.676752	
314	16326	20173158549	2021	6	1	otro_obra_soc	6118.01	2023-06-25 00:24:02.677001	2023-06-25 00:24:02.677001	
315	16326	20173158549	2021	6	1	otro_sindicato	1078.78	2023-06-25 00:24:02.677258	2023-06-25 00:24:02.677258	
316	16326	20173158549	2021	7	1	otro_seg_soc	8845.15	2023-06-25 00:24:02.677879	2023-06-25 00:24:02.677879	
317	16326	20173158549	2021	7	1	otro_obra_soc	4698.82	2023-06-25 00:24:02.678202	2023-06-25 00:24:02.678202	
318	16326	20173158549	2021	7	1	otro_gan_brut	42205.18	2023-06-25 00:24:02.678466	2023-06-25 00:24:02.678466	
319	16326	20173158549	2021	7	1	otro_sindicato	984.80	2023-06-25 00:24:02.678734	2023-06-25 00:24:02.678734	
320	16326	20173158549	2021	8	1	otro_seg_soc	7822.26	2023-06-25 00:24:02.679348	2023-06-25 00:24:02.679348	
321	16326	20173158549	2021	8	1	otro_obra_soc	4665.39	2023-06-25 00:24:02.679691	2023-06-25 00:24:02.679691	
322	16326	20173158549	2021	8	1	otro_gan_brut	42205.18	2023-06-25 00:24:02.680031	2023-06-25 00:24:02.680031	
323	16326	20173158549	2021	8	1	otro_sindicato	956.84	2023-06-25 00:24:02.681043	2023-06-25 00:24:02.681043	
324	16326	20173158549	2021	9	1	otro_seg_soc	8184.26	2023-06-25 00:24:02.681902	2023-06-25 00:24:02.681902	
325	16326	20173158549	2021	9	1	otro_gan_brut	39322.63	2023-06-25 00:24:02.68235	2023-06-25 00:24:02.68235	
326	16326	20173158549	2021	9	1	otro_obra_soc	4567.45	2023-06-25 00:24:02.682799	2023-06-25 00:24:02.682799	
327	16326	20173158549	2021	9	1	otro_sindicato	606.38	2023-06-25 00:24:02.683233	2023-06-25 00:24:02.683233	
328	16326	20173158549	2021	10	1	otro_gan_brut	45369.69	2023-06-25 00:24:02.683938	2023-06-25 00:24:02.683938	
329	16326	20173158549	2021	10	1	otro_obra_soc	4797.79	2023-06-25 00:24:02.684372	2023-06-25 00:24:02.684372	
330	16326	20173158549	2021	10	1	otro_sindicato	1067.78	2023-06-25 00:24:02.684697	2023-06-25 00:24:02.684697	
331	16326	20173158549	2021	10	1	otro_seg_soc	9412.21	2023-06-25 00:24:02.685043	2023-06-25 00:24:02.685043	
332	16326	20173158549	2021	11	1	otro_gan_brut	39704.85	2023-06-25 00:24:02.68599	2023-06-25 00:24:02.68599	
333	16326	20173158549	2021	11	1	otro_obra_soc	4797.79	2023-06-25 00:24:02.686875	2023-06-25 00:24:02.686875	
334	16326	20173158549	2021	11	1	otro_sindicato	606.38	2023-06-25 00:24:02.687444	2023-06-25 00:24:02.687444	
335	16326	20173158549	2021	11	1	otro_seg_soc	8338.35	2023-06-25 00:24:02.687866	2023-06-25 00:24:02.687866	
336	16326	20173158549	2021	12	1	otro_gan_brut	66618.95	2023-06-25 00:24:02.688612	2023-06-25 00:24:02.688612	
337	16326	20173158549	2021	12	1	otro_obra_soc	7421.27	2023-06-25 00:24:02.688987	2023-06-25 00:24:02.688987	
338	16326	20173158549	2021	12	1	otro_sindicato	1491.54	2023-06-25 00:24:02.689378	2023-06-25 00:24:02.689378	
339	16326	20173158549	2021	12	1	otro_sac	18008.80	2023-06-25 00:24:02.689754	2023-06-25 00:24:02.689754	
340	16326	20173158549	2021	12	1	otro_seg_soc	13158.29	2023-06-25 00:24:02.690161	2023-06-25 00:24:02.690161	
341	19326	20173160144	2022	1	4	ded_domestica	4767.08	2023-06-25 00:24:02.695673	2023-06-25 00:24:02.695673	
342	19326	20173160144	2022	2	4	ded_domestica	5836.16	2023-06-25 00:24:02.695972	2023-06-25 00:24:02.695972	
343	19326	20173160144	2022	3	4	ded_domestica	3336.00	2023-06-25 00:24:02.696255	2023-06-25 00:24:02.696255	
344	19326	20173160144	2022	4	4	ded_domestica	3672.60	2023-06-25 00:24:02.696539	2023-06-25 00:24:02.696539	
345	42168	20173919914	2021	3	12	ded_gastos_medicos	680.00	2023-06-25 00:24:02.701635	2023-06-25 00:24:02.701635	
346	42168	20173919914	2021	1	12	ded_gastos_medicos	1440.00	2023-06-25 00:24:02.702126	2023-06-25 00:24:02.702126	
347	42168	20173919914	2021	8	12	ded_gastos_medicos	1120.00	2023-06-25 00:24:02.702467	2023-06-25 00:24:02.702467	
348	42168	20173919914	2021	1	12	fam_hijos_100	100.00	2023-06-25 00:24:02.702792	2023-06-25 00:24:02.702792	
349	42168	20173919914	2021	2	12	fam_hijos_100	100.00	2023-06-25 00:24:02.702996	2023-06-25 00:24:02.702996	
350	42168	20173919914	2021	3	12	fam_hijos_100	100.00	2023-06-25 00:24:02.703197	2023-06-25 00:24:02.703197	
351	42168	20173919914	2021	4	12	fam_hijos_100	100.00	2023-06-25 00:24:02.703413	2023-06-25 00:24:02.703413	
352	42168	20173919914	2021	5	12	fam_hijos_100	100.00	2023-06-25 00:24:02.703592	2023-06-25 00:24:02.703592	
353	42168	20173919914	2021	6	12	fam_hijos_100	100.00	2023-06-25 00:24:02.703764	2023-06-25 00:24:02.703764	
354	42168	20173919914	2021	7	12	fam_hijos_100	100.00	2023-06-25 00:24:02.703943	2023-06-25 00:24:02.703943	
355	42168	20173919914	2021	8	12	fam_hijos_100	100.00	2023-06-25 00:24:02.704122	2023-06-25 00:24:02.704122	
356	42168	20173919914	2021	9	12	fam_hijos_100	100.00	2023-06-25 00:24:02.704295	2023-06-25 00:24:02.704295	
357	42168	20173919914	2021	10	12	fam_hijos_100	100.00	2023-06-25 00:24:02.70447	2023-06-25 00:24:02.70447	
358	42168	20173919914	2021	11	12	fam_hijos_100	100.00	2023-06-25 00:24:02.704646	2023-06-25 00:24:02.704646	
359	42168	20173919914	2021	12	12	fam_hijos_100	100.00	2023-06-25 00:24:02.704813	2023-06-25 00:24:02.704813	
360	42168	20173919914	2021	1	12	otro_seg_soc	29987.69	2023-06-25 00:24:02.705662	2023-06-25 00:24:02.705662	
361	42168	20173919914	2021	1	12	otro_sindicato	3748.46	2023-06-25 00:24:02.705943	2023-06-25 00:24:02.705943	
362	42168	20173919914	2021	1	12	otro_gan_brut	187423.11	2023-06-25 00:24:02.70623	2023-06-25 00:24:02.70623	
363	42168	20173919914	2021	1	12	otro_obra_soc	6747.43	2023-06-25 00:24:02.706972	2023-06-25 00:24:02.706972	
364	42168	20173919914	2021	1	12	otro_ret_gan	33238.71	2023-06-25 00:24:02.707311	2023-06-25 00:24:02.707311	
365	42168	20173919914	2021	2	12	otro_obra_soc	7015.34	2023-06-25 00:24:02.707824	2023-06-25 00:24:02.707824	
366	42168	20173919914	2021	2	12	otro_seg_soc	31273.63	2023-06-25 00:24:02.70813	2023-06-25 00:24:02.70813	
367	42168	20173919914	2021	2	12	otro_sindicato	3909.20	2023-06-25 00:24:02.708381	2023-06-25 00:24:02.708381	
368	42168	20173919914	2021	2	12	otro_gan_brut	195460.17	2023-06-25 00:24:02.708627	2023-06-25 00:24:02.708627	
369	42168	20173919914	2021	3	12	otro_gan_brut	203497.23	2023-06-25 00:24:02.709117	2023-06-25 00:24:02.709117	
370	42168	20173919914	2021	3	12	otro_seg_soc	32559.56	2023-06-25 00:24:02.709469	2023-06-25 00:24:02.709469	
371	42168	20173919914	2021	3	12	otro_sindicato	4069.94	2023-06-25 00:24:02.7098	2023-06-25 00:24:02.7098	
372	42168	20173919914	2021	3	12	otro_obra_soc	7283.24	2023-06-25 00:24:02.710132	2023-06-25 00:24:02.710132	
373	42168	20173919914	2021	4	12	otro_obra_soc	7283.24	2023-06-25 00:24:02.710672	2023-06-25 00:24:02.710672	
374	42168	20173919914	2021	4	12	otro_sindicato	4069.94	2023-06-25 00:24:02.710907	2023-06-25 00:24:02.710907	
375	42168	20173919914	2021	4	12	otro_gan_brut	203497.23	2023-06-25 00:24:02.71112	2023-06-25 00:24:02.71112	
376	42168	20173919914	2021	4	12	otro_seg_soc	32559.56	2023-06-25 00:24:02.711334	2023-06-25 00:24:02.711334	
377	42168	20173919914	2021	5	12	otro_obra_soc	8872.59	2023-06-25 00:24:02.712006	2023-06-25 00:24:02.712006	
378	42168	20173919914	2021	5	12	otro_seg_soc	39408.25	2023-06-25 00:24:02.712715	2023-06-25 00:24:02.712715	
379	42168	20173919914	2021	5	12	otro_sindicato	5023.55	2023-06-25 00:24:02.713134	2023-06-25 00:24:02.713134	
380	42168	20173919914	2021	5	12	otro_gan_brut	251177.70	2023-06-25 00:24:02.713606	2023-06-25 00:24:02.713606	
381	42168	20173919914	2021	6	12	otro_gan_brut	282054.11	2023-06-25 00:24:02.714343	2023-06-25 00:24:02.714343	
382	42168	20173919914	2021	6	12	otro_sac	141027.06	2023-06-25 00:24:02.714724	2023-06-25 00:24:02.714724	
383	42168	20173919914	2021	6	12	otro_seg_soc	66361.36	2023-06-25 00:24:02.715104	2023-06-25 00:24:02.715104	
384	42168	20173919914	2021	6	12	otro_sindicato	8461.62	2023-06-25 00:24:02.715648	2023-06-25 00:24:02.715648	
385	42168	20173919914	2021	6	12	otro_obra_soc	15053.71	2023-06-25 00:24:02.716025	2023-06-25 00:24:02.716025	
386	42168	20173919914	2021	7	12	otro_obra_soc	12625.18	2023-06-25 00:24:02.71651	2023-06-25 00:24:02.71651	
387	42168	20173919914	2021	7	12	otro_seg_soc	54862.07	2023-06-25 00:24:02.716836	2023-06-25 00:24:02.716836	
388	42168	20173919914	2021	7	12	otro_sindicato	7275.11	2023-06-25 00:24:02.717092	2023-06-25 00:24:02.717092	
389	42168	20173919914	2021	7	12	otro_gan_brut	363755.32	2023-06-25 00:24:02.7175	2023-06-25 00:24:02.7175	
390	42168	20173919914	2021	8	12	otro_gan_brut	376518.69	2023-06-25 00:24:02.717983	2023-06-25 00:24:02.717983	
391	42168	20173919914	2021	8	12	otro_seg_soc	56521.31	2023-06-25 00:24:02.718262	2023-06-25 00:24:02.718262	
392	42168	20173919914	2021	8	12	otro_sindicato	7530.37	2023-06-25 00:24:02.718523	2023-06-25 00:24:02.718523	
393	42168	20173919914	2021	8	12	otro_obra_soc	13050.62	2023-06-25 00:24:02.718775	2023-06-25 00:24:02.718775	
394	42168	20173919914	2021	9	12	otro_obra_soc	13688.79	2023-06-25 00:24:02.720011	2023-06-25 00:24:02.720011	
395	42168	20173919914	2021	9	12	otro_seg_soc	59948.56	2023-06-25 00:24:02.720384	2023-06-25 00:24:02.720384	
396	42168	20173919914	2021	9	12	otro_sindicato	7913.27	2023-06-25 00:24:02.720741	2023-06-25 00:24:02.720741	
397	42168	20173919914	2021	9	12	otro_gan_brut	395663.73	2023-06-25 00:24:02.721166	2023-06-25 00:24:02.721166	
398	42168	20173919914	2021	10	12	otro_gan_brut	417999.64	2023-06-25 00:24:02.721859	2023-06-25 00:24:02.721859	
399	42168	20173919914	2021	10	12	otro_seg_soc	62852.23	2023-06-25 00:24:02.722209	2023-06-25 00:24:02.722209	
400	42168	20173919914	2021	10	12	otro_sindicato	8359.99	2023-06-25 00:24:02.72252	2023-06-25 00:24:02.72252	
401	42168	20173919914	2021	10	12	otro_obra_soc	14433.32	2023-06-25 00:24:02.722846	2023-06-25 00:24:02.722846	
402	42168	20173919914	2021	11	12	otro_sindicato	8359.99	2023-06-25 00:24:02.723437	2023-06-25 00:24:02.723437	
403	42168	20173919914	2021	11	12	otro_gan_brut	417999.64	2023-06-25 00:24:02.723679	2023-06-25 00:24:02.723679	
404	42168	20173919914	2021	11	12	otro_seg_soc	62852.23	2023-06-25 00:24:02.723909	2023-06-25 00:24:02.723909	
405	42168	20173919914	2021	11	12	otro_obra_soc	14433.32	2023-06-25 00:24:02.724146	2023-06-25 00:24:02.724146	
406	42168	20173919914	2021	12	12	otro_obra_soc	18592.99	2023-06-25 00:24:02.724638	2023-06-25 00:24:02.724638	
407	42168	20173919914	2021	12	12	otro_sindicato	10215.00	2023-06-25 00:24:02.724876	2023-06-25 00:24:02.724876	
408	42168	20173919914	2021	12	12	otro_gan_brut	301749.91	2023-06-25 00:24:02.725129	2023-06-25 00:24:02.725129	
409	42168	20173919914	2021	12	12	otro_sac	208999.82	2023-06-25 00:24:02.726084	2023-06-25 00:24:02.726084	
410	42168	20173919914	2021	12	12	otro_seg_soc	80712.13	2023-06-25 00:24:02.726416	2023-06-25 00:24:02.726416	
411	42168	20173919914	2022	1	3	fam_hijos_100	100.00	2023-06-25 00:24:02.730858	2023-06-25 00:24:02.730858	
412	42168	20173919914	2022	2	3	fam_hijos_100	100.00	2023-06-25 00:24:02.731553	2023-06-25 00:24:02.731553	
413	42168	20173919914	2022	3	3	fam_hijos_100	100.00	2023-06-25 00:24:02.731902	2023-06-25 00:24:02.731902	
414	42168	20173919914	2022	4	3	fam_hijos_100	100.00	2023-06-25 00:24:02.732167	2023-06-25 00:24:02.732167	
415	42168	20173919914	2022	5	3	fam_hijos_100	100.00	2023-06-25 00:24:02.732376	2023-06-25 00:24:02.732376	
416	42168	20173919914	2022	6	3	fam_hijos_100	100.00	2023-06-25 00:24:02.732558	2023-06-25 00:24:02.732558	
417	42168	20173919914	2022	7	3	fam_hijos_100	100.00	2023-06-25 00:24:02.732735	2023-06-25 00:24:02.732735	
418	42168	20173919914	2022	8	3	fam_hijos_100	100.00	2023-06-25 00:24:02.73291	2023-06-25 00:24:02.73291	
419	42168	20173919914	2022	9	3	fam_hijos_100	100.00	2023-06-25 00:24:02.733088	2023-06-25 00:24:02.733088	
420	42168	20173919914	2022	10	3	fam_hijos_100	100.00	2023-06-25 00:24:02.733292	2023-06-25 00:24:02.733292	
421	42168	20173919914	2022	11	3	fam_hijos_100	100.00	2023-06-25 00:24:02.733475	2023-06-25 00:24:02.733475	
422	42168	20173919914	2022	12	3	fam_hijos_100	100.00	2023-06-25 00:24:02.733653	2023-06-25 00:24:02.733653	
423	42168	20173919914	2022	1	3	otro_sindicato	1024.38	2023-06-25 00:24:02.734279	2023-06-25 00:24:02.734279	
424	42168	20173919914	2022	1	3	otro_gan_brut	51218.95	2023-06-25 00:24:02.734575	2023-06-25 00:24:02.734575	
425	42168	20173919914	2022	1	3	otro_obra_soc	2207.30	2023-06-25 00:24:02.734847	2023-06-25 00:24:02.734847	
426	42168	20173919914	2022	1	3	otro_seg_soc	8195.03	2023-06-25 00:24:02.735118	2023-06-25 00:24:02.735118	
427	42168	20173919914	2022	2	3	otro_gan_brut	478625.60	2023-06-25 00:24:02.735683	2023-06-25 00:24:02.735683	
428	42168	20173919914	2022	2	3	otro_obra_soc	17808.19	2023-06-25 00:24:02.735945	2023-06-25 00:24:02.735945	
429	42168	20173919914	2022	2	3	otro_seg_soc	71764.44	2023-06-25 00:24:02.736236	2023-06-25 00:24:02.736236	
430	42168	20173919914	2022	3	3	otro_seg_soc	82431.32	2023-06-25 00:24:02.7368	2023-06-25 00:24:02.7368	
431	42168	20173919914	2022	3	3	otro_gan_brut	551663.93	2023-06-25 00:24:02.737229	2023-06-25 00:24:02.737229	
432	42168	20173919914	2022	3	3	otro_obra_soc	18888.80	2023-06-25 00:24:02.737475	2023-06-25 00:24:02.737475	
433	15392	20183568958	2022	1	1	ded_retiro	2400.00	2023-06-25 00:24:02.741267	2023-06-25 00:24:02.741267	
434	15392	20183568958	2022	2	1	ded_retiro	2400.00	2023-06-25 00:24:02.741539	2023-06-25 00:24:02.741539	
435	33424	20214556430	2022	1	3	ded_cuota_medica	27470.91	2023-06-25 00:24:02.750061	2023-06-25 00:24:02.750061	
436	33424	20214556430	2022	2	3	ded_cuota_medica	28743.91	2023-06-25 00:24:02.750482	2023-06-25 00:24:02.750482	
437	33424	20214556430	2022	1	3	fam_hijos_100	100.00	2023-06-25 00:24:02.750898	2023-06-25 00:24:02.750898	
438	33424	20214556430	2022	2	3	fam_hijos_100	100.00	2023-06-25 00:24:02.751183	2023-06-25 00:24:02.751183	
439	33424	20214556430	2022	3	3	fam_hijos_100	100.00	2023-06-25 00:24:02.751451	2023-06-25 00:24:02.751451	
440	33424	20214556430	2022	4	3	fam_hijos_100	100.00	2023-06-25 00:24:02.751742	2023-06-25 00:24:02.751742	
441	33424	20214556430	2022	5	3	fam_hijos_100	100.00	2023-06-25 00:24:02.752149	2023-06-25 00:24:02.752149	
442	33424	20214556430	2022	6	3	fam_hijos_100	100.00	2023-06-25 00:24:02.75253	2023-06-25 00:24:02.75253	
443	33424	20214556430	2022	7	3	fam_hijos_100	100.00	2023-06-25 00:24:02.752851	2023-06-25 00:24:02.752851	
444	33424	20214556430	2022	8	3	fam_hijos_100	100.00	2023-06-25 00:24:02.753958	2023-06-25 00:24:02.753958	
445	33424	20214556430	2022	9	3	fam_hijos_100	100.00	2023-06-25 00:24:02.754712	2023-06-25 00:24:02.754712	
446	33424	20214556430	2022	10	3	fam_hijos_100	100.00	2023-06-25 00:24:02.755318	2023-06-25 00:24:02.755318	
447	33424	20214556430	2022	11	3	fam_hijos_100	100.00	2023-06-25 00:24:02.755851	2023-06-25 00:24:02.755851	
448	33424	20214556430	2022	12	3	fam_hijos_100	100.00	2023-06-25 00:24:02.756392	2023-06-25 00:24:02.756392	
449	33424	20214556430	2022	1	3	fam_hijos_100	100.00	2023-06-25 00:24:02.757111	2023-06-25 00:24:02.757111	
450	33424	20214556430	2022	2	3	fam_hijos_100	100.00	2023-06-25 00:24:02.757461	2023-06-25 00:24:02.757461	
451	33424	20214556430	2022	3	3	fam_hijos_100	100.00	2023-06-25 00:24:02.757728	2023-06-25 00:24:02.757728	
452	33424	20214556430	2022	4	3	fam_hijos_100	100.00	2023-06-25 00:24:02.757931	2023-06-25 00:24:02.757931	
453	33424	20214556430	2022	5	3	fam_hijos_100	100.00	2023-06-25 00:24:02.758133	2023-06-25 00:24:02.758133	
454	33424	20214556430	2022	6	3	fam_hijos_100	100.00	2023-06-25 00:24:02.758332	2023-06-25 00:24:02.758332	
455	33424	20214556430	2022	7	3	fam_hijos_100	100.00	2023-06-25 00:24:02.758625	2023-06-25 00:24:02.758625	
456	33424	20214556430	2022	8	3	fam_hijos_100	100.00	2023-06-25 00:24:02.758955	2023-06-25 00:24:02.758955	
457	33424	20214556430	2022	9	3	fam_hijos_100	100.00	2023-06-25 00:24:02.759199	2023-06-25 00:24:02.759199	
458	33424	20214556430	2022	10	3	fam_hijos_100	100.00	2023-06-25 00:24:02.759431	2023-06-25 00:24:02.759431	
459	33424	20214556430	2022	11	3	fam_hijos_100	100.00	2023-06-25 00:24:02.759659	2023-06-25 00:24:02.759659	
460	33424	20214556430	2022	12	3	fam_hijos_100	100.00	2023-06-25 00:24:02.759886	2023-06-25 00:24:02.759886	
461	19652	20230085723	2022	1	2	FECDEVDESDE	100.00	2023-06-25 00:24:02.764839	2023-06-25 00:24:02.764839	
462	19652	20230085723	2022	2	2	FECDEVDESDE	100.00	2023-06-25 00:24:02.765077	2023-06-25 00:24:02.765077	
463	19652	20230085723	2022	3	2	FECDEVDESDE	100.00	2023-06-25 00:24:02.765302	2023-06-25 00:24:02.765302	
464	19652	20230085723	2022	4	2	FECDEVDESDE	100.00	2023-06-25 00:24:02.765547	2023-06-25 00:24:02.765547	
465	19652	20230085723	2022	5	2	FECDEVDESDE	100.00	2023-06-25 00:24:02.765782	2023-06-25 00:24:02.765782	
466	19652	20230085723	2022	6	2	FECDEVDESDE	100.00	2023-06-25 00:24:02.765996	2023-06-25 00:24:02.765996	
467	19652	20230085723	2022	7	2	FECDEVDESDE	100.00	2023-06-25 00:24:02.7662	2023-06-25 00:24:02.7662	
468	19652	20230085723	2022	8	2	FECDEVDESDE	100.00	2023-06-25 00:24:02.766428	2023-06-25 00:24:02.766428	
469	19652	20230085723	2022	9	2	FECDEVDESDE	100.00	2023-06-25 00:24:02.766617	2023-06-25 00:24:02.766617	
470	19652	20230085723	2022	10	2	FECDEVDESDE	100.00	2023-06-25 00:24:02.76681	2023-06-25 00:24:02.76681	
471	19652	20230085723	2022	11	2	FECDEVDESDE	100.00	2023-06-25 00:24:02.766994	2023-06-25 00:24:02.766994	
472	19652	20230085723	2022	12	2	FECDEVDESDE	100.00	2023-06-25 00:24:02.767189	2023-06-25 00:24:02.767189	
473	19652	20230085723	2022	1	2	fam_hijos_100	100.00	2023-06-25 00:24:02.767568	2023-06-25 00:24:02.767568	
474	19652	20230085723	2022	2	2	fam_hijos_100	100.00	2023-06-25 00:24:02.767772	2023-06-25 00:24:02.767772	
475	19652	20230085723	2022	3	2	fam_hijos_100	100.00	2023-06-25 00:24:02.76796	2023-06-25 00:24:02.76796	
476	19652	20230085723	2022	4	2	fam_hijos_100	100.00	2023-06-25 00:24:02.768166	2023-06-25 00:24:02.768166	
477	19652	20230085723	2022	5	2	fam_hijos_100	100.00	2023-06-25 00:24:02.768365	2023-06-25 00:24:02.768365	
478	19652	20230085723	2022	6	2	fam_hijos_100	100.00	2023-06-25 00:24:02.768564	2023-06-25 00:24:02.768564	
479	19652	20230085723	2022	7	2	fam_hijos_100	100.00	2023-06-25 00:24:02.768759	2023-06-25 00:24:02.768759	
480	19652	20230085723	2022	8	2	fam_hijos_100	100.00	2023-06-25 00:24:02.768947	2023-06-25 00:24:02.768947	
481	19652	20230085723	2022	9	2	fam_hijos_100	100.00	2023-06-25 00:24:02.769138	2023-06-25 00:24:02.769138	
482	19652	20230085723	2022	10	2	fam_hijos_100	100.00	2023-06-25 00:24:02.769386	2023-06-25 00:24:02.769386	
483	19652	20230085723	2022	11	2	fam_hijos_100	100.00	2023-06-25 00:24:02.769602	2023-06-25 00:24:02.769602	
484	19652	20230085723	2022	12	2	fam_hijos_100	100.00	2023-06-25 00:24:02.769817	2023-06-25 00:24:02.769817	
485	19652	20230085723	2022	1	2	otro_gan_brut	74076.06	2023-06-25 00:24:02.770539	2023-06-25 00:24:02.770539	
486	19652	20230085723	2022	1	2	otro_obra_soc	3995.10	2023-06-25 00:24:02.770828	2023-06-25 00:24:02.770828	
487	19652	20230085723	2022	1	2	otro_seg_soc	11852.17	2023-06-25 00:24:02.771114	2023-06-25 00:24:02.771114	
488	19652	20230085723	2022	2	2	otro_seg_soc	11857.18	2023-06-25 00:24:02.771653	2023-06-25 00:24:02.771653	
489	19652	20230085723	2022	2	2	otro_obra_soc	3711.29	2023-06-25 00:24:02.771915	2023-06-25 00:24:02.771915	
490	19652	20230085723	2022	2	2	otro_gan_brut	74107.38	2023-06-25 00:24:02.772691	2023-06-25 00:24:02.772691	
491	36104	20233149099	2021	1	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.778597	2023-06-25 00:24:02.778597	
492	36104	20233149099	2021	2	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.778842	2023-06-25 00:24:02.778842	
493	36104	20233149099	2021	3	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.779052	2023-06-25 00:24:02.779052	
494	36104	20233149099	2021	4	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.779252	2023-06-25 00:24:02.779252	
495	36104	20233149099	2021	5	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.779454	2023-06-25 00:24:02.779454	
496	36104	20233149099	2021	6	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.779656	2023-06-25 00:24:02.779656	
497	36104	20233149099	2021	7	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.779857	2023-06-25 00:24:02.779857	
498	36104	20233149099	2021	8	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.780064	2023-06-25 00:24:02.780064	
499	36104	20233149099	2021	9	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.780263	2023-06-25 00:24:02.780263	
500	36104	20233149099	2021	10	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.780505	2023-06-25 00:24:02.780505	
501	36104	20233149099	2021	11	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.780739	2023-06-25 00:24:02.780739	
502	36104	20233149099	2021	12	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.780943	2023-06-25 00:24:02.780943	
503	36104	20233149099	2021	1	1	fam_hijos_100	100.00	2023-06-25 00:24:02.781278	2023-06-25 00:24:02.781278	
504	36104	20233149099	2021	2	1	fam_hijos_100	100.00	2023-06-25 00:24:02.781634	2023-06-25 00:24:02.781634	
505	36104	20233149099	2021	3	1	fam_hijos_100	100.00	2023-06-25 00:24:02.781874	2023-06-25 00:24:02.781874	
506	36104	20233149099	2021	4	1	fam_hijos_100	100.00	2023-06-25 00:24:02.782089	2023-06-25 00:24:02.782089	
507	36104	20233149099	2021	5	1	fam_hijos_100	100.00	2023-06-25 00:24:02.782268	2023-06-25 00:24:02.782268	
508	36104	20233149099	2021	6	1	fam_hijos_100	100.00	2023-06-25 00:24:02.782457	2023-06-25 00:24:02.782457	
509	36104	20233149099	2021	7	1	fam_hijos_100	100.00	2023-06-25 00:24:02.782634	2023-06-25 00:24:02.782634	
510	36104	20233149099	2021	8	1	fam_hijos_100	100.00	2023-06-25 00:24:02.782814	2023-06-25 00:24:02.782814	
511	36104	20233149099	2021	9	1	fam_hijos_100	100.00	2023-06-25 00:24:02.782996	2023-06-25 00:24:02.782996	
512	36104	20233149099	2021	10	1	fam_hijos_100	100.00	2023-06-25 00:24:02.783168	2023-06-25 00:24:02.783168	
513	36104	20233149099	2021	11	1	fam_hijos_100	100.00	2023-06-25 00:24:02.783361	2023-06-25 00:24:02.783361	
514	36104	20233149099	2021	12	1	fam_hijos_100	100.00	2023-06-25 00:24:02.783525	2023-06-25 00:24:02.783525	
515	36104	20233149099	2021	1	1	fam_hijos_100	100.00	2023-06-25 00:24:02.783807	2023-06-25 00:24:02.783807	
516	36104	20233149099	2021	2	1	fam_hijos_100	100.00	2023-06-25 00:24:02.783986	2023-06-25 00:24:02.783986	
517	36104	20233149099	2021	3	1	fam_hijos_100	100.00	2023-06-25 00:24:02.784151	2023-06-25 00:24:02.784151	
518	36104	20233149099	2021	4	1	fam_hijos_100	100.00	2023-06-25 00:24:02.784313	2023-06-25 00:24:02.784313	
519	36104	20233149099	2021	5	1	fam_hijos_100	100.00	2023-06-25 00:24:02.784484	2023-06-25 00:24:02.784484	
520	36104	20233149099	2021	6	1	fam_hijos_100	100.00	2023-06-25 00:24:02.784649	2023-06-25 00:24:02.784649	
521	36104	20233149099	2021	7	1	fam_hijos_100	100.00	2023-06-25 00:24:02.784816	2023-06-25 00:24:02.784816	
522	36104	20233149099	2021	8	1	fam_hijos_100	100.00	2023-06-25 00:24:02.784983	2023-06-25 00:24:02.784983	
523	36104	20233149099	2021	9	1	fam_hijos_100	100.00	2023-06-25 00:24:02.785144	2023-06-25 00:24:02.785144	
524	36104	20233149099	2021	10	1	fam_hijos_100	100.00	2023-06-25 00:24:02.785547	2023-06-25 00:24:02.785547	
525	36104	20233149099	2021	11	1	fam_hijos_100	100.00	2023-06-25 00:24:02.785825	2023-06-25 00:24:02.785825	
526	36104	20233149099	2021	12	1	fam_hijos_100	100.00	2023-06-25 00:24:02.78608	2023-06-25 00:24:02.78608	
527	36104	20233149099	2021	1	1	otro_ex_nogan	484.00	2023-06-25 00:24:02.787667	2023-06-25 00:24:02.787667	
528	36104	20233149099	2021	1	1	otro_obra_soc	167.14	2023-06-25 00:24:02.788123	2023-06-25 00:24:02.788123	
529	36104	20233149099	2021	1	1	otro_seg_soc	557.12	2023-06-25 00:24:02.788489	2023-06-25 00:24:02.788489	
530	36104	20233149099	2021	1	1	otro_gan_brut	3965.00	2023-06-25 00:24:02.788839	2023-06-25 00:24:02.788839	
531	36104	20233149099	2021	1	1	otro_sac	3481.98	2023-06-25 00:24:02.789206	2023-06-25 00:24:02.789206	
532	36104	20233149099	2021	2	1	otro_gan_brut	5000.00	2023-06-25 00:24:02.789879	2023-06-25 00:24:02.789879	
533	36104	20233149099	2021	2	1	otro_ex_nogan	484.00	2023-06-25 00:24:02.790272	2023-06-25 00:24:02.790272	
534	36104	20233149099	2021	2	1	otro_obra_soc	260.00	2023-06-25 00:24:02.790568	2023-06-25 00:24:02.790568	
535	36104	20233149099	2021	2	1	otro_seg_soc	867.00	2023-06-25 00:24:02.790875	2023-06-25 00:24:02.790875	
536	36104	20233149099	2021	3	1	otro_ex_nogan	404.00	2023-06-25 00:24:02.79141	2023-06-25 00:24:02.79141	
537	36104	20233149099	2021	3	1	otro_obra_soc	300.00	2023-06-25 00:24:02.79172	2023-06-25 00:24:02.79172	
538	36104	20233149099	2021	3	1	otro_seg_soc	1000.31	2023-06-25 00:24:02.792002	2023-06-25 00:24:02.792002	
539	36104	20233149099	2021	3	1	otro_gan_brut	6650.00	2023-06-25 00:24:02.792308	2023-06-25 00:24:02.792308	
540	36104	20233149099	2021	3	1	otro_sac	828.79	2023-06-25 00:24:02.792583	2023-06-25 00:24:02.792583	
541	36104	20233149099	2021	4	1	otro_ex_nogan	322.00	2023-06-25 00:24:02.793095	2023-06-25 00:24:02.793095	
542	36104	20233149099	2021	4	1	otro_gan_brut	322.00	2023-06-25 00:24:02.793401	2023-06-25 00:24:02.793401	
543	36104	20233149099	2021	5	1	otro_ex_nogan	322.00	2023-06-25 00:24:02.793873	2023-06-25 00:24:02.793873	
544	36104	20233149099	2021	5	1	otro_gan_brut	322.00	2023-06-25 00:24:02.794122	2023-06-25 00:24:02.794122	
545	36104	20233149099	2021	6	1	otro_ex_nogan	165.00	2023-06-25 00:24:02.794554	2023-06-25 00:24:02.794554	
546	36104	20233149099	2021	6	1	otro_gan_brut	165.00	2023-06-25 00:24:02.794797	2023-06-25 00:24:02.794797	
547	36104	20233149099	2021	7	1	otro_sac	10638.00	2023-06-25 00:24:02.79523	2023-06-25 00:24:02.79523	
548	36104	20233149099	2021	7	1	otro_gan_brut	127048.00	2023-06-25 00:24:02.795477	2023-06-25 00:24:02.795477	
549	36104	20233149099	2021	7	1	otro_obra_soc	5948.00	2023-06-25 00:24:02.795703	2023-06-25 00:24:02.795703	
550	36104	20233149099	2021	7	1	otro_seg_soc	19826.94	2023-06-25 00:24:02.795923	2023-06-25 00:24:02.795923	
551	36104	20233149099	2021	7	1	otro_ex_nogan	2420.00	2023-06-25 00:24:02.796308	2023-06-25 00:24:02.796308	
552	36104	20233149099	2021	8	1	otro_seg_soc	7793.07	2023-06-25 00:24:02.797216	2023-06-25 00:24:02.797216	
553	36104	20233149099	2021	8	1	otro_ex_nogan	2420.00	2023-06-25 00:24:02.798141	2023-06-25 00:24:02.798141	
554	36104	20233149099	2021	8	1	otro_obra_soc	2337.92	2023-06-25 00:24:02.798455	2023-06-25 00:24:02.798455	
555	36104	20233149099	2021	8	1	otro_gan_brut	51836.00	2023-06-25 00:24:02.798741	2023-06-25 00:24:02.798741	
556	36104	20233149099	2021	9	1	otro_obra_soc	2337.92	2023-06-25 00:24:02.799311	2023-06-25 00:24:02.799311	
557	36104	20233149099	2021	9	1	otro_seg_soc	7793.07	2023-06-25 00:24:02.799589	2023-06-25 00:24:02.799589	
558	36104	20233149099	2021	9	1	otro_ex_nogan	1181.86	2023-06-25 00:24:02.799828	2023-06-25 00:24:02.799828	
559	36104	20233149099	2021	9	1	otro_gan_brut	50598.56	2023-06-25 00:24:02.800085	2023-06-25 00:24:02.800085	
560	36104	20233149099	2021	10	1	otro_seg_soc	7952.50	2023-06-25 00:24:02.800543	2023-06-25 00:24:02.800543	
561	36104	20233149099	2021	10	1	otro_ex_nogan	2830.00	2023-06-25 00:24:02.800806	2023-06-25 00:24:02.800806	
562	36104	20233149099	2021	10	1	otro_obra_soc	2385.75	2023-06-25 00:24:02.801055	2023-06-25 00:24:02.801055	
563	36104	20233149099	2021	10	1	otro_gan_brut	53533.10	2023-06-25 00:24:02.801304	2023-06-25 00:24:02.801304	
564	36104	20233149099	2021	11	1	otro_seg_soc	8261.00	2023-06-25 00:24:02.801773	2023-06-25 00:24:02.801773	
565	36104	20233149099	2021	11	1	otro_ex_nogan	2830.00	2023-06-25 00:24:02.802032	2023-06-25 00:24:02.802032	
566	36104	20233149099	2021	11	1	otro_obra_soc	2478.50	2023-06-25 00:24:02.80227	2023-06-25 00:24:02.80227	
567	36104	20233149099	2021	11	1	otro_gan_brut	55466.00	2023-06-25 00:24:02.802503	2023-06-25 00:24:02.802503	
568	36104	20233149099	2021	12	1	otro_gan_brut	57714.00	2023-06-25 00:24:02.802967	2023-06-25 00:24:02.802967	
569	36104	20233149099	2021	12	1	otro_obra_soc	2586.46	2023-06-25 00:24:02.803203	2023-06-25 00:24:02.803203	
570	36104	20233149099	2021	12	1	otro_seg_soc	8261.54	2023-06-25 00:24:02.803432	2023-06-25 00:24:02.803432	
571	36104	20233149099	2021	12	1	otro_ex_nogan	2830.00	2023-06-25 00:24:02.803654	2023-06-25 00:24:02.803654	
572	42480	20281965973	2022	1	1	ded_cuota_medica	0.01	2023-06-25 00:24:02.811016	2023-06-25 00:24:02.811016	
573	42480	20281965973	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:02.811607	2023-06-25 00:24:02.811607	
574	42480	20281965973	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:02.811984	2023-06-25 00:24:02.811984	
575	42480	20281965973	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:02.812371	2023-06-25 00:24:02.812371	
576	42480	20281965973	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:02.812718	2023-06-25 00:24:02.812718	
577	42480	20281965973	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:02.813087	2023-06-25 00:24:02.813087	
578	42480	20281965973	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:02.813456	2023-06-25 00:24:02.813456	
579	42480	20281965973	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:02.814478	2023-06-25 00:24:02.814478	
580	42480	20281965973	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:02.814745	2023-06-25 00:24:02.814745	
581	42480	20281965973	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:02.814932	2023-06-25 00:24:02.814932	
582	42480	20281965973	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:02.815139	2023-06-25 00:24:02.815139	
583	42480	20281965973	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:02.815345	2023-06-25 00:24:02.815345	
584	42480	20281965973	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:24:02.815589	2023-06-25 00:24:02.815589	
585	42480	20281965973	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:02.815929	2023-06-25 00:24:02.815929	
586	42480	20281965973	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:02.816121	2023-06-25 00:24:02.816121	
587	42480	20281965973	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:02.816332	2023-06-25 00:24:02.816332	
588	42480	20281965973	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:02.816516	2023-06-25 00:24:02.816516	
589	42480	20281965973	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:02.816699	2023-06-25 00:24:02.816699	
590	42480	20281965973	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:02.816878	2023-06-25 00:24:02.816878	
591	42480	20281965973	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:02.817053	2023-06-25 00:24:02.817053	
592	42480	20281965973	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:02.817268	2023-06-25 00:24:02.817268	
593	42480	20281965973	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:02.817478	2023-06-25 00:24:02.817478	
594	42480	20281965973	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:02.817695	2023-06-25 00:24:02.817695	
595	42480	20281965973	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:02.817871	2023-06-25 00:24:02.817871	
596	47457	20286436995	2022	1	1	ded_domestica	36393.36	2023-06-25 00:24:02.82247	2023-06-25 00:24:02.82247	
597	47457	20286436995	2022	2	1	ded_domestica	36923.41	2023-06-25 00:24:02.822866	2023-06-25 00:24:02.822866	
598	47457	20286436995	2022	1	1	fam_hijos_100	50.00	2023-06-25 00:24:02.823201	2023-06-25 00:24:02.823201	
599	47457	20286436995	2022	2	1	fam_hijos_100	50.00	2023-06-25 00:24:02.823419	2023-06-25 00:24:02.823419	
600	47457	20286436995	2022	3	1	fam_hijos_100	50.00	2023-06-25 00:24:02.823594	2023-06-25 00:24:02.823594	
601	47457	20286436995	2022	4	1	fam_hijos_100	50.00	2023-06-25 00:24:02.823773	2023-06-25 00:24:02.823773	
602	47457	20286436995	2022	5	1	fam_hijos_100	50.00	2023-06-25 00:24:02.823936	2023-06-25 00:24:02.823936	
603	47457	20286436995	2022	6	1	fam_hijos_100	50.00	2023-06-25 00:24:02.824123	2023-06-25 00:24:02.824123	
604	47457	20286436995	2022	7	1	fam_hijos_100	50.00	2023-06-25 00:24:02.82429	2023-06-25 00:24:02.82429	
605	47457	20286436995	2022	8	1	fam_hijos_100	50.00	2023-06-25 00:24:02.824454	2023-06-25 00:24:02.824454	
606	47457	20286436995	2022	9	1	fam_hijos_100	50.00	2023-06-25 00:24:02.824625	2023-06-25 00:24:02.824625	
607	47457	20286436995	2022	10	1	fam_hijos_100	50.00	2023-06-25 00:24:02.824786	2023-06-25 00:24:02.824786	
608	47457	20286436995	2022	11	1	fam_hijos_100	50.00	2023-06-25 00:24:02.824949	2023-06-25 00:24:02.824949	
609	47457	20286436995	2022	12	1	fam_hijos_100	50.00	2023-06-25 00:24:02.825115	2023-06-25 00:24:02.825115	
610	47457	20286436995	2022	1	1	fam_hijos_100	50.00	2023-06-25 00:24:02.825395	2023-06-25 00:24:02.825395	
611	47457	20286436995	2022	2	1	fam_hijos_100	50.00	2023-06-25 00:24:02.825634	2023-06-25 00:24:02.825634	
612	47457	20286436995	2022	3	1	fam_hijos_100	50.00	2023-06-25 00:24:02.825841	2023-06-25 00:24:02.825841	
613	47457	20286436995	2022	4	1	fam_hijos_100	50.00	2023-06-25 00:24:02.826036	2023-06-25 00:24:02.826036	
614	47457	20286436995	2022	5	1	fam_hijos_100	50.00	2023-06-25 00:24:02.826863	2023-06-25 00:24:02.826863	
615	47457	20286436995	2022	6	1	fam_hijos_100	50.00	2023-06-25 00:24:02.827157	2023-06-25 00:24:02.827157	
616	47457	20286436995	2022	7	1	fam_hijos_100	50.00	2023-06-25 00:24:02.827365	2023-06-25 00:24:02.827365	
617	47457	20286436995	2022	8	1	fam_hijos_100	50.00	2023-06-25 00:24:02.827562	2023-06-25 00:24:02.827562	
618	47457	20286436995	2022	9	1	fam_hijos_100	50.00	2023-06-25 00:24:02.827743	2023-06-25 00:24:02.827743	
619	47457	20286436995	2022	10	1	fam_hijos_100	50.00	2023-06-25 00:24:02.827924	2023-06-25 00:24:02.827924	
620	47457	20286436995	2022	11	1	fam_hijos_100	50.00	2023-06-25 00:24:02.828101	2023-06-25 00:24:02.828101	
621	47457	20286436995	2022	12	1	fam_hijos_100	50.00	2023-06-25 00:24:02.828282	2023-06-25 00:24:02.828282	
622	43095	20287462477	2021	1	3	ded_cuota_medica	2412.82	2023-06-25 00:24:02.832301	2023-06-25 00:24:02.832301	
623	43095	20287462477	2021	11	3	ded_cuota_medica	317.31	2023-06-25 00:24:02.832634	2023-06-25 00:24:02.832634	
624	43095	20287462477	2021	12	3	ded_cuota_medica	5436.04	2023-06-25 00:24:02.832927	2023-06-25 00:24:02.832927	
625	43095	20287462477	2021	1	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.833302	2023-06-25 00:24:02.833302	
626	43095	20287462477	2021	2	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.833513	2023-06-25 00:24:02.833513	
627	43095	20287462477	2021	3	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.833762	2023-06-25 00:24:02.833762	
628	43095	20287462477	2021	4	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.833997	2023-06-25 00:24:02.833997	
629	43095	20287462477	2021	5	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.834232	2023-06-25 00:24:02.834232	
630	43095	20287462477	2021	6	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.834424	2023-06-25 00:24:02.834424	
631	43095	20287462477	2021	7	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.83464	2023-06-25 00:24:02.83464	
632	43095	20287462477	2021	8	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.834814	2023-06-25 00:24:02.834814	
633	43095	20287462477	2021	9	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.834996	2023-06-25 00:24:02.834996	
634	43095	20287462477	2021	10	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.835194	2023-06-25 00:24:02.835194	
635	43095	20287462477	2021	11	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.835364	2023-06-25 00:24:02.835364	
636	43095	20287462477	2021	12	3	FECDEVDESDE	100.00	2023-06-25 00:24:02.835542	2023-06-25 00:24:02.835542	
637	43095	20287462477	2021	1	3	fam_hijos_100	100.00	2023-06-25 00:24:02.835823	2023-06-25 00:24:02.835823	
638	43095	20287462477	2021	2	3	fam_hijos_100	100.00	2023-06-25 00:24:02.835984	2023-06-25 00:24:02.835984	
639	43095	20287462477	2021	3	3	fam_hijos_100	100.00	2023-06-25 00:24:02.836152	2023-06-25 00:24:02.836152	
640	43095	20287462477	2021	4	3	fam_hijos_100	100.00	2023-06-25 00:24:02.836355	2023-06-25 00:24:02.836355	
641	43095	20287462477	2021	5	3	fam_hijos_100	100.00	2023-06-25 00:24:02.836531	2023-06-25 00:24:02.836531	
642	43095	20287462477	2021	6	3	fam_hijos_100	100.00	2023-06-25 00:24:02.836717	2023-06-25 00:24:02.836717	
643	43095	20287462477	2021	7	3	fam_hijos_100	100.00	2023-06-25 00:24:02.836903	2023-06-25 00:24:02.836903	
644	43095	20287462477	2021	8	3	fam_hijos_100	100.00	2023-06-25 00:24:02.837128	2023-06-25 00:24:02.837128	
645	43095	20287462477	2021	9	3	fam_hijos_100	100.00	2023-06-25 00:24:02.837364	2023-06-25 00:24:02.837364	
646	43095	20287462477	2021	10	3	fam_hijos_100	100.00	2023-06-25 00:24:02.837563	2023-06-25 00:24:02.837563	
647	43095	20287462477	2021	11	3	fam_hijos_100	100.00	2023-06-25 00:24:02.837765	2023-06-25 00:24:02.837765	
648	43095	20287462477	2021	12	3	fam_hijos_100	100.00	2023-06-25 00:24:02.837989	2023-06-25 00:24:02.837989	
649	43095	20287462477	2022	1	1	ded_cuota_medica	5436.04	2023-06-25 00:24:02.844927	2023-06-25 00:24:02.844927	
650	43095	20287462477	2022	2	1	ded_cuota_medica	4504.36	2023-06-25 00:24:02.845576	2023-06-25 00:24:02.845576	
651	43095	20287462477	2022	1	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.845967	2023-06-25 00:24:02.845967	
652	43095	20287462477	2022	2	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.846187	2023-06-25 00:24:02.846187	
653	43095	20287462477	2022	3	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.846397	2023-06-25 00:24:02.846397	
654	43095	20287462477	2022	4	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.846671	2023-06-25 00:24:02.846671	
655	43095	20287462477	2022	5	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.84687	2023-06-25 00:24:02.84687	
656	43095	20287462477	2022	6	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.847063	2023-06-25 00:24:02.847063	
657	43095	20287462477	2022	7	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.847254	2023-06-25 00:24:02.847254	
658	43095	20287462477	2022	8	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.847438	2023-06-25 00:24:02.847438	
659	43095	20287462477	2022	9	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.847623	2023-06-25 00:24:02.847623	
660	43095	20287462477	2022	10	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.847807	2023-06-25 00:24:02.847807	
661	43095	20287462477	2022	11	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.847992	2023-06-25 00:24:02.847992	
662	43095	20287462477	2022	12	1	FECDEVDESDE	100.00	2023-06-25 00:24:02.848171	2023-06-25 00:24:02.848171	
663	43095	20287462477	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:02.848448	2023-06-25 00:24:02.848448	
664	43095	20287462477	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:02.848615	2023-06-25 00:24:02.848615	
665	43095	20287462477	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:02.84879	2023-06-25 00:24:02.84879	
666	43095	20287462477	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:02.849013	2023-06-25 00:24:02.849013	
667	43095	20287462477	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:02.84924	2023-06-25 00:24:02.84924	
668	43095	20287462477	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:02.849449	2023-06-25 00:24:02.849449	
669	43095	20287462477	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:02.849664	2023-06-25 00:24:02.849664	
670	43095	20287462477	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:02.849863	2023-06-25 00:24:02.849863	
671	43095	20287462477	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:02.850053	2023-06-25 00:24:02.850053	
672	43095	20287462477	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:02.850247	2023-06-25 00:24:02.850247	
673	43095	20287462477	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:02.850466	2023-06-25 00:24:02.850466	
674	43095	20287462477	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:24:02.850643	2023-06-25 00:24:02.850643	
675	44223	20307785197	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:02.855901	2023-06-25 00:24:02.855901	
676	44223	20307785197	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:02.856189	2023-06-25 00:24:02.856189	
677	44223	20307785197	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:02.856413	2023-06-25 00:24:02.856413	
678	44223	20307785197	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:02.856622	2023-06-25 00:24:02.856622	
679	44223	20307785197	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:02.856842	2023-06-25 00:24:02.856842	
680	44223	20307785197	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:02.857049	2023-06-25 00:24:02.857049	
681	44223	20307785197	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:02.857259	2023-06-25 00:24:02.857259	
682	44223	20307785197	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:02.857498	2023-06-25 00:24:02.857498	
683	44223	20307785197	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:02.857697	2023-06-25 00:24:02.857697	
684	44223	20307785197	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:02.857882	2023-06-25 00:24:02.857882	
685	44223	20307785197	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:02.858055	2023-06-25 00:24:02.858055	
686	44223	20307785197	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:24:02.858234	2023-06-25 00:24:02.858234	
687	44139	20323948918	2022	1	1	ded_cuota_medica	0.01	2023-06-25 00:24:02.86235	2023-06-25 00:24:02.86235	
688	44139	20323948918	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:02.863053	2023-06-25 00:24:02.863053	
689	44139	20323948918	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:02.863284	2023-06-25 00:24:02.863284	
690	44139	20323948918	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:02.863481	2023-06-25 00:24:02.863481	
691	44139	20323948918	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:02.863669	2023-06-25 00:24:02.863669	
692	44139	20323948918	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:02.863849	2023-06-25 00:24:02.863849	
693	44139	20323948918	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:02.864026	2023-06-25 00:24:02.864026	
694	44139	20323948918	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:02.864205	2023-06-25 00:24:02.864205	
695	44139	20323948918	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:02.864383	2023-06-25 00:24:02.864383	
696	44139	20323948918	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:02.864561	2023-06-25 00:24:02.864561	
697	44139	20323948918	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:02.864748	2023-06-25 00:24:02.864748	
698	44139	20323948918	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:02.864925	2023-06-25 00:24:02.864925	
699	44139	20323948918	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:24:02.865107	2023-06-25 00:24:02.865107	
700	40082	20325658356	2021	2	3	ded_cuota_medica	197.00	2023-06-25 00:24:02.870127	2023-06-25 00:24:02.870127	
701	40082	20325658356	2021	3	3	ded_cuota_medica	197.00	2023-06-25 00:24:02.870754	2023-06-25 00:24:02.870754	
702	40082	20325658356	2021	4	3	ded_cuota_medica	650.00	2023-06-25 00:24:02.871499	2023-06-25 00:24:02.871499	
703	40082	20325658356	2021	5	3	ded_cuota_medica	1252.00	2023-06-25 00:24:02.872156	2023-06-25 00:24:02.872156	
704	40082	20325658356	2021	6	3	ded_cuota_medica	2021.00	2023-06-25 00:24:02.872664	2023-06-25 00:24:02.872664	
705	40082	20325658356	2021	1	3	ded_domestica	18243.50	2023-06-25 00:24:02.87348	2023-06-25 00:24:02.87348	
706	40082	20325658356	2021	2	3	ded_domestica	21445.10	2023-06-25 00:24:02.874089	2023-06-25 00:24:02.874089	
707	40082	20325658356	2021	3	3	ded_domestica	23296.76	2023-06-25 00:24:02.874631	2023-06-25 00:24:02.874631	
708	40082	20325658356	2021	4	3	ded_domestica	23300.09	2023-06-25 00:24:02.875148	2023-06-25 00:24:02.875148	
709	40082	20325658356	2021	5	3	ded_domestica	23328.19	2023-06-25 00:24:02.875668	2023-06-25 00:24:02.875668	
710	40082	20325658356	2021	6	3	ded_domestica	37660.56	2023-06-25 00:24:02.876277	2023-06-25 00:24:02.876277	
711	40082	20325658356	2021	7	3	ded_domestica	26334.01	2023-06-25 00:24:02.876738	2023-06-25 00:24:02.876738	
712	40082	20325658356	2021	8	3	ded_domestica	26334.01	2023-06-25 00:24:02.877003	2023-06-25 00:24:02.877003	
713	40082	20325658356	2021	9	3	ded_domestica	29123.05	2023-06-25 00:24:02.877488	2023-06-25 00:24:02.877488	
714	40082	20325658356	2021	10	3	ded_domestica	29123.05	2023-06-25 00:24:02.877699	2023-06-25 00:24:02.877699	
715	40082	20325658356	2021	11	3	ded_domestica	30549.55	2023-06-25 00:24:02.877991	2023-06-25 00:24:02.877991	
716	40082	20325658356	2021	12	3	ded_domestica	47054.05	2023-06-25 00:24:02.878326	2023-06-25 00:24:02.878326	
717	40082	20325658356	2022	1	1	ded_cuota_medica	1500.00	2023-06-25 00:24:02.882604	2023-06-25 00:24:02.882604	
718	40082	20325658356	2022	2	1	ded_cuota_medica	1500.00	2023-06-25 00:24:02.882803	2023-06-25 00:24:02.882803	
719	40082	20325658356	2022	3	1	ded_cuota_medica	1500.00	2023-06-25 00:24:02.883028	2023-06-25 00:24:02.883028	
720	40082	20325658356	2022	1	1	ded_domestica	32241.04	2023-06-25 00:24:02.883435	2023-06-25 00:24:02.883435	
721	40082	20325658356	2022	2	1	ded_domestica	32265.92	2023-06-25 00:24:02.883721	2023-06-25 00:24:02.883721	
722	40082	20325658356	2022	3	1	ded_domestica	34997.92	2023-06-25 00:24:02.884024	2023-06-25 00:24:02.884024	
723	43910	20352712990	2021	10	3	ded_donaciones	30000.00	2023-06-25 00:24:02.888098	2023-06-25 00:24:02.888098	
724	43910	20352712990	2021	11	3	ded_donaciones	25000.00	2023-06-25 00:24:02.888532	2023-06-25 00:24:02.888532	
725	43910	20352712990	2021	11	3	ded_gastos_medicos	3240.00	2023-06-25 00:24:02.888971	2023-06-25 00:24:02.888971	
726	43910	20352712990	2021	12	3	ded_gastos_medicos	2160.00	2023-06-25 00:24:02.889293	2023-06-25 00:24:02.889293	
727	43910	20352712990	2022	1	2	ded_gastos_medicos	3240.00	2023-06-25 00:24:02.893156	2023-06-25 00:24:02.893156	
728	43910	20352712990	2022	3	2	ded_gastos_medicos	2320.00	2023-06-25 00:24:02.893504	2023-06-25 00:24:02.893504	
729	41544	20371039660	2022	4	5	ded_gastos_medicos	4000.00	2023-06-25 00:24:02.897284	2023-06-25 00:24:02.897284	
730	41544	20371039660	2022	1	5	ded_domestica	24069.00	2023-06-25 00:24:02.89786	2023-06-25 00:24:02.89786	
731	41544	20371039660	2022	2	5	ded_domestica	15360.00	2023-06-25 00:24:02.898254	2023-06-25 00:24:02.898254	
732	41544	20371039660	2022	3	5	ded_domestica	16680.00	2023-06-25 00:24:02.898582	2023-06-25 00:24:02.898582	
733	41544	20371039660	2022	4	5	ded_domestica	16680.00	2023-06-25 00:24:02.898759	2023-06-25 00:24:02.898759	
734	17718	23145545374	2021	1	5	ded_cuota_medica	2050.03	2023-06-25 00:24:02.908161	2023-06-25 00:24:02.908161	
735	17718	23145545374	2021	2	5	ded_cuota_medica	1656.00	2023-06-25 00:24:02.908658	2023-06-25 00:24:02.908658	
736	17718	23145545374	2021	3	5	ded_cuota_medica	5957.00	2023-06-25 00:24:02.909648	2023-06-25 00:24:02.909648	
737	17718	23145545374	2021	4	5	ded_cuota_medica	6009.00	2023-06-25 00:24:02.910088	2023-06-25 00:24:02.910088	
738	17718	23145545374	2021	5	5	ded_cuota_medica	2311.00	2023-06-25 00:24:02.91043	2023-06-25 00:24:02.91043	
739	17718	23145545374	2021	6	5	ded_cuota_medica	1940.00	2023-06-25 00:24:02.91075	2023-06-25 00:24:02.91075	
740	17718	23145545374	2021	7	5	ded_cuota_medica	4283.00	2023-06-25 00:24:02.911048	2023-06-25 00:24:02.911048	
741	19344	23221670094	2021	1	3	ded_cuota_medica	8543.10	2023-06-25 00:24:02.917908	2023-06-25 00:24:02.917908	
742	19344	23221670094	2021	2	3	ded_cuota_medica	8469.05	2023-06-25 00:24:02.918289	2023-06-25 00:24:02.918289	
743	19344	23221670094	2021	3	3	ded_cuota_medica	8625.90	2023-06-25 00:24:02.918652	2023-06-25 00:24:02.918652	
744	19344	23221670094	2021	4	3	ded_cuota_medica	5145.67	2023-06-25 00:24:02.918985	2023-06-25 00:24:02.918985	
745	19344	23221670094	2021	5	3	ded_cuota_medica	12765.63	2023-06-25 00:24:02.919313	2023-06-25 00:24:02.919313	
746	19344	23221670094	2021	6	3	ded_cuota_medica	11668.51	2023-06-25 00:24:02.919636	2023-06-25 00:24:02.919636	
747	19344	23221670094	2021	7	3	ded_cuota_medica	11668.51	2023-06-25 00:24:02.919825	2023-06-25 00:24:02.919825	
748	19344	23221670094	2021	8	3	ded_cuota_medica	11239.57	2023-06-25 00:24:02.920146	2023-06-25 00:24:02.920146	
749	19344	23221670094	2021	9	3	ded_cuota_medica	16414.33	2023-06-25 00:24:02.920525	2023-06-25 00:24:02.920525	
750	19344	23221670094	2021	10	3	ded_cuota_medica	12982.96	2023-06-25 00:24:02.920886	2023-06-25 00:24:02.920886	
751	19344	23221670094	2021	11	3	ded_cuota_medica	16121.86	2023-06-25 00:24:02.921232	2023-06-25 00:24:02.921232	
752	19344	23221670094	2021	12	3	ded_cuota_medica	15976.90	2023-06-25 00:24:02.921585	2023-06-25 00:24:02.921585	
753	43504	23233379379	2021	1	10	ded_cuota_medica	6067.62	2023-06-25 00:24:02.926295	2023-06-25 00:24:02.926295	
754	43504	23233379379	2021	2	10	ded_cuota_medica	5587.24	2023-06-25 00:24:02.926677	2023-06-25 00:24:02.926677	
755	43504	23233379379	2021	3	10	ded_cuota_medica	5940.57	2023-06-25 00:24:02.927016	2023-06-25 00:24:02.927016	
756	43504	23233379379	2021	4	10	ded_cuota_medica	6093.03	2023-06-25 00:24:02.927349	2023-06-25 00:24:02.927349	
757	43504	23233379379	2021	5	10	ded_cuota_medica	7193.08	2023-06-25 00:24:02.927674	2023-06-25 00:24:02.927674	
758	43504	23233379379	2021	7	10	ded_cuota_medica	6040.06	2023-06-25 00:24:02.928008	2023-06-25 00:24:02.928008	
759	43504	23233379379	2021	8	10	ded_cuota_medica	7676.16	2023-06-25 00:24:02.928354	2023-06-25 00:24:02.928354	
760	43504	23233379379	2021	9	10	ded_cuota_medica	8485.88	2023-06-25 00:24:02.928688	2023-06-25 00:24:02.928688	
761	43504	23233379379	2021	10	10	ded_cuota_medica	11141.03	2023-06-25 00:24:02.929068	2023-06-25 00:24:02.929068	
762	43504	23233379379	2021	1	10	fam_hijos_100	100.00	2023-06-25 00:24:02.929458	2023-06-25 00:24:02.929458	
763	43504	23233379379	2021	2	10	fam_hijos_100	100.00	2023-06-25 00:24:02.929677	2023-06-25 00:24:02.929677	
764	43504	23233379379	2021	3	10	fam_hijos_100	100.00	2023-06-25 00:24:02.929898	2023-06-25 00:24:02.929898	
765	43504	23233379379	2021	4	10	fam_hijos_100	100.00	2023-06-25 00:24:02.930103	2023-06-25 00:24:02.930103	
766	43504	23233379379	2021	5	10	fam_hijos_100	100.00	2023-06-25 00:24:02.930299	2023-06-25 00:24:02.930299	
767	43504	23233379379	2021	6	10	fam_hijos_100	100.00	2023-06-25 00:24:02.930497	2023-06-25 00:24:02.930497	
768	43504	23233379379	2021	7	10	fam_hijos_100	100.00	2023-06-25 00:24:02.930696	2023-06-25 00:24:02.930696	
769	43504	23233379379	2021	8	10	fam_hijos_100	100.00	2023-06-25 00:24:02.930888	2023-06-25 00:24:02.930888	
770	43504	23233379379	2021	9	10	fam_hijos_100	100.00	2023-06-25 00:24:02.931078	2023-06-25 00:24:02.931078	
771	43504	23233379379	2021	10	10	fam_hijos_100	100.00	2023-06-25 00:24:02.931278	2023-06-25 00:24:02.931278	
772	43504	23233379379	2021	11	10	fam_hijos_100	100.00	2023-06-25 00:24:02.931472	2023-06-25 00:24:02.931472	
773	43504	23233379379	2021	12	10	fam_hijos_100	100.00	2023-06-25 00:24:02.93171	2023-06-25 00:24:02.93171	
774	43767	23270252974	2021	1	3	ded_cuota_medica	7500.00	2023-06-25 00:24:02.940442	2023-06-25 00:24:02.940442	
775	43767	23270252974	2021	2	3	ded_cuota_medica	7500.00	2023-06-25 00:24:02.941025	2023-06-25 00:24:02.941025	
776	43767	23270252974	2021	3	3	ded_cuota_medica	7500.00	2023-06-25 00:24:02.941414	2023-06-25 00:24:02.941414	
777	43767	23270252974	2021	4	3	ded_cuota_medica	8200.00	2023-06-25 00:24:02.942206	2023-06-25 00:24:02.942206	
778	43767	23270252974	2021	5	3	ded_cuota_medica	8270.00	2023-06-25 00:24:02.942605	2023-06-25 00:24:02.942605	
779	43767	23270252974	2021	6	3	ded_cuota_medica	8630.00	2023-06-25 00:24:02.942955	2023-06-25 00:24:02.942955	
780	43767	23270252974	2021	7	3	ded_cuota_medica	8710.00	2023-06-25 00:24:02.943296	2023-06-25 00:24:02.943296	
781	43767	23270252974	2021	8	3	ded_cuota_medica	8710.00	2023-06-25 00:24:02.943519	2023-06-25 00:24:02.943519	
782	43767	23270252974	2021	9	3	ded_cuota_medica	6657.11	2023-06-25 00:24:02.943974	2023-06-25 00:24:02.943974	
783	43767	23270252974	2021	10	3	ded_cuota_medica	6657.11	2023-06-25 00:24:02.944204	2023-06-25 00:24:02.944204	
784	43767	23270252974	2021	11	3	ded_cuota_medica	6657.11	2023-06-25 00:24:02.944406	2023-06-25 00:24:02.944406	
785	43767	23270252974	2021	12	3	ded_cuota_medica	6657.11	2023-06-25 00:24:02.944621	2023-06-25 00:24:02.944621	
786	43767	23270252974	2021	1	3	fam_hijos_100	100.00	2023-06-25 00:24:02.944961	2023-06-25 00:24:02.944961	
787	43767	23270252974	2021	2	3	fam_hijos_100	100.00	2023-06-25 00:24:02.945179	2023-06-25 00:24:02.945179	
788	43767	23270252974	2021	3	3	fam_hijos_100	100.00	2023-06-25 00:24:02.945412	2023-06-25 00:24:02.945412	
789	43767	23270252974	2021	4	3	fam_hijos_100	100.00	2023-06-25 00:24:02.945626	2023-06-25 00:24:02.945626	
790	43767	23270252974	2021	5	3	fam_hijos_100	100.00	2023-06-25 00:24:02.945839	2023-06-25 00:24:02.945839	
791	43767	23270252974	2021	6	3	fam_hijos_100	100.00	2023-06-25 00:24:02.946047	2023-06-25 00:24:02.946047	
792	43767	23270252974	2021	7	3	fam_hijos_100	100.00	2023-06-25 00:24:02.946413	2023-06-25 00:24:02.946413	
793	43767	23270252974	2021	8	3	fam_hijos_100	100.00	2023-06-25 00:24:02.946872	2023-06-25 00:24:02.946872	
794	43767	23270252974	2021	9	3	fam_hijos_100	100.00	2023-06-25 00:24:02.947203	2023-06-25 00:24:02.947203	
795	43767	23270252974	2021	10	3	fam_hijos_100	100.00	2023-06-25 00:24:02.947416	2023-06-25 00:24:02.947416	
796	43767	23270252974	2021	11	3	fam_hijos_100	100.00	2023-06-25 00:24:02.947619	2023-06-25 00:24:02.947619	
797	43767	23270252974	2021	12	3	fam_hijos_100	100.00	2023-06-25 00:24:02.947801	2023-06-25 00:24:02.947801	
798	42789	23307781174	2021	1	1	fam_hijos_100	100.00	2023-06-25 00:24:02.95205	2023-06-25 00:24:02.95205	
799	42789	23307781174	2021	2	1	fam_hijos_100	100.00	2023-06-25 00:24:02.952459	2023-06-25 00:24:02.952459	
800	42789	23307781174	2021	3	1	fam_hijos_100	100.00	2023-06-25 00:24:02.952763	2023-06-25 00:24:02.952763	
801	42789	23307781174	2021	4	1	fam_hijos_100	100.00	2023-06-25 00:24:02.953044	2023-06-25 00:24:02.953044	
802	42789	23307781174	2021	5	1	fam_hijos_100	100.00	2023-06-25 00:24:02.953516	2023-06-25 00:24:02.953516	
803	42789	23307781174	2021	6	1	fam_hijos_100	100.00	2023-06-25 00:24:02.953878	2023-06-25 00:24:02.953878	
804	42789	23307781174	2021	7	1	fam_hijos_100	100.00	2023-06-25 00:24:02.954176	2023-06-25 00:24:02.954176	
805	42789	23307781174	2021	8	1	fam_hijos_100	100.00	2023-06-25 00:24:02.954473	2023-06-25 00:24:02.954473	
806	42789	23307781174	2021	9	1	fam_hijos_100	100.00	2023-06-25 00:24:02.954758	2023-06-25 00:24:02.954758	
807	42789	23307781174	2021	10	1	fam_hijos_100	100.00	2023-06-25 00:24:02.955005	2023-06-25 00:24:02.955005	
808	42789	23307781174	2021	11	1	fam_hijos_100	100.00	2023-06-25 00:24:02.955192	2023-06-25 00:24:02.955192	
809	42789	23307781174	2021	12	1	fam_hijos_100	100.00	2023-06-25 00:24:02.955371	2023-06-25 00:24:02.955371	
810	42789	23307781174	2021	1	1	fam_hijos_100	100.00	2023-06-25 00:24:02.95574	2023-06-25 00:24:02.95574	
811	42789	23307781174	2021	2	1	fam_hijos_100	100.00	2023-06-25 00:24:02.955923	2023-06-25 00:24:02.955923	
812	42789	23307781174	2021	3	1	fam_hijos_100	100.00	2023-06-25 00:24:02.956107	2023-06-25 00:24:02.956107	
813	42789	23307781174	2021	4	1	fam_hijos_100	100.00	2023-06-25 00:24:02.956291	2023-06-25 00:24:02.956291	
814	42789	23307781174	2021	5	1	fam_hijos_100	100.00	2023-06-25 00:24:02.956475	2023-06-25 00:24:02.956475	
815	42789	23307781174	2021	6	1	fam_hijos_100	100.00	2023-06-25 00:24:02.956674	2023-06-25 00:24:02.956674	
816	42789	23307781174	2021	7	1	fam_hijos_100	100.00	2023-06-25 00:24:02.956841	2023-06-25 00:24:02.956841	
817	42789	23307781174	2021	8	1	fam_hijos_100	100.00	2023-06-25 00:24:02.957008	2023-06-25 00:24:02.957008	
818	42789	23307781174	2021	9	1	fam_hijos_100	100.00	2023-06-25 00:24:02.957174	2023-06-25 00:24:02.957174	
819	42789	23307781174	2021	10	1	fam_hijos_100	100.00	2023-06-25 00:24:02.957378	2023-06-25 00:24:02.957378	
820	42789	23307781174	2021	11	1	fam_hijos_100	100.00	2023-06-25 00:24:02.957557	2023-06-25 00:24:02.957557	
821	42789	23307781174	2021	12	1	fam_hijos_100	100.00	2023-06-25 00:24:02.957726	2023-06-25 00:24:02.957726	
822	42789	23307781174	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:02.961724	2023-06-25 00:24:02.961724	
823	42789	23307781174	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:02.961961	2023-06-25 00:24:02.961961	
824	42789	23307781174	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:02.962266	2023-06-25 00:24:02.962266	
825	42789	23307781174	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:02.96258	2023-06-25 00:24:02.96258	
826	42789	23307781174	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:02.962888	2023-06-25 00:24:02.962888	
827	42789	23307781174	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:02.963374	2023-06-25 00:24:02.963374	
828	42789	23307781174	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:02.963843	2023-06-25 00:24:02.963843	
829	42789	23307781174	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:02.964593	2023-06-25 00:24:02.964593	
830	42789	23307781174	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:02.964904	2023-06-25 00:24:02.964904	
831	42789	23307781174	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:02.965238	2023-06-25 00:24:02.965238	
832	42789	23307781174	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:02.965571	2023-06-25 00:24:02.965571	
833	42789	23307781174	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:24:02.965859	2023-06-25 00:24:02.965859	
834	42789	23307781174	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:02.966456	2023-06-25 00:24:02.966456	
835	42789	23307781174	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:02.966823	2023-06-25 00:24:02.966823	
836	42789	23307781174	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:02.967108	2023-06-25 00:24:02.967108	
837	42789	23307781174	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:02.967416	2023-06-25 00:24:02.967416	
838	42789	23307781174	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:02.967746	2023-06-25 00:24:02.967746	
839	42789	23307781174	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:02.967997	2023-06-25 00:24:02.967997	
840	42789	23307781174	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:02.968303	2023-06-25 00:24:02.968303	
841	42789	23307781174	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:02.968579	2023-06-25 00:24:02.968579	
842	42789	23307781174	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:02.968838	2023-06-25 00:24:02.968838	
843	42789	23307781174	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:02.969079	2023-06-25 00:24:02.969079	
844	42789	23307781174	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:02.969538	2023-06-25 00:24:02.969538	
845	42789	23307781174	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:24:02.9699	2023-06-25 00:24:02.9699	
846	36515	24244360080	2021	1	2	ded_domestica	8000.00	2023-06-25 00:24:02.98014	2023-06-25 00:24:02.98014	
847	36515	24244360080	2021	2	2	ded_domestica	8000.00	2023-06-25 00:24:02.980378	2023-06-25 00:24:02.980378	
848	36515	24244360080	2021	3	2	ded_domestica	10000.00	2023-06-25 00:24:02.98068	2023-06-25 00:24:02.98068	
849	36515	24244360080	2021	4	2	ded_domestica	10000.00	2023-06-25 00:24:02.980865	2023-06-25 00:24:02.980865	
850	36515	24244360080	2021	5	2	ded_domestica	10000.00	2023-06-25 00:24:02.981042	2023-06-25 00:24:02.981042	
851	36515	24244360080	2021	6	2	ded_domestica	15000.00	2023-06-25 00:24:02.982454	2023-06-25 00:24:02.982454	
852	36515	24244360080	2021	7	2	ded_domestica	10000.00	2023-06-25 00:24:02.982916	2023-06-25 00:24:02.982916	
853	36515	24244360080	2021	8	2	ded_domestica	10000.00	2023-06-25 00:24:02.983151	2023-06-25 00:24:02.983151	
854	36515	24244360080	2021	9	2	ded_domestica	12000.00	2023-06-25 00:24:02.984034	2023-06-25 00:24:02.984034	
855	36515	24244360080	2021	10	2	ded_domestica	12000.00	2023-06-25 00:24:02.984381	2023-06-25 00:24:02.984381	
856	36515	24244360080	2021	11	2	ded_domestica	12000.00	2023-06-25 00:24:02.984615	2023-06-25 00:24:02.984615	
857	36515	24244360080	2021	12	2	ded_domestica	18000.00	2023-06-25 00:24:02.984953	2023-06-25 00:24:02.984953	
858	19299	27106234987	2021	9	13	ded_donaciones	15000.00	2023-06-25 00:24:02.99315	2023-06-25 00:24:02.99315	
859	19299	27106234987	2021	1	13	ded_domestica	20266.39	2023-06-25 00:24:02.993655	2023-06-25 00:24:02.993655	
860	19299	27106234987	2021	2	13	ded_domestica	20266.39	2023-06-25 00:24:02.993858	2023-06-25 00:24:02.993858	
861	19299	27106234987	2021	3	13	ded_domestica	21741.20	2023-06-25 00:24:02.99428	2023-06-25 00:24:02.99428	
862	19299	27106234987	2021	4	13	ded_domestica	23558.90	2023-06-25 00:24:02.995334	2023-06-25 00:24:02.995334	
863	19299	27106234987	2021	5	13	ded_domestica	23558.90	2023-06-25 00:24:02.995752	2023-06-25 00:24:02.995752	
864	19299	27106234987	2021	6	13	ded_domestica	39412.36	2023-06-25 00:24:02.996301	2023-06-25 00:24:02.996301	
865	19299	27106234987	2021	7	13	ded_domestica	26636.34	2023-06-25 00:24:02.996858	2023-06-25 00:24:02.996858	
866	19299	27106234987	2021	8	13	ded_domestica	26642.01	2023-06-25 00:24:02.997476	2023-06-25 00:24:02.997476	
867	19299	27106234987	2021	9	13	ded_domestica	30876.39	2023-06-25 00:24:02.99811	2023-06-25 00:24:02.99811	
868	19299	27106234987	2021	10	13	ded_domestica	30876.39	2023-06-25 00:24:02.998668	2023-06-25 00:24:02.998668	
869	19299	27106234987	2021	11	13	ded_domestica	32310.69	2023-06-25 00:24:02.999092	2023-06-25 00:24:02.999092	
870	19299	27106234987	2021	12	13	ded_domestica	50568.51	2023-06-25 00:24:02.999468	2023-06-25 00:24:02.999468	
871	19299	27106234987	2021	1	13	ded_domestica	25986.61	2023-06-25 00:24:02.999938	2023-06-25 00:24:02.999938	
872	19299	27106234987	2021	2	13	ded_domestica	25986.61	2023-06-25 00:24:03.000128	2023-06-25 00:24:03.000128	
873	19299	27106234987	2021	3	13	ded_domestica	27802.62	2023-06-25 00:24:03.000517	2023-06-25 00:24:03.000517	
874	19299	27106234987	2021	4	13	ded_domestica	30045.62	2023-06-25 00:24:03.000847	2023-06-25 00:24:03.000847	
875	19299	27106234987	2021	5	13	ded_domestica	30045.62	2023-06-25 00:24:03.001038	2023-06-25 00:24:03.001038	
876	19299	27106234987	2021	6	13	ded_domestica	50050.73	2023-06-25 00:24:03.001534	2023-06-25 00:24:03.001534	
877	19299	27106234987	2021	7	13	ded_domestica	34198.21	2023-06-25 00:24:03.001875	2023-06-25 00:24:03.001875	
878	19299	27106234987	2021	8	13	ded_domestica	34203.88	2023-06-25 00:24:03.002202	2023-06-25 00:24:03.002202	
879	19299	27106234987	2021	9	13	ded_domestica	38013.61	2023-06-25 00:24:03.003074	2023-06-25 00:24:03.003074	
880	19299	27106234987	2021	10	13	ded_domestica	38013.61	2023-06-25 00:24:03.003486	2023-06-25 00:24:03.003486	
881	19299	27106234987	2021	11	13	ded_domestica	40101.55	2023-06-25 00:24:03.004065	2023-06-25 00:24:03.004065	
882	19299	27106234987	2021	12	13	ded_domestica	62061.61	2023-06-25 00:24:03.004637	2023-06-25 00:24:03.004637	
883	19263	27124036548	2022	1	1	ded_cuota_medica	1380.00	2023-06-25 00:24:03.010907	2023-06-25 00:24:03.010907	
884	19263	27124036548	2022	2	1	ded_cuota_medica	1380.00	2023-06-25 00:24:03.011175	2023-06-25 00:24:03.011175	
885	19263	27124036548	2022	3	1	ded_cuota_medica	1380.00	2023-06-25 00:24:03.01139	2023-06-25 00:24:03.01139	
886	31763	27124623176	2021	1	1	ded_cuota_medica	12289.59	2023-06-25 00:24:03.018827	2023-06-25 00:24:03.018827	
887	31763	27124623176	2021	2	1	ded_cuota_medica	12289.59	2023-06-25 00:24:03.019031	2023-06-25 00:24:03.019031	
888	31763	27124623176	2021	3	1	ded_cuota_medica	12719.46	2023-06-25 00:24:03.019324	2023-06-25 00:24:03.019324	
889	31763	27124623176	2021	4	1	ded_cuota_medica	13706.79	2023-06-25 00:24:03.019673	2023-06-25 00:24:03.019673	
890	31763	27124623176	2021	5	1	ded_cuota_medica	14021.72	2023-06-25 00:24:03.019999	2023-06-25 00:24:03.019999	
891	31763	27124623176	2021	6	1	ded_cuota_medica	14021.72	2023-06-25 00:24:03.020202	2023-06-25 00:24:03.020202	
892	31763	27124623176	2021	7	1	ded_cuota_medica	14021.72	2023-06-25 00:24:03.020372	2023-06-25 00:24:03.020372	
893	31763	27124623176	2021	8	1	ded_cuota_medica	15283.26	2023-06-25 00:24:03.020654	2023-06-25 00:24:03.020654	
894	31763	27124623176	2021	9	1	ded_cuota_medica	16657.92	2023-06-25 00:24:03.020932	2023-06-25 00:24:03.020932	
895	31763	27124623176	2021	10	1	ded_cuota_medica	18156.56	2023-06-25 00:24:03.021226	2023-06-25 00:24:03.021226	
896	31763	27124623176	2021	11	1	ded_cuota_medica	18156.56	2023-06-25 00:24:03.021422	2023-06-25 00:24:03.021422	
897	31763	27124623176	2021	12	1	ded_cuota_medica	18156.56	2023-06-25 00:24:03.021599	2023-06-25 00:24:03.021599	
898	18146	27140426879	2021	1	12	ded_cuota_medica	1329.97	2023-06-25 00:24:03.030225	2023-06-25 00:24:03.030225	
899	18146	27140426879	2021	2	12	ded_cuota_medica	8889.61	2023-06-25 00:24:03.030611	2023-06-25 00:24:03.030611	
900	18146	27140426879	2021	3	12	ded_cuota_medica	9881.26	2023-06-25 00:24:03.030918	2023-06-25 00:24:03.030918	
901	18146	27140426879	2021	4	12	ded_cuota_medica	5888.34	2023-06-25 00:24:03.031222	2023-06-25 00:24:03.031222	
902	18146	27140426879	2021	5	12	ded_cuota_medica	10319.43	2023-06-25 00:24:03.031533	2023-06-25 00:24:03.031533	
903	18146	27140426879	2021	6	12	ded_cuota_medica	9094.37	2023-06-25 00:24:03.03183	2023-06-25 00:24:03.03183	
904	18146	27140426879	2021	7	12	ded_cuota_medica	12527.26	2023-06-25 00:24:03.032118	2023-06-25 00:24:03.032118	
905	18146	27140426879	2021	8	12	ded_cuota_medica	4728.46	2023-06-25 00:24:03.032406	2023-06-25 00:24:03.032406	
906	18146	27140426879	2021	9	12	ded_cuota_medica	11296.47	2023-06-25 00:24:03.032701	2023-06-25 00:24:03.032701	
907	18146	27140426879	2021	10	12	ded_cuota_medica	12755.84	2023-06-25 00:24:03.032989	2023-06-25 00:24:03.032989	
908	18146	27140426879	2021	11	12	ded_cuota_medica	15938.43	2023-06-25 00:24:03.033491	2023-06-25 00:24:03.033491	
909	18146	27140426879	2021	12	12	ded_cuota_medica	15938.43	2023-06-25 00:24:03.033966	2023-06-25 00:24:03.033966	
910	18146	27140426879	2021	1	12	ded_domestica	14400.00	2023-06-25 00:24:03.034481	2023-06-25 00:24:03.034481	
911	18146	27140426879	2021	2	12	ded_domestica	14400.00	2023-06-25 00:24:03.034671	2023-06-25 00:24:03.034671	
912	18146	27140426879	2021	3	12	ded_domestica	20772.00	2023-06-25 00:24:03.03568	2023-06-25 00:24:03.03568	
913	18146	27140426879	2021	4	12	ded_domestica	18549.00	2023-06-25 00:24:03.036171	2023-06-25 00:24:03.036171	
914	18146	27140426879	2021	5	12	ded_domestica	17680.00	2023-06-25 00:24:03.037372	2023-06-25 00:24:03.037372	
915	18146	27140426879	2021	6	12	ded_domestica	30580.00	2023-06-25 00:24:03.038286	2023-06-25 00:24:03.038286	
916	18146	27140426879	2021	7	12	ded_domestica	19800.00	2023-06-25 00:24:03.03887	2023-06-25 00:24:03.03887	
917	18146	27140426879	2021	8	12	ded_domestica	21760.00	2023-06-25 00:24:03.039378	2023-06-25 00:24:03.039378	
918	18146	27140426879	2021	9	12	ded_domestica	23270.00	2023-06-25 00:24:03.039926	2023-06-25 00:24:03.039926	
919	18146	27140426879	2021	10	12	ded_domestica	23420.00	2023-06-25 00:24:03.040408	2023-06-25 00:24:03.040408	
920	18146	27140426879	2021	11	12	ded_domestica	24300.00	2023-06-25 00:24:03.04089	2023-06-25 00:24:03.04089	
921	18146	27140426879	2021	12	12	ded_domestica	34405.00	2023-06-25 00:24:03.0413	2023-06-25 00:24:03.0413	
922	18146	27140426879	2021	1	12	otro_ret_gan	1295.04	2023-06-25 00:24:03.050748	2023-06-25 00:24:03.050748	
923	18146	27140426879	2021	1	12	otro_seg_soc	9152.88	2023-06-25 00:24:03.051023	2023-06-25 00:24:03.051023	
924	18146	27140426879	2021	1	12	otro_sindicato	1889.64	2023-06-25 00:24:03.051299	2023-06-25 00:24:03.051299	
925	18146	27140426879	2021	1	12	otro_ex_nogan	109710.71	2023-06-25 00:24:03.051539	2023-06-25 00:24:03.051539	
926	18146	27140426879	2021	2	12	otro_ex_nogan	114862.54	2023-06-25 00:24:03.051998	2023-06-25 00:24:03.051998	
927	18146	27140426879	2021	2	12	otro_seg_soc	10342.01	2023-06-25 00:24:03.052445	2023-06-25 00:24:03.052445	
928	18146	27140426879	2021	2	12	otro_sindicato	1889.03	2023-06-25 00:24:03.052876	2023-06-25 00:24:03.052876	
929	18146	27140426879	2021	3	12	otro_seg_soc	9186.72	2023-06-25 00:24:03.053631	2023-06-25 00:24:03.053631	
930	18146	27140426879	2021	3	12	otro_sindicato	3452.11	2023-06-25 00:24:03.053989	2023-06-25 00:24:03.053989	
931	18146	27140426879	2021	3	12	otro_ex_nogan	133724.16	2023-06-25 00:24:03.054505	2023-06-25 00:24:03.054505	
932	18146	27140426879	2021	4	12	otro_ex_nogan	116770.64	2023-06-25 00:24:03.055378	2023-06-25 00:24:03.055378	
933	18146	27140426879	2021	4	12	otro_seg_soc	9186.72	2023-06-25 00:24:03.055769	2023-06-25 00:24:03.055769	
934	18146	27140426879	2021	4	12	otro_sindicato	3452.11	2023-06-25 00:24:03.056124	2023-06-25 00:24:03.056124	
935	18146	27140426879	2021	5	12	otro_seg_soc	9186.72	2023-06-25 00:24:03.056734	2023-06-25 00:24:03.056734	
936	18146	27140426879	2021	5	12	otro_sindicato	3452.11	2023-06-25 00:24:03.057037	2023-06-25 00:24:03.057037	
937	18146	27140426879	2021	5	12	otro_ex_nogan	123889.64	2023-06-25 00:24:03.058764	2023-06-25 00:24:03.058764	
938	18146	27140426879	2021	6	12	otro_seg_soc	11122.50	2023-06-25 00:24:03.059851	2023-06-25 00:24:03.059851	
939	18146	27140426879	2021	6	12	otro_sindicato	6899.69	2023-06-25 00:24:03.06049	2023-06-25 00:24:03.06049	
940	18146	27140426879	2021	6	12	otro_ex_nogan	159072.38	2023-06-25 00:24:03.061071	2023-06-25 00:24:03.061071	
941	18146	27140426879	2021	7	12	otro_sindicato	4660.55	2023-06-25 00:24:03.062068	2023-06-25 00:24:03.062068	
942	18146	27140426879	2021	7	12	otro_ex_nogan	118397.11	2023-06-25 00:24:03.062551	2023-06-25 00:24:03.062551	
943	18146	27140426879	2021	7	12	otro_seg_soc	9574.58	2023-06-25 00:24:03.063427	2023-06-25 00:24:03.063427	
944	18146	27140426879	2021	8	12	otro_seg_soc	8597.14	2023-06-25 00:24:03.064066	2023-06-25 00:24:03.064066	
945	18146	27140426879	2021	8	12	otro_sindicato	4091.17	2023-06-25 00:24:03.064405	2023-06-25 00:24:03.064405	
946	18146	27140426879	2021	8	12	otro_ex_nogan	102695.35	2023-06-25 00:24:03.064761	2023-06-25 00:24:03.064761	
947	18146	27140426879	2021	9	12	otro_seg_soc	9056.81	2023-06-25 00:24:03.065413	2023-06-25 00:24:03.065413	
948	18146	27140426879	2021	9	12	otro_sindicato	6774.62	2023-06-25 00:24:03.065688	2023-06-25 00:24:03.065688	
949	18146	27140426879	2021	9	12	otro_ex_nogan	153750.68	2023-06-25 00:24:03.065946	2023-06-25 00:24:03.065946	
950	18146	27140426879	2021	10	12	otro_gan_brut	133691.70	2023-06-25 00:24:03.0664	2023-06-25 00:24:03.0664	
951	18146	27140426879	2021	10	12	otro_seg_soc	12696.92	2023-06-25 00:24:03.066663	2023-06-25 00:24:03.066663	
952	18146	27140426879	2021	10	12	otro_sindicato	4740.83	2023-06-25 00:24:03.066902	2023-06-25 00:24:03.066902	
953	18146	27140426879	2021	10	12	otro_ex_nogan	7188.00	2023-06-25 00:24:03.067134	2023-06-25 00:24:03.067134	
954	18146	27140426879	2021	11	12	otro_ex_nogan	7188.00	2023-06-25 00:24:03.067584	2023-06-25 00:24:03.067584	
955	18146	27140426879	2021	11	12	otro_seg_soc	12655.02	2023-06-25 00:24:03.067829	2023-06-25 00:24:03.067829	
956	18146	27140426879	2021	11	12	otro_sindicato	4740.83	2023-06-25 00:24:03.068067	2023-06-25 00:24:03.068067	
957	18146	27140426879	2021	11	12	otro_gan_brut	150437.45	2023-06-25 00:24:03.068311	2023-06-25 00:24:03.068311	
958	18146	27140426879	2021	12	12	otro_ex_nogan	7188.00	2023-06-25 00:24:03.06877	2023-06-25 00:24:03.06877	
959	18146	27140426879	2021	12	12	otro_seg_soc	13957.04	2023-06-25 00:24:03.06902	2023-06-25 00:24:03.06902	
960	18146	27140426879	2021	12	12	otro_sindicato	4665.10	2023-06-25 00:24:03.069496	2023-06-25 00:24:03.069496	
961	18146	27140426879	2021	12	12	otro_gan_brut	162998.06	2023-06-25 00:24:03.069996	2023-06-25 00:24:03.069996	
962	18146	27140426879	2022	2	3	ded_cuota_medica	12566.45	2023-06-25 00:24:03.074305	2023-06-25 00:24:03.074305	
963	18146	27140426879	2022	3	3	ded_cuota_medica	15516.35	2023-06-25 00:24:03.074714	2023-06-25 00:24:03.074714	
964	18146	27140426879	2022	1	3	ded_domestica	20480.00	2023-06-25 00:24:03.075239	2023-06-25 00:24:03.075239	
965	18146	27140426879	2022	2	3	ded_domestica	31107.00	2023-06-25 00:24:03.075632	2023-06-25 00:24:03.075632	
966	18146	27140426879	2022	3	3	ded_domestica	26688.00	2023-06-25 00:24:03.075985	2023-06-25 00:24:03.075985	
967	18146	27140426879	2022	1	3	otro_seg_soc	14232.68	2023-06-25 00:24:03.078245	2023-06-25 00:24:03.078245	
968	18146	27140426879	2022	1	3	otro_gan_brut	187089.87	2023-06-25 00:24:03.078534	2023-06-25 00:24:03.078534	
969	18146	27140426879	2022	1	3	otro_sindicato	4897.31	2023-06-25 00:24:03.078816	2023-06-25 00:24:03.078816	
970	18146	27140426879	2022	2	3	otro_sindicato	4897.31	2023-06-25 00:24:03.079294	2023-06-25 00:24:03.079294	
971	18146	27140426879	2022	2	3	otro_gan_brut	187089.82	2023-06-25 00:24:03.079544	2023-06-25 00:24:03.079544	
972	18146	27140426879	2022	2	3	otro_seg_soc	14232.68	2023-06-25 00:24:03.079783	2023-06-25 00:24:03.079783	
973	18146	27140426879	2022	3	3	otro_sindicato	4943.96	2023-06-25 00:24:03.080214	2023-06-25 00:24:03.080214	
974	18146	27140426879	2022	3	3	otro_seg_soc	13281.65	2023-06-25 00:24:03.080474	2023-06-25 00:24:03.080474	
975	18146	27140426879	2022	3	3	otro_gan_brut	157123.26	2023-06-25 00:24:03.080714	2023-06-25 00:24:03.080714	
976	17608	27148204530	2021	1	2	otro_seg_soc	5584.64	2023-06-25 00:24:03.085332	2023-06-25 00:24:03.085332	
977	17608	27148204530	2021	1	2	otro_gan_brut	34948.04	2023-06-25 00:24:03.085694	2023-06-25 00:24:03.085694	
978	17608	27148204530	2021	2	2	otro_seg_soc	5803.66	2023-06-25 00:24:03.086723	2023-06-25 00:24:03.086723	
979	17608	27148204530	2021	2	2	otro_gan_brut	36316.84	2023-06-25 00:24:03.087038	2023-06-25 00:24:03.087038	
980	17608	27148204530	2021	3	2	otro_gan_brut	37685.64	2023-06-25 00:24:03.087511	2023-06-25 00:24:03.087511	
981	17608	27148204530	2021	3	2	otro_seg_soc	6022.66	2023-06-25 00:24:03.087769	2023-06-25 00:24:03.087769	
982	17608	27148204530	2021	4	2	otro_seg_soc	6224.38	2023-06-25 00:24:03.088241	2023-06-25 00:24:03.088241	
983	17608	27148204530	2021	4	2	otro_gan_brut	38946.40	2023-06-25 00:24:03.088479	2023-06-25 00:24:03.088479	
984	17608	27148204530	2021	5	2	otro_seg_soc	6885.44	2023-06-25 00:24:03.088941	2023-06-25 00:24:03.088941	
985	17608	27148204530	2021	5	2	otro_gan_brut	44077.98	2023-06-25 00:24:03.089178	2023-06-25 00:24:03.089178	
986	17608	27148204530	2021	6	2	otro_sac	22000.00	2023-06-25 00:24:03.090114	2023-06-25 00:24:03.090114	
987	17608	27148204530	2021	6	2	otro_gan_brut	43411.28	2023-06-25 00:24:03.0905	2023-06-25 00:24:03.0905	
988	17608	27148204530	2021	6	2	otro_seg_soc	10298.77	2023-06-25 00:24:03.09099	2023-06-25 00:24:03.09099	
989	17608	27148204530	2021	7	2	otro_gan_brut	22477.76	2023-06-25 00:24:03.092047	2023-06-25 00:24:03.092047	
990	17608	27148204530	2021	7	2	otro_seg_soc	3432.72	2023-06-25 00:24:03.092531	2023-06-25 00:24:03.092531	
991	17608	27148204530	2021	8	2	otro_seg_soc	3553.38	2023-06-25 00:24:03.093296	2023-06-25 00:24:03.093296	
992	17608	27148204530	2021	8	2	otro_gan_brut	23230.61	2023-06-25 00:24:03.093735	2023-06-25 00:24:03.093735	
993	17608	27148204530	2021	9	2	otro_seg_soc	3734.97	2023-06-25 00:24:03.094426	2023-06-25 00:24:03.094426	
994	17608	27148204530	2021	9	2	otro_gan_brut	24359.87	2023-06-25 00:24:03.094812	2023-06-25 00:24:03.094812	
995	17608	27148204530	2021	10	2	otro_seg_soc	3944.86	2023-06-25 00:24:03.095461	2023-06-25 00:24:03.095461	
996	17608	27148204530	2021	10	2	otro_gan_brut	26677.36	2023-06-25 00:24:03.095798	2023-06-25 00:24:03.095798	
997	17608	27148204530	2021	11	2	otro_gan_brut	26677.36	2023-06-25 00:24:03.096427	2023-06-25 00:24:03.096427	
998	17608	27148204530	2021	11	2	otro_seg_soc	3944.86	2023-06-25 00:24:03.096839	2023-06-25 00:24:03.096839	
999	17608	27148204530	2021	12	2	otro_sac	13900.00	2023-06-25 00:24:03.097347	2023-06-25 00:24:03.097347	
1000	17608	27148204530	2021	12	2	otro_gan_brut	26677.36	2023-06-25 00:24:03.097609	2023-06-25 00:24:03.097609	
1001	17608	27148204530	2021	12	2	otro_seg_soc	6233.49	2023-06-25 00:24:03.09786	2023-06-25 00:24:03.09786	
1002	17608	27148204530	2022	1	1	otro_gan_brut	28747.68	2023-06-25 00:24:03.102583	2023-06-25 00:24:03.102583	
1003	17608	27148204530	2022	1	1	otro_seg_soc	4276.10	2023-06-25 00:24:03.102861	2023-06-25 00:24:03.102861	
1004	17681	27163213287	2022	1	4	ded_gastos_medicos	1200.00	2023-06-25 00:24:03.108139	2023-06-25 00:24:03.108139	
1005	17681	27163213287	2022	2	4	ded_gastos_medicos	1600.00	2023-06-25 00:24:03.108757	2023-06-25 00:24:03.108757	
1006	17681	27163213287	2022	3	4	ded_gastos_medicos	1600.00	2023-06-25 00:24:03.109092	2023-06-25 00:24:03.109092	
1007	17430	27166775006	2021	1	13	ded_cuota_medica	1662.72	2023-06-25 00:24:03.113232	2023-06-25 00:24:03.113232	
1008	17430	27166775006	2021	2	13	ded_cuota_medica	1142.76	2023-06-25 00:24:03.113562	2023-06-25 00:24:03.113562	
1009	17430	27166775006	2021	5	13	ded_cuota_medica	296.28	2023-06-25 00:24:03.113844	2023-06-25 00:24:03.113844	
1010	17430	27166775006	2021	6	13	ded_cuota_medica	1233.94	2023-06-25 00:24:03.114132	2023-06-25 00:24:03.114132	
1011	17430	27166775006	2021	7	13	ded_cuota_medica	596.66	2023-06-25 00:24:03.11442	2023-06-25 00:24:03.11442	
1012	17430	27166775006	2021	8	13	ded_cuota_medica	596.66	2023-06-25 00:24:03.114592	2023-06-25 00:24:03.114592	
1013	17430	27166775006	2021	9	13	ded_cuota_medica	1023.00	2023-06-25 00:24:03.114862	2023-06-25 00:24:03.114862	
1014	17430	27166775006	2021	11	13	ded_cuota_medica	1075.44	2023-06-25 00:24:03.115179	2023-06-25 00:24:03.115179	
1015	17430	27166775006	2021	12	13	ded_cuota_medica	886.34	2023-06-25 00:24:03.115458	2023-06-25 00:24:03.115458	
1016	17430	27166775006	2022	1	5	ded_cuota_medica	2194.26	2023-06-25 00:24:03.120919	2023-06-25 00:24:03.120919	
1017	17430	27166775006	2022	2	5	ded_cuota_medica	1192.42	2023-06-25 00:24:03.121508	2023-06-25 00:24:03.121508	
1018	17730	27168506568	2021	1	8	ded_cuota_medica	12749.41	2023-06-25 00:24:03.132661	2023-06-25 00:24:03.132661	
1019	17730	27168506568	2021	2	8	ded_cuota_medica	11993.94	2023-06-25 00:24:03.133048	2023-06-25 00:24:03.133048	
1020	17730	27168506568	2021	3	8	ded_cuota_medica	12890.31	2023-06-25 00:24:03.133563	2023-06-25 00:24:03.133563	
1021	17730	27168506568	2021	4	8	ded_cuota_medica	12766.45	2023-06-25 00:24:03.133973	2023-06-25 00:24:03.133973	
1022	17730	27168506568	2021	5	8	ded_cuota_medica	14308.87	2023-06-25 00:24:03.134336	2023-06-25 00:24:03.134336	
1023	17730	27168506568	2021	6	8	ded_cuota_medica	7158.76	2023-06-25 00:24:03.134698	2023-06-25 00:24:03.134698	
1024	17730	27168506568	2021	7	8	ded_cuota_medica	11002.38	2023-06-25 00:24:03.135084	2023-06-25 00:24:03.135084	
1025	17730	27168506568	2021	8	8	ded_cuota_medica	14460.92	2023-06-25 00:24:03.135438	2023-06-25 00:24:03.135438	
1026	17730	27168506568	2021	9	8	ded_cuota_medica	15264.82	2023-06-25 00:24:03.1358	2023-06-25 00:24:03.1358	
1027	17730	27168506568	2021	11	8	ded_cuota_medica	17582.98	2023-06-25 00:24:03.136099	2023-06-25 00:24:03.136099	
1028	17730	27168506568	2021	12	8	ded_cuota_medica	8157.04	2023-06-25 00:24:03.136396	2023-06-25 00:24:03.136396	
1029	17730	27168506568	2021	6	8	ded_gastos_medicos	2000.00	2023-06-25 00:24:03.137463	2023-06-25 00:24:03.137463	
1030	17730	27168506568	2021	8	8	ded_gastos_medicos	1000.00	2023-06-25 00:24:03.13801	2023-06-25 00:24:03.13801	
1031	17730	27168506568	2021	9	8	ded_gastos_medicos	1000.00	2023-06-25 00:24:03.13844	2023-06-25 00:24:03.13844	
1032	17730	27168506568	2021	10	8	ded_gastos_medicos	1000.00	2023-06-25 00:24:03.138891	2023-06-25 00:24:03.138891	
1033	17730	27168506568	2021	11	8	ded_gastos_medicos	1000.00	2023-06-25 00:24:03.139315	2023-06-25 00:24:03.139315	
1034	17730	27168506568	2021	1	8	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.13981	2023-06-25 00:24:03.13981	
1035	17730	27168506568	2021	2	8	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.140091	2023-06-25 00:24:03.140091	
1036	17730	27168506568	2021	3	8	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.140365	2023-06-25 00:24:03.140365	
1037	17730	27168506568	2021	4	8	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.140657	2023-06-25 00:24:03.140657	
1038	17730	27168506568	2022	1	3	ded_cuota_medica	19860.37	2023-06-25 00:24:03.144753	2023-06-25 00:24:03.144753	
1039	17730	27168506568	2022	2	3	ded_cuota_medica	19860.37	2023-06-25 00:24:03.14498	2023-06-25 00:24:03.14498	
1040	17730	27168506568	2022	1	3	ded_gastos_medicos	2000.00	2023-06-25 00:24:03.145933	2023-06-25 00:24:03.145933	
1041	17730	27168506568	2022	3	3	ded_gastos_medicos	1120.00	2023-06-25 00:24:03.146433	2023-06-25 00:24:03.146433	
1042	17730	27168506568	2022	4	3	ded_gastos_medicos	112.00	2023-06-25 00:24:03.146839	2023-06-25 00:24:03.146839	
1043	17602	27168933105	2021	1	12	ded_cuota_medica	6097.95	2023-06-25 00:24:03.151524	2023-06-25 00:24:03.151524	
1044	17602	27168933105	2021	2	12	ded_cuota_medica	5376.87	2023-06-25 00:24:03.151935	2023-06-25 00:24:03.151935	
1045	17602	27168933105	2021	4	12	ded_cuota_medica	12711.38	2023-06-25 00:24:03.153435	2023-06-25 00:24:03.153435	
1046	17602	27168933105	2021	5	12	ded_cuota_medica	846.53	2023-06-25 00:24:03.155376	2023-06-25 00:24:03.155376	
1047	17602	27168933105	2021	6	12	ded_cuota_medica	6528.67	2023-06-25 00:24:03.15688	2023-06-25 00:24:03.15688	
1048	17602	27168933105	2021	7	12	ded_cuota_medica	5602.84	2023-06-25 00:24:03.157607	2023-06-25 00:24:03.157607	
1049	17602	27168933105	2021	8	12	ded_cuota_medica	5278.14	2023-06-25 00:24:03.158119	2023-06-25 00:24:03.158119	
1050	17602	27168933105	2021	9	12	ded_cuota_medica	4593.30	2023-06-25 00:24:03.158666	2023-06-25 00:24:03.158666	
1051	17602	27168933105	2021	10	12	ded_cuota_medica	8271.37	2023-06-25 00:24:03.159202	2023-06-25 00:24:03.159202	
1052	17602	27168933105	2021	11	12	ded_cuota_medica	8311.39	2023-06-25 00:24:03.159729	2023-06-25 00:24:03.159729	
1053	17602	27168933105	2021	12	12	ded_cuota_medica	7076.26	2023-06-25 00:24:03.16022	2023-06-25 00:24:03.16022	
1054	17602	27168933105	2022	1	4	ded_cuota_medica	11077.65	2023-06-25 00:24:03.165533	2023-06-25 00:24:03.165533	
1055	17602	27168933105	2022	2	4	ded_cuota_medica	9482.55	2023-06-25 00:24:03.165913	2023-06-25 00:24:03.165913	
1056	17602	27168933105	2022	3	4	ded_cuota_medica	543.84	2023-06-25 00:24:03.166291	2023-06-25 00:24:03.166291	
1057	17602	27168933105	2022	4	4	ded_cuota_medica	13628.66	2023-06-25 00:24:03.166648	2023-06-25 00:24:03.166648	
1058	15591	27171033247	2021	9	14	ded_donaciones	15000.00	2023-06-25 00:24:03.172531	2023-06-25 00:24:03.172531	
1059	15591	27171033247	2021	1	14	ded_domestica	6721.35	2023-06-25 00:24:03.1733	2023-06-25 00:24:03.1733	
1060	15591	27171033247	2021	2	14	ded_domestica	7203.35	2023-06-25 00:24:03.173773	2023-06-25 00:24:03.173773	
1061	15591	27171033247	2021	3	14	ded_domestica	7263.86	2023-06-25 00:24:03.174188	2023-06-25 00:24:03.174188	
1062	15591	27171033247	2021	4	14	ded_domestica	7823.86	2023-06-25 00:24:03.174512	2023-06-25 00:24:03.174512	
1063	15591	27171033247	2021	5	14	ded_domestica	7864.22	2023-06-25 00:24:03.174875	2023-06-25 00:24:03.174875	
1064	15591	27171033247	2021	6	14	ded_domestica	13069.34	2023-06-25 00:24:03.175254	2023-06-25 00:24:03.175254	
1065	15591	27171033247	2021	7	14	ded_domestica	8879.34	2023-06-25 00:24:03.17559	2023-06-25 00:24:03.17559	
1066	15591	27171033247	2021	8	14	ded_domestica	9168.82	2023-06-25 00:24:03.17592	2023-06-25 00:24:03.17592	
1067	15591	27171033247	2021	9	14	ded_domestica	10816.82	2023-06-25 00:24:03.176227	2023-06-25 00:24:03.176227	
1068	15591	27171033247	2021	10	14	ded_domestica	10816.82	2023-06-25 00:24:03.176414	2023-06-25 00:24:03.176414	
1069	15591	27171033247	2021	11	14	ded_domestica	10856.25	2023-06-25 00:24:03.176735	2023-06-25 00:24:03.176735	
1070	15591	27171033247	2021	12	14	ded_domestica	16591.46	2023-06-25 00:24:03.177031	2023-06-25 00:24:03.177031	
1071	15591	27171033247	2022	1	2	ded_domestica	11164.26	2023-06-25 00:24:03.182188	2023-06-25 00:24:03.182188	
1072	15591	27171033247	2022	2	2	ded_domestica	10943.88	2023-06-25 00:24:03.182589	2023-06-25 00:24:03.182589	
1073	15591	27171033247	2022	3	2	ded_domestica	11819.50	2023-06-25 00:24:03.182988	2023-06-25 00:24:03.182988	
1074	16409	27172130327	2021	1	26	ded_cuota_medica	3224.04	2023-06-25 00:24:03.19052	2023-06-25 00:24:03.19052	
1075	16409	27172130327	2021	2	26	ded_cuota_medica	3246.11	2023-06-25 00:24:03.191082	2023-06-25 00:24:03.191082	
1076	16409	27172130327	2021	3	26	ded_cuota_medica	3170.89	2023-06-25 00:24:03.191655	2023-06-25 00:24:03.191655	
1077	16409	27172130327	2021	5	26	ded_cuota_medica	4325.72	2023-06-25 00:24:03.192149	2023-06-25 00:24:03.192149	
1078	16409	27172130327	2021	6	26	ded_cuota_medica	3335.71	2023-06-25 00:24:03.192737	2023-06-25 00:24:03.192737	
1079	16409	27172130327	2021	7	26	ded_cuota_medica	3280.28	2023-06-25 00:24:03.193143	2023-06-25 00:24:03.193143	
1080	16409	27172130327	2021	8	26	ded_cuota_medica	2787.70	2023-06-25 00:24:03.193623	2023-06-25 00:24:03.193623	
1081	16409	27172130327	2021	9	26	ded_cuota_medica	6465.83	2023-06-25 00:24:03.194056	2023-06-25 00:24:03.194056	
1082	16409	27172130327	2021	10	26	ded_cuota_medica	1956.48	2023-06-25 00:24:03.194441	2023-06-25 00:24:03.194441	
1083	16409	27172130327	2021	11	26	ded_cuota_medica	6474.47	2023-06-25 00:24:03.194792	2023-06-25 00:24:03.194792	
1084	16409	27172130327	2021	12	26	ded_cuota_medica	6257.93	2023-06-25 00:24:03.195173	2023-06-25 00:24:03.195173	
1085	16409	27172130327	2021	1	26	otro_gan_brut	15887.25	2023-06-25 00:24:03.195901	2023-06-25 00:24:03.195901	
1086	16409	27172130327	2021	1	26	otro_ex_nogan	17736.00	2023-06-25 00:24:03.196168	2023-06-25 00:24:03.196168	
1087	16409	27172130327	2021	2	26	otro_ex_nogan	17736.00	2023-06-25 00:24:03.196641	2023-06-25 00:24:03.196641	
1088	16409	27172130327	2021	2	26	otro_gan_brut	15887.25	2023-06-25 00:24:03.196902	2023-06-25 00:24:03.196902	
1089	16409	27172130327	2021	3	26	otro_gan_brut	15887.25	2023-06-25 00:24:03.197981	2023-06-25 00:24:03.197981	
1090	16409	27172130327	2021	3	26	otro_ex_nogan	17736.00	2023-06-25 00:24:03.198965	2023-06-25 00:24:03.198965	
1091	16409	27172130327	2021	4	26	otro_gan_brut	13125.00	2023-06-25 00:24:03.199581	2023-06-25 00:24:03.199581	
1092	16409	27172130327	2021	4	26	otro_ex_nogan	24750.00	2023-06-25 00:24:03.199901	2023-06-25 00:24:03.199901	
1093	16409	27172130327	2021	5	26	otro_gan_brut	13125.00	2023-06-25 00:24:03.20037	2023-06-25 00:24:03.20037	
1094	16409	27172130327	2021	5	26	otro_ex_nogan	24750.00	2023-06-25 00:24:03.200646	2023-06-25 00:24:03.200646	
1095	16409	27172130327	2021	6	26	otro_gan_brut	13125.00	2023-06-25 00:24:03.20109	2023-06-25 00:24:03.20109	
1096	16409	27172130327	2021	6	26	otro_ex_nogan	43687.50	2023-06-25 00:24:03.201423	2023-06-25 00:24:03.201423	
1097	16409	27172130327	2021	7	26	otro_gan_brut	14437.50	2023-06-25 00:24:03.201892	2023-06-25 00:24:03.201892	
1098	16409	27172130327	2021	7	26	otro_ex_nogan	26250.00	2023-06-25 00:24:03.202146	2023-06-25 00:24:03.202146	
1099	16409	27172130327	2021	8	26	otro_gan_brut	16687.50	2023-06-25 00:24:03.20258	2023-06-25 00:24:03.20258	
1100	16409	27172130327	2021	8	26	otro_ex_nogan	26250.00	2023-06-25 00:24:03.202828	2023-06-25 00:24:03.202828	
1101	16409	27172130327	2021	9	26	otro_ex_nogan	26250.00	2023-06-25 00:24:03.203297	2023-06-25 00:24:03.203297	
1102	16409	27172130327	2021	9	26	otro_gan_brut	16687.50	2023-06-25 00:24:03.203546	2023-06-25 00:24:03.203546	
1103	16409	27172130327	2021	10	26	otro_gan_brut	16687.50	2023-06-25 00:24:03.204038	2023-06-25 00:24:03.204038	
1104	16409	27172130327	2021	10	26	otro_ex_nogan	26250.00	2023-06-25 00:24:03.204361	2023-06-25 00:24:03.204361	
1105	16409	27172130327	2021	11	26	otro_ex_nogan	28500.00	2023-06-25 00:24:03.204812	2023-06-25 00:24:03.204812	
1106	16409	27172130327	2021	11	26	otro_gan_brut	18375.00	2023-06-25 00:24:03.205067	2023-06-25 00:24:03.205067	
1107	16409	27172130327	2021	12	26	otro_gan_brut	18375.00	2023-06-25 00:24:03.205528	2023-06-25 00:24:03.205528	
1108	16409	27172130327	2021	12	26	otro_ex_nogan	51937.50	2023-06-25 00:24:03.205778	2023-06-25 00:24:03.205778	
1109	16409	27172130327	2022	1	5	ded_cuota_medica	6257.93	2023-06-25 00:24:03.210904	2023-06-25 00:24:03.210904	
1110	16409	27172130327	2022	2	5	ded_cuota_medica	7134.64	2023-06-25 00:24:03.21128	2023-06-25 00:24:03.21128	
1111	16409	27172130327	2022	3	5	ded_cuota_medica	6705.18	2023-06-25 00:24:03.211621	2023-06-25 00:24:03.211621	
1112	16409	27172130327	2022	4	5	ded_cuota_medica	4678.49	2023-06-25 00:24:03.211943	2023-06-25 00:24:03.211943	
1113	16409	27172130327	2022	1	5	otro_gan_brut	18375.00	2023-06-25 00:24:03.212537	2023-06-25 00:24:03.212537	
1114	16409	27172130327	2022	1	5	otro_ex_nogan	28500.00	2023-06-25 00:24:03.212813	2023-06-25 00:24:03.212813	
1115	16409	27172130327	2022	2	5	otro_ex_nogan	28500.00	2023-06-25 00:24:03.213293	2023-06-25 00:24:03.213293	
1116	16409	27172130327	2022	2	5	otro_gan_brut	18375.00	2023-06-25 00:24:03.213546	2023-06-25 00:24:03.213546	
1117	16409	27172130327	2022	3	5	otro_ex_nogan	28500.00	2023-06-25 00:24:03.214035	2023-06-25 00:24:03.214035	
1118	16409	27172130327	2022	3	5	otro_gan_brut	18375.00	2023-06-25 00:24:03.2143	2023-06-25 00:24:03.2143	
1119	14823	27172609800	2021	2	12	ded_cuota_medica	5935.41	2023-06-25 00:24:03.221254	2023-06-25 00:24:03.221254	
1120	14823	27172609800	2021	3	12	ded_cuota_medica	9599.81	2023-06-25 00:24:03.222193	2023-06-25 00:24:03.222193	
1121	14823	27172609800	2021	4	12	ded_cuota_medica	9098.36	2023-06-25 00:24:03.222824	2023-06-25 00:24:03.222824	
1122	14823	27172609800	2021	5	12	ded_cuota_medica	9533.98	2023-06-25 00:24:03.223378	2023-06-25 00:24:03.223378	
1123	14823	27172609800	2021	6	12	ded_cuota_medica	9723.51	2023-06-25 00:24:03.223852	2023-06-25 00:24:03.223852	
1124	14823	27172609800	2021	7	12	ded_cuota_medica	11311.55	2023-06-25 00:24:03.224289	2023-06-25 00:24:03.224289	
1125	14823	27172609800	2021	8	12	ded_cuota_medica	6685.96	2023-06-25 00:24:03.224728	2023-06-25 00:24:03.224728	
1126	14823	27172609800	2021	9	12	ded_cuota_medica	9969.52	2023-06-25 00:24:03.225248	2023-06-25 00:24:03.225248	
1127	14823	27172609800	2021	10	12	ded_cuota_medica	11730.92	2023-06-25 00:24:03.225814	2023-06-25 00:24:03.225814	
1128	14823	27172609800	2021	11	12	ded_cuota_medica	13003.02	2023-06-25 00:24:03.22617	2023-06-25 00:24:03.22617	
1129	14823	27172609800	2021	12	12	ded_cuota_medica	15713.86	2023-06-25 00:24:03.226479	2023-06-25 00:24:03.226479	
1130	14823	27172609800	2022	1	3	ded_cuota_medica	14446.12	2023-06-25 00:24:03.232306	2023-06-25 00:24:03.232306	
1131	14823	27172609800	2022	2	3	ded_cuota_medica	18081.12	2023-06-25 00:24:03.23272	2023-06-25 00:24:03.23272	
1132	48353	27175432650	2022	1	1	ded_cuota_medica	25180.74	2023-06-25 00:24:03.236756	2023-06-25 00:24:03.236756	
1133	48353	27175432650	2022	2	1	ded_cuota_medica	25180.74	2023-06-25 00:24:03.236964	2023-06-25 00:24:03.236964	
1134	48353	27175432650	2022	1	1	ded_seguros	833.55	2023-06-25 00:24:03.237477	2023-06-25 00:24:03.237477	
1135	48353	27175432650	2022	2	1	ded_seguros	833.55	2023-06-25 00:24:03.237676	2023-06-25 00:24:03.237676	
1136	48353	27175432650	2022	1	1	ded_donaciones	800.00	2023-06-25 00:24:03.238087	2023-06-25 00:24:03.238087	
1137	48353	27175432650	2022	2	1	ded_donaciones	800.00	2023-06-25 00:24:03.238274	2023-06-25 00:24:03.238274	
1138	43517	27177107382	2021	1	5	ded_cuota_medica	759.00	2023-06-25 00:24:03.242264	2023-06-25 00:24:03.242264	
1139	43517	27177107382	2021	2	5	ded_cuota_medica	1077.00	2023-06-25 00:24:03.242612	2023-06-25 00:24:03.242612	
1140	43517	27177107382	2021	3	5	ded_cuota_medica	1077.00	2023-06-25 00:24:03.242811	2023-06-25 00:24:03.242811	
1141	43517	27177107382	2021	4	5	ded_cuota_medica	1077.00	2023-06-25 00:24:03.243124	2023-06-25 00:24:03.243124	
1142	43517	27177107382	2021	6	5	ded_cuota_medica	1845.00	2023-06-25 00:24:03.243424	2023-06-25 00:24:03.243424	
1143	43517	27177107382	2021	10	5	ded_cuota_medica	1592.00	2023-06-25 00:24:03.243718	2023-06-25 00:24:03.243718	
1144	43517	27177107382	2021	11	5	ded_cuota_medica	1592.00	2023-06-25 00:24:03.2439	2023-06-25 00:24:03.2439	
1145	43517	27177107382	2022	1	2	ded_cuota_medica	1831.00	2023-06-25 00:24:03.247791	2023-06-25 00:24:03.247791	
1146	43517	27177107382	2022	2	2	ded_cuota_medica	1831.00	2023-06-25 00:24:03.248031	2023-06-25 00:24:03.248031	
1147	43517	27177107382	2022	1	2	ded_domestica	20000.00	2023-06-25 00:24:03.248517	2023-06-25 00:24:03.248517	
1148	43517	27177107382	2022	2	2	ded_domestica	24000.00	2023-06-25 00:24:03.248939	2023-06-25 00:24:03.248939	
1149	39453	27178240256	2021	1	8	ded_cuota_medica	3500.00	2023-06-25 00:24:03.26219	2023-06-25 00:24:03.26219	
1150	39453	27178240256	2021	2	8	ded_cuota_medica	3500.00	2023-06-25 00:24:03.262414	2023-06-25 00:24:03.262414	
1151	39453	27178240256	2021	3	8	ded_cuota_medica	3500.00	2023-06-25 00:24:03.262612	2023-06-25 00:24:03.262612	
1152	39453	27178240256	2021	4	8	ded_cuota_medica	3500.00	2023-06-25 00:24:03.2628	2023-06-25 00:24:03.2628	
1153	39453	27178240256	2021	5	8	ded_cuota_medica	3500.00	2023-06-25 00:24:03.262979	2023-06-25 00:24:03.262979	
1154	39453	27178240256	2021	6	8	ded_cuota_medica	3500.00	2023-06-25 00:24:03.263208	2023-06-25 00:24:03.263208	
1155	39453	27178240256	2021	7	8	ded_cuota_medica	5000.00	2023-06-25 00:24:03.263541	2023-06-25 00:24:03.263541	
1156	39453	27178240256	2021	8	8	ded_cuota_medica	3500.00	2023-06-25 00:24:03.263867	2023-06-25 00:24:03.263867	
1157	39453	27178240256	2021	9	8	ded_cuota_medica	3500.00	2023-06-25 00:24:03.264046	2023-06-25 00:24:03.264046	
1158	39453	27178240256	2021	10	8	ded_cuota_medica	3500.00	2023-06-25 00:24:03.264224	2023-06-25 00:24:03.264224	
1159	39453	27178240256	2021	11	8	ded_cuota_medica	4000.00	2023-06-25 00:24:03.264514	2023-06-25 00:24:03.264514	
1160	39453	27178240256	2021	12	8	ded_cuota_medica	4000.00	2023-06-25 00:24:03.264695	2023-06-25 00:24:03.264695	
1161	39453	27178240256	2021	6	8	ded_gastos_medicos	6360.00	2023-06-25 00:24:03.265172	2023-06-25 00:24:03.265172	
1162	39453	27178240256	2021	5	8	ded_gastos_medicos	1000.00	2023-06-25 00:24:03.265653	2023-06-25 00:24:03.265653	
1163	39453	27178240256	2021	10	8	ded_gastos_medicos	2340.00	2023-06-25 00:24:03.266165	2023-06-25 00:24:03.266165	
1164	39453	27178240256	2021	11	8	ded_gastos_medicos	868.00	2023-06-25 00:24:03.266484	2023-06-25 00:24:03.266484	
1165	39453	27178240256	2021	1	8	FECDEVDESDE	100.00	2023-06-25 00:24:03.266841	2023-06-25 00:24:03.266841	
1166	39453	27178240256	2021	2	8	FECDEVDESDE	100.00	2023-06-25 00:24:03.267037	2023-06-25 00:24:03.267037	
1167	39453	27178240256	2021	3	8	FECDEVDESDE	100.00	2023-06-25 00:24:03.267368	2023-06-25 00:24:03.267368	
1168	39453	27178240256	2021	4	8	FECDEVDESDE	100.00	2023-06-25 00:24:03.267625	2023-06-25 00:24:03.267625	
1169	39453	27178240256	2021	5	8	FECDEVDESDE	100.00	2023-06-25 00:24:03.267839	2023-06-25 00:24:03.267839	
1170	39453	27178240256	2021	6	8	FECDEVDESDE	100.00	2023-06-25 00:24:03.268047	2023-06-25 00:24:03.268047	
1171	39453	27178240256	2021	7	8	FECDEVDESDE	100.00	2023-06-25 00:24:03.268256	2023-06-25 00:24:03.268256	
1172	39453	27178240256	2021	8	8	FECDEVDESDE	100.00	2023-06-25 00:24:03.268479	2023-06-25 00:24:03.268479	
1173	39453	27178240256	2021	9	8	FECDEVDESDE	100.00	2023-06-25 00:24:03.268677	2023-06-25 00:24:03.268677	
1174	39453	27178240256	2021	10	8	FECDEVDESDE	100.00	2023-06-25 00:24:03.268886	2023-06-25 00:24:03.268886	
1175	39453	27178240256	2021	11	8	FECDEVDESDE	100.00	2023-06-25 00:24:03.269068	2023-06-25 00:24:03.269068	
1176	39453	27178240256	2021	12	8	FECDEVDESDE	100.00	2023-06-25 00:24:03.269264	2023-06-25 00:24:03.269264	
1177	34687	27179707069	2021	5	9	ded_cuota_medica	5022.58	2023-06-25 00:24:03.274251	2023-06-25 00:24:03.274251	
1178	34687	27179707069	2021	6	9	ded_cuota_medica	6880.84	2023-06-25 00:24:03.274579	2023-06-25 00:24:03.274579	
1179	34687	27179707069	2021	7	9	ded_cuota_medica	6373.66	2023-06-25 00:24:03.2749	2023-06-25 00:24:03.2749	
1180	34687	27179707069	2021	8	9	ded_cuota_medica	2777.72	2023-06-25 00:24:03.275243	2023-06-25 00:24:03.275243	
1181	34687	27179707069	2021	9	9	ded_cuota_medica	8161.38	2023-06-25 00:24:03.275625	2023-06-25 00:24:03.275625	
1182	34687	27179707069	2021	10	9	ded_cuota_medica	8995.47	2023-06-25 00:24:03.275974	2023-06-25 00:24:03.275974	
1183	34687	27179707069	2021	11	9	ded_cuota_medica	8662.74	2023-06-25 00:24:03.27631	2023-06-25 00:24:03.27631	
1184	34687	27179707069	2021	12	9	ded_cuota_medica	8279.97	2023-06-25 00:24:03.276615	2023-06-25 00:24:03.276615	
1185	34687	27179707069	2021	1	9	ded_cuota_medica	2122.90	2023-06-25 00:24:03.277041	2023-06-25 00:24:03.277041	
1186	34687	27179707069	2021	2	9	ded_cuota_medica	2606.61	2023-06-25 00:24:03.277353	2023-06-25 00:24:03.277353	
1187	34687	27179707069	2021	4	9	ded_cuota_medica	854.73	2023-06-25 00:24:03.277745	2023-06-25 00:24:03.277745	
1188	17346	27183191530	2021	1	15	ded_cuota_medica	4116.00	2023-06-25 00:24:03.285669	2023-06-25 00:24:03.285669	
1189	17346	27183191530	2021	2	15	ded_cuota_medica	3798.00	2023-06-25 00:24:03.286077	2023-06-25 00:24:03.286077	
1190	17346	27183191530	2021	4	15	ded_cuota_medica	8008.00	2023-06-25 00:24:03.287397	2023-06-25 00:24:03.287397	
1191	17346	27183191530	2021	5	15	ded_cuota_medica	4685.00	2023-06-25 00:24:03.287921	2023-06-25 00:24:03.287921	
1192	17346	27183191530	2021	6	15	ded_cuota_medica	4296.00	2023-06-25 00:24:03.288442	2023-06-25 00:24:03.288442	
1193	17346	27183191530	2021	7	15	ded_cuota_medica	3305.00	2023-06-25 00:24:03.288972	2023-06-25 00:24:03.288972	
1194	17346	27183191530	2021	8	15	ded_cuota_medica	5802.00	2023-06-25 00:24:03.289495	2023-06-25 00:24:03.289495	
1195	17346	27183191530	2021	9	15	ded_cuota_medica	1044.00	2023-06-25 00:24:03.289997	2023-06-25 00:24:03.289997	
1196	17346	27183191530	2021	10	15	ded_cuota_medica	6973.00	2023-06-25 00:24:03.290467	2023-06-25 00:24:03.290467	
1197	17346	27183191530	2021	11	15	ded_cuota_medica	7744.00	2023-06-25 00:24:03.29085	2023-06-25 00:24:03.29085	
1198	17346	27183191530	2021	12	15	ded_cuota_medica	7019.00	2023-06-25 00:24:03.291178	2023-06-25 00:24:03.291178	
1199	17346	27183191530	2022	1	3	ded_cuota_medica	7019.00	2023-06-25 00:24:03.295517	2023-06-25 00:24:03.295517	
1200	17346	27183191530	2022	2	3	ded_cuota_medica	7837.00	2023-06-25 00:24:03.295867	2023-06-25 00:24:03.295867	
1201	17346	27183191530	2022	3	3	ded_cuota_medica	9360.00	2023-06-25 00:24:03.296194	2023-06-25 00:24:03.296194	
1202	18191	27208638934	2021	1	4	ded_cuota_medica	1.00	2023-06-25 00:24:03.302459	2023-06-25 00:24:03.302459	
1203	18191	27208638934	2021	9	4	ded_donaciones	10000.00	2023-06-25 00:24:03.302972	2023-06-25 00:24:03.302972	
1204	18191	27208638934	2021	10	4	ded_donaciones	30000.00	2023-06-25 00:24:03.303337	2023-06-25 00:24:03.303337	
1205	18191	27208638934	2021	1	4	fam_hijos_100	100.00	2023-06-25 00:24:03.303717	2023-06-25 00:24:03.303717	
1206	18191	27208638934	2021	2	4	fam_hijos_100	100.00	2023-06-25 00:24:03.303902	2023-06-25 00:24:03.303902	
1207	18191	27208638934	2021	3	4	fam_hijos_100	100.00	2023-06-25 00:24:03.304136	2023-06-25 00:24:03.304136	
1208	18191	27208638934	2021	4	4	fam_hijos_100	100.00	2023-06-25 00:24:03.304342	2023-06-25 00:24:03.304342	
1209	18191	27208638934	2021	5	4	fam_hijos_100	100.00	2023-06-25 00:24:03.304534	2023-06-25 00:24:03.304534	
1210	18191	27208638934	2021	6	4	fam_hijos_100	100.00	2023-06-25 00:24:03.304735	2023-06-25 00:24:03.304735	
1211	18191	27208638934	2021	7	4	fam_hijos_100	100.00	2023-06-25 00:24:03.304914	2023-06-25 00:24:03.304914	
1212	18191	27208638934	2021	8	4	fam_hijos_100	100.00	2023-06-25 00:24:03.305097	2023-06-25 00:24:03.305097	
1213	18191	27208638934	2021	9	4	fam_hijos_100	100.00	2023-06-25 00:24:03.305295	2023-06-25 00:24:03.305295	
1214	18191	27208638934	2021	10	4	fam_hijos_100	100.00	2023-06-25 00:24:03.305494	2023-06-25 00:24:03.305494	
1215	18191	27208638934	2021	11	4	fam_hijos_100	100.00	2023-06-25 00:24:03.305685	2023-06-25 00:24:03.305685	
1216	18191	27208638934	2021	12	4	fam_hijos_100	100.00	2023-06-25 00:24:03.305873	2023-06-25 00:24:03.305873	
1217	18191	27208638934	2021	1	4	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.306202	2023-06-25 00:24:03.306202	
1218	18191	27208638934	2021	2	4	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.306406	2023-06-25 00:24:03.306406	
1219	18191	27208638934	2021	3	4	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.306582	2023-06-25 00:24:03.306582	
1220	18191	27208638934	2021	4	4	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.306774	2023-06-25 00:24:03.306774	
1221	18191	27208638934	2021	5	4	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.306954	2023-06-25 00:24:03.306954	
1222	18191	27208638934	2021	6	4	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.307132	2023-06-25 00:24:03.307132	
1223	18191	27208638934	2021	7	4	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.307308	2023-06-25 00:24:03.307308	
1224	18191	27208638934	2021	8	4	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.307482	2023-06-25 00:24:03.307482	
1225	18191	27208638934	2021	9	4	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.307657	2023-06-25 00:24:03.307657	
1226	18191	27208638934	2021	10	4	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.307861	2023-06-25 00:24:03.307861	
1227	18191	27208638934	2021	11	4	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.308036	2023-06-25 00:24:03.308036	
1228	18191	27208638934	2021	12	4	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.308227	2023-06-25 00:24:03.308227	
1229	18191	27208638934	2022	1	1	ded_cuota_medica	0.01	2023-06-25 00:24:03.314421	2023-06-25 00:24:03.314421	
1230	18191	27208638934	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:03.315068	2023-06-25 00:24:03.315068	
1231	18191	27208638934	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:03.315291	2023-06-25 00:24:03.315291	
1232	18191	27208638934	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:03.315496	2023-06-25 00:24:03.315496	
1233	18191	27208638934	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:03.315698	2023-06-25 00:24:03.315698	
1234	18191	27208638934	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:03.316533	2023-06-25 00:24:03.316533	
1235	18191	27208638934	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:03.316884	2023-06-25 00:24:03.316884	
1236	18191	27208638934	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:03.317109	2023-06-25 00:24:03.317109	
1237	18191	27208638934	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:03.317701	2023-06-25 00:24:03.317701	
1238	18191	27208638934	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:03.317919	2023-06-25 00:24:03.317919	
1239	18191	27208638934	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:03.318129	2023-06-25 00:24:03.318129	
1240	18191	27208638934	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:03.318327	2023-06-25 00:24:03.318327	
1241	18191	27208638934	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:24:03.318516	2023-06-25 00:24:03.318516	
1242	18191	27208638934	2022	1	1	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.318886	2023-06-25 00:24:03.318886	
1243	18191	27208638934	2022	2	1	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.3191	2023-06-25 00:24:03.3191	
1244	18191	27208638934	2022	3	1	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.319301	2023-06-25 00:24:03.319301	
1245	18191	27208638934	2022	4	1	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.319541	2023-06-25 00:24:03.319541	
1246	18191	27208638934	2022	5	1	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.31974	2023-06-25 00:24:03.31974	
1247	18191	27208638934	2022	6	1	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.319948	2023-06-25 00:24:03.319948	
1248	18191	27208638934	2022	7	1	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.320652	2023-06-25 00:24:03.320652	
1249	18191	27208638934	2022	8	1	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.320955	2023-06-25 00:24:03.320955	
1250	18191	27208638934	2022	9	1	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.321236	2023-06-25 00:24:03.321236	
1251	18191	27208638934	2022	10	1	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.321565	2023-06-25 00:24:03.321565	
1252	18191	27208638934	2022	11	1	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.321849	2023-06-25 00:24:03.321849	
1253	18191	27208638934	2022	12	1	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.322134	2023-06-25 00:24:03.322134	
1254	19668	27208670870	2021	7	11	ded_cuota_medica	640.00	2023-06-25 00:24:03.327214	2023-06-25 00:24:03.327214	
1255	19668	27208670870	2021	8	11	ded_cuota_medica	290.00	2023-06-25 00:24:03.327521	2023-06-25 00:24:03.327521	
1256	19668	27208670870	2021	9	11	ded_cuota_medica	80.00	2023-06-25 00:24:03.327826	2023-06-25 00:24:03.327826	
1257	19668	27208670870	2021	10	11	ded_cuota_medica	440.00	2023-06-25 00:24:03.328112	2023-06-25 00:24:03.328112	
1258	19668	27208670870	2021	12	11	ded_cuota_medica	140.00	2023-06-25 00:24:03.32839	2023-06-25 00:24:03.32839	
1259	35799	27215526491	2021	5	7	ded_alquiler	8000.00	2023-06-25 00:24:03.340767	2023-06-25 00:24:03.340767	
1260	35799	27215526491	2021	6	7	ded_alquiler	8000.00	2023-06-25 00:24:03.341009	2023-06-25 00:24:03.341009	
1261	35799	27215526491	2021	7	7	ded_alquiler	8000.00	2023-06-25 00:24:03.341315	2023-06-25 00:24:03.341315	
1262	35799	27215526491	2021	8	7	ded_alquiler	8000.00	2023-06-25 00:24:03.341555	2023-06-25 00:24:03.341555	
1263	35799	27215526491	2021	9	7	ded_alquiler	8000.00	2023-06-25 00:24:03.34215	2023-06-25 00:24:03.34215	
1264	35799	27215526491	2021	10	7	ded_alquiler	8000.00	2023-06-25 00:24:03.3432	2023-06-25 00:24:03.3432	
1265	35799	27215526491	2021	11	7	ded_alquiler	8000.00	2023-06-25 00:24:03.3438	2023-06-25 00:24:03.3438	
1266	35799	27215526491	2021	12	7	ded_alquiler	8000.00	2023-06-25 00:24:03.344172	2023-06-25 00:24:03.344172	
1267	35799	27215526491	2021	1	7	ded_alquiler	4000.00	2023-06-25 00:24:03.344985	2023-06-25 00:24:03.344985	
1268	35799	27215526491	2021	2	7	ded_alquiler	4000.00	2023-06-25 00:24:03.345338	2023-06-25 00:24:03.345338	
1269	35799	27215526491	2021	3	7	ded_alquiler	4000.00	2023-06-25 00:24:03.345662	2023-06-25 00:24:03.345662	
1270	35799	27215526491	2021	4	7	ded_alquiler	4000.00	2023-06-25 00:24:03.345962	2023-06-25 00:24:03.345962	
1271	35799	27215526491	2022	1	2	ded_alquiler	8000.00	2023-06-25 00:24:03.350255	2023-06-25 00:24:03.350255	
1272	35799	27215526491	2022	2	2	ded_alquiler	8000.00	2023-06-25 00:24:03.350496	2023-06-25 00:24:03.350496	
1273	35799	27215526491	2022	3	2	ded_alquiler	8000.00	2023-06-25 00:24:03.350705	2023-06-25 00:24:03.350705	
1274	19207	27218720914	2021	2	3	ded_gastos_medicos	14000.00	2023-06-25 00:24:03.358657	2023-06-25 00:24:03.358657	
1275	19207	27218720914	2021	4	3	ded_gastos_medicos	4000.00	2023-06-25 00:24:03.359208	2023-06-25 00:24:03.359208	
1276	19207	27218720914	2021	8	3	ded_gastos_medicos	4800.00	2023-06-25 00:24:03.359605	2023-06-25 00:24:03.359605	
1277	19207	27218720914	2021	9	3	ded_gastos_medicos	6000.00	2023-06-25 00:24:03.359957	2023-06-25 00:24:03.359957	
1278	19207	27218720914	2021	12	3	ded_indumentaria	34000.00	2023-06-25 00:24:03.360435	2023-06-25 00:24:03.360435	
1279	19207	27218720914	2021	3	3	ded_indumentaria	8000.00	2023-06-25 00:24:03.360951	2023-06-25 00:24:03.360951	
1280	19199	27219725529	2021	1	11	ded_cuota_medica	7736.00	2023-06-25 00:24:03.368791	2023-06-25 00:24:03.368791	
1281	19199	27219725529	2021	2	11	ded_cuota_medica	7736.00	2023-06-25 00:24:03.369003	2023-06-25 00:24:03.369003	
1282	19199	27219725529	2021	3	11	ded_cuota_medica	7736.00	2023-06-25 00:24:03.369216	2023-06-25 00:24:03.369216	
1283	19199	27219725529	2021	4	11	ded_cuota_medica	7736.00	2023-06-25 00:24:03.369428	2023-06-25 00:24:03.369428	
1284	19199	27219725529	2021	5	11	ded_cuota_medica	8665.00	2023-06-25 00:24:03.369735	2023-06-25 00:24:03.369735	
1285	19199	27219725529	2021	6	11	ded_cuota_medica	8665.00	2023-06-25 00:24:03.369935	2023-06-25 00:24:03.369935	
1286	19199	27219725529	2021	7	11	ded_cuota_medica	9964.00	2023-06-25 00:24:03.370246	2023-06-25 00:24:03.370246	
1287	19199	27219725529	2021	8	11	ded_cuota_medica	9964.00	2023-06-25 00:24:03.370441	2023-06-25 00:24:03.370441	
1288	19199	27219725529	2021	9	11	ded_cuota_medica	11458.00	2023-06-25 00:24:03.370751	2023-06-25 00:24:03.370751	
1289	19199	27219725529	2021	10	11	ded_cuota_medica	11458.00	2023-06-25 00:24:03.370947	2023-06-25 00:24:03.370947	
1290	19199	27219725529	2021	11	11	ded_cuota_medica	11458.00	2023-06-25 00:24:03.371148	2023-06-25 00:24:03.371148	
1291	19199	27219725529	2021	12	11	ded_cuota_medica	12375.00	2023-06-25 00:24:03.371481	2023-06-25 00:24:03.371481	
1292	19199	27219725529	2021	9	11	ded_cuota_medica	6260.00	2023-06-25 00:24:03.371991	2023-06-25 00:24:03.371991	
1293	19199	27219725529	2021	10	11	ded_cuota_medica	6260.00	2023-06-25 00:24:03.372242	2023-06-25 00:24:03.372242	
1294	19199	27219725529	2021	11	11	ded_cuota_medica	6260.00	2023-06-25 00:24:03.372452	2023-06-25 00:24:03.372452	
1295	19199	27219725529	2021	12	11	ded_cuota_medica	6260.00	2023-06-25 00:24:03.372655	2023-06-25 00:24:03.372655	
1296	19199	27219725529	2021	1	11	ded_seguros	2025.00	2023-06-25 00:24:03.373108	2023-06-25 00:24:03.373108	
1297	19199	27219725529	2021	2	11	ded_seguros	2025.00	2023-06-25 00:24:03.373756	2023-06-25 00:24:03.373756	
1298	19199	27219725529	2021	3	11	ded_seguros	2025.00	2023-06-25 00:24:03.374136	2023-06-25 00:24:03.374136	
1299	19199	27219725529	2021	4	11	ded_seguros	2025.00	2023-06-25 00:24:03.374491	2023-06-25 00:24:03.374491	
1300	19199	27219725529	2021	5	11	ded_seguros	2025.00	2023-06-25 00:24:03.374854	2023-06-25 00:24:03.374854	
1301	19199	27219725529	2021	6	11	ded_seguros	2025.00	2023-06-25 00:24:03.375181	2023-06-25 00:24:03.375181	
1302	19199	27219725529	2021	7	11	ded_seguros	2025.00	2023-06-25 00:24:03.375823	2023-06-25 00:24:03.375823	
1303	19199	27219725529	2021	8	11	ded_seguros	2025.00	2023-06-25 00:24:03.376316	2023-06-25 00:24:03.376316	
1304	19199	27219725529	2021	9	11	ded_seguros	2025.00	2023-06-25 00:24:03.376682	2023-06-25 00:24:03.376682	
1305	19199	27219725529	2021	10	11	ded_seguros	2050.00	2023-06-25 00:24:03.377356	2023-06-25 00:24:03.377356	
1306	19199	27219725529	2021	11	11	ded_seguros	2050.00	2023-06-25 00:24:03.37769	2023-06-25 00:24:03.37769	
1307	19199	27219725529	2021	12	11	ded_seguros	2050.00	2023-06-25 00:24:03.377978	2023-06-25 00:24:03.377978	
1308	19199	27219725529	2021	12	11	ded_donaciones	75000.00	2023-06-25 00:24:03.378739	2023-06-25 00:24:03.378739	
1309	19199	27219725529	2021	1	11	ded_donaciones	1200.00	2023-06-25 00:24:03.37953	2023-06-25 00:24:03.37953	
1310	19199	27219725529	2021	2	11	ded_donaciones	1200.00	2023-06-25 00:24:03.379854	2023-06-25 00:24:03.379854	
1311	19199	27219725529	2021	3	11	ded_donaciones	1200.00	2023-06-25 00:24:03.380917	2023-06-25 00:24:03.380917	
1312	19199	27219725529	2021	4	11	ded_donaciones	1200.00	2023-06-25 00:24:03.381448	2023-06-25 00:24:03.381448	
1313	19199	27219725529	2021	5	11	ded_donaciones	1200.00	2023-06-25 00:24:03.381756	2023-06-25 00:24:03.381756	
1314	19199	27219725529	2021	6	11	ded_donaciones	1200.00	2023-06-25 00:24:03.382016	2023-06-25 00:24:03.382016	
1315	19199	27219725529	2021	7	11	ded_donaciones	1200.00	2023-06-25 00:24:03.382236	2023-06-25 00:24:03.382236	
1316	19199	27219725529	2021	8	11	ded_donaciones	1200.00	2023-06-25 00:24:03.382477	2023-06-25 00:24:03.382477	
1317	19199	27219725529	2021	9	11	ded_donaciones	1200.00	2023-06-25 00:24:03.382698	2023-06-25 00:24:03.382698	
1318	19199	27219725529	2021	10	11	ded_donaciones	1200.00	2023-06-25 00:24:03.382947	2023-06-25 00:24:03.382947	
1319	19199	27219725529	2021	11	11	ded_donaciones	1200.00	2023-06-25 00:24:03.38319	2023-06-25 00:24:03.38319	
1320	19199	27219725529	2021	12	11	ded_donaciones	1200.00	2023-06-25 00:24:03.383404	2023-06-25 00:24:03.383404	
1321	19199	27219725529	2021	1	11	ded_int_hipotecarios	2475.00	2023-06-25 00:24:03.383942	2023-06-25 00:24:03.383942	
1322	19199	27219725529	2021	2	11	ded_int_hipotecarios	2475.00	2023-06-25 00:24:03.384144	2023-06-25 00:24:03.384144	
1323	19199	27219725529	2021	3	11	ded_int_hipotecarios	2475.00	2023-06-25 00:24:03.384338	2023-06-25 00:24:03.384338	
1324	19199	27219725529	2021	4	11	ded_int_hipotecarios	2475.00	2023-06-25 00:24:03.384516	2023-06-25 00:24:03.384516	
1325	19199	27219725529	2021	5	11	ded_int_hipotecarios	2475.00	2023-06-25 00:24:03.384699	2023-06-25 00:24:03.384699	
1326	19199	27219725529	2021	6	11	ded_int_hipotecarios	2475.00	2023-06-25 00:24:03.384875	2023-06-25 00:24:03.384875	
1327	19199	27219725529	2021	7	11	ded_int_hipotecarios	2475.00	2023-06-25 00:24:03.38505	2023-06-25 00:24:03.38505	
1328	19199	27219725529	2021	8	11	ded_int_hipotecarios	2475.00	2023-06-25 00:24:03.385409	2023-06-25 00:24:03.385409	
1329	19199	27219725529	2021	9	11	ded_int_hipotecarios	2475.00	2023-06-25 00:24:03.386004	2023-06-25 00:24:03.386004	
1330	19199	27219725529	2021	10	11	ded_int_hipotecarios	2475.00	2023-06-25 00:24:03.386266	2023-06-25 00:24:03.386266	
1331	19199	27219725529	2021	11	11	ded_int_hipotecarios	2475.00	2023-06-25 00:24:03.38652	2023-06-25 00:24:03.38652	
1332	19199	27219725529	2021	12	11	ded_int_hipotecarios	2475.00	2023-06-25 00:24:03.38673	2023-06-25 00:24:03.38673	
1333	19199	27219725529	2021	2	11	ded_gastos_medicos	2000.00	2023-06-25 00:24:03.387237	2023-06-25 00:24:03.387237	
1334	19199	27219725529	2021	3	11	ded_gastos_medicos	4240.00	2023-06-25 00:24:03.387688	2023-06-25 00:24:03.387688	
1335	19199	27219725529	2021	4	11	ded_gastos_medicos	1520.00	2023-06-25 00:24:03.388028	2023-06-25 00:24:03.388028	
1336	19199	27219725529	2021	6	11	ded_gastos_medicos	600.00	2023-06-25 00:24:03.388316	2023-06-25 00:24:03.388316	
1337	19199	27219725529	2021	9	11	ded_gastos_medicos	800.00	2023-06-25 00:24:03.388603	2023-06-25 00:24:03.388603	
1338	19199	27219725529	2021	7	11	ded_gastos_medicos	9600.00	2023-06-25 00:24:03.389003	2023-06-25 00:24:03.389003	
1339	19199	27219725529	2021	9	11	ded_gastos_medicos	10000.00	2023-06-25 00:24:03.389331	2023-06-25 00:24:03.389331	
1340	19199	27219725529	2021	7	11	ded_gastos_medicos	2400.00	2023-06-25 00:24:03.389913	2023-06-25 00:24:03.389913	
1341	19199	27219725529	2021	1	11	ded_gastos_medicos	8200.00	2023-06-25 00:24:03.39047	2023-06-25 00:24:03.39047	
1342	19199	27219725529	2021	3	11	ded_gastos_medicos	8600.00	2023-06-25 00:24:03.390844	2023-06-25 00:24:03.390844	
1343	19199	27219725529	2021	5	11	ded_gastos_medicos	9000.00	2023-06-25 00:24:03.391206	2023-06-25 00:24:03.391206	
1344	19199	27219725529	2021	2	11	ded_gastos_medicos	9400.00	2023-06-25 00:24:03.391712	2023-06-25 00:24:03.391712	
1345	19199	27219725529	2021	4	11	ded_gastos_medicos	9800.00	2023-06-25 00:24:03.392059	2023-06-25 00:24:03.392059	
1346	19199	27219725529	2021	6	11	ded_gastos_medicos	10200.00	2023-06-25 00:24:03.392459	2023-06-25 00:24:03.392459	
1347	19199	27219725529	2021	8	11	ded_gastos_medicos	10600.00	2023-06-25 00:24:03.392857	2023-06-25 00:24:03.392857	
1348	19199	27219725529	2021	8	11	ded_gastos_medicos	1120.00	2023-06-25 00:24:03.393422	2023-06-25 00:24:03.393422	
1349	19199	27219725529	2021	9	11	ded_gastos_medicos	1120.00	2023-06-25 00:24:03.393815	2023-06-25 00:24:03.393815	
1350	19199	27219725529	2021	10	11	ded_gastos_medicos	1120.00	2023-06-25 00:24:03.394153	2023-06-25 00:24:03.394153	
1351	19199	27219725529	2021	10	11	ded_gastos_medicos	9200.00	2023-06-25 00:24:03.394643	2023-06-25 00:24:03.394643	
1352	19199	27219725529	2021	12	11	ded_gastos_medicos	9400.00	2023-06-25 00:24:03.394965	2023-06-25 00:24:03.394965	
1353	19199	27219725529	2021	11	11	ded_gastos_medicos	4200.00	2023-06-25 00:24:03.39539	2023-06-25 00:24:03.39539	
1354	19199	27219725529	2021	1	11	ded_retiro	2050.00	2023-06-25 00:24:03.395826	2023-06-25 00:24:03.395826	
1355	19199	27219725529	2021	2	11	ded_retiro	2050.00	2023-06-25 00:24:03.396023	2023-06-25 00:24:03.396023	
1356	19199	27219725529	2021	3	11	ded_retiro	2050.00	2023-06-25 00:24:03.396217	2023-06-25 00:24:03.396217	
1357	19199	27219725529	2021	4	11	ded_retiro	2050.00	2023-06-25 00:24:03.39641	2023-06-25 00:24:03.39641	
1358	19199	27219725529	2021	5	11	ded_retiro	2050.00	2023-06-25 00:24:03.396607	2023-06-25 00:24:03.396607	
1359	19199	27219725529	2021	6	11	ded_retiro	2050.00	2023-06-25 00:24:03.396795	2023-06-25 00:24:03.396795	
1360	19199	27219725529	2021	7	11	ded_retiro	2050.00	2023-06-25 00:24:03.396984	2023-06-25 00:24:03.396984	
1361	19199	27219725529	2021	8	11	ded_retiro	2050.00	2023-06-25 00:24:03.397176	2023-06-25 00:24:03.397176	
1362	19199	27219725529	2021	9	11	ded_retiro	2050.00	2023-06-25 00:24:03.397381	2023-06-25 00:24:03.397381	
1363	19199	27219725529	2021	10	11	ded_retiro	2050.00	2023-06-25 00:24:03.397611	2023-06-25 00:24:03.397611	
1364	19199	27219725529	2021	11	11	ded_retiro	2050.00	2023-06-25 00:24:03.397846	2023-06-25 00:24:03.397846	
1365	19199	27219725529	2021	12	11	ded_retiro	2050.00	2023-06-25 00:24:03.398044	2023-06-25 00:24:03.398044	
1366	19199	27219725529	2022	1	1	ded_cuota_medica	12375.00	2023-06-25 00:24:03.40215	2023-06-25 00:24:03.40215	
1367	19199	27219725529	2022	2	1	ded_cuota_medica	12375.00	2023-06-25 00:24:03.402387	2023-06-25 00:24:03.402387	
1368	19199	27219725529	2022	3	1	ded_cuota_medica	12375.00	2023-06-25 00:24:03.402587	2023-06-25 00:24:03.402587	
1369	19199	27219725529	2022	4	1	ded_cuota_medica	12375.00	2023-06-25 00:24:03.402783	2023-06-25 00:24:03.402783	
1370	19199	27219725529	2022	1	1	ded_cuota_medica	6260.00	2023-06-25 00:24:03.403956	2023-06-25 00:24:03.403956	
1371	19199	27219725529	2022	2	1	ded_cuota_medica	6260.00	2023-06-25 00:24:03.404213	2023-06-25 00:24:03.404213	
1372	19199	27219725529	2022	3	1	ded_cuota_medica	6260.00	2023-06-25 00:24:03.404437	2023-06-25 00:24:03.404437	
1373	19199	27219725529	2022	4	1	ded_cuota_medica	6260.00	2023-06-25 00:24:03.404657	2023-06-25 00:24:03.404657	
1374	19199	27219725529	2022	1	1	ded_seguros	2050.00	2023-06-25 00:24:03.405772	2023-06-25 00:24:03.405772	
1375	19199	27219725529	2022	2	1	ded_seguros	2050.00	2023-06-25 00:24:03.406188	2023-06-25 00:24:03.406188	
1376	19199	27219725529	2022	3	1	ded_seguros	2050.00	2023-06-25 00:24:03.406807	2023-06-25 00:24:03.406807	
1377	19199	27219725529	2022	4	1	ded_seguros	2050.00	2023-06-25 00:24:03.407181	2023-06-25 00:24:03.407181	
1378	19199	27219725529	2022	1	1	ded_donaciones	5200.00	2023-06-25 00:24:03.408095	2023-06-25 00:24:03.408095	
1379	19199	27219725529	2022	2	1	ded_donaciones	5200.00	2023-06-25 00:24:03.408499	2023-06-25 00:24:03.408499	
1380	19199	27219725529	2022	3	1	ded_donaciones	5200.00	2023-06-25 00:24:03.408862	2023-06-25 00:24:03.408862	
1381	19199	27219725529	2022	4	1	ded_donaciones	5200.00	2023-06-25 00:24:03.409236	2023-06-25 00:24:03.409236	
1382	19199	27219725529	2022	1	1	ded_int_hipotecarios	2455.00	2023-06-25 00:24:03.410068	2023-06-25 00:24:03.410068	
1383	19199	27219725529	2022	2	1	ded_int_hipotecarios	2455.00	2023-06-25 00:24:03.410395	2023-06-25 00:24:03.410395	
1384	19199	27219725529	2022	3	1	ded_int_hipotecarios	2455.00	2023-06-25 00:24:03.410693	2023-06-25 00:24:03.410693	
1385	19199	27219725529	2022	4	1	ded_int_hipotecarios	2455.00	2023-06-25 00:24:03.410978	2023-06-25 00:24:03.410978	
1386	19199	27219725529	2022	1	1	ded_retiro	2050.00	2023-06-25 00:24:03.411664	2023-06-25 00:24:03.411664	
1387	19199	27219725529	2022	2	1	ded_retiro	2050.00	2023-06-25 00:24:03.411982	2023-06-25 00:24:03.411982	
1388	19199	27219725529	2022	3	1	ded_retiro	2050.00	2023-06-25 00:24:03.412226	2023-06-25 00:24:03.412226	
1389	19199	27219725529	2022	4	1	ded_retiro	2050.00	2023-06-25 00:24:03.412467	2023-06-25 00:24:03.412467	
1390	37222	27225268938	2021	5	7	ded_cuota_medica	778.12	2023-06-25 00:24:03.416942	2023-06-25 00:24:03.416942	
1391	37222	27225268938	2021	9	7	ded_cuota_medica	1322.32	2023-06-25 00:24:03.417773	2023-06-25 00:24:03.417773	
1392	37222	27225268938	2021	11	7	ded_cuota_medica	976.81	2023-06-25 00:24:03.418278	2023-06-25 00:24:03.418278	
1393	37222	27225268938	2021	12	7	ded_cuota_medica	650.99	2023-06-25 00:24:03.418644	2023-06-25 00:24:03.418644	
1394	37222	27225268938	2021	1	7	ded_seguros	135.00	2023-06-25 00:24:03.419086	2023-06-25 00:24:03.419086	
1395	37222	27225268938	2021	2	7	ded_seguros	135.00	2023-06-25 00:24:03.419317	2023-06-25 00:24:03.419317	
1396	37222	27225268938	2021	3	7	ded_seguros	135.00	2023-06-25 00:24:03.419518	2023-06-25 00:24:03.419518	
1397	37222	27225268938	2021	4	7	ded_seguros	135.00	2023-06-25 00:24:03.419718	2023-06-25 00:24:03.419718	
1398	37222	27225268938	2021	5	7	ded_seguros	135.00	2023-06-25 00:24:03.41992	2023-06-25 00:24:03.41992	
1399	37222	27225268938	2021	6	7	ded_seguros	135.00	2023-06-25 00:24:03.420114	2023-06-25 00:24:03.420114	
1400	37222	27225268938	2021	7	7	ded_seguros	135.00	2023-06-25 00:24:03.420311	2023-06-25 00:24:03.420311	
1401	37222	27225268938	2021	8	7	ded_seguros	155.00	2023-06-25 00:24:03.420619	2023-06-25 00:24:03.420619	
1402	37222	27225268938	2021	10	7	ded_seguros	306.88	2023-06-25 00:24:03.420948	2023-06-25 00:24:03.420948	
1403	37222	27225268938	2021	11	7	ded_seguros	154.00	2023-06-25 00:24:03.421351	2023-06-25 00:24:03.421351	
1404	37222	27225268938	2021	12	7	ded_seguros	155.00	2023-06-25 00:24:03.421702	2023-06-25 00:24:03.421702	
1405	37222	27225268938	2021	3	7	ded_gastos_medicos	2600.00	2023-06-25 00:24:03.422158	2023-06-25 00:24:03.422158	
1406	37222	27225268938	2021	8	7	ded_gastos_medicos	3000.00	2023-06-25 00:24:03.422521	2023-06-25 00:24:03.422521	
1407	37222	27225268938	2021	2	7	ded_gastos_medicos	1200.00	2023-06-25 00:24:03.423067	2023-06-25 00:24:03.423067	
1408	37222	27225268938	2021	4	7	ded_gastos_medicos	1200.00	2023-06-25 00:24:03.423393	2023-06-25 00:24:03.423393	
1409	37222	27225268938	2021	7	7	ded_gastos_medicos	1600.00	2023-06-25 00:24:03.423693	2023-06-25 00:24:03.423693	
1410	37222	27225268938	2021	9	7	ded_gastos_medicos	1600.00	2023-06-25 00:24:03.42399	2023-06-25 00:24:03.42399	
1411	37222	27225268938	2021	10	7	ded_gastos_medicos	3800.00	2023-06-25 00:24:03.424284	2023-06-25 00:24:03.424284	
1412	37222	27225268938	2021	12	7	ded_gastos_medicos	1800.00	2023-06-25 00:24:03.424612	2023-06-25 00:24:03.424612	
1413	37222	27225268938	2021	3	7	ded_gastos_medicos	800.00	2023-06-25 00:24:03.425024	2023-06-25 00:24:03.425024	
1414	37222	27225268938	2021	6	7	ded_gastos_medicos	1000.00	2023-06-25 00:24:03.425332	2023-06-25 00:24:03.425332	
1415	37222	27225268938	2021	9	7	ded_gastos_medicos	1120.00	2023-06-25 00:24:03.425641	2023-06-25 00:24:03.425641	
1416	37222	27225268938	2021	9	7	ded_gastos_medicos	856.52	2023-06-25 00:24:03.426127	2023-06-25 00:24:03.426127	
1417	37222	27225268938	2021	1	7	ded_indumentaria	30642.00	2023-06-25 00:24:03.426598	2023-06-25 00:24:03.426598	
1418	37222	27225268938	2021	11	7	ded_indumentaria	3561.40	2023-06-25 00:24:03.427165	2023-06-25 00:24:03.427165	
1419	37222	27225268938	2021	1	7	fam_hijos_100	100.00	2023-06-25 00:24:03.42794	2023-06-25 00:24:03.42794	
1420	37222	27225268938	2021	2	7	fam_hijos_100	100.00	2023-06-25 00:24:03.42818	2023-06-25 00:24:03.42818	
1421	37222	27225268938	2021	3	7	fam_hijos_100	100.00	2023-06-25 00:24:03.428384	2023-06-25 00:24:03.428384	
1422	37222	27225268938	2021	4	7	fam_hijos_100	100.00	2023-06-25 00:24:03.428571	2023-06-25 00:24:03.428571	
1423	37222	27225268938	2021	5	7	fam_hijos_100	100.00	2023-06-25 00:24:03.428752	2023-06-25 00:24:03.428752	
1424	37222	27225268938	2021	6	7	fam_hijos_100	100.00	2023-06-25 00:24:03.428932	2023-06-25 00:24:03.428932	
1425	37222	27225268938	2021	7	7	fam_hijos_100	100.00	2023-06-25 00:24:03.42911	2023-06-25 00:24:03.42911	
1426	37222	27225268938	2021	8	7	fam_hijos_100	100.00	2023-06-25 00:24:03.429308	2023-06-25 00:24:03.429308	
1427	37222	27225268938	2021	9	7	fam_hijos_100	100.00	2023-06-25 00:24:03.429497	2023-06-25 00:24:03.429497	
1428	37222	27225268938	2021	10	7	fam_hijos_100	100.00	2023-06-25 00:24:03.429683	2023-06-25 00:24:03.429683	
1429	37222	27225268938	2021	11	7	fam_hijos_100	100.00	2023-06-25 00:24:03.429864	2023-06-25 00:24:03.429864	
1430	37222	27225268938	2021	12	7	fam_hijos_100	100.00	2023-06-25 00:24:03.430042	2023-06-25 00:24:03.430042	
1431	37222	27225268938	2021	1	7	FECDEVDESDE	100.00	2023-06-25 00:24:03.430407	2023-06-25 00:24:03.430407	
1432	37222	27225268938	2021	2	7	FECDEVDESDE	100.00	2023-06-25 00:24:03.430609	2023-06-25 00:24:03.430609	
1433	37222	27225268938	2021	3	7	FECDEVDESDE	100.00	2023-06-25 00:24:03.430806	2023-06-25 00:24:03.430806	
1434	37222	27225268938	2021	4	7	FECDEVDESDE	100.00	2023-06-25 00:24:03.430997	2023-06-25 00:24:03.430997	
1435	37222	27225268938	2021	5	7	FECDEVDESDE	100.00	2023-06-25 00:24:03.431193	2023-06-25 00:24:03.431193	
1436	37222	27225268938	2021	6	7	FECDEVDESDE	100.00	2023-06-25 00:24:03.431381	2023-06-25 00:24:03.431381	
1437	37222	27225268938	2021	7	7	FECDEVDESDE	100.00	2023-06-25 00:24:03.431577	2023-06-25 00:24:03.431577	
1438	37222	27225268938	2021	8	7	FECDEVDESDE	100.00	2023-06-25 00:24:03.43177	2023-06-25 00:24:03.43177	
1439	37222	27225268938	2021	9	7	FECDEVDESDE	100.00	2023-06-25 00:24:03.431958	2023-06-25 00:24:03.431958	
1440	37222	27225268938	2021	10	7	FECDEVDESDE	100.00	2023-06-25 00:24:03.432151	2023-06-25 00:24:03.432151	
1441	37222	27225268938	2021	11	7	FECDEVDESDE	100.00	2023-06-25 00:24:03.432357	2023-06-25 00:24:03.432357	
1442	37222	27225268938	2021	12	7	FECDEVDESDE	100.00	2023-06-25 00:24:03.432551	2023-06-25 00:24:03.432551	
1443	37222	27225268938	2021	1	7	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.432934	2023-06-25 00:24:03.432934	
1444	37222	27225268938	2021	2	7	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.433126	2023-06-25 00:24:03.433126	
1445	37222	27225268938	2021	3	7	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.433333	2023-06-25 00:24:03.433333	
1446	37222	27225268938	2021	4	7	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.433525	2023-06-25 00:24:03.433525	
1447	37222	27225268938	2021	5	7	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.43371	2023-06-25 00:24:03.43371	
1448	37222	27225268938	2021	6	7	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.433889	2023-06-25 00:24:03.433889	
1449	37222	27225268938	2021	7	7	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.434072	2023-06-25 00:24:03.434072	
1450	37222	27225268938	2021	8	7	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.434264	2023-06-25 00:24:03.434264	
1451	37222	27225268938	2021	9	7	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.434448	2023-06-25 00:24:03.434448	
1452	37222	27225268938	2021	10	7	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.43467	2023-06-25 00:24:03.43467	
1453	37222	27225268938	2021	11	7	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.434926	2023-06-25 00:24:03.434926	
1454	37222	27225268938	2021	12	7	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.435119	2023-06-25 00:24:03.435119	
1455	37222	27225268938	2022	1	2	ded_cuota_medica	1687.56	2023-06-25 00:24:03.444009	2023-06-25 00:24:03.444009	
1456	37222	27225268938	2022	2	2	ded_cuota_medica	1485.65	2023-06-25 00:24:03.44442	2023-06-25 00:24:03.44442	
1457	37222	27225268938	2022	3	2	ded_cuota_medica	988.80	2023-06-25 00:24:03.444783	2023-06-25 00:24:03.444783	
1458	37222	27225268938	2022	1	2	ded_gastos_medicos	1200.00	2023-06-25 00:24:03.44533	2023-06-25 00:24:03.44533	
1459	37222	27225268938	2022	1	2	fam_hijos_100	100.00	2023-06-25 00:24:03.44567	2023-06-25 00:24:03.44567	
1460	37222	27225268938	2022	1	2	FECDEVDESDE	100.00	2023-06-25 00:24:03.445988	2023-06-25 00:24:03.445988	
1461	37222	27225268938	2022	2	2	FECDEVDESDE	100.00	2023-06-25 00:24:03.446201	2023-06-25 00:24:03.446201	
1462	37222	27225268938	2022	3	2	FECDEVDESDE	100.00	2023-06-25 00:24:03.446402	2023-06-25 00:24:03.446402	
1463	37222	27225268938	2022	4	2	FECDEVDESDE	100.00	2023-06-25 00:24:03.446598	2023-06-25 00:24:03.446598	
1464	37222	27225268938	2022	5	2	FECDEVDESDE	100.00	2023-06-25 00:24:03.446798	2023-06-25 00:24:03.446798	
1465	37222	27225268938	2022	6	2	FECDEVDESDE	100.00	2023-06-25 00:24:03.446996	2023-06-25 00:24:03.446996	
1466	37222	27225268938	2022	7	2	FECDEVDESDE	100.00	2023-06-25 00:24:03.447193	2023-06-25 00:24:03.447193	
1467	37222	27225268938	2022	8	2	FECDEVDESDE	100.00	2023-06-25 00:24:03.447393	2023-06-25 00:24:03.447393	
1468	37222	27225268938	2022	9	2	FECDEVDESDE	100.00	2023-06-25 00:24:03.447592	2023-06-25 00:24:03.447592	
1469	37222	27225268938	2022	10	2	FECDEVDESDE	100.00	2023-06-25 00:24:03.447791	2023-06-25 00:24:03.447791	
1470	37222	27225268938	2022	11	2	FECDEVDESDE	100.00	2023-06-25 00:24:03.447987	2023-06-25 00:24:03.447987	
1471	37222	27225268938	2022	12	2	FECDEVDESDE	100.00	2023-06-25 00:24:03.448184	2023-06-25 00:24:03.448184	
1472	37222	27225268938	2022	1	2	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.448481	2023-06-25 00:24:03.448481	
1473	37222	27225268938	2022	2	2	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.44907	2023-06-25 00:24:03.44907	
1474	37222	27225268938	2022	3	2	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.449999	2023-06-25 00:24:03.449999	
1475	37222	27225268938	2022	4	2	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.450324	2023-06-25 00:24:03.450324	
1476	37222	27225268938	2022	5	2	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.450541	2023-06-25 00:24:03.450541	
1477	37222	27225268938	2022	6	2	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.450735	2023-06-25 00:24:03.450735	
1478	37222	27225268938	2022	7	2	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.450918	2023-06-25 00:24:03.450918	
1479	37222	27225268938	2022	8	2	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.4511	2023-06-25 00:24:03.4511	
1480	37222	27225268938	2022	9	2	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.451308	2023-06-25 00:24:03.451308	
1481	37222	27225268938	2022	10	2	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.451486	2023-06-25 00:24:03.451486	
1482	37222	27225268938	2022	11	2	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.451663	2023-06-25 00:24:03.451663	
1483	37222	27225268938	2022	12	2	fam_hijos_disc_50	100.00	2023-06-25 00:24:03.451841	2023-06-25 00:24:03.451841	
1484	19832	27227082424	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:03.45769	2023-06-25 00:24:03.45769	
1485	19832	27227082424	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:03.457941	2023-06-25 00:24:03.457941	
1486	19832	27227082424	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:03.458139	2023-06-25 00:24:03.458139	
1487	19832	27227082424	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:03.458336	2023-06-25 00:24:03.458336	
1488	19832	27227082424	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:03.458515	2023-06-25 00:24:03.458515	
1489	19832	27227082424	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:03.458691	2023-06-25 00:24:03.458691	
1490	19832	27227082424	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:03.45887	2023-06-25 00:24:03.45887	
1491	19832	27227082424	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:03.45906	2023-06-25 00:24:03.45906	
1492	19832	27227082424	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:03.459306	2023-06-25 00:24:03.459306	
1493	19832	27227082424	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:03.459569	2023-06-25 00:24:03.459569	
1494	19832	27227082424	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:03.459808	2023-06-25 00:24:03.459808	
1495	19832	27227082424	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:24:03.460064	2023-06-25 00:24:03.460064	
1496	19832	27227082424	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:03.4604	2023-06-25 00:24:03.4604	
1497	19832	27227082424	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:03.460639	2023-06-25 00:24:03.460639	
1498	19832	27227082424	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:03.460815	2023-06-25 00:24:03.460815	
1499	19832	27227082424	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:03.460988	2023-06-25 00:24:03.460988	
1500	19832	27227082424	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:03.46119	2023-06-25 00:24:03.46119	
1501	19832	27227082424	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:03.461432	2023-06-25 00:24:03.461432	
1502	19832	27227082424	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:03.461681	2023-06-25 00:24:03.461681	
1503	19832	27227082424	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:03.461902	2023-06-25 00:24:03.461902	
1504	19832	27227082424	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:03.462119	2023-06-25 00:24:03.462119	
1505	19832	27227082424	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:03.462334	2023-06-25 00:24:03.462334	
1506	19832	27227082424	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:03.462547	2023-06-25 00:24:03.462547	
1507	19832	27227082424	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:24:03.462905	2023-06-25 00:24:03.462905	
1508	33392	27230605578	2022	1	2	ded_cuota_medica	10490.87	2023-06-25 00:24:03.467029	2023-06-25 00:24:03.467029	
1509	33392	27230605578	2022	2	2	ded_cuota_medica	10490.87	2023-06-25 00:24:03.467267	2023-06-25 00:24:03.467267	
1510	33392	27230605578	2022	3	2	ded_cuota_medica	10490.87	2023-06-25 00:24:03.467527	2023-06-25 00:24:03.467527	
1511	33392	27230605578	2022	3	2	ded_indumentaria	6018.71	2023-06-25 00:24:03.468231	2023-06-25 00:24:03.468231	
1512	33392	27230605578	2022	3	2	ded_indumentaria	6103.89	2023-06-25 00:24:03.469712	2023-06-25 00:24:03.469712	
1513	33392	27230605578	2022	2	2	ded_indumentaria	3808.75	2023-06-25 00:24:03.470672	2023-06-25 00:24:03.470672	
1514	33392	27230605578	2022	3	2	ded_indumentaria	2974.04	2023-06-25 00:24:03.471328	2023-06-25 00:24:03.471328	
1515	33392	27230605578	2022	1	2	fam_hijos_100	100.00	2023-06-25 00:24:03.471894	2023-06-25 00:24:03.471894	
1516	33392	27230605578	2022	2	2	fam_hijos_100	100.00	2023-06-25 00:24:03.472353	2023-06-25 00:24:03.472353	
1517	33392	27230605578	2022	3	2	fam_hijos_100	100.00	2023-06-25 00:24:03.472669	2023-06-25 00:24:03.472669	
1518	33392	27230605578	2022	4	2	fam_hijos_100	100.00	2023-06-25 00:24:03.472952	2023-06-25 00:24:03.472952	
1519	33392	27230605578	2022	5	2	fam_hijos_100	100.00	2023-06-25 00:24:03.473254	2023-06-25 00:24:03.473254	
1520	33392	27230605578	2022	6	2	fam_hijos_100	100.00	2023-06-25 00:24:03.473537	2023-06-25 00:24:03.473537	
1521	33392	27230605578	2022	7	2	fam_hijos_100	100.00	2023-06-25 00:24:03.473806	2023-06-25 00:24:03.473806	
1522	33392	27230605578	2022	8	2	fam_hijos_100	100.00	2023-06-25 00:24:03.474094	2023-06-25 00:24:03.474094	
1523	33392	27230605578	2022	9	2	fam_hijos_100	100.00	2023-06-25 00:24:03.47436	2023-06-25 00:24:03.47436	
1524	33392	27230605578	2022	10	2	fam_hijos_100	100.00	2023-06-25 00:24:03.474628	2023-06-25 00:24:03.474628	
1525	33392	27230605578	2022	11	2	fam_hijos_100	100.00	2023-06-25 00:24:03.474892	2023-06-25 00:24:03.474892	
1526	33392	27230605578	2022	12	2	fam_hijos_100	100.00	2023-06-25 00:24:03.475152	2023-06-25 00:24:03.475152	
1527	41231	27237809152	2021	1	7	ded_seguros	2000.00	2023-06-25 00:24:03.48772	2023-06-25 00:24:03.48772	
1528	41231	27237809152	2021	2	7	ded_seguros	2000.00	2023-06-25 00:24:03.4879	2023-06-25 00:24:03.4879	
1529	41231	27237809152	2021	3	7	ded_seguros	2000.00	2023-06-25 00:24:03.488061	2023-06-25 00:24:03.488061	
1530	41231	27237809152	2021	4	7	ded_seguros	2000.00	2023-06-25 00:24:03.488219	2023-06-25 00:24:03.488219	
1531	41231	27237809152	2021	5	7	ded_seguros	2000.00	2023-06-25 00:24:03.488416	2023-06-25 00:24:03.488416	
1532	41231	27237809152	2021	6	7	ded_seguros	2000.00	2023-06-25 00:24:03.488734	2023-06-25 00:24:03.488734	
1533	41231	27237809152	2021	7	7	ded_seguros	2000.00	2023-06-25 00:24:03.488907	2023-06-25 00:24:03.488907	
1534	41231	27237809152	2021	8	7	ded_seguros	2500.00	2023-06-25 00:24:03.489237	2023-06-25 00:24:03.489237	
1535	41231	27237809152	2021	9	7	ded_seguros	2500.00	2023-06-25 00:24:03.48943	2023-06-25 00:24:03.48943	
1536	41231	27237809152	2021	10	7	ded_seguros	2500.00	2023-06-25 00:24:03.48962	2023-06-25 00:24:03.48962	
1537	41231	27237809152	2021	11	7	ded_seguros	2500.00	2023-06-25 00:24:03.489798	2023-06-25 00:24:03.489798	
1538	41231	27237809152	2021	12	7	ded_seguros	2500.00	2023-06-25 00:24:03.489983	2023-06-25 00:24:03.489983	
1539	41231	27237809152	2021	10	7	ded_gastos_medicos	920.00	2023-06-25 00:24:03.490384	2023-06-25 00:24:03.490384	
1540	41231	27237809152	2021	3	7	ded_indumentaria	5940.00	2023-06-25 00:24:03.49077	2023-06-25 00:24:03.49077	
1541	41231	27237809152	2021	7	7	ded_indumentaria	11800.00	2023-06-25 00:24:03.491157	2023-06-25 00:24:03.491157	
1542	41231	27237809152	2021	10	7	ded_indumentaria	1699.90	2023-06-25 00:24:03.491541	2023-06-25 00:24:03.491541	
1543	41231	27237809152	2021	1	7	ded_indumentaria	6580.00	2023-06-25 00:24:03.491923	2023-06-25 00:24:03.491923	
1544	41231	27237809152	2021	4	7	ded_indumentaria	4899.00	2023-06-25 00:24:03.492306	2023-06-25 00:24:03.492306	
1545	41231	27237809152	2021	6	7	ded_indumentaria	28594.00	2023-06-25 00:24:03.492627	2023-06-25 00:24:03.492627	
1546	41231	27237809152	2021	9	7	ded_indumentaria	14597.00	2023-06-25 00:24:03.492957	2023-06-25 00:24:03.492957	
1547	41231	27237809152	2021	9	7	ded_indumentaria	10900.00	2023-06-25 00:24:03.4934	2023-06-25 00:24:03.4934	
1548	41231	27237809152	2021	10	7	ded_indumentaria	9400.00	2023-06-25 00:24:03.49384	2023-06-25 00:24:03.49384	
1549	41231	27237809152	2021	1	7	fam_hijos_100	50.00	2023-06-25 00:24:03.494437	2023-06-25 00:24:03.494437	
1550	41231	27237809152	2021	2	7	fam_hijos_100	50.00	2023-06-25 00:24:03.494656	2023-06-25 00:24:03.494656	
1551	41231	27237809152	2021	3	7	fam_hijos_100	50.00	2023-06-25 00:24:03.494834	2023-06-25 00:24:03.494834	
1552	41231	27237809152	2021	4	7	fam_hijos_100	50.00	2023-06-25 00:24:03.495007	2023-06-25 00:24:03.495007	
1553	41231	27237809152	2021	5	7	fam_hijos_100	50.00	2023-06-25 00:24:03.495173	2023-06-25 00:24:03.495173	
1554	41231	27237809152	2021	6	7	fam_hijos_100	50.00	2023-06-25 00:24:03.495342	2023-06-25 00:24:03.495342	
1555	41231	27237809152	2021	7	7	fam_hijos_100	50.00	2023-06-25 00:24:03.495533	2023-06-25 00:24:03.495533	
1556	41231	27237809152	2021	8	7	fam_hijos_100	50.00	2023-06-25 00:24:03.495694	2023-06-25 00:24:03.495694	
1557	41231	27237809152	2021	9	7	fam_hijos_100	50.00	2023-06-25 00:24:03.49588	2023-06-25 00:24:03.49588	
1558	41231	27237809152	2021	10	7	fam_hijos_100	50.00	2023-06-25 00:24:03.496621	2023-06-25 00:24:03.496621	
1559	41231	27237809152	2021	11	7	fam_hijos_100	50.00	2023-06-25 00:24:03.496896	2023-06-25 00:24:03.496896	
1560	41231	27237809152	2021	12	7	fam_hijos_100	50.00	2023-06-25 00:24:03.497107	2023-06-25 00:24:03.497107	
1561	41231	27237809152	2021	1	7	otro_seg_soc	4443.64	2023-06-25 00:24:03.49787	2023-06-25 00:24:03.49787	
1562	41231	27237809152	2021	1	7	otro_obra_soc	833.18	2023-06-25 00:24:03.498293	2023-06-25 00:24:03.498293	
1563	41231	27237809152	2021	1	7	otro_gan_brut	28772.75	2023-06-25 00:24:03.498774	2023-06-25 00:24:03.498774	
1564	41231	27237809152	2021	2	7	otro_seg_soc	4613.44	2023-06-25 00:24:03.499948	2023-06-25 00:24:03.499948	
1565	41231	27237809152	2021	2	7	otro_obra_soc	865.25	2023-06-25 00:24:03.500695	2023-06-25 00:24:03.500695	
1566	41231	27237809152	2021	2	7	otro_gan_brut	28833.99	2023-06-25 00:24:03.501329	2023-06-25 00:24:03.501329	
1567	41231	27237809152	2021	3	7	otro_gan_brut	29895.22	2023-06-25 00:24:03.502391	2023-06-25 00:24:03.502391	
1568	41231	27237809152	2021	3	7	otro_obra_soc	896.96	2023-06-25 00:24:03.502998	2023-06-25 00:24:03.502998	
1569	41231	27237809152	2021	3	7	otro_seg_soc	4783.23	2023-06-25 00:24:03.503634	2023-06-25 00:24:03.503634	
1570	41231	27237809152	2022	1	1	ded_seguros	2500.00	2023-06-25 00:24:03.510601	2023-06-25 00:24:03.510601	
1571	41231	27237809152	2022	2	1	ded_seguros	2500.00	2023-06-25 00:24:03.510827	2023-06-25 00:24:03.510827	
1572	41231	27237809152	2022	3	1	ded_seguros	2500.00	2023-06-25 00:24:03.511024	2023-06-25 00:24:03.511024	
1573	41231	27237809152	2022	3	1	ded_indumentaria	17197.00	2023-06-25 00:24:03.511483	2023-06-25 00:24:03.511483	
1574	41231	27237809152	2022	1	1	ded_indumentaria	4764.00	2023-06-25 00:24:03.511939	2023-06-25 00:24:03.511939	
1575	41231	27237809152	2022	1	1	fam_hijos_100	50.00	2023-06-25 00:24:03.512259	2023-06-25 00:24:03.512259	
1576	41231	27237809152	2022	2	1	fam_hijos_100	50.00	2023-06-25 00:24:03.512429	2023-06-25 00:24:03.512429	
1577	41231	27237809152	2022	3	1	fam_hijos_100	50.00	2023-06-25 00:24:03.512624	2023-06-25 00:24:03.512624	
1578	41231	27237809152	2022	4	1	fam_hijos_100	50.00	2023-06-25 00:24:03.5128	2023-06-25 00:24:03.5128	
1579	41231	27237809152	2022	5	1	fam_hijos_100	50.00	2023-06-25 00:24:03.512967	2023-06-25 00:24:03.512967	
1580	41231	27237809152	2022	6	1	fam_hijos_100	50.00	2023-06-25 00:24:03.513132	2023-06-25 00:24:03.513132	
1581	41231	27237809152	2022	7	1	fam_hijos_100	50.00	2023-06-25 00:24:03.513911	2023-06-25 00:24:03.513911	
1582	41231	27237809152	2022	8	1	fam_hijos_100	50.00	2023-06-25 00:24:03.514174	2023-06-25 00:24:03.514174	
1583	41231	27237809152	2022	9	1	fam_hijos_100	50.00	2023-06-25 00:24:03.514367	2023-06-25 00:24:03.514367	
1584	41231	27237809152	2022	10	1	fam_hijos_100	50.00	2023-06-25 00:24:03.514598	2023-06-25 00:24:03.514598	
1585	41231	27237809152	2022	11	1	fam_hijos_100	50.00	2023-06-25 00:24:03.514854	2023-06-25 00:24:03.514854	
1586	41231	27237809152	2022	12	1	fam_hijos_100	50.00	2023-06-25 00:24:03.515084	2023-06-25 00:24:03.515084	
1587	35774	27238794027	2021	5	15	ded_cuota_medica	4562.00	2023-06-25 00:24:03.520037	2023-06-25 00:24:03.520037	
1588	35774	27238794027	2021	6	15	ded_cuota_medica	5877.00	2023-06-25 00:24:03.520357	2023-06-25 00:24:03.520357	
1589	35774	27238794027	2021	8	15	ded_cuota_medica	5798.43	2023-06-25 00:24:03.520668	2023-06-25 00:24:03.520668	
1590	35774	27238794027	2021	9	15	ded_cuota_medica	9583.02	2023-06-25 00:24:03.521006	2023-06-25 00:24:03.521006	
1591	35774	27238794027	2021	10	15	ded_cuota_medica	10224.24	2023-06-25 00:24:03.521321	2023-06-25 00:24:03.521321	
1592	35774	27238794027	2021	9	15	ded_cuota_medica	2045.30	2023-06-25 00:24:03.521816	2023-06-25 00:24:03.521816	
1593	35774	27238794027	2021	10	15	ded_cuota_medica	2045.30	2023-06-25 00:24:03.522003	2023-06-25 00:24:03.522003	
1594	35774	27238794027	2021	11	15	ded_cuota_medica	2264.44	2023-06-25 00:24:03.522325	2023-06-25 00:24:03.522325	
1595	35774	27238794027	2021	12	15	ded_cuota_medica	2264.44	2023-06-25 00:24:03.522521	2023-06-25 00:24:03.522521	
1596	35774	27238794027	2021	1	15	ded_cuota_medica	912.22	2023-06-25 00:24:03.52297	2023-06-25 00:24:03.52297	
1597	35774	27238794027	2021	3	15	ded_cuota_medica	986.57	2023-06-25 00:24:03.523321	2023-06-25 00:24:03.523321	
1598	35774	27238794027	2021	4	15	ded_cuota_medica	1072.21	2023-06-25 00:24:03.523643	2023-06-25 00:24:03.523643	
1599	35774	27238794027	2021	8	15	ded_cuota_medica	1236.47	2023-06-25 00:24:03.523934	2023-06-25 00:24:03.523934	
1600	35774	27238794027	2021	9	15	ded_cuota_medica	1345.07	2023-06-25 00:24:03.524261	2023-06-25 00:24:03.524261	
1601	35774	27238794027	2021	10	15	ded_cuota_medica	1410.99	2023-06-25 00:24:03.524551	2023-06-25 00:24:03.524551	
1602	35774	27238794027	2021	1	15	ded_cuota_medica	903.32	2023-06-25 00:24:03.525415	2023-06-25 00:24:03.525415	
1603	35774	27238794027	2021	2	15	ded_cuota_medica	1375.48	2023-06-25 00:24:03.52588	2023-06-25 00:24:03.52588	
1604	35774	27238794027	2021	3	15	ded_cuota_medica	0.01	2023-06-25 00:24:03.526247	2023-06-25 00:24:03.526247	
1605	35774	27238794027	2021	4	15	ded_cuota_medica	925.04	2023-06-25 00:24:03.526587	2023-06-25 00:24:03.526587	
1606	35774	27238794027	2021	6	15	ded_cuota_medica	1127.97	2023-06-25 00:24:03.527047	2023-06-25 00:24:03.527047	
1607	35774	27238794027	2021	8	15	ded_gastos_medicos	800.00	2023-06-25 00:24:03.52753	2023-06-25 00:24:03.52753	
1608	35774	27238794027	2021	12	15	ded_indumentaria	9630.00	2023-06-25 00:24:03.52799	2023-06-25 00:24:03.52799	
1609	35774	27238794027	2021	2	15	ded_indumentaria	22488.00	2023-06-25 00:24:03.528454	2023-06-25 00:24:03.528454	
1610	35774	27238794027	2021	12	15	ded_indumentaria	1500.00	2023-06-25 00:24:03.528907	2023-06-25 00:24:03.528907	
1611	35774	27238794027	2021	12	15	ded_indumentaria	2750.00	2023-06-25 00:24:03.529356	2023-06-25 00:24:03.529356	
1612	35774	27238794027	2021	12	15	ded_indumentaria	2990.00	2023-06-25 00:24:03.529876	2023-06-25 00:24:03.529876	
1613	35774	27238794027	2021	1	15	fam_hijos_100	100.00	2023-06-25 00:24:03.530299	2023-06-25 00:24:03.530299	
1614	35774	27238794027	2021	2	15	fam_hijos_100	100.00	2023-06-25 00:24:03.53053	2023-06-25 00:24:03.53053	
1615	35774	27238794027	2021	3	15	fam_hijos_100	100.00	2023-06-25 00:24:03.531269	2023-06-25 00:24:03.531269	
1616	35774	27238794027	2021	4	15	fam_hijos_100	100.00	2023-06-25 00:24:03.531705	2023-06-25 00:24:03.531705	
1617	35774	27238794027	2021	5	15	fam_hijos_100	100.00	2023-06-25 00:24:03.532085	2023-06-25 00:24:03.532085	
1618	35774	27238794027	2021	6	15	fam_hijos_100	100.00	2023-06-25 00:24:03.532467	2023-06-25 00:24:03.532467	
1619	35774	27238794027	2021	7	15	fam_hijos_100	100.00	2023-06-25 00:24:03.533036	2023-06-25 00:24:03.533036	
1620	35774	27238794027	2021	8	15	fam_hijos_100	100.00	2023-06-25 00:24:03.53336	2023-06-25 00:24:03.53336	
1621	35774	27238794027	2021	9	15	fam_hijos_100	100.00	2023-06-25 00:24:03.533686	2023-06-25 00:24:03.533686	
1622	35774	27238794027	2021	10	15	fam_hijos_100	100.00	2023-06-25 00:24:03.534044	2023-06-25 00:24:03.534044	
1623	35774	27238794027	2021	11	15	fam_hijos_100	100.00	2023-06-25 00:24:03.534376	2023-06-25 00:24:03.534376	
1624	35774	27238794027	2021	12	15	fam_hijos_100	100.00	2023-06-25 00:24:03.534702	2023-06-25 00:24:03.534702	
1625	35774	27238794027	2022	1	3	ded_cuota_medica	2512.98	2023-06-25 00:24:03.540224	2023-06-25 00:24:03.540224	
1626	35774	27238794027	2022	1	3	ded_cuota_medica	1467.99	2023-06-25 00:24:03.540766	2023-06-25 00:24:03.540766	
1627	35774	27238794027	2022	3	3	ded_cuota_medica	1500.00	2023-06-25 00:24:03.541685	2023-06-25 00:24:03.541685	
1628	35774	27238794027	2022	1	3	ded_cuota_medica	200.00	2023-06-25 00:24:03.542476	2023-06-25 00:24:03.542476	
1629	35774	27238794027	2022	2	3	ded_indumentaria	3920.00	2023-06-25 00:24:03.543	2023-06-25 00:24:03.543	
1630	35774	27238794027	2022	2	3	ded_indumentaria	10798.00	2023-06-25 00:24:03.543481	2023-06-25 00:24:03.543481	
1631	35774	27238794027	2022	1	3	ded_indumentaria	3900.00	2023-06-25 00:24:03.543971	2023-06-25 00:24:03.543971	
1632	35774	27238794027	2022	1	3	fam_hijos_100	100.00	2023-06-25 00:24:03.544348	2023-06-25 00:24:03.544348	
1633	35774	27238794027	2022	2	3	fam_hijos_100	100.00	2023-06-25 00:24:03.544538	2023-06-25 00:24:03.544538	
1634	35774	27238794027	2022	3	3	fam_hijos_100	100.00	2023-06-25 00:24:03.544733	2023-06-25 00:24:03.544733	
1635	35774	27238794027	2022	4	3	fam_hijos_100	100.00	2023-06-25 00:24:03.544939	2023-06-25 00:24:03.544939	
1636	35774	27238794027	2022	5	3	fam_hijos_100	100.00	2023-06-25 00:24:03.545122	2023-06-25 00:24:03.545122	
1637	35774	27238794027	2022	6	3	fam_hijos_100	100.00	2023-06-25 00:24:03.545347	2023-06-25 00:24:03.545347	
1638	35774	27238794027	2022	7	3	fam_hijos_100	100.00	2023-06-25 00:24:03.545546	2023-06-25 00:24:03.545546	
1639	35774	27238794027	2022	8	3	fam_hijos_100	100.00	2023-06-25 00:24:03.545739	2023-06-25 00:24:03.545739	
1640	35774	27238794027	2022	9	3	fam_hijos_100	100.00	2023-06-25 00:24:03.545921	2023-06-25 00:24:03.545921	
1641	35774	27238794027	2022	10	3	fam_hijos_100	100.00	2023-06-25 00:24:03.546128	2023-06-25 00:24:03.546128	
1642	35774	27238794027	2022	11	3	fam_hijos_100	100.00	2023-06-25 00:24:03.546813	2023-06-25 00:24:03.546813	
1643	35774	27238794027	2022	12	3	fam_hijos_100	100.00	2023-06-25 00:24:03.547149	2023-06-25 00:24:03.547149	
1644	36498	27250276422	2022	1	1	ded_cuota_medica	7854.32	2023-06-25 00:24:03.551219	2023-06-25 00:24:03.551219	
1645	36498	27250276422	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:03.551559	2023-06-25 00:24:03.551559	
1646	36498	27250276422	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:03.551794	2023-06-25 00:24:03.551794	
1647	36498	27250276422	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:03.551991	2023-06-25 00:24:03.551991	
1648	36498	27250276422	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:03.552186	2023-06-25 00:24:03.552186	
1649	36498	27250276422	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:03.552385	2023-06-25 00:24:03.552385	
1650	36498	27250276422	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:03.552579	2023-06-25 00:24:03.552579	
1651	36498	27250276422	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:03.5528	2023-06-25 00:24:03.5528	
1652	36498	27250276422	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:03.553092	2023-06-25 00:24:03.553092	
1653	36498	27250276422	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:03.553392	2023-06-25 00:24:03.553392	
1654	36498	27250276422	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:03.553691	2023-06-25 00:24:03.553691	
1655	36498	27250276422	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:03.553945	2023-06-25 00:24:03.553945	
1656	36498	27250276422	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:24:03.554196	2023-06-25 00:24:03.554196	
1657	36498	27250276422	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:03.554625	2023-06-25 00:24:03.554625	
1658	36498	27250276422	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:03.554879	2023-06-25 00:24:03.554879	
1659	36498	27250276422	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:03.555132	2023-06-25 00:24:03.555132	
1660	36498	27250276422	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:03.555367	2023-06-25 00:24:03.555367	
1661	36498	27250276422	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:03.555896	2023-06-25 00:24:03.555896	
1662	36498	27250276422	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:03.556405	2023-06-25 00:24:03.556405	
1663	36498	27250276422	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:03.556774	2023-06-25 00:24:03.556774	
1664	36498	27250276422	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:03.557004	2023-06-25 00:24:03.557004	
1665	36498	27250276422	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:03.557182	2023-06-25 00:24:03.557182	
1666	36498	27250276422	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:03.557381	2023-06-25 00:24:03.557381	
1667	36498	27250276422	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:03.557563	2023-06-25 00:24:03.557563	
1668	36498	27250276422	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:24:03.557741	2023-06-25 00:24:03.557741	
1669	41266	27251216652	2022	1	3	ded_indumentaria	24999.00	2023-06-25 00:24:03.562164	2023-06-25 00:24:03.562164	
1670	18989	27253986048	2021	1	7	ded_cuota_medica	4236.74	2023-06-25 00:24:03.570078	2023-06-25 00:24:03.570078	
1671	18989	27253986048	2021	2	7	ded_cuota_medica	895.05	2023-06-25 00:24:03.570909	2023-06-25 00:24:03.570909	
1672	18989	27253986048	2021	3	7	ded_cuota_medica	4757.55	2023-06-25 00:24:03.5717	2023-06-25 00:24:03.5717	
1673	18989	27253986048	2021	4	7	ded_cuota_medica	4405.29	2023-06-25 00:24:03.572329	2023-06-25 00:24:03.572329	
1674	18989	27253986048	2021	5	7	ded_cuota_medica	4601.72	2023-06-25 00:24:03.57301	2023-06-25 00:24:03.57301	
1675	18989	27253986048	2021	6	7	ded_cuota_medica	4831.17	2023-06-25 00:24:03.573511	2023-06-25 00:24:03.573511	
1676	40310	27255514437	2021	1	2	fam_hijos_100	100.00	2023-06-25 00:24:03.580677	2023-06-25 00:24:03.580677	
1677	40310	27255514437	2021	2	2	fam_hijos_100	100.00	2023-06-25 00:24:03.580879	2023-06-25 00:24:03.580879	
1678	40310	27255514437	2021	3	2	fam_hijos_100	100.00	2023-06-25 00:24:03.581063	2023-06-25 00:24:03.581063	
1679	40310	27255514437	2021	4	2	fam_hijos_100	100.00	2023-06-25 00:24:03.581435	2023-06-25 00:24:03.581435	
1680	40310	27255514437	2021	5	2	fam_hijos_100	100.00	2023-06-25 00:24:03.582164	2023-06-25 00:24:03.582164	
1681	40310	27255514437	2021	6	2	fam_hijos_100	100.00	2023-06-25 00:24:03.582376	2023-06-25 00:24:03.582376	
1682	40310	27255514437	2021	7	2	fam_hijos_100	100.00	2023-06-25 00:24:03.582574	2023-06-25 00:24:03.582574	
1683	40310	27255514437	2021	8	2	fam_hijos_100	100.00	2023-06-25 00:24:03.582769	2023-06-25 00:24:03.582769	
1684	40310	27255514437	2021	9	2	fam_hijos_100	100.00	2023-06-25 00:24:03.583104	2023-06-25 00:24:03.583104	
1685	40310	27255514437	2021	10	2	fam_hijos_100	100.00	2023-06-25 00:24:03.583329	2023-06-25 00:24:03.583329	
1686	40310	27255514437	2021	11	2	fam_hijos_100	100.00	2023-06-25 00:24:03.583526	2023-06-25 00:24:03.583526	
1687	40310	27255514437	2021	12	2	fam_hijos_100	100.00	2023-06-25 00:24:03.583714	2023-06-25 00:24:03.583714	
1688	40359	27260108072	2022	1	1	ded_cuota_medica	21468.00	2023-06-25 00:24:03.588237	2023-06-25 00:24:03.588237	
1689	46718	27264662872	2022	1	2	ded_cuota_medica	1702.25	2023-06-25 00:24:03.592813	2023-06-25 00:24:03.592813	
1690	46718	27264662872	2022	2	2	ded_cuota_medica	1158.49	2023-06-25 00:24:03.593184	2023-06-25 00:24:03.593184	
1691	46718	27264662872	2022	3	2	ded_cuota_medica	229.90	2023-06-25 00:24:03.593741	2023-06-25 00:24:03.593741	
1692	46718	27264662872	2022	1	2	fam_hijos_100	100.00	2023-06-25 00:24:03.596275	2023-06-25 00:24:03.596275	
1693	46718	27264662872	2022	2	2	fam_hijos_100	100.00	2023-06-25 00:24:03.596658	2023-06-25 00:24:03.596658	
1694	46718	27264662872	2022	3	2	fam_hijos_100	100.00	2023-06-25 00:24:03.597037	2023-06-25 00:24:03.597037	
1695	46718	27264662872	2022	4	2	fam_hijos_100	100.00	2023-06-25 00:24:03.59764	2023-06-25 00:24:03.59764	
1696	46718	27264662872	2022	5	2	fam_hijos_100	100.00	2023-06-25 00:24:03.598117	2023-06-25 00:24:03.598117	
1697	46718	27264662872	2022	6	2	fam_hijos_100	100.00	2023-06-25 00:24:03.598425	2023-06-25 00:24:03.598425	
1698	46718	27264662872	2022	7	2	fam_hijos_100	100.00	2023-06-25 00:24:03.598716	2023-06-25 00:24:03.598716	
1699	46718	27264662872	2022	8	2	fam_hijos_100	100.00	2023-06-25 00:24:03.598974	2023-06-25 00:24:03.598974	
1700	46718	27264662872	2022	9	2	fam_hijos_100	100.00	2023-06-25 00:24:03.599267	2023-06-25 00:24:03.599267	
1701	46718	27264662872	2022	10	2	fam_hijos_100	100.00	2023-06-25 00:24:03.599446	2023-06-25 00:24:03.599446	
1702	46718	27264662872	2022	11	2	fam_hijos_100	100.00	2023-06-25 00:24:03.599642	2023-06-25 00:24:03.599642	
1703	46718	27264662872	2022	12	2	fam_hijos_100	100.00	2023-06-25 00:24:03.599814	2023-06-25 00:24:03.599814	
1704	38128	27275650590	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:03.606007	2023-06-25 00:24:03.606007	
1705	38128	27275650590	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:03.606372	2023-06-25 00:24:03.606372	
1706	38128	27275650590	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:03.606634	2023-06-25 00:24:03.606634	
1707	38128	27275650590	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:03.60693	2023-06-25 00:24:03.60693	
1708	38128	27275650590	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:03.60722	2023-06-25 00:24:03.60722	
1709	38128	27275650590	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:03.607508	2023-06-25 00:24:03.607508	
1710	38128	27275650590	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:03.607773	2023-06-25 00:24:03.607773	
1711	38128	27275650590	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:03.6081	2023-06-25 00:24:03.6081	
1712	38128	27275650590	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:03.608406	2023-06-25 00:24:03.608406	
1713	38128	27275650590	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:03.608653	2023-06-25 00:24:03.608653	
1714	38128	27275650590	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:03.608877	2023-06-25 00:24:03.608877	
1715	38128	27275650590	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:24:03.609096	2023-06-25 00:24:03.609096	
1716	38128	27275650590	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:03.609794	2023-06-25 00:24:03.609794	
1717	38128	27275650590	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:03.610037	2023-06-25 00:24:03.610037	
1718	38128	27275650590	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:03.61027	2023-06-25 00:24:03.61027	
1719	38128	27275650590	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:03.610466	2023-06-25 00:24:03.610466	
1720	38128	27275650590	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:03.610667	2023-06-25 00:24:03.610667	
1721	38128	27275650590	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:03.610859	2023-06-25 00:24:03.610859	
1722	38128	27275650590	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:03.611047	2023-06-25 00:24:03.611047	
1723	38128	27275650590	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:03.611232	2023-06-25 00:24:03.611232	
1724	38128	27275650590	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:03.611422	2023-06-25 00:24:03.611422	
1725	38128	27275650590	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:03.611604	2023-06-25 00:24:03.611604	
1726	38128	27275650590	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:03.61179	2023-06-25 00:24:03.61179	
1727	38128	27275650590	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:24:03.611971	2023-06-25 00:24:03.611971	
1728	45548	27277784675	2021	1	3	ded_cuota_medica	8304.97	2023-06-25 00:24:03.617164	2023-06-25 00:24:03.617164	
1729	45548	27277784675	2021	2	3	ded_cuota_medica	8001.51	2023-06-25 00:24:03.617549	2023-06-25 00:24:03.617549	
1730	45548	27277784675	2021	3	3	ded_cuota_medica	7269.28	2023-06-25 00:24:03.61792	2023-06-25 00:24:03.61792	
1731	45548	27277784675	2021	4	3	ded_cuota_medica	337.83	2023-06-25 00:24:03.618264	2023-06-25 00:24:03.618264	
1732	45548	27277784675	2021	5	3	ded_cuota_medica	10286.58	2023-06-25 00:24:03.61862	2023-06-25 00:24:03.61862	
1733	45548	27277784675	2021	6	3	ded_cuota_medica	2261.84	2023-06-25 00:24:03.618932	2023-06-25 00:24:03.618932	
1734	45548	27277784675	2021	7	3	ded_cuota_medica	7587.61	2023-06-25 00:24:03.619233	2023-06-25 00:24:03.619233	
1735	45548	27277784675	2021	8	3	ded_cuota_medica	6992.06	2023-06-25 00:24:03.61954	2023-06-25 00:24:03.61954	
1736	45548	27277784675	2021	9	3	ded_cuota_medica	13390.13	2023-06-25 00:24:03.619988	2023-06-25 00:24:03.619988	
1737	45548	27277784675	2021	10	3	ded_cuota_medica	4191.20	2023-06-25 00:24:03.620743	2023-06-25 00:24:03.620743	
1738	45548	27277784675	2021	11	3	ded_cuota_medica	19236.85	2023-06-25 00:24:03.621184	2023-06-25 00:24:03.621184	
1739	45548	27277784675	2021	12	3	ded_cuota_medica	12089.63	2023-06-25 00:24:03.621623	2023-06-25 00:24:03.621623	
1740	45548	27277784675	2021	1	3	fam_hijos_100	100.00	2023-06-25 00:24:03.621963	2023-06-25 00:24:03.621963	
1741	45548	27277784675	2021	2	3	fam_hijos_100	100.00	2023-06-25 00:24:03.622155	2023-06-25 00:24:03.622155	
1742	45548	27277784675	2021	3	3	fam_hijos_100	100.00	2023-06-25 00:24:03.622358	2023-06-25 00:24:03.622358	
1743	45548	27277784675	2021	4	3	fam_hijos_100	100.00	2023-06-25 00:24:03.622532	2023-06-25 00:24:03.622532	
1744	45548	27277784675	2021	5	3	fam_hijos_100	100.00	2023-06-25 00:24:03.622723	2023-06-25 00:24:03.622723	
1745	45548	27277784675	2021	6	3	fam_hijos_100	100.00	2023-06-25 00:24:03.622941	2023-06-25 00:24:03.622941	
1746	45548	27277784675	2021	7	3	fam_hijos_100	100.00	2023-06-25 00:24:03.623144	2023-06-25 00:24:03.623144	
1747	45548	27277784675	2021	8	3	fam_hijos_100	100.00	2023-06-25 00:24:03.623339	2023-06-25 00:24:03.623339	
1748	45548	27277784675	2021	9	3	fam_hijos_100	100.00	2023-06-25 00:24:03.623551	2023-06-25 00:24:03.623551	
1749	45548	27277784675	2021	10	3	fam_hijos_100	100.00	2023-06-25 00:24:03.623839	2023-06-25 00:24:03.623839	
1750	45548	27277784675	2021	11	3	fam_hijos_100	100.00	2023-06-25 00:24:03.624083	2023-06-25 00:24:03.624083	
1751	45548	27277784675	2021	12	3	fam_hijos_100	100.00	2023-06-25 00:24:03.624407	2023-06-25 00:24:03.624407	
1752	45548	27277784675	2021	1	3	fam_hijos_100	100.00	2023-06-25 00:24:03.624864	2023-06-25 00:24:03.624864	
1753	45548	27277784675	2021	2	3	fam_hijos_100	100.00	2023-06-25 00:24:03.625769	2023-06-25 00:24:03.625769	
1754	45548	27277784675	2021	3	3	fam_hijos_100	100.00	2023-06-25 00:24:03.626286	2023-06-25 00:24:03.626286	
1755	45548	27277784675	2021	4	3	fam_hijos_100	100.00	2023-06-25 00:24:03.626744	2023-06-25 00:24:03.626744	
1756	45548	27277784675	2021	5	3	fam_hijos_100	100.00	2023-06-25 00:24:03.627062	2023-06-25 00:24:03.627062	
1757	45548	27277784675	2021	6	3	fam_hijos_100	100.00	2023-06-25 00:24:03.627353	2023-06-25 00:24:03.627353	
1758	45548	27277784675	2021	7	3	fam_hijos_100	100.00	2023-06-25 00:24:03.627627	2023-06-25 00:24:03.627627	
1759	45548	27277784675	2021	8	3	fam_hijos_100	100.00	2023-06-25 00:24:03.627889	2023-06-25 00:24:03.627889	
1760	45548	27277784675	2021	9	3	fam_hijos_100	100.00	2023-06-25 00:24:03.628161	2023-06-25 00:24:03.628161	
1761	45548	27277784675	2021	10	3	fam_hijos_100	100.00	2023-06-25 00:24:03.628418	2023-06-25 00:24:03.628418	
1762	45548	27277784675	2021	11	3	fam_hijos_100	100.00	2023-06-25 00:24:03.628665	2023-06-25 00:24:03.628665	
1763	45548	27277784675	2021	12	3	fam_hijos_100	100.00	2023-06-25 00:24:03.628919	2023-06-25 00:24:03.628919	
1764	45548	27277784675	2022	1	1	ded_cuota_medica	13114.48	2023-06-25 00:24:03.635368	2023-06-25 00:24:03.635368	
1765	45548	27277784675	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:03.635732	2023-06-25 00:24:03.635732	
1766	45548	27277784675	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:03.635965	2023-06-25 00:24:03.635965	
1767	45548	27277784675	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:03.636178	2023-06-25 00:24:03.636178	
1768	45548	27277784675	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:03.636387	2023-06-25 00:24:03.636387	
1769	45548	27277784675	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:03.636592	2023-06-25 00:24:03.636592	
1770	45548	27277784675	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:03.636795	2023-06-25 00:24:03.636795	
1771	45548	27277784675	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:03.637033	2023-06-25 00:24:03.637033	
1772	45548	27277784675	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:03.637722	2023-06-25 00:24:03.637722	
1773	45548	27277784675	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:03.638038	2023-06-25 00:24:03.638038	
1774	45548	27277784675	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:03.638572	2023-06-25 00:24:03.638572	
1775	45548	27277784675	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:03.638952	2023-06-25 00:24:03.638952	
1776	45548	27277784675	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:24:03.639249	2023-06-25 00:24:03.639249	
1777	45548	27277784675	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:03.639724	2023-06-25 00:24:03.639724	
1778	45548	27277784675	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:03.640053	2023-06-25 00:24:03.640053	
1779	45548	27277784675	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:03.640361	2023-06-25 00:24:03.640361	
1780	45548	27277784675	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:03.640733	2023-06-25 00:24:03.640733	
1781	45548	27277784675	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:03.641026	2023-06-25 00:24:03.641026	
1782	45548	27277784675	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:03.641386	2023-06-25 00:24:03.641386	
1783	45548	27277784675	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:03.641727	2023-06-25 00:24:03.641727	
1784	45548	27277784675	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:03.642006	2023-06-25 00:24:03.642006	
1785	45548	27277784675	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:03.642311	2023-06-25 00:24:03.642311	
1786	45548	27277784675	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:03.642505	2023-06-25 00:24:03.642505	
1787	45548	27277784675	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:03.642783	2023-06-25 00:24:03.642783	
1788	45548	27277784675	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:24:03.64301	2023-06-25 00:24:03.64301	
1789	40527	27280858124	2021	1	1	fam_hijos_100	100.00	2023-06-25 00:24:03.647672	2023-06-25 00:24:03.647672	
1790	40527	27280858124	2021	2	1	fam_hijos_100	100.00	2023-06-25 00:24:03.647884	2023-06-25 00:24:03.647884	
1791	40527	27280858124	2021	3	1	fam_hijos_100	100.00	2023-06-25 00:24:03.648065	2023-06-25 00:24:03.648065	
1792	40527	27280858124	2021	4	1	fam_hijos_100	100.00	2023-06-25 00:24:03.648246	2023-06-25 00:24:03.648246	
1793	40527	27280858124	2021	5	1	fam_hijos_100	100.00	2023-06-25 00:24:03.648442	2023-06-25 00:24:03.648442	
1794	40527	27280858124	2021	6	1	fam_hijos_100	100.00	2023-06-25 00:24:03.648787	2023-06-25 00:24:03.648787	
1795	40527	27280858124	2021	7	1	fam_hijos_100	100.00	2023-06-25 00:24:03.649426	2023-06-25 00:24:03.649426	
1796	40527	27280858124	2021	8	1	fam_hijos_100	100.00	2023-06-25 00:24:03.649786	2023-06-25 00:24:03.649786	
1797	40527	27280858124	2021	9	1	fam_hijos_100	100.00	2023-06-25 00:24:03.650073	2023-06-25 00:24:03.650073	
1798	40527	27280858124	2021	10	1	fam_hijos_100	100.00	2023-06-25 00:24:03.650283	2023-06-25 00:24:03.650283	
1799	40527	27280858124	2021	11	1	fam_hijos_100	100.00	2023-06-25 00:24:03.650486	2023-06-25 00:24:03.650486	
1800	40527	27280858124	2021	12	1	fam_hijos_100	100.00	2023-06-25 00:24:03.650707	2023-06-25 00:24:03.650707	
1801	40527	27280858124	2021	1	1	fam_hijos_100	100.00	2023-06-25 00:24:03.651113	2023-06-25 00:24:03.651113	
1802	40527	27280858124	2021	2	1	fam_hijos_100	100.00	2023-06-25 00:24:03.651352	2023-06-25 00:24:03.651352	
1803	40527	27280858124	2021	3	1	fam_hijos_100	100.00	2023-06-25 00:24:03.651611	2023-06-25 00:24:03.651611	
1804	40527	27280858124	2021	4	1	fam_hijos_100	100.00	2023-06-25 00:24:03.651817	2023-06-25 00:24:03.651817	
1805	40527	27280858124	2021	5	1	fam_hijos_100	100.00	2023-06-25 00:24:03.652041	2023-06-25 00:24:03.652041	
1806	40527	27280858124	2021	6	1	fam_hijos_100	100.00	2023-06-25 00:24:03.652261	2023-06-25 00:24:03.652261	
1807	40527	27280858124	2021	7	1	fam_hijos_100	100.00	2023-06-25 00:24:03.652455	2023-06-25 00:24:03.652455	
1808	40527	27280858124	2021	8	1	fam_hijos_100	100.00	2023-06-25 00:24:03.652649	2023-06-25 00:24:03.652649	
1809	40527	27280858124	2021	9	1	fam_hijos_100	100.00	2023-06-25 00:24:03.652845	2023-06-25 00:24:03.652845	
1810	40527	27280858124	2021	10	1	fam_hijos_100	100.00	2023-06-25 00:24:03.653034	2023-06-25 00:24:03.653034	
1811	40527	27280858124	2021	11	1	fam_hijos_100	100.00	2023-06-25 00:24:03.653302	2023-06-25 00:24:03.653302	
1812	40527	27280858124	2021	12	1	fam_hijos_100	100.00	2023-06-25 00:24:03.653742	2023-06-25 00:24:03.653742	
1813	48462	27290066242	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:24:03.671422	2023-06-25 00:24:03.671422	
1814	48462	27290066242	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:24:03.671632	2023-06-25 00:24:03.671632	
1815	48462	27290066242	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:24:03.671811	2023-06-25 00:24:03.671811	
1816	48462	27290066242	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:24:03.671978	2023-06-25 00:24:03.671978	
1817	48462	27290066242	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:24:03.672147	2023-06-25 00:24:03.672147	
1818	48462	27290066242	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:24:03.672326	2023-06-25 00:24:03.672326	
1819	48462	27290066242	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:24:03.672499	2023-06-25 00:24:03.672499	
1820	48462	27290066242	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:24:03.672663	2023-06-25 00:24:03.672663	
1821	48462	27290066242	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:24:03.672827	2023-06-25 00:24:03.672827	
1822	48462	27290066242	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:24:03.67299	2023-06-25 00:24:03.67299	
1823	48462	27290066242	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:24:03.673165	2023-06-25 00:24:03.673165	
1824	48462	27290066242	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:24:03.673383	2023-06-25 00:24:03.673383	
1825	37819	27292776425	2021	1	8	ded_cuota_medica	4421.00	2023-06-25 00:24:03.677467	2023-06-25 00:24:03.677467	
1826	37819	27292776425	2021	2	8	ded_cuota_medica	2524.71	2023-06-25 00:24:03.677939	2023-06-25 00:24:03.677939	
1827	37819	27292776425	2021	3	8	ded_cuota_medica	2524.71	2023-06-25 00:24:03.67816	2023-06-25 00:24:03.67816	
1828	37819	27292776425	2021	4	8	ded_cuota_medica	2524.71	2023-06-25 00:24:03.678376	2023-06-25 00:24:03.678376	
1829	37819	27292776425	2021	5	8	ded_cuota_medica	3120.00	2023-06-25 00:24:03.678675	2023-06-25 00:24:03.678675	
1830	37819	27292776425	2021	6	8	ded_cuota_medica	3120.00	2023-06-25 00:24:03.678862	2023-06-25 00:24:03.678862	
1831	37819	27292776425	2021	8	8	ded_cuota_medica	2437.29	2023-06-25 00:24:03.679156	2023-06-25 00:24:03.679156	
1832	37819	27292776425	2021	9	8	ded_cuota_medica	4311.58	2023-06-25 00:24:03.679469	2023-06-25 00:24:03.679469	
1833	37819	27292776425	2021	10	8	ded_cuota_medica	7001.48	2023-06-25 00:24:03.679745	2023-06-25 00:24:03.679745	
1834	37819	27292776425	2021	11	8	ded_cuota_medica	5571.68	2023-06-25 00:24:03.68074	2023-06-25 00:24:03.68074	
1835	37819	27292776425	2021	9	8	ded_donaciones	20000.00	2023-06-25 00:24:03.681258	2023-06-25 00:24:03.681258	
1836	37819	27292776425	2021	11	8	ded_donaciones	30000.00	2023-06-25 00:24:03.681571	2023-06-25 00:24:03.681571	
1837	37819	27292776425	2021	3	8	ded_gastos_medicos	1280.00	2023-06-25 00:24:03.681973	2023-06-25 00:24:03.681973	
1838	37819	27292776425	2021	7	8	ded_gastos_medicos	600.00	2023-06-25 00:24:03.682259	2023-06-25 00:24:03.682259	
1839	37819	27292776425	2021	8	8	ded_gastos_medicos	600.00	2023-06-25 00:24:03.682542	2023-06-25 00:24:03.682542	
1840	37819	27292776425	2021	9	8	ded_gastos_medicos	600.00	2023-06-25 00:24:03.682831	2023-06-25 00:24:03.682831	
1841	37819	27292776425	2021	10	8	ded_gastos_medicos	600.00	2023-06-25 00:24:03.683107	2023-06-25 00:24:03.683107	
1842	37819	27292776425	2021	11	8	ded_gastos_medicos	1200.00	2023-06-25 00:24:03.683402	2023-06-25 00:24:03.683402	
1843	37819	27292776425	2021	12	8	ded_gastos_medicos	1200.00	2023-06-25 00:24:03.683685	2023-06-25 00:24:03.683685	
1844	37819	27292776425	2021	6	8	ded_domestica	7999.34	2023-06-25 00:24:03.684085	2023-06-25 00:24:03.684085	
1845	37819	27292776425	2021	7	8	ded_domestica	7999.34	2023-06-25 00:24:03.684264	2023-06-25 00:24:03.684264	
1846	37819	27292776425	2021	8	8	ded_domestica	8905.01	2023-06-25 00:24:03.684546	2023-06-25 00:24:03.684546	
1847	37819	27292776425	2021	9	8	ded_domestica	8937.42	2023-06-25 00:24:03.684837	2023-06-25 00:24:03.684837	
1848	37819	27292776425	2021	10	8	ded_domestica	8937.42	2023-06-25 00:24:03.685032	2023-06-25 00:24:03.685032	
1849	37819	27292776425	2021	11	8	ded_domestica	8976.85	2023-06-25 00:24:03.685358	2023-06-25 00:24:03.685358	
1850	37819	27292776425	2021	12	8	ded_domestica	13176.85	2023-06-25 00:24:03.68567	2023-06-25 00:24:03.68567	
1851	48394	27340209929	2021	1	15	ded_alquiler	7349.20	2023-06-25 00:24:03.697075	2023-06-25 00:24:03.697075	
1852	48394	27340209929	2021	2	15	ded_alquiler	8349.20	2023-06-25 00:24:03.6975	2023-06-25 00:24:03.6975	
1853	48394	27340209929	2021	3	15	ded_alquiler	8349.20	2023-06-25 00:24:03.697701	2023-06-25 00:24:03.697701	
1854	48394	27340209929	2021	4	15	ded_alquiler	8349.20	2023-06-25 00:24:03.697883	2023-06-25 00:24:03.697883	
1855	48394	27340209929	2021	5	15	ded_alquiler	8349.20	2023-06-25 00:24:03.698061	2023-06-25 00:24:03.698061	
1856	48394	27340209929	2021	6	15	ded_alquiler	8349.20	2023-06-25 00:24:03.69826	2023-06-25 00:24:03.69826	
1857	48394	27340209929	2021	7	15	ded_alquiler	8349.20	2023-06-25 00:24:03.69843	2023-06-25 00:24:03.69843	
1858	48394	27340209929	2021	8	15	ded_alquiler	9349.20	2023-06-25 00:24:03.698705	2023-06-25 00:24:03.698705	
1859	48394	27340209929	2021	9	15	ded_alquiler	9349.20	2023-06-25 00:24:03.698876	2023-06-25 00:24:03.698876	
1860	48394	27340209929	2021	10	15	ded_alquiler	9349.20	2023-06-25 00:24:03.699044	2023-06-25 00:24:03.699044	
1861	48394	27340209929	2021	11	15	ded_alquiler	9349.20	2023-06-25 00:24:03.699213	2023-06-25 00:24:03.699213	
1862	48394	27340209929	2021	12	15	ded_alquiler	9349.20	2023-06-25 00:24:03.699383	2023-06-25 00:24:03.699383	
1863	48394	27340209929	2022	1	4	ded_alquiler	9624.00	2023-06-25 00:24:03.704636	2023-06-25 00:24:03.704636	
1864	48394	27340209929	2022	2	4	ded_alquiler	10624.00	2023-06-25 00:24:03.704994	2023-06-25 00:24:03.704994	
1865	48394	27340209929	2022	3	4	ded_alquiler	10624.00	2023-06-25 00:24:03.705219	2023-06-25 00:24:03.705219	
1866	48394	27340209929	2022	4	4	ded_alquiler	10624.00	2023-06-25 00:24:03.705429	2023-06-25 00:24:03.705429	
1867	43250	27361629731	2022	4	2	ded_gastos_medicos	12000.00	2023-06-25 00:24:03.713088	2023-06-25 00:24:03.713088	
1868	43250	27361629731	2022	3	2	ded_gastos_medicos	14800.00	2023-06-25 00:24:03.713566	2023-06-25 00:24:03.713566	
1869	19851	27925229070	2021	1	18	ded_seguros	75.13	2023-06-25 00:24:03.736502	2023-06-25 00:24:03.736502	
1870	19851	27925229070	2021	2	18	ded_seguros	75.00	2023-06-25 00:24:03.73695	2023-06-25 00:24:03.73695	
1871	19851	27925229070	2021	3	18	ded_seguros	74.86	2023-06-25 00:24:03.737316	2023-06-25 00:24:03.737316	
1872	19851	27925229070	2021	4	18	ded_seguros	74.71	2023-06-25 00:24:03.737699	2023-06-25 00:24:03.737699	
1873	19851	27925229070	2021	5	18	ded_seguros	74.56	2023-06-25 00:24:03.738138	2023-06-25 00:24:03.738138	
1874	19851	27925229070	2021	6	18	ded_seguros	74.41	2023-06-25 00:24:03.738422	2023-06-25 00:24:03.738422	
1875	19851	27925229070	2021	7	18	ded_seguros	74.25	2023-06-25 00:24:03.7387	2023-06-25 00:24:03.7387	
1876	19851	27925229070	2021	8	18	ded_seguros	74.09	2023-06-25 00:24:03.738983	2023-06-25 00:24:03.738983	
1877	19851	27925229070	2021	9	18	ded_seguros	73.92	2023-06-25 00:24:03.739263	2023-06-25 00:24:03.739263	
1878	19851	27925229070	2021	10	18	ded_seguros	73.75	2023-06-25 00:24:03.739544	2023-06-25 00:24:03.739544	
1879	19851	27925229070	2021	11	18	ded_seguros	73.57	2023-06-25 00:24:03.739828	2023-06-25 00:24:03.739828	
1880	19851	27925229070	2021	12	18	ded_seguros	73.39	2023-06-25 00:24:03.740109	2023-06-25 00:24:03.740109	
1881	19851	27925229070	2021	9	18	ded_donaciones	8000.00	2023-06-25 00:24:03.740531	2023-06-25 00:24:03.740531	
1882	19851	27925229070	2021	1	18	ded_int_hipotecarios	2308.72	2023-06-25 00:24:03.741397	2023-06-25 00:24:03.741397	
1883	19851	27925229070	2021	2	18	ded_int_hipotecarios	2304.08	2023-06-25 00:24:03.741884	2023-06-25 00:24:03.741884	
1884	19851	27925229070	2021	3	18	ded_int_hipotecarios	2302.40	2023-06-25 00:24:03.74223	2023-06-25 00:24:03.74223	
1885	19851	27925229070	2021	4	18	ded_int_hipotecarios	2295.65	2023-06-25 00:24:03.742608	2023-06-25 00:24:03.742608	
1886	19851	27925229070	2021	5	18	ded_int_hipotecarios	2291.24	2023-06-25 00:24:03.742935	2023-06-25 00:24:03.742935	
1887	19851	27925229070	2021	6	18	ded_int_hipotecarios	2286.08	2023-06-25 00:24:03.743265	2023-06-25 00:24:03.743265	
1888	19851	27925229070	2021	7	18	ded_int_hipotecarios	2275.26	2023-06-25 00:24:03.743595	2023-06-25 00:24:03.743595	
1889	19851	27925229070	2021	8	18	ded_int_hipotecarios	2277.14	2023-06-25 00:24:03.743919	2023-06-25 00:24:03.743919	
1890	19851	27925229070	2021	9	18	ded_int_hipotecarios	2267.89	2023-06-25 00:24:03.744251	2023-06-25 00:24:03.744251	
1891	19851	27925229070	2021	10	18	ded_int_hipotecarios	2265.17	2023-06-25 00:24:03.744591	2023-06-25 00:24:03.744591	
1892	19851	27925229070	2021	11	18	ded_int_hipotecarios	2264.12	2023-06-25 00:24:03.744911	2023-06-25 00:24:03.744911	
1893	19851	27925229070	2021	12	18	ded_int_hipotecarios	2259.87	2023-06-25 00:24:03.745253	2023-06-25 00:24:03.745253	
1894	19851	27925229070	2021	4	18	ded_gastos_medicos	3120.00	2023-06-25 00:24:03.745727	2023-06-25 00:24:03.745727	
1895	19851	27925229070	2022	1	3	ded_seguros	73.20	2023-06-25 00:24:03.76914	2023-06-25 00:24:03.76914	
1896	19851	27925229070	2022	2	3	ded_seguros	73.02	2023-06-25 00:24:03.769546	2023-06-25 00:24:03.769546	
1897	19851	27925229070	2022	1	3	ded_int_hipotecarios	2251.83	2023-06-25 00:24:03.770066	2023-06-25 00:24:03.770066	
1898	19851	27925229070	2022	2	3	ded_int_hipotecarios	2328.61	2023-06-25 00:24:03.770398	2023-06-25 00:24:03.770398	
1899	48002	27947155569	2021	1	9	otro_gan_brut	95431.94	2023-06-25 00:24:03.781793	2023-06-25 00:24:03.781793	
1900	48002	27947155569	2021	1	9	otro_obra_soc	2996.02	2023-06-25 00:24:03.782357	2023-06-25 00:24:03.782357	
1901	48002	27947155569	2021	1	9	otro_seg_soc	5492.71	2023-06-25 00:24:03.783123	2023-06-25 00:24:03.783123	
1902	48002	27947155569	2021	1	9	otro_sindicato	990.76	2023-06-25 00:24:03.783657	2023-06-25 00:24:03.783657	
1903	15485	20106503134	2022	1	3	ded_cuota_medica	60350.01	2023-06-25 00:27:33.165891	2023-06-25 00:27:33.165891	
1904	15485	20106503134	2022	2	3	ded_cuota_medica	60350.01	2023-06-25 00:27:33.167177	2023-06-25 00:27:33.167177	
1905	15485	20106503134	2022	3	3	ded_cuota_medica	63970.00	2023-06-25 00:27:33.168018	2023-06-25 00:27:33.168018	
1906	39187	20114928233	2022	1	4	ded_cuota_medica	34584.64	2023-06-25 00:27:33.185051	2023-06-25 00:27:33.185051	
1907	39187	20114928233	2022	2	4	ded_cuota_medica	34548.64	2023-06-25 00:27:33.18603	2023-06-25 00:27:33.18603	
1908	39187	20114928233	2022	3	4	ded_cuota_medica	34548.64	2023-06-25 00:27:33.186375	2023-06-25 00:27:33.186375	
1909	39187	20114928233	2022	4	4	ded_cuota_medica	40891.78	2023-06-25 00:27:33.186904	2023-06-25 00:27:33.186904	
1910	18958	20120856511	2022	1	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.1916	2023-06-25 00:27:33.1916	
1911	18958	20120856511	2022	2	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.19186	2023-06-25 00:27:33.19186	
1912	18958	20120856511	2022	3	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.192198	2023-06-25 00:27:33.192198	
1913	18958	20120856511	2022	4	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.192443	2023-06-25 00:27:33.192443	
1914	18958	20120856511	2022	5	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.192667	2023-06-25 00:27:33.192667	
1915	18958	20120856511	2022	6	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.192885	2023-06-25 00:27:33.192885	
1916	18958	20120856511	2022	7	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.193087	2023-06-25 00:27:33.193087	
1917	18958	20120856511	2022	8	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.193325	2023-06-25 00:27:33.193325	
1918	18958	20120856511	2022	9	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.19356	2023-06-25 00:27:33.19356	
1919	18958	20120856511	2022	10	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.193763	2023-06-25 00:27:33.193763	
1920	18958	20120856511	2022	11	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.193952	2023-06-25 00:27:33.193952	
1921	18958	20120856511	2022	12	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.194151	2023-06-25 00:27:33.194151	
1922	43030	20128013971	2021	10	2	ded_donaciones	60000.00	2023-06-25 00:27:33.210097	2023-06-25 00:27:33.210097	
1923	18769	20142476089	2021	12	16	ded_cuota_medica	7416.30	2023-06-25 00:27:33.217932	2023-06-25 00:27:33.217932	
1924	18769	20142476089	2021	9	16	ded_donaciones	15000.00	2023-06-25 00:27:33.218944	2023-06-25 00:27:33.218944	
1925	18769	20142476089	2021	10	16	ded_donaciones	50000.00	2023-06-25 00:27:33.219272	2023-06-25 00:27:33.219272	
1926	18769	20142476089	2021	1	16	ded_domestica	12363.25	2023-06-25 00:27:33.219808	2023-06-25 00:27:33.219808	
1927	18769	20142476089	2021	2	16	ded_domestica	12363.35	2023-06-25 00:27:33.220136	2023-06-25 00:27:33.220136	
1928	18769	20142476089	2021	3	16	ded_domestica	12363.00	2023-06-25 00:27:33.220439	2023-06-25 00:27:33.220439	
1929	18769	20142476089	2021	4	16	ded_domestica	12363.00	2023-06-25 00:27:33.220621	2023-06-25 00:27:33.220621	
1930	18769	20142476089	2021	5	16	ded_domestica	12464.22	2023-06-25 00:27:33.220932	2023-06-25 00:27:33.220932	
1931	18769	20142476089	2021	6	16	ded_domestica	18499.34	2023-06-25 00:27:33.221442	2023-06-25 00:27:33.221442	
1932	18769	20142476089	2021	7	16	ded_domestica	12000.00	2023-06-25 00:27:33.222045	2023-06-25 00:27:33.222045	
1933	18769	20142476089	2021	10	16	ded_domestica	28500.00	2023-06-25 00:27:33.222752	2023-06-25 00:27:33.222752	
1934	18769	20142476089	2021	11	16	ded_domestica	33000.00	2023-06-25 00:27:33.223267	2023-06-25 00:27:33.223267	
1935	18769	20142476089	2021	12	16	ded_domestica	49500.00	2023-06-25 00:27:33.223892	2023-06-25 00:27:33.223892	
1936	18769	20142476089	2021	1	16	fam_hijos_100	100.00	2023-06-25 00:27:33.224494	2023-06-25 00:27:33.224494	
1937	18769	20142476089	2021	2	16	fam_hijos_100	100.00	2023-06-25 00:27:33.224706	2023-06-25 00:27:33.224706	
1938	18769	20142476089	2021	3	16	fam_hijos_100	100.00	2023-06-25 00:27:33.224904	2023-06-25 00:27:33.224904	
1939	18769	20142476089	2021	4	16	fam_hijos_100	100.00	2023-06-25 00:27:33.225082	2023-06-25 00:27:33.225082	
1940	18769	20142476089	2021	5	16	fam_hijos_100	100.00	2023-06-25 00:27:33.225321	2023-06-25 00:27:33.225321	
1941	18769	20142476089	2021	6	16	fam_hijos_100	100.00	2023-06-25 00:27:33.225671	2023-06-25 00:27:33.225671	
1942	18769	20142476089	2021	7	16	fam_hijos_100	100.00	2023-06-25 00:27:33.22591	2023-06-25 00:27:33.22591	
1943	18769	20142476089	2021	8	16	fam_hijos_100	100.00	2023-06-25 00:27:33.226141	2023-06-25 00:27:33.226141	
1944	18769	20142476089	2021	9	16	fam_hijos_100	100.00	2023-06-25 00:27:33.226341	2023-06-25 00:27:33.226341	
1945	18769	20142476089	2021	10	16	fam_hijos_100	100.00	2023-06-25 00:27:33.226535	2023-06-25 00:27:33.226535	
1946	18769	20142476089	2021	11	16	fam_hijos_100	100.00	2023-06-25 00:27:33.226728	2023-06-25 00:27:33.226728	
1947	18769	20142476089	2021	12	16	fam_hijos_100	100.00	2023-06-25 00:27:33.226926	2023-06-25 00:27:33.226926	
1948	18769	20142476089	2022	1	5	ded_cuota_medica	5775.00	2023-06-25 00:27:33.231827	2023-06-25 00:27:33.231827	
1949	18769	20142476089	2022	3	5	ded_domestica	15891.95	2023-06-25 00:27:33.232325	2023-06-25 00:27:33.232325	
1950	18769	20142476089	2022	4	5	ded_domestica	40000.00	2023-06-25 00:27:33.232658	2023-06-25 00:27:33.232658	
1951	18769	20142476089	2022	1	5	ded_domestica	23991.36	2023-06-25 00:27:33.233329	2023-06-25 00:27:33.233329	
1952	18769	20142476089	2022	2	5	ded_domestica	11512.00	2023-06-25 00:27:33.234258	2023-06-25 00:27:33.234258	
1953	18769	20142476089	2022	1	5	fam_hijos_100	100.00	2023-06-25 00:27:33.23498	2023-06-25 00:27:33.23498	
1954	18769	20142476089	2022	2	5	fam_hijos_100	100.00	2023-06-25 00:27:33.235836	2023-06-25 00:27:33.235836	
1955	18769	20142476089	2022	3	5	fam_hijos_100	100.00	2023-06-25 00:27:33.236265	2023-06-25 00:27:33.236265	
1956	18769	20142476089	2022	4	5	fam_hijos_100	100.00	2023-06-25 00:27:33.236659	2023-06-25 00:27:33.236659	
1957	18769	20142476089	2022	5	5	fam_hijos_100	100.00	2023-06-25 00:27:33.237795	2023-06-25 00:27:33.237795	
1958	18769	20142476089	2022	6	5	fam_hijos_100	100.00	2023-06-25 00:27:33.238348	2023-06-25 00:27:33.238348	
1959	18769	20142476089	2022	7	5	fam_hijos_100	100.00	2023-06-25 00:27:33.238752	2023-06-25 00:27:33.238752	
1960	14397	20145571708	2022	1	1	fam_hijos_100	50.00	2023-06-25 00:27:33.243529	2023-06-25 00:27:33.243529	
1961	14397	20145571708	2022	2	1	fam_hijos_100	50.00	2023-06-25 00:27:33.243756	2023-06-25 00:27:33.243756	
1962	14397	20145571708	2022	3	1	fam_hijos_100	50.00	2023-06-25 00:27:33.243942	2023-06-25 00:27:33.243942	
1963	14397	20145571708	2022	4	1	fam_hijos_100	50.00	2023-06-25 00:27:33.244121	2023-06-25 00:27:33.244121	
1964	17174	20148364215	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:33.250509	2023-06-25 00:27:33.250509	
1965	17174	20148364215	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:33.25097	2023-06-25 00:27:33.25097	
1966	17174	20148364215	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:33.251349	2023-06-25 00:27:33.251349	
1967	17174	20148364215	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:33.25171	2023-06-25 00:27:33.25171	
1968	17174	20148364215	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:33.252111	2023-06-25 00:27:33.252111	
1969	17174	20148364215	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:33.252492	2023-06-25 00:27:33.252492	
1970	17174	20148364215	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:33.252779	2023-06-25 00:27:33.252779	
1971	17174	20148364215	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:33.253036	2023-06-25 00:27:33.253036	
1972	17174	20148364215	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:33.253316	2023-06-25 00:27:33.253316	
1973	17174	20148364215	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:33.253598	2023-06-25 00:27:33.253598	
1974	17174	20148364215	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:33.253826	2023-06-25 00:27:33.253826	
1975	17714	20166806330	2022	1	1	ded_cuota_medica	10792.51	2023-06-25 00:27:33.258389	2023-06-25 00:27:33.258389	
1976	17714	20166806330	2022	2	1	ded_cuota_medica	10698.22	2023-06-25 00:27:33.258786	2023-06-25 00:27:33.258786	
1977	17714	20166806330	2022	3	1	ded_cuota_medica	9626.13	2023-06-25 00:27:33.259231	2023-06-25 00:27:33.259231	
1978	18540	20170309430	2021	1	4	otro_obra_soc	2696.97	2023-06-25 00:27:33.277023	2023-06-25 00:27:33.277023	
1979	18540	20170309430	2021	1	4	otro_seg_soc	14383.84	2023-06-25 00:27:33.277731	2023-06-25 00:27:33.277731	
1980	18540	20170309430	2021	1	4	otro_gan_brut	92528.98	2023-06-25 00:27:33.278292	2023-06-25 00:27:33.278292	
1981	18540	20170309430	2021	1	4	otro_sindicato	4045.45	2023-06-25 00:27:33.27888	2023-06-25 00:27:33.27888	
1982	18540	20170309430	2021	2	4	otro_gan_brut	92528.98	2023-06-25 00:27:33.28019	2023-06-25 00:27:33.28019	
1983	18540	20170309430	2021	2	4	otro_obra_soc	2696.97	2023-06-25 00:27:33.281145	2023-06-25 00:27:33.281145	
1984	18540	20170309430	2021	2	4	otro_seg_soc	14383.84	2023-06-25 00:27:33.281828	2023-06-25 00:27:33.281828	
1985	18540	20170309430	2021	2	4	otro_sindicato	4045.45	2023-06-25 00:27:33.282409	2023-06-25 00:27:33.282409	
1986	18540	20170309430	2021	3	4	otro_seg_soc	16148.63	2023-06-25 00:27:33.283355	2023-06-25 00:27:33.283355	
1987	18540	20170309430	2021	3	4	otro_gan_brut	104058.93	2023-06-25 00:27:33.283963	2023-06-25 00:27:33.283963	
1988	18540	20170309430	2021	3	4	otro_obra_soc	3027.87	2023-06-25 00:27:33.284579	2023-06-25 00:27:33.284579	
1989	18540	20170309430	2021	3	4	otro_sindicato	4541.80	2023-06-25 00:27:33.285029	2023-06-25 00:27:33.285029	
1990	18540	20170309430	2021	4	4	otro_sindicato	4541.80	2023-06-25 00:27:33.286294	2023-06-25 00:27:33.286294	
1991	18540	20170309430	2021	4	4	otro_gan_brut	104058.93	2023-06-25 00:27:33.286731	2023-06-25 00:27:33.286731	
1992	18540	20170309430	2021	4	4	otro_obra_soc	3027.87	2023-06-25 00:27:33.287145	2023-06-25 00:27:33.287145	
1993	18540	20170309430	2021	4	4	otro_seg_soc	16148.63	2023-06-25 00:27:33.287556	2023-06-25 00:27:33.287556	
1994	18540	20170309430	2021	5	4	otro_obra_soc	3027.87	2023-06-25 00:27:33.288478	2023-06-25 00:27:33.288478	
1995	18540	20170309430	2021	5	4	otro_seg_soc	4541.80	2023-06-25 00:27:33.289	2023-06-25 00:27:33.289	
1996	18540	20170309430	2021	5	4	otro_gan_brut	104058.93	2023-06-25 00:27:33.289459	2023-06-25 00:27:33.289459	
1997	18540	20170309430	2021	5	4	otro_sindicato	4541.80	2023-06-25 00:27:33.289906	2023-06-25 00:27:33.289906	
1998	18540	20170309430	2021	6	4	otro_seg_soc	24222.94	2023-06-25 00:27:33.290619	2023-06-25 00:27:33.290619	
1999	18540	20170309430	2021	6	4	otro_gan_brut	104058.93	2023-06-25 00:27:33.291043	2023-06-25 00:27:33.291043	
2000	18540	20170309430	2021	6	4	otro_obra_soc	4551.80	2023-06-25 00:27:33.291496	2023-06-25 00:27:33.291496	
2001	18540	20170309430	2021	6	4	otro_sac	50464.46	2023-06-25 00:27:33.291898	2023-06-25 00:27:33.291898	
2002	18540	20170309430	2021	6	4	otro_sindicato	6812.70	2023-06-25 00:27:33.292326	2023-06-25 00:27:33.292326	
2003	18540	20170309430	2021	7	4	otro_sindicato	5225.40	2023-06-25 00:27:33.293045	2023-06-25 00:27:33.293045	
2004	18540	20170309430	2021	7	4	otro_seg_soc	18579.19	2023-06-25 00:27:33.29355	2023-06-25 00:27:33.29355	
2005	18540	20170309430	2021	7	4	otro_gan_brut	119249.93	2023-06-25 00:27:33.294002	2023-06-25 00:27:33.294002	
2006	18540	20170309430	2021	7	4	otro_obra_soc	3483.60	2023-06-25 00:27:33.294409	2023-06-25 00:27:33.294409	
2007	18540	20170309430	2021	8	4	otro_seg_soc	18579.19	2023-06-25 00:27:33.29499	2023-06-25 00:27:33.29499	
2008	18540	20170309430	2021	8	4	otro_gan_brut	119249.93	2023-06-25 00:27:33.295401	2023-06-25 00:27:33.295401	
2009	18540	20170309430	2021	8	4	otro_obra_soc	3483.60	2023-06-25 00:27:33.295805	2023-06-25 00:27:33.295805	
2010	18540	20170309430	2021	8	4	otro_sindicato	5225.40	2023-06-25 00:27:33.296225	2023-06-25 00:27:33.296225	
2011	18540	20170309430	2021	9	4	otro_gan_brut	124212.83	2023-06-25 00:27:33.296977	2023-06-25 00:27:33.296977	
2012	18540	20170309430	2021	9	4	otro_obra_soc	3611.48	2023-06-25 00:27:33.298066	2023-06-25 00:27:33.298066	
2013	18540	20170309430	2021	9	4	otro_seg_soc	19261.25	2023-06-25 00:27:33.299054	2023-06-25 00:27:33.299054	
2014	18540	20170309430	2021	9	4	otro_sindicato	5417.23	2023-06-25 00:27:33.299811	2023-06-25 00:27:33.299811	
2015	18540	20170309430	2021	10	4	otro_sindicato	5590.22	2023-06-25 00:27:33.300821	2023-06-25 00:27:33.300821	
2016	18540	20170309430	2021	10	4	otro_obra_soc	3726.81	2023-06-25 00:27:33.301533	2023-06-25 00:27:33.301533	
2017	18540	20170309430	2021	10	4	otro_seg_soc	19876.33	2023-06-25 00:27:33.30221	2023-06-25 00:27:33.30221	
2018	18540	20170309430	2021	10	4	otro_gan_brut	128057.08	2023-06-25 00:27:33.3029	2023-06-25 00:27:33.3029	
2019	18540	20170309430	2021	11	4	otro_obra_soc	3939.96	2023-06-25 00:27:33.303905	2023-06-25 00:27:33.303905	
2020	18540	20170309430	2021	11	4	otro_seg_soc	21013.10	2023-06-25 00:27:33.30441	2023-06-25 00:27:33.30441	
2021	18540	20170309430	2021	11	4	otro_gan_brut	131331.85	2023-06-25 00:27:33.304913	2023-06-25 00:27:33.304913	
2022	18540	20170309430	2021	11	4	otro_sindicato	5909.93	2023-06-25 00:27:33.305423	2023-06-25 00:27:33.305423	
2023	18540	20170309430	2021	12	4	otro_gan_brut	136726.63	2023-06-25 00:27:33.306257	2023-06-25 00:27:33.306257	
2024	18540	20170309430	2021	12	4	otro_obra_soc	4101.80	2023-06-25 00:27:33.306781	2023-06-25 00:27:33.306781	
2025	18540	20170309430	2021	12	4	otro_seg_soc	21876.26	2023-06-25 00:27:33.307274	2023-06-25 00:27:33.307274	
2026	18540	20170309430	2021	12	4	otro_sac	65665.92	2023-06-25 00:27:33.307682	2023-06-25 00:27:33.307682	
2027	18540	20170309430	2021	12	4	otro_sindicato	6152.70	2023-06-25 00:27:33.308109	2023-06-25 00:27:33.308109	
2028	18540	20170309430	2021	1	4	otro_seg_soc	6641.64	2023-06-25 00:27:33.309053	2023-06-25 00:27:33.309053	
2029	18540	20170309430	2021	1	4	otro_gan_brut	44140.20	2023-06-25 00:27:33.309595	2023-06-25 00:27:33.309595	
2030	18540	20170309430	2021	1	4	otro_obra_soc	1245.31	2023-06-25 00:27:33.310153	2023-06-25 00:27:33.310153	
2031	18540	20170309430	2021	1	4	otro_sindicato	1867.96	2023-06-25 00:27:33.310592	2023-06-25 00:27:33.310592	
2032	18540	20170309430	2021	2	4	otro_sindicato	1867.96	2023-06-25 00:27:33.311289	2023-06-25 00:27:33.311289	
2033	18540	20170309430	2021	2	4	otro_gan_brut	44140.20	2023-06-25 00:27:33.311771	2023-06-25 00:27:33.311771	
2034	18540	20170309430	2021	2	4	otro_obra_soc	1245.31	2023-06-25 00:27:33.312217	2023-06-25 00:27:33.312217	
2035	18540	20170309430	2021	2	4	otro_seg_soc	6641.64	2023-06-25 00:27:33.312636	2023-06-25 00:27:33.312636	
2036	18540	20170309430	2021	3	4	otro_sindicato	2140.70	2023-06-25 00:27:33.314135	2023-06-25 00:27:33.314135	
2037	18540	20170309430	2021	3	4	otro_obra_soc	1427.14	2023-06-25 00:27:33.314692	2023-06-25 00:27:33.314692	
2038	18540	20170309430	2021	3	4	otro_seg_soc	7611.39	2023-06-25 00:27:33.315206	2023-06-25 00:27:33.315206	
2039	18540	20170309430	2021	3	4	otro_gan_brut	50701.17	2023-06-25 00:27:33.315736	2023-06-25 00:27:33.315736	
2040	18540	20170309430	2021	4	4	otro_gan_brut	50701.17	2023-06-25 00:27:33.316542	2023-06-25 00:27:33.316542	
2041	18540	20170309430	2021	4	4	otro_obra_soc	1427.14	2023-06-25 00:27:33.317131	2023-06-25 00:27:33.317131	
2042	18540	20170309430	2021	4	4	otro_seg_soc	7611.39	2023-06-25 00:27:33.318002	2023-06-25 00:27:33.318002	
2043	18540	20170309430	2021	4	4	otro_sindicato	2140.70	2023-06-25 00:27:33.318809	2023-06-25 00:27:33.318809	
2044	18540	20170309430	2021	5	4	otro_sindicato	2140.70	2023-06-25 00:27:33.319573	2023-06-25 00:27:33.319573	
2045	18540	20170309430	2021	5	4	otro_seg_soc	7611.39	2023-06-25 00:27:33.320036	2023-06-25 00:27:33.320036	
2046	18540	20170309430	2021	5	4	otro_gan_brut	48701.17	2023-06-25 00:27:33.320471	2023-06-25 00:27:33.320471	
2047	18540	20170309430	2021	5	4	otro_obra_soc	1427.17	2023-06-25 00:27:33.320869	2023-06-25 00:27:33.320869	
2048	18540	20170309430	2021	6	4	otro_sac	23785.58	2023-06-25 00:27:33.321626	2023-06-25 00:27:33.321626	
2049	18540	20170309430	2021	6	4	otro_sindicato	3240.74	2023-06-25 00:27:33.32236	2023-06-25 00:27:33.32236	
2050	18540	20170309430	2021	6	4	otro_obra_soc	2140.71	2023-06-25 00:27:33.323137	2023-06-25 00:27:33.323137	
2051	18540	20170309430	2021	6	4	otro_seg_soc	11417.08	2023-06-25 00:27:33.32408	2023-06-25 00:27:33.32408	
2052	18540	20170309430	2021	6	4	otro_gan_brut	48701.17	2023-06-25 00:27:33.324847	2023-06-25 00:27:33.324847	
2053	18540	20170309430	2021	7	4	otro_sindicato	2453.99	2023-06-25 00:27:33.326139	2023-06-25 00:27:33.326139	
2054	18540	20170309430	2021	7	4	otro_obra_soc	1636.00	2023-06-25 00:27:33.326614	2023-06-25 00:27:33.326614	
2055	18540	20170309430	2021	7	4	otro_seg_soc	8725.31	2023-06-25 00:27:33.327009	2023-06-25 00:27:33.327009	
2056	18540	20170309430	2021	7	4	otro_gan_brut	57663.17	2023-06-25 00:27:33.327399	2023-06-25 00:27:33.327399	
2057	18540	20170309430	2021	8	4	otro_sindicato	2453.99	2023-06-25 00:27:33.328096	2023-06-25 00:27:33.328096	
2058	18540	20170309430	2021	8	4	otro_obra_soc	1636.00	2023-06-25 00:27:33.32856	2023-06-25 00:27:33.32856	
2059	18540	20170309430	2021	8	4	otro_seg_soc	8725.31	2023-06-25 00:27:33.328956	2023-06-25 00:27:33.328956	
2060	18540	20170309430	2021	8	4	otro_gan_brut	57663.17	2023-06-25 00:27:33.32936	2023-06-25 00:27:33.32936	
2061	18540	20170309430	2021	9	4	otro_obra_soc	1674.63	2023-06-25 00:27:33.329951	2023-06-25 00:27:33.329951	
2062	18540	20170309430	2021	9	4	otro_seg_soc	8931.35	2023-06-25 00:27:33.330456	2023-06-25 00:27:33.330456	
2063	18540	20170309430	2021	9	4	otro_gan_brut	59650.96	2023-06-25 00:27:33.330846	2023-06-25 00:27:33.330846	
2064	18540	20170309430	2021	9	4	otro_sindicato	2511.94	2023-06-25 00:27:33.331237	2023-06-25 00:27:33.331237	
2065	18540	20170309430	2021	10	4	otro_obra_soc	1737.73	2023-06-25 00:27:33.331892	2023-06-25 00:27:33.331892	
2066	18540	20170309430	2021	10	4	otro_seg_soc	9267.92	2023-06-25 00:27:33.33232	2023-06-25 00:27:33.33232	
2067	18540	20170309430	2021	10	4	otro_gan_brut	61754.47	2023-06-25 00:27:33.332721	2023-06-25 00:27:33.332721	
2068	18540	20170309430	2021	10	4	otro_sindicato	2606.60	2023-06-25 00:27:33.333088	2023-06-25 00:27:33.333088	
2069	18540	20170309430	2021	11	4	otro_sindicato	2724.84	2023-06-25 00:27:33.333691	2023-06-25 00:27:33.333691	
2070	18540	20170309430	2021	11	4	otro_gan_brut	60552.72	2023-06-25 00:27:33.334087	2023-06-25 00:27:33.334087	
2071	18540	20170309430	2021	11	4	otro_obra_soc	1816.58	2023-06-25 00:27:33.33449	2023-06-25 00:27:33.33449	
2072	18540	20170309430	2021	11	4	otro_seg_soc	9688.44	2023-06-25 00:27:33.334845	2023-06-25 00:27:33.334845	
2073	18540	20170309430	2021	12	4	otro_obra_soc	2785.50	2023-06-25 00:27:33.335432	2023-06-25 00:27:33.335432	
2074	18540	20170309430	2021	12	4	otro_seg_soc	14856.50	2023-06-25 00:27:33.335842	2023-06-25 00:27:33.335842	
2075	18540	20170309430	2021	12	4	otro_gan_brut	62576.77	2023-06-25 00:27:33.336216	2023-06-25 00:27:33.336216	
2076	18540	20170309430	2021	12	4	otro_sac	30276.36	2023-06-25 00:27:33.336608	2023-06-25 00:27:33.336608	
2077	18540	20170309430	2022	1	3	otro_obra_soc	4101.80	2023-06-25 00:27:33.341109	2023-06-25 00:27:33.341109	
2078	18540	20170309430	2022	1	3	otro_seg_soc	21876.26	2023-06-25 00:27:33.34156	2023-06-25 00:27:33.34156	
2079	18540	20170309430	2022	1	3	otro_gan_brut	136726.63	2023-06-25 00:27:33.341967	2023-06-25 00:27:33.341967	
2080	18540	20170309430	2022	1	3	otro_sindicato	6152.70	2023-06-25 00:27:33.342385	2023-06-25 00:27:33.342385	
2081	18540	20170309430	2022	2	3	otro_sindicato	6152.70	2023-06-25 00:27:33.343011	2023-06-25 00:27:33.343011	
2082	18540	20170309430	2022	2	3	otro_gan_brut	141806.63	2023-06-25 00:27:33.343394	2023-06-25 00:27:33.343394	
2083	18540	20170309430	2022	2	3	otro_obra_soc	4101.80	2023-06-25 00:27:33.343793	2023-06-25 00:27:33.343793	
2084	18540	20170309430	2022	2	3	otro_seg_soc	21876.26	2023-06-25 00:27:33.344178	2023-06-25 00:27:33.344178	
2085	18540	20170309430	2022	3	3	otro_obra_soc	4101.80	2023-06-25 00:27:33.344806	2023-06-25 00:27:33.344806	
2086	18540	20170309430	2022	3	3	otro_seg_soc	21876.26	2023-06-25 00:27:33.345232	2023-06-25 00:27:33.345232	
2087	18540	20170309430	2022	3	3	otro_gan_brut	141806.63	2023-06-25 00:27:33.345645	2023-06-25 00:27:33.345645	
2088	18540	20170309430	2022	3	3	otro_sindicato	6152.70	2023-06-25 00:27:33.346065	2023-06-25 00:27:33.346065	
2089	18540	20170309430	2022	1	3	otro_sindicato	2815.95	2023-06-25 00:27:33.346831	2023-06-25 00:27:33.346831	
2090	18540	20170309430	2022	1	3	otro_gan_brut	62576.77	2023-06-25 00:27:33.347221	2023-06-25 00:27:33.347221	
2091	18540	20170309430	2022	1	3	otro_obra_soc	1877.30	2023-06-25 00:27:33.347643	2023-06-25 00:27:33.347643	
2092	18540	20170309430	2022	1	3	otro_sac	1012.03	2023-06-25 00:27:33.348206	2023-06-25 00:27:33.348206	
2093	18540	20170309430	2022	1	3	otro_seg_soc	10012.28	2023-06-25 00:27:33.348746	2023-06-25 00:27:33.348746	
2094	18540	20170309430	2022	2	3	otro_obra_soc	1877.30	2023-06-25 00:27:33.350404	2023-06-25 00:27:33.350404	
2095	18540	20170309430	2022	2	3	otro_seg_soc	10012.28	2023-06-25 00:27:33.351611	2023-06-25 00:27:33.351611	
2096	18540	20170309430	2022	2	3	otro_sindicato	2815.95	2023-06-25 00:27:33.352415	2023-06-25 00:27:33.352415	
2097	18540	20170309430	2022	2	3	otro_gan_brut	67656.77	2023-06-25 00:27:33.353038	2023-06-25 00:27:33.353038	
2098	18540	20170309430	2022	3	3	otro_sindicato	2815.95	2023-06-25 00:27:33.353999	2023-06-25 00:27:33.353999	
2099	18540	20170309430	2022	3	3	otro_gan_brut	67656.77	2023-06-25 00:27:33.354763	2023-06-25 00:27:33.354763	
2100	18540	20170309430	2022	3	3	otro_obra_soc	1877.30	2023-06-25 00:27:33.355288	2023-06-25 00:27:33.355288	
2101	18540	20170309430	2022	3	3	otro_seg_soc	10012.28	2023-06-25 00:27:33.3557	2023-06-25 00:27:33.3557	
2102	34953	20171720967	2021	1	13	ded_cuota_medica	10295.57	2023-06-25 00:27:33.360036	2023-06-25 00:27:33.360036	
2103	34953	20171720967	2021	2	13	ded_cuota_medica	10046.93	2023-06-25 00:27:33.360492	2023-06-25 00:27:33.360492	
2104	34953	20171720967	2021	3	13	ded_cuota_medica	10007.41	2023-06-25 00:27:33.360873	2023-06-25 00:27:33.360873	
2105	34953	20171720967	2021	4	13	ded_cuota_medica	10282.61	2023-06-25 00:27:33.36156	2023-06-25 00:27:33.36156	
2106	34953	20171720967	2021	5	13	ded_cuota_medica	6262.13	2023-06-25 00:27:33.362179	2023-06-25 00:27:33.362179	
2107	34953	20171720967	2021	6	13	ded_cuota_medica	11657.11	2023-06-25 00:27:33.36255	2023-06-25 00:27:33.36255	
2108	34953	20171720967	2021	7	13	ded_cuota_medica	10960.59	2023-06-25 00:27:33.362885	2023-06-25 00:27:33.362885	
2109	34953	20171720967	2021	8	13	ded_cuota_medica	10917.59	2023-06-25 00:27:33.363484	2023-06-25 00:27:33.363484	
2110	34953	20171720967	2021	9	13	ded_cuota_medica	11904.10	2023-06-25 00:27:33.364044	2023-06-25 00:27:33.364044	
2111	34953	20171720967	2021	10	13	ded_cuota_medica	13522.44	2023-06-25 00:27:33.36508	2023-06-25 00:27:33.36508	
2112	34953	20171720967	2021	11	13	ded_cuota_medica	10066.22	2023-06-25 00:27:33.366097	2023-06-25 00:27:33.366097	
2113	34953	20171720967	2021	12	13	ded_cuota_medica	18862.66	2023-06-25 00:27:33.36684	2023-06-25 00:27:33.36684	
2114	34953	20171720967	2021	1	13	ded_domestica	14097.55	2023-06-25 00:27:33.367737	2023-06-25 00:27:33.367737	
2115	34953	20171720967	2021	2	13	ded_domestica	14099.96	2023-06-25 00:27:33.36832	2023-06-25 00:27:33.36832	
2116	34953	20171720967	2021	3	13	ded_domestica	14170.81	2023-06-25 00:27:33.368994	2023-06-25 00:27:33.368994	
2117	34953	20171720967	2021	4	13	ded_domestica	14170.81	2023-06-25 00:27:33.369383	2023-06-25 00:27:33.369383	
2118	34953	20171720967	2021	5	13	ded_domestica	14253.84	2023-06-25 00:27:33.37	2023-06-25 00:27:33.37	
2119	34953	20171720967	2021	6	13	ded_domestica	20989.24	2023-06-25 00:27:33.370636	2023-06-25 00:27:33.370636	
2120	34953	20171720967	2021	7	13	ded_domestica	14303.34	2023-06-25 00:27:33.371131	2023-06-25 00:27:33.371131	
2121	34953	20171720967	2021	8	13	ded_domestica	14364.18	2023-06-25 00:27:33.371693	2023-06-25 00:27:33.371693	
2122	34953	20171720967	2021	9	13	ded_domestica	14634.18	2023-06-25 00:27:33.372313	2023-06-25 00:27:33.372313	
2123	34953	20171720967	2021	10	13	ded_domestica	14666.47	2023-06-25 00:27:33.372803	2023-06-25 00:27:33.372803	
2124	34953	20171720967	2021	11	13	ded_domestica	14694.57	2023-06-25 00:27:33.373309	2023-06-25 00:27:33.373309	
2125	34953	20171720967	2021	12	13	ded_domestica	21565.55	2023-06-25 00:27:33.373797	2023-06-25 00:27:33.373797	
2126	34953	20171720967	2021	1	13	otro_seg_soc	5751.14	2023-06-25 00:27:33.374837	2023-06-25 00:27:33.374837	
2127	34953	20171720967	2021	1	13	otro_gan_brut	41079.58	2023-06-25 00:27:33.375353	2023-06-25 00:27:33.375353	
2128	34953	20171720967	2021	1	13	otro_sindicato	616.19	2023-06-25 00:27:33.375849	2023-06-25 00:27:33.375849	
2129	34953	20171720967	2021	1	13	otro_obra_soc	1232.29	2023-06-25 00:27:33.376365	2023-06-25 00:27:33.376365	
2130	34953	20171720967	2021	2	13	otro_gan_brut	45915.89	2023-06-25 00:27:33.377051	2023-06-25 00:27:33.377051	
2131	34953	20171720967	2021	2	13	otro_seg_soc	6428.22	2023-06-25 00:27:33.377519	2023-06-25 00:27:33.377519	
2132	34953	20171720967	2021	2	13	otro_obra_soc	1377.48	2023-06-25 00:27:33.377936	2023-06-25 00:27:33.377936	
2133	34953	20171720967	2021	2	13	otro_sindicato	688.74	2023-06-25 00:27:33.378372	2023-06-25 00:27:33.378372	
2134	34953	20171720967	2021	3	13	otro_gan_brut	45915.89	2023-06-25 00:27:33.379035	2023-06-25 00:27:33.379035	
2135	34953	20171720967	2021	3	13	otro_seg_soc	6428.22	2023-06-25 00:27:33.379535	2023-06-25 00:27:33.379535	
2136	34953	20171720967	2021	3	13	otro_sindicato	688.74	2023-06-25 00:27:33.380004	2023-06-25 00:27:33.380004	
2137	34953	20171720967	2021	3	13	otro_obra_soc	1377.48	2023-06-25 00:27:33.38043	2023-06-25 00:27:33.38043	
2138	34953	20171720967	2021	4	13	otro_sindicato	855.18	2023-06-25 00:27:33.381099	2023-06-25 00:27:33.381099	
2139	34953	20171720967	2021	4	13	otro_obra_soc	1710.35	2023-06-25 00:27:33.382038	2023-06-25 00:27:33.382038	
2140	34953	20171720967	2021	4	13	otro_seg_soc	7981.65	2023-06-25 00:27:33.382551	2023-06-25 00:27:33.382551	
2141	34953	20171720967	2021	4	13	otro_gan_brut	57011.83	2023-06-25 00:27:33.382971	2023-06-25 00:27:33.382971	
2142	34953	20171720967	2021	5	13	otro_obra_soc	1763.95	2023-06-25 00:27:33.383592	2023-06-25 00:27:33.383592	
2143	34953	20171720967	2021	5	13	otro_sindicato	881.98	2023-06-25 00:27:33.383999	2023-06-25 00:27:33.383999	
2144	34953	20171720967	2021	5	13	otro_gan_brut	58798.44	2023-06-25 00:27:33.384429	2023-06-25 00:27:33.384429	
2145	34953	20171720967	2021	5	13	otro_seg_soc	8231.78	2023-06-25 00:27:33.384862	2023-06-25 00:27:33.384862	
2146	34953	20171720967	2021	6	13	otro_sindicato	1282.77	2023-06-25 00:27:33.385477	2023-06-25 00:27:33.385477	
2147	34953	20171720967	2021	6	13	otro_obra_soc	2565.53	2023-06-25 00:27:33.385953	2023-06-25 00:27:33.385953	
2148	34953	20171720967	2021	6	13	otro_sac	28505.92	2023-06-25 00:27:33.386373	2023-06-25 00:27:33.386373	
2149	34953	20171720967	2021	6	13	otro_gan_brut	85517.75	2023-06-25 00:27:33.386789	2023-06-25 00:27:33.386789	
2150	34953	20171720967	2021	6	13	otro_seg_soc	11972.46	2023-06-25 00:27:33.387204	2023-06-25 00:27:33.387204	
2151	34953	20171720967	2021	7	13	otro_sac	12610.29	2023-06-25 00:27:33.38779	2023-06-25 00:27:33.38779	
2152	34953	20171720967	2022	1	3	ded_cuota_medica	18862.66	2023-06-25 00:27:33.391891	2023-06-25 00:27:33.391891	
2153	34953	20171720967	2022	2	3	ded_cuota_medica	20656.32	2023-06-25 00:27:33.392245	2023-06-25 00:27:33.392245	
2154	34953	20171720967	2022	3	3	ded_cuota_medica	20656.32	2023-06-25 00:27:33.392427	2023-06-25 00:27:33.392427	
2155	34953	20171720967	2022	4	3	ded_cuota_medica	21774.35	2023-06-25 00:27:33.392764	2023-06-25 00:27:33.392764	
2156	34953	20171720967	2022	1	3	ded_domestica	14951.95	2023-06-25 00:27:33.393281	2023-06-25 00:27:33.393281	
2157	34953	20171720967	2022	2	3	ded_domestica	15006.62	2023-06-25 00:27:33.394199	2023-06-25 00:27:33.394199	
2158	34953	20171720967	2022	3	3	ded_domestica	15004.33	2023-06-25 00:27:33.39487	2023-06-25 00:27:33.39487	
2159	43643	20172361758	2021	1	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.400675	2023-06-25 00:27:33.400675	
2160	43643	20172361758	2021	2	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.401059	2023-06-25 00:27:33.401059	
2161	43643	20172361758	2021	3	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.401413	2023-06-25 00:27:33.401413	
2162	43643	20172361758	2021	4	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.401711	2023-06-25 00:27:33.401711	
2163	43643	20172361758	2021	5	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.402044	2023-06-25 00:27:33.402044	
2164	43643	20172361758	2021	6	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.402438	2023-06-25 00:27:33.402438	
2165	43643	20172361758	2021	7	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.402758	2023-06-25 00:27:33.402758	
2166	43643	20172361758	2021	8	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.403061	2023-06-25 00:27:33.403061	
2167	43643	20172361758	2021	9	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.403351	2023-06-25 00:27:33.403351	
2168	43643	20172361758	2021	10	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.403643	2023-06-25 00:27:33.403643	
2169	43643	20172361758	2021	11	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.403935	2023-06-25 00:27:33.403935	
2170	43643	20172361758	2021	12	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.404301	2023-06-25 00:27:33.404301	
2171	43643	20172361758	2021	1	3	fam_hijos_100	100.00	2023-06-25 00:27:33.40481	2023-06-25 00:27:33.40481	
2172	43643	20172361758	2021	2	3	fam_hijos_100	100.00	2023-06-25 00:27:33.405063	2023-06-25 00:27:33.405063	
2173	43643	20172361758	2021	3	3	fam_hijos_100	100.00	2023-06-25 00:27:33.405357	2023-06-25 00:27:33.405357	
2174	43643	20172361758	2021	4	3	fam_hijos_100	100.00	2023-06-25 00:27:33.405715	2023-06-25 00:27:33.405715	
2175	43643	20172361758	2021	5	3	fam_hijos_100	100.00	2023-06-25 00:27:33.405923	2023-06-25 00:27:33.405923	
2176	43643	20172361758	2021	6	3	fam_hijos_100	100.00	2023-06-25 00:27:33.406162	2023-06-25 00:27:33.406162	
2177	43643	20172361758	2021	7	3	fam_hijos_100	100.00	2023-06-25 00:27:33.406356	2023-06-25 00:27:33.406356	
2178	43643	20172361758	2021	8	3	fam_hijos_100	100.00	2023-06-25 00:27:33.406567	2023-06-25 00:27:33.406567	
2179	43643	20172361758	2021	9	3	fam_hijos_100	100.00	2023-06-25 00:27:33.406754	2023-06-25 00:27:33.406754	
2180	43643	20172361758	2021	10	3	fam_hijos_100	100.00	2023-06-25 00:27:33.406961	2023-06-25 00:27:33.406961	
2181	43643	20172361758	2021	11	3	fam_hijos_100	100.00	2023-06-25 00:27:33.407137	2023-06-25 00:27:33.407137	
2182	43643	20172361758	2021	12	3	fam_hijos_100	100.00	2023-06-25 00:27:33.40731	2023-06-25 00:27:33.40731	
2183	16326	20173158549	2021	1	1	ded_cuota_medica	1776.74	2023-06-25 00:27:33.413505	2023-06-25 00:27:33.413505	
2184	16326	20173158549	2021	4	1	ded_cuota_medica	1609.97	2023-06-25 00:27:33.414138	2023-06-25 00:27:33.414138	
2185	16326	20173158549	2021	5	1	ded_cuota_medica	2124.25	2023-06-25 00:27:33.414629	2023-06-25 00:27:33.414629	
2186	16326	20173158549	2021	6	1	ded_cuota_medica	1622.54	2023-06-25 00:27:33.415165	2023-06-25 00:27:33.415165	
2187	16326	20173158549	2021	7	1	ded_cuota_medica	1622.54	2023-06-25 00:27:33.415495	2023-06-25 00:27:33.415495	
2188	16326	20173158549	2021	9	1	ded_cuota_medica	2652.42	2023-06-25 00:27:33.4159	2023-06-25 00:27:33.4159	
2189	16326	20173158549	2021	10	1	ded_cuota_medica	3707.26	2023-06-25 00:27:33.41626	2023-06-25 00:27:33.41626	
2190	16326	20173158549	2021	11	1	ded_cuota_medica	2981.81	2023-06-25 00:27:33.416593	2023-06-25 00:27:33.416593	
2191	16326	20173158549	2021	3	1	ded_gastos_medicos	9600.00	2023-06-25 00:27:33.417119	2023-06-25 00:27:33.417119	
2192	16326	20173158549	2021	12	1	ded_gastos_medicos	15200.00	2023-06-25 00:27:33.417545	2023-06-25 00:27:33.417545	
2193	16326	20173158549	2021	11	1	ded_gastos_medicos	3680.00	2023-06-25 00:27:33.418174	2023-06-25 00:27:33.418174	
2194	16326	20173158549	2021	1	1	otro_gan_brut	32193.59	2023-06-25 00:27:33.419068	2023-06-25 00:27:33.419068	
2195	16326	20173158549	2021	1	1	otro_obra_soc	3931.60	2023-06-25 00:27:33.419456	2023-06-25 00:27:33.419456	
2196	16326	20173158549	2021	1	1	otro_seg_soc	6749.68	2023-06-25 00:27:33.419816	2023-06-25 00:27:33.419816	
2197	16326	20173158549	2021	1	1	otro_sindicato	376.19	2023-06-25 00:27:33.420157	2023-06-25 00:27:33.420157	
2198	16326	20173158549	2021	2	1	otro_gan_brut	32193.63	2023-06-25 00:27:33.420731	2023-06-25 00:27:33.420731	
2199	16326	20173158549	2021	2	1	otro_obra_soc	3603.16	2023-06-25 00:27:33.421281	2023-06-25 00:27:33.421281	
2200	16326	20173158549	2021	2	1	otro_seg_soc	6749.68	2023-06-25 00:27:33.422066	2023-06-25 00:27:33.422066	
2201	16326	20173158549	2021	2	1	otro_sindicato	777.73	2023-06-25 00:27:33.422855	2023-06-25 00:27:33.422855	
2202	16326	20173158549	2021	3	1	otro_gan_brut	37034.07	2023-06-25 00:27:33.424247	2023-06-25 00:27:33.424247	
2203	16326	20173158549	2021	3	1	otro_obra_soc	3833.24	2023-06-25 00:27:33.424848	2023-06-25 00:27:33.424848	
2204	16326	20173158549	2021	3	1	otro_seg_soc	6815.71	2023-06-25 00:27:33.4259	2023-06-25 00:27:33.4259	
2205	16326	20173158549	2021	4	1	otro_obra_soc	3833.24	2023-06-25 00:27:33.427524	2023-06-25 00:27:33.427524	
2206	16326	20173158549	2021	4	1	otro_seg_soc	6815.71	2023-06-25 00:27:33.428592	2023-06-25 00:27:33.428592	
2207	16326	20173158549	2021	4	1	otro_sindicato	856.10	2023-06-25 00:27:33.429712	2023-06-25 00:27:33.429712	
2208	16326	20173158549	2021	4	1	otro_gan_brut	37034.07	2023-06-25 00:27:33.430949	2023-06-25 00:27:33.430949	
2209	16326	20173158549	2021	5	1	otro_gan_brut	37034.07	2023-06-25 00:27:33.432417	2023-06-25 00:27:33.432417	
2210	16326	20173158549	2021	5	1	otro_seg_soc	6815.71	2023-06-25 00:27:33.433248	2023-06-25 00:27:33.433248	
2211	16326	20173158549	2021	5	1	otro_sindicato	856.10	2023-06-25 00:27:33.433982	2023-06-25 00:27:33.433982	
2212	16326	20173158549	2021	5	1	otro_obra_soc	3833.24	2023-06-25 00:27:33.434825	2023-06-25 00:27:33.434825	
2213	16326	20173158549	2021	6	1	otro_gan_brut	42205.18	2023-06-25 00:27:33.435985	2023-06-25 00:27:33.435985	
2214	16326	20173158549	2021	6	1	otro_sac	17986.30	2023-06-25 00:27:33.436677	2023-06-25 00:27:33.436677	
2215	16326	20173158549	2021	6	1	otro_sindicato	1078.78	2023-06-25 00:27:33.437238	2023-06-25 00:27:33.437238	
2216	16326	20173158549	2021	6	1	otro_obra_soc	6118.01	2023-06-25 00:27:33.437686	2023-06-25 00:27:33.437686	
2217	16326	20173158549	2021	6	1	otro_seg_soc	11558.00	2023-06-25 00:27:33.438269	2023-06-25 00:27:33.438269	
2218	16326	20173158549	2021	7	1	otro_gan_brut	42205.18	2023-06-25 00:27:33.439038	2023-06-25 00:27:33.439038	
2219	16326	20173158549	2021	7	1	otro_seg_soc	8845.15	2023-06-25 00:27:33.439559	2023-06-25 00:27:33.439559	
2220	16326	20173158549	2021	7	1	otro_sindicato	984.80	2023-06-25 00:27:33.440135	2023-06-25 00:27:33.440135	
2221	16326	20173158549	2021	7	1	otro_obra_soc	4698.82	2023-06-25 00:27:33.440697	2023-06-25 00:27:33.440697	
2222	16326	20173158549	2021	8	1	otro_obra_soc	4665.39	2023-06-25 00:27:33.441814	2023-06-25 00:27:33.441814	
2223	16326	20173158549	2021	8	1	otro_seg_soc	7822.26	2023-06-25 00:27:33.442612	2023-06-25 00:27:33.442612	
2224	16326	20173158549	2021	8	1	otro_sindicato	956.84	2023-06-25 00:27:33.443127	2023-06-25 00:27:33.443127	
2225	16326	20173158549	2021	8	1	otro_gan_brut	42205.18	2023-06-25 00:27:33.443622	2023-06-25 00:27:33.443622	
2226	16326	20173158549	2021	9	1	otro_obra_soc	4567.45	2023-06-25 00:27:33.444262	2023-06-25 00:27:33.444262	
2227	16326	20173158549	2021	9	1	otro_seg_soc	8184.26	2023-06-25 00:27:33.444714	2023-06-25 00:27:33.444714	
2228	16326	20173158549	2021	9	1	otro_sindicato	606.38	2023-06-25 00:27:33.445151	2023-06-25 00:27:33.445151	
2229	16326	20173158549	2021	9	1	otro_gan_brut	39322.63	2023-06-25 00:27:33.445647	2023-06-25 00:27:33.445647	
2230	16326	20173158549	2021	10	1	otro_obra_soc	4797.79	2023-06-25 00:27:33.446369	2023-06-25 00:27:33.446369	
2231	16326	20173158549	2021	10	1	otro_seg_soc	9412.21	2023-06-25 00:27:33.446805	2023-06-25 00:27:33.446805	
2232	16326	20173158549	2021	10	1	otro_sindicato	1067.78	2023-06-25 00:27:33.447234	2023-06-25 00:27:33.447234	
2233	16326	20173158549	2021	10	1	otro_gan_brut	45369.69	2023-06-25 00:27:33.447645	2023-06-25 00:27:33.447645	
2234	16326	20173158549	2021	11	1	otro_gan_brut	39704.85	2023-06-25 00:27:33.448254	2023-06-25 00:27:33.448254	
2235	16326	20173158549	2021	11	1	otro_obra_soc	4797.79	2023-06-25 00:27:33.44869	2023-06-25 00:27:33.44869	
2236	16326	20173158549	2021	11	1	otro_seg_soc	8338.35	2023-06-25 00:27:33.449135	2023-06-25 00:27:33.449135	
2237	16326	20173158549	2021	11	1	otro_sindicato	606.38	2023-06-25 00:27:33.449631	2023-06-25 00:27:33.449631	
2238	16326	20173158549	2021	12	1	otro_seg_soc	13158.29	2023-06-25 00:27:33.45045	2023-06-25 00:27:33.45045	
2239	16326	20173158549	2021	12	1	otro_sindicato	1491.54	2023-06-25 00:27:33.450986	2023-06-25 00:27:33.450986	
2240	16326	20173158549	2021	12	1	otro_obra_soc	7421.27	2023-06-25 00:27:33.451417	2023-06-25 00:27:33.451417	
2241	16326	20173158549	2021	12	1	otro_sac	18008.80	2023-06-25 00:27:33.451829	2023-06-25 00:27:33.451829	
2242	16326	20173158549	2021	12	1	otro_gan_brut	66618.95	2023-06-25 00:27:33.452671	2023-06-25 00:27:33.452671	
2243	19326	20173160144	2022	1	4	ded_domestica	4767.08	2023-06-25 00:27:33.458076	2023-06-25 00:27:33.458076	
2244	19326	20173160144	2022	2	4	ded_domestica	5836.16	2023-06-25 00:27:33.459234	2023-06-25 00:27:33.459234	
2245	19326	20173160144	2022	3	4	ded_domestica	3336.00	2023-06-25 00:27:33.459871	2023-06-25 00:27:33.459871	
2246	19326	20173160144	2022	4	4	ded_domestica	3672.60	2023-06-25 00:27:33.460372	2023-06-25 00:27:33.460372	
2247	42168	20173919914	2021	3	12	ded_gastos_medicos	680.00	2023-06-25 00:27:33.466373	2023-06-25 00:27:33.466373	
2248	42168	20173919914	2021	1	12	ded_gastos_medicos	1440.00	2023-06-25 00:27:33.467244	2023-06-25 00:27:33.467244	
2249	42168	20173919914	2021	8	12	ded_gastos_medicos	1120.00	2023-06-25 00:27:33.467729	2023-06-25 00:27:33.467729	
2250	42168	20173919914	2021	1	12	fam_hijos_100	100.00	2023-06-25 00:27:33.468845	2023-06-25 00:27:33.468845	
2251	42168	20173919914	2021	2	12	fam_hijos_100	100.00	2023-06-25 00:27:33.469104	2023-06-25 00:27:33.469104	
2252	42168	20173919914	2021	3	12	fam_hijos_100	100.00	2023-06-25 00:27:33.469803	2023-06-25 00:27:33.469803	
2253	42168	20173919914	2021	4	12	fam_hijos_100	100.00	2023-06-25 00:27:33.470151	2023-06-25 00:27:33.470151	
2254	42168	20173919914	2021	5	12	fam_hijos_100	100.00	2023-06-25 00:27:33.470404	2023-06-25 00:27:33.470404	
2255	42168	20173919914	2021	6	12	fam_hijos_100	100.00	2023-06-25 00:27:33.470638	2023-06-25 00:27:33.470638	
2256	42168	20173919914	2021	7	12	fam_hijos_100	100.00	2023-06-25 00:27:33.47085	2023-06-25 00:27:33.47085	
2257	42168	20173919914	2021	8	12	fam_hijos_100	100.00	2023-06-25 00:27:33.471058	2023-06-25 00:27:33.471058	
2258	42168	20173919914	2021	9	12	fam_hijos_100	100.00	2023-06-25 00:27:33.471261	2023-06-25 00:27:33.471261	
2259	42168	20173919914	2021	10	12	fam_hijos_100	100.00	2023-06-25 00:27:33.471459	2023-06-25 00:27:33.471459	
2260	42168	20173919914	2021	11	12	fam_hijos_100	100.00	2023-06-25 00:27:33.471662	2023-06-25 00:27:33.471662	
2261	42168	20173919914	2021	12	12	fam_hijos_100	100.00	2023-06-25 00:27:33.471868	2023-06-25 00:27:33.471868	
2262	42168	20173919914	2021	1	12	otro_sindicato	3748.46	2023-06-25 00:27:33.472761	2023-06-25 00:27:33.472761	
2263	42168	20173919914	2021	1	12	otro_obra_soc	6747.43	2023-06-25 00:27:33.473251	2023-06-25 00:27:33.473251	
2264	42168	20173919914	2021	1	12	otro_ret_gan	33238.71	2023-06-25 00:27:33.473679	2023-06-25 00:27:33.473679	
2265	42168	20173919914	2021	1	12	otro_seg_soc	29987.69	2023-06-25 00:27:33.474096	2023-06-25 00:27:33.474096	
2266	42168	20173919914	2021	1	12	otro_gan_brut	187423.11	2023-06-25 00:27:33.474537	2023-06-25 00:27:33.474537	
2267	42168	20173919914	2021	2	12	otro_sindicato	3909.20	2023-06-25 00:27:33.47523	2023-06-25 00:27:33.47523	
2268	42168	20173919914	2021	2	12	otro_gan_brut	195460.17	2023-06-25 00:27:33.475767	2023-06-25 00:27:33.475767	
2269	42168	20173919914	2021	2	12	otro_obra_soc	7015.34	2023-06-25 00:27:33.476231	2023-06-25 00:27:33.476231	
2270	42168	20173919914	2021	2	12	otro_seg_soc	31273.63	2023-06-25 00:27:33.476692	2023-06-25 00:27:33.476692	
2271	42168	20173919914	2021	3	12	otro_sindicato	4069.94	2023-06-25 00:27:33.477332	2023-06-25 00:27:33.477332	
2272	42168	20173919914	2021	3	12	otro_gan_brut	203497.23	2023-06-25 00:27:33.477741	2023-06-25 00:27:33.477741	
2273	42168	20173919914	2021	3	12	otro_obra_soc	7283.24	2023-06-25 00:27:33.478149	2023-06-25 00:27:33.478149	
2274	42168	20173919914	2021	3	12	otro_seg_soc	32559.56	2023-06-25 00:27:33.478525	2023-06-25 00:27:33.478525	
2275	42168	20173919914	2021	4	12	otro_sindicato	4069.94	2023-06-25 00:27:33.479112	2023-06-25 00:27:33.479112	
2276	42168	20173919914	2021	4	12	otro_seg_soc	32559.56	2023-06-25 00:27:33.479539	2023-06-25 00:27:33.479539	
2277	42168	20173919914	2021	4	12	otro_gan_brut	203497.23	2023-06-25 00:27:33.479937	2023-06-25 00:27:33.479937	
2278	42168	20173919914	2021	4	12	otro_obra_soc	7283.24	2023-06-25 00:27:33.48035	2023-06-25 00:27:33.48035	
2279	42168	20173919914	2021	5	12	otro_sindicato	5023.55	2023-06-25 00:27:33.48094	2023-06-25 00:27:33.48094	
2280	42168	20173919914	2021	5	12	otro_gan_brut	251177.70	2023-06-25 00:27:33.481424	2023-06-25 00:27:33.481424	
2281	42168	20173919914	2021	5	12	otro_obra_soc	8872.59	2023-06-25 00:27:33.481859	2023-06-25 00:27:33.481859	
2282	42168	20173919914	2021	5	12	otro_seg_soc	39408.25	2023-06-25 00:27:33.482315	2023-06-25 00:27:33.482315	
2283	42168	20173919914	2021	6	12	otro_obra_soc	15053.71	2023-06-25 00:27:33.482982	2023-06-25 00:27:33.482982	
2284	42168	20173919914	2021	6	12	otro_seg_soc	66361.36	2023-06-25 00:27:33.483432	2023-06-25 00:27:33.483432	
2285	42168	20173919914	2021	6	12	otro_gan_brut	282054.11	2023-06-25 00:27:33.483866	2023-06-25 00:27:33.483866	
2286	42168	20173919914	2021	6	12	otro_sac	141027.06	2023-06-25 00:27:33.484244	2023-06-25 00:27:33.484244	
2287	42168	20173919914	2021	6	12	otro_sindicato	8461.62	2023-06-25 00:27:33.484622	2023-06-25 00:27:33.484622	
2288	42168	20173919914	2021	7	12	otro_gan_brut	363755.32	2023-06-25 00:27:33.485293	2023-06-25 00:27:33.485293	
2289	42168	20173919914	2021	7	12	otro_obra_soc	12625.18	2023-06-25 00:27:33.485737	2023-06-25 00:27:33.485737	
2290	42168	20173919914	2021	7	12	otro_seg_soc	54862.07	2023-06-25 00:27:33.486208	2023-06-25 00:27:33.486208	
2291	42168	20173919914	2021	7	12	otro_sindicato	7275.11	2023-06-25 00:27:33.486645	2023-06-25 00:27:33.486645	
2292	42168	20173919914	2021	8	12	otro_sindicato	7530.37	2023-06-25 00:27:33.4873	2023-06-25 00:27:33.4873	
2293	42168	20173919914	2021	8	12	otro_seg_soc	56521.31	2023-06-25 00:27:33.487749	2023-06-25 00:27:33.487749	
2294	42168	20173919914	2021	8	12	otro_gan_brut	376518.69	2023-06-25 00:27:33.488427	2023-06-25 00:27:33.488427	
2295	42168	20173919914	2021	8	12	otro_obra_soc	13050.62	2023-06-25 00:27:33.489555	2023-06-25 00:27:33.489555	
2296	42168	20173919914	2021	9	12	otro_sindicato	7913.27	2023-06-25 00:27:33.490831	2023-06-25 00:27:33.490831	
2297	42168	20173919914	2021	9	12	otro_seg_soc	59948.56	2023-06-25 00:27:33.491485	2023-06-25 00:27:33.491485	
2298	42168	20173919914	2021	9	12	otro_gan_brut	395663.73	2023-06-25 00:27:33.492146	2023-06-25 00:27:33.492146	
2299	42168	20173919914	2021	9	12	otro_obra_soc	13688.79	2023-06-25 00:27:33.492802	2023-06-25 00:27:33.492802	
2300	42168	20173919914	2021	10	12	otro_gan_brut	417999.64	2023-06-25 00:27:33.493977	2023-06-25 00:27:33.493977	
2301	42168	20173919914	2021	10	12	otro_obra_soc	14433.32	2023-06-25 00:27:33.494478	2023-06-25 00:27:33.494478	
2302	42168	20173919914	2021	10	12	otro_seg_soc	62852.23	2023-06-25 00:27:33.494918	2023-06-25 00:27:33.494918	
2303	42168	20173919914	2021	10	12	otro_sindicato	8359.99	2023-06-25 00:27:33.495366	2023-06-25 00:27:33.495366	
2304	42168	20173919914	2021	11	12	otro_sindicato	8359.99	2023-06-25 00:27:33.496953	2023-06-25 00:27:33.496953	
2305	42168	20173919914	2021	11	12	otro_seg_soc	62852.23	2023-06-25 00:27:33.497953	2023-06-25 00:27:33.497953	
2306	42168	20173919914	2021	11	12	otro_gan_brut	417999.64	2023-06-25 00:27:33.498596	2023-06-25 00:27:33.498596	
2307	42168	20173919914	2021	11	12	otro_obra_soc	14433.32	2023-06-25 00:27:33.499119	2023-06-25 00:27:33.499119	
2308	42168	20173919914	2021	12	12	otro_gan_brut	301749.91	2023-06-25 00:27:33.499939	2023-06-25 00:27:33.499939	
2309	42168	20173919914	2021	12	12	otro_obra_soc	18592.99	2023-06-25 00:27:33.500505	2023-06-25 00:27:33.500505	
2310	42168	20173919914	2021	12	12	otro_seg_soc	80712.13	2023-06-25 00:27:33.501008	2023-06-25 00:27:33.501008	
2311	42168	20173919914	2021	12	12	otro_sac	208999.82	2023-06-25 00:27:33.501596	2023-06-25 00:27:33.501596	
2312	42168	20173919914	2021	12	12	otro_sindicato	10215.00	2023-06-25 00:27:33.502125	2023-06-25 00:27:33.502125	
2313	42168	20173919914	2022	1	3	fam_hijos_100	100.00	2023-06-25 00:27:33.506011	2023-06-25 00:27:33.506011	
2314	42168	20173919914	2022	2	3	fam_hijos_100	100.00	2023-06-25 00:27:33.506234	2023-06-25 00:27:33.506234	
2315	42168	20173919914	2022	3	3	fam_hijos_100	100.00	2023-06-25 00:27:33.506453	2023-06-25 00:27:33.506453	
2316	42168	20173919914	2022	4	3	fam_hijos_100	100.00	2023-06-25 00:27:33.506641	2023-06-25 00:27:33.506641	
2317	42168	20173919914	2022	5	3	fam_hijos_100	100.00	2023-06-25 00:27:33.506823	2023-06-25 00:27:33.506823	
2318	42168	20173919914	2022	6	3	fam_hijos_100	100.00	2023-06-25 00:27:33.507004	2023-06-25 00:27:33.507004	
2319	42168	20173919914	2022	7	3	fam_hijos_100	100.00	2023-06-25 00:27:33.507186	2023-06-25 00:27:33.507186	
2320	42168	20173919914	2022	8	3	fam_hijos_100	100.00	2023-06-25 00:27:33.50736	2023-06-25 00:27:33.50736	
2321	42168	20173919914	2022	9	3	fam_hijos_100	100.00	2023-06-25 00:27:33.507535	2023-06-25 00:27:33.507535	
2322	42168	20173919914	2022	10	3	fam_hijos_100	100.00	2023-06-25 00:27:33.507717	2023-06-25 00:27:33.507717	
2323	42168	20173919914	2022	11	3	fam_hijos_100	100.00	2023-06-25 00:27:33.507895	2023-06-25 00:27:33.507895	
2324	42168	20173919914	2022	12	3	fam_hijos_100	100.00	2023-06-25 00:27:33.508067	2023-06-25 00:27:33.508067	
2325	42168	20173919914	2022	1	3	otro_obra_soc	2207.30	2023-06-25 00:27:33.508817	2023-06-25 00:27:33.508817	
2326	42168	20173919914	2022	1	3	otro_seg_soc	8195.03	2023-06-25 00:27:33.509455	2023-06-25 00:27:33.509455	
2327	42168	20173919914	2022	1	3	otro_gan_brut	51218.95	2023-06-25 00:27:33.51026	2023-06-25 00:27:33.51026	
2328	42168	20173919914	2022	1	3	otro_sindicato	1024.38	2023-06-25 00:27:33.510695	2023-06-25 00:27:33.510695	
2329	42168	20173919914	2022	2	3	otro_obra_soc	17808.19	2023-06-25 00:27:33.511416	2023-06-25 00:27:33.511416	
2330	42168	20173919914	2022	2	3	otro_seg_soc	71764.44	2023-06-25 00:27:33.511818	2023-06-25 00:27:33.511818	
2331	42168	20173919914	2022	2	3	otro_gan_brut	478625.60	2023-06-25 00:27:33.512221	2023-06-25 00:27:33.512221	
2332	42168	20173919914	2022	3	3	otro_gan_brut	551663.93	2023-06-25 00:27:33.512905	2023-06-25 00:27:33.512905	
2333	42168	20173919914	2022	3	3	otro_obra_soc	18888.80	2023-06-25 00:27:33.513326	2023-06-25 00:27:33.513326	
2334	42168	20173919914	2022	3	3	otro_seg_soc	82431.32	2023-06-25 00:27:33.51374	2023-06-25 00:27:33.51374	
2335	15392	20183568958	2022	1	1	ded_retiro	2400.00	2023-06-25 00:27:33.517395	2023-06-25 00:27:33.517395	
2336	15392	20183568958	2022	2	1	ded_retiro	2400.00	2023-06-25 00:27:33.517616	2023-06-25 00:27:33.517616	
2337	33424	20214556430	2022	1	3	ded_cuota_medica	27470.91	2023-06-25 00:27:33.52612	2023-06-25 00:27:33.52612	
2338	33424	20214556430	2022	2	3	ded_cuota_medica	28743.91	2023-06-25 00:27:33.526517	2023-06-25 00:27:33.526517	
2339	33424	20214556430	2022	1	3	fam_hijos_100	100.00	2023-06-25 00:27:33.526978	2023-06-25 00:27:33.526978	
2340	33424	20214556430	2022	2	3	fam_hijos_100	100.00	2023-06-25 00:27:33.527236	2023-06-25 00:27:33.527236	
2341	33424	20214556430	2022	3	3	fam_hijos_100	100.00	2023-06-25 00:27:33.527445	2023-06-25 00:27:33.527445	
2342	33424	20214556430	2022	4	3	fam_hijos_100	100.00	2023-06-25 00:27:33.527649	2023-06-25 00:27:33.527649	
2343	33424	20214556430	2022	5	3	fam_hijos_100	100.00	2023-06-25 00:27:33.527854	2023-06-25 00:27:33.527854	
2344	33424	20214556430	2022	6	3	fam_hijos_100	100.00	2023-06-25 00:27:33.528118	2023-06-25 00:27:33.528118	
2345	33424	20214556430	2022	7	3	fam_hijos_100	100.00	2023-06-25 00:27:33.528333	2023-06-25 00:27:33.528333	
2346	33424	20214556430	2022	8	3	fam_hijos_100	100.00	2023-06-25 00:27:33.528581	2023-06-25 00:27:33.528581	
2347	33424	20214556430	2022	9	3	fam_hijos_100	100.00	2023-06-25 00:27:33.528812	2023-06-25 00:27:33.528812	
2348	33424	20214556430	2022	10	3	fam_hijos_100	100.00	2023-06-25 00:27:33.529025	2023-06-25 00:27:33.529025	
2349	33424	20214556430	2022	11	3	fam_hijos_100	100.00	2023-06-25 00:27:33.529662	2023-06-25 00:27:33.529662	
2350	33424	20214556430	2022	12	3	fam_hijos_100	100.00	2023-06-25 00:27:33.530061	2023-06-25 00:27:33.530061	
2351	33424	20214556430	2022	1	3	fam_hijos_100	100.00	2023-06-25 00:27:33.530725	2023-06-25 00:27:33.530725	
2352	33424	20214556430	2022	2	3	fam_hijos_100	100.00	2023-06-25 00:27:33.531072	2023-06-25 00:27:33.531072	
2353	33424	20214556430	2022	3	3	fam_hijos_100	100.00	2023-06-25 00:27:33.53134	2023-06-25 00:27:33.53134	
2354	33424	20214556430	2022	4	3	fam_hijos_100	100.00	2023-06-25 00:27:33.531627	2023-06-25 00:27:33.531627	
2355	33424	20214556430	2022	5	3	fam_hijos_100	100.00	2023-06-25 00:27:33.53193	2023-06-25 00:27:33.53193	
2356	33424	20214556430	2022	6	3	fam_hijos_100	100.00	2023-06-25 00:27:33.532195	2023-06-25 00:27:33.532195	
2357	33424	20214556430	2022	7	3	fam_hijos_100	100.00	2023-06-25 00:27:33.53247	2023-06-25 00:27:33.53247	
2358	33424	20214556430	2022	8	3	fam_hijos_100	100.00	2023-06-25 00:27:33.532707	2023-06-25 00:27:33.532707	
2359	33424	20214556430	2022	9	3	fam_hijos_100	100.00	2023-06-25 00:27:33.532971	2023-06-25 00:27:33.532971	
2360	33424	20214556430	2022	10	3	fam_hijos_100	100.00	2023-06-25 00:27:33.533232	2023-06-25 00:27:33.533232	
2361	33424	20214556430	2022	11	3	fam_hijos_100	100.00	2023-06-25 00:27:33.533536	2023-06-25 00:27:33.533536	
2362	33424	20214556430	2022	12	3	fam_hijos_100	100.00	2023-06-25 00:27:33.533781	2023-06-25 00:27:33.533781	
2363	19652	20230085723	2022	1	2	FECDEVDESDE	100.00	2023-06-25 00:27:33.538359	2023-06-25 00:27:33.538359	
2364	19652	20230085723	2022	2	2	FECDEVDESDE	100.00	2023-06-25 00:27:33.538608	2023-06-25 00:27:33.538608	
2365	19652	20230085723	2022	3	2	FECDEVDESDE	100.00	2023-06-25 00:27:33.538866	2023-06-25 00:27:33.538866	
2366	19652	20230085723	2022	4	2	FECDEVDESDE	100.00	2023-06-25 00:27:33.539114	2023-06-25 00:27:33.539114	
2367	19652	20230085723	2022	5	2	FECDEVDESDE	100.00	2023-06-25 00:27:33.539325	2023-06-25 00:27:33.539325	
2368	19652	20230085723	2022	6	2	FECDEVDESDE	100.00	2023-06-25 00:27:33.539553	2023-06-25 00:27:33.539553	
2369	19652	20230085723	2022	7	2	FECDEVDESDE	100.00	2023-06-25 00:27:33.539751	2023-06-25 00:27:33.539751	
2370	19652	20230085723	2022	8	2	FECDEVDESDE	100.00	2023-06-25 00:27:33.539948	2023-06-25 00:27:33.539948	
2371	19652	20230085723	2022	9	2	FECDEVDESDE	100.00	2023-06-25 00:27:33.540145	2023-06-25 00:27:33.540145	
2372	19652	20230085723	2022	10	2	FECDEVDESDE	100.00	2023-06-25 00:27:33.54037	2023-06-25 00:27:33.54037	
2373	19652	20230085723	2022	11	2	FECDEVDESDE	100.00	2023-06-25 00:27:33.540558	2023-06-25 00:27:33.540558	
2374	19652	20230085723	2022	12	2	FECDEVDESDE	100.00	2023-06-25 00:27:33.540751	2023-06-25 00:27:33.540751	
2375	19652	20230085723	2022	1	2	fam_hijos_100	100.00	2023-06-25 00:27:33.541044	2023-06-25 00:27:33.541044	
2376	19652	20230085723	2022	2	2	fam_hijos_100	100.00	2023-06-25 00:27:33.541238	2023-06-25 00:27:33.541238	
2377	19652	20230085723	2022	3	2	fam_hijos_100	100.00	2023-06-25 00:27:33.542124	2023-06-25 00:27:33.542124	
2378	19652	20230085723	2022	4	2	fam_hijos_100	100.00	2023-06-25 00:27:33.542356	2023-06-25 00:27:33.542356	
2379	19652	20230085723	2022	5	2	fam_hijos_100	100.00	2023-06-25 00:27:33.542619	2023-06-25 00:27:33.542619	
2380	19652	20230085723	2022	6	2	fam_hijos_100	100.00	2023-06-25 00:27:33.542845	2023-06-25 00:27:33.542845	
2381	19652	20230085723	2022	7	2	fam_hijos_100	100.00	2023-06-25 00:27:33.543061	2023-06-25 00:27:33.543061	
2382	19652	20230085723	2022	8	2	fam_hijos_100	100.00	2023-06-25 00:27:33.543251	2023-06-25 00:27:33.543251	
2383	19652	20230085723	2022	9	2	fam_hijos_100	100.00	2023-06-25 00:27:33.543435	2023-06-25 00:27:33.543435	
2384	19652	20230085723	2022	10	2	fam_hijos_100	100.00	2023-06-25 00:27:33.543616	2023-06-25 00:27:33.543616	
2385	19652	20230085723	2022	11	2	fam_hijos_100	100.00	2023-06-25 00:27:33.543788	2023-06-25 00:27:33.543788	
2386	19652	20230085723	2022	12	2	fam_hijos_100	100.00	2023-06-25 00:27:33.54398	2023-06-25 00:27:33.54398	
2387	19652	20230085723	2022	1	2	otro_obra_soc	3995.10	2023-06-25 00:27:33.544939	2023-06-25 00:27:33.544939	
2388	19652	20230085723	2022	1	2	otro_gan_brut	74076.06	2023-06-25 00:27:33.545386	2023-06-25 00:27:33.545386	
2389	19652	20230085723	2022	1	2	otro_seg_soc	11852.17	2023-06-25 00:27:33.545962	2023-06-25 00:27:33.545962	
2390	19652	20230085723	2022	2	2	otro_seg_soc	11857.18	2023-06-25 00:27:33.546747	2023-06-25 00:27:33.546747	
2391	19652	20230085723	2022	2	2	otro_gan_brut	74107.38	2023-06-25 00:27:33.547278	2023-06-25 00:27:33.547278	
2392	19652	20230085723	2022	2	2	otro_obra_soc	3711.29	2023-06-25 00:27:33.547773	2023-06-25 00:27:33.547773	
2393	36104	20233149099	2021	1	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.553925	2023-06-25 00:27:33.553925	
2394	36104	20233149099	2021	2	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.554585	2023-06-25 00:27:33.554585	
2395	36104	20233149099	2021	3	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.555018	2023-06-25 00:27:33.555018	
2396	36104	20233149099	2021	4	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.555416	2023-06-25 00:27:33.555416	
2397	36104	20233149099	2021	5	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.555789	2023-06-25 00:27:33.555789	
2398	36104	20233149099	2021	6	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.556176	2023-06-25 00:27:33.556176	
2399	36104	20233149099	2021	7	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.556477	2023-06-25 00:27:33.556477	
2400	36104	20233149099	2021	8	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.55678	2023-06-25 00:27:33.55678	
2401	36104	20233149099	2021	9	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.557114	2023-06-25 00:27:33.557114	
2402	36104	20233149099	2021	10	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.557479	2023-06-25 00:27:33.557479	
2403	36104	20233149099	2021	11	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.557816	2023-06-25 00:27:33.557816	
2404	36104	20233149099	2021	12	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.558098	2023-06-25 00:27:33.558098	
2405	36104	20233149099	2021	1	1	fam_hijos_100	100.00	2023-06-25 00:27:33.558675	2023-06-25 00:27:33.558675	
2406	36104	20233149099	2021	2	1	fam_hijos_100	100.00	2023-06-25 00:27:33.559004	2023-06-25 00:27:33.559004	
2407	36104	20233149099	2021	3	1	fam_hijos_100	100.00	2023-06-25 00:27:33.559355	2023-06-25 00:27:33.559355	
2408	36104	20233149099	2021	4	1	fam_hijos_100	100.00	2023-06-25 00:27:33.559711	2023-06-25 00:27:33.559711	
2409	36104	20233149099	2021	5	1	fam_hijos_100	100.00	2023-06-25 00:27:33.560056	2023-06-25 00:27:33.560056	
2410	36104	20233149099	2021	6	1	fam_hijos_100	100.00	2023-06-25 00:27:33.560326	2023-06-25 00:27:33.560326	
2411	36104	20233149099	2021	7	1	fam_hijos_100	100.00	2023-06-25 00:27:33.560532	2023-06-25 00:27:33.560532	
2412	36104	20233149099	2021	8	1	fam_hijos_100	100.00	2023-06-25 00:27:33.560755	2023-06-25 00:27:33.560755	
2413	36104	20233149099	2021	9	1	fam_hijos_100	100.00	2023-06-25 00:27:33.560966	2023-06-25 00:27:33.560966	
2414	36104	20233149099	2021	10	1	fam_hijos_100	100.00	2023-06-25 00:27:33.561214	2023-06-25 00:27:33.561214	
2415	36104	20233149099	2021	11	1	fam_hijos_100	100.00	2023-06-25 00:27:33.561422	2023-06-25 00:27:33.561422	
2416	36104	20233149099	2021	12	1	fam_hijos_100	100.00	2023-06-25 00:27:33.56165	2023-06-25 00:27:33.56165	
2417	36104	20233149099	2021	1	1	fam_hijos_100	100.00	2023-06-25 00:27:33.562069	2023-06-25 00:27:33.562069	
2418	36104	20233149099	2021	2	1	fam_hijos_100	100.00	2023-06-25 00:27:33.56226	2023-06-25 00:27:33.56226	
2419	36104	20233149099	2021	3	1	fam_hijos_100	100.00	2023-06-25 00:27:33.562488	2023-06-25 00:27:33.562488	
2420	36104	20233149099	2021	4	1	fam_hijos_100	100.00	2023-06-25 00:27:33.563133	2023-06-25 00:27:33.563133	
2421	36104	20233149099	2021	5	1	fam_hijos_100	100.00	2023-06-25 00:27:33.563939	2023-06-25 00:27:33.563939	
2422	36104	20233149099	2021	6	1	fam_hijos_100	100.00	2023-06-25 00:27:33.564358	2023-06-25 00:27:33.564358	
2423	36104	20233149099	2021	7	1	fam_hijos_100	100.00	2023-06-25 00:27:33.564956	2023-06-25 00:27:33.564956	
2424	36104	20233149099	2021	8	1	fam_hijos_100	100.00	2023-06-25 00:27:33.565323	2023-06-25 00:27:33.565323	
2425	36104	20233149099	2021	9	1	fam_hijos_100	100.00	2023-06-25 00:27:33.565615	2023-06-25 00:27:33.565615	
2426	36104	20233149099	2021	10	1	fam_hijos_100	100.00	2023-06-25 00:27:33.56589	2023-06-25 00:27:33.56589	
2427	36104	20233149099	2021	11	1	fam_hijos_100	100.00	2023-06-25 00:27:33.566167	2023-06-25 00:27:33.566167	
2428	36104	20233149099	2021	12	1	fam_hijos_100	100.00	2023-06-25 00:27:33.56644	2023-06-25 00:27:33.56644	
2429	36104	20233149099	2021	1	1	otro_gan_brut	3965.00	2023-06-25 00:27:33.567773	2023-06-25 00:27:33.567773	
2430	36104	20233149099	2021	1	1	otro_seg_soc	557.12	2023-06-25 00:27:33.568469	2023-06-25 00:27:33.568469	
2431	36104	20233149099	2021	1	1	otro_ex_nogan	484.00	2023-06-25 00:27:33.568995	2023-06-25 00:27:33.568995	
2432	36104	20233149099	2021	1	1	otro_obra_soc	167.14	2023-06-25 00:27:33.569454	2023-06-25 00:27:33.569454	
2433	36104	20233149099	2021	1	1	otro_sac	3481.98	2023-06-25 00:27:33.569886	2023-06-25 00:27:33.569886	
2434	36104	20233149099	2021	2	1	otro_ex_nogan	484.00	2023-06-25 00:27:33.570634	2023-06-25 00:27:33.570634	
2435	36104	20233149099	2021	2	1	otro_gan_brut	5000.00	2023-06-25 00:27:33.571079	2023-06-25 00:27:33.571079	
2436	36104	20233149099	2021	2	1	otro_seg_soc	867.00	2023-06-25 00:27:33.5715	2023-06-25 00:27:33.5715	
2437	36104	20233149099	2021	2	1	otro_obra_soc	260.00	2023-06-25 00:27:33.57194	2023-06-25 00:27:33.57194	
2438	36104	20233149099	2021	3	1	otro_ex_nogan	404.00	2023-06-25 00:27:33.572671	2023-06-25 00:27:33.572671	
2439	36104	20233149099	2021	3	1	otro_gan_brut	6650.00	2023-06-25 00:27:33.573116	2023-06-25 00:27:33.573116	
2440	36104	20233149099	2021	3	1	otro_seg_soc	1000.31	2023-06-25 00:27:33.57422	2023-06-25 00:27:33.57422	
2441	36104	20233149099	2021	3	1	otro_obra_soc	300.00	2023-06-25 00:27:33.574823	2023-06-25 00:27:33.574823	
2442	36104	20233149099	2021	3	1	otro_sac	828.79	2023-06-25 00:27:33.575258	2023-06-25 00:27:33.575258	
2443	36104	20233149099	2021	4	1	otro_ex_nogan	322.00	2023-06-25 00:27:33.576001	2023-06-25 00:27:33.576001	
2444	36104	20233149099	2021	4	1	otro_gan_brut	322.00	2023-06-25 00:27:33.576562	2023-06-25 00:27:33.576562	
2445	36104	20233149099	2021	5	1	otro_ex_nogan	322.00	2023-06-25 00:27:33.577343	2023-06-25 00:27:33.577343	
2446	36104	20233149099	2021	5	1	otro_gan_brut	322.00	2023-06-25 00:27:33.577933	2023-06-25 00:27:33.577933	
2447	36104	20233149099	2021	6	1	otro_ex_nogan	165.00	2023-06-25 00:27:33.578637	2023-06-25 00:27:33.578637	
2448	36104	20233149099	2021	6	1	otro_gan_brut	165.00	2023-06-25 00:27:33.579075	2023-06-25 00:27:33.579075	
2449	36104	20233149099	2021	7	1	otro_obra_soc	5948.00	2023-06-25 00:27:33.579721	2023-06-25 00:27:33.579721	
2450	36104	20233149099	2021	7	1	otro_sac	10638.00	2023-06-25 00:27:33.580152	2023-06-25 00:27:33.580152	
2451	36104	20233149099	2021	7	1	otro_gan_brut	127048.00	2023-06-25 00:27:33.580567	2023-06-25 00:27:33.580567	
2452	36104	20233149099	2021	7	1	otro_seg_soc	19826.94	2023-06-25 00:27:33.580999	2023-06-25 00:27:33.580999	
2453	36104	20233149099	2021	7	1	otro_ex_nogan	2420.00	2023-06-25 00:27:33.581413	2023-06-25 00:27:33.581413	
2454	36104	20233149099	2021	8	1	otro_ex_nogan	2420.00	2023-06-25 00:27:33.582074	2023-06-25 00:27:33.582074	
2455	36104	20233149099	2021	8	1	otro_gan_brut	51836.00	2023-06-25 00:27:33.582515	2023-06-25 00:27:33.582515	
2456	36104	20233149099	2021	8	1	otro_seg_soc	7793.07	2023-06-25 00:27:33.582939	2023-06-25 00:27:33.582939	
2457	36104	20233149099	2021	8	1	otro_obra_soc	2337.92	2023-06-25 00:27:33.583366	2023-06-25 00:27:33.583366	
2458	36104	20233149099	2021	9	1	otro_obra_soc	2337.92	2023-06-25 00:27:33.584058	2023-06-25 00:27:33.584058	
2459	36104	20233149099	2021	9	1	otro_ex_nogan	1181.86	2023-06-25 00:27:33.584476	2023-06-25 00:27:33.584476	
2460	36104	20233149099	2021	9	1	otro_gan_brut	50598.56	2023-06-25 00:27:33.584892	2023-06-25 00:27:33.584892	
2461	36104	20233149099	2021	9	1	otro_seg_soc	7793.07	2023-06-25 00:27:33.585376	2023-06-25 00:27:33.585376	
2462	36104	20233149099	2021	10	1	otro_ex_nogan	2830.00	2023-06-25 00:27:33.586002	2023-06-25 00:27:33.586002	
2463	36104	20233149099	2021	10	1	otro_gan_brut	53533.10	2023-06-25 00:27:33.586421	2023-06-25 00:27:33.586421	
2464	36104	20233149099	2021	10	1	otro_seg_soc	7952.50	2023-06-25 00:27:33.586826	2023-06-25 00:27:33.586826	
2465	36104	20233149099	2021	10	1	otro_obra_soc	2385.75	2023-06-25 00:27:33.587237	2023-06-25 00:27:33.587237	
2466	36104	20233149099	2021	11	1	otro_seg_soc	8261.00	2023-06-25 00:27:33.587857	2023-06-25 00:27:33.587857	
2467	36104	20233149099	2021	11	1	otro_ex_nogan	2830.00	2023-06-25 00:27:33.588306	2023-06-25 00:27:33.588306	
2468	36104	20233149099	2021	11	1	otro_gan_brut	55466.00	2023-06-25 00:27:33.588743	2023-06-25 00:27:33.588743	
2469	36104	20233149099	2021	11	1	otro_obra_soc	2478.50	2023-06-25 00:27:33.589176	2023-06-25 00:27:33.589176	
2470	36104	20233149099	2021	12	1	otro_obra_soc	2586.46	2023-06-25 00:27:33.589839	2023-06-25 00:27:33.589839	
2471	36104	20233149099	2021	12	1	otro_ex_nogan	2830.00	2023-06-25 00:27:33.590474	2023-06-25 00:27:33.590474	
2472	36104	20233149099	2021	12	1	otro_gan_brut	57714.00	2023-06-25 00:27:33.591035	2023-06-25 00:27:33.591035	
2473	36104	20233149099	2021	12	1	otro_seg_soc	8261.54	2023-06-25 00:27:33.59159	2023-06-25 00:27:33.59159	
2474	42480	20281965973	2022	1	1	ded_cuota_medica	0.01	2023-06-25 00:27:33.596893	2023-06-25 00:27:33.596893	
2475	42480	20281965973	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:33.597235	2023-06-25 00:27:33.597235	
2476	42480	20281965973	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:33.597429	2023-06-25 00:27:33.597429	
2477	42480	20281965973	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:33.597634	2023-06-25 00:27:33.597634	
2478	42480	20281965973	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:33.597825	2023-06-25 00:27:33.597825	
2479	42480	20281965973	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:33.598014	2023-06-25 00:27:33.598014	
2480	42480	20281965973	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:33.598205	2023-06-25 00:27:33.598205	
2481	42480	20281965973	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:33.598383	2023-06-25 00:27:33.598383	
2482	42480	20281965973	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:33.598587	2023-06-25 00:27:33.598587	
2483	42480	20281965973	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:33.598757	2023-06-25 00:27:33.598757	
2484	42480	20281965973	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:33.598926	2023-06-25 00:27:33.598926	
2485	42480	20281965973	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:33.599099	2023-06-25 00:27:33.599099	
2486	42480	20281965973	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:27:33.59927	2023-06-25 00:27:33.59927	
2487	42480	20281965973	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:33.599555	2023-06-25 00:27:33.599555	
2488	42480	20281965973	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:33.599734	2023-06-25 00:27:33.599734	
2489	42480	20281965973	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:33.5999	2023-06-25 00:27:33.5999	
2490	42480	20281965973	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:33.600068	2023-06-25 00:27:33.600068	
2491	42480	20281965973	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:33.600239	2023-06-25 00:27:33.600239	
2492	42480	20281965973	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:33.6004	2023-06-25 00:27:33.6004	
2493	42480	20281965973	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:33.600564	2023-06-25 00:27:33.600564	
2494	42480	20281965973	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:33.60073	2023-06-25 00:27:33.60073	
2495	42480	20281965973	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:33.600896	2023-06-25 00:27:33.600896	
2496	42480	20281965973	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:33.601094	2023-06-25 00:27:33.601094	
2497	42480	20281965973	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:33.601295	2023-06-25 00:27:33.601295	
2498	47457	20286436995	2022	1	1	ded_domestica	36393.36	2023-06-25 00:27:33.606122	2023-06-25 00:27:33.606122	
2499	47457	20286436995	2022	2	1	ded_domestica	36923.41	2023-06-25 00:27:33.606508	2023-06-25 00:27:33.606508	
2500	47457	20286436995	2022	1	1	fam_hijos_100	50.00	2023-06-25 00:27:33.606868	2023-06-25 00:27:33.606868	
2501	47457	20286436995	2022	2	1	fam_hijos_100	50.00	2023-06-25 00:27:33.607069	2023-06-25 00:27:33.607069	
2502	47457	20286436995	2022	3	1	fam_hijos_100	50.00	2023-06-25 00:27:33.607255	2023-06-25 00:27:33.607255	
2503	47457	20286436995	2022	4	1	fam_hijos_100	50.00	2023-06-25 00:27:33.607438	2023-06-25 00:27:33.607438	
2504	47457	20286436995	2022	5	1	fam_hijos_100	50.00	2023-06-25 00:27:33.607622	2023-06-25 00:27:33.607622	
2505	47457	20286436995	2022	6	1	fam_hijos_100	50.00	2023-06-25 00:27:33.607799	2023-06-25 00:27:33.607799	
2506	47457	20286436995	2022	7	1	fam_hijos_100	50.00	2023-06-25 00:27:33.607971	2023-06-25 00:27:33.607971	
2507	47457	20286436995	2022	8	1	fam_hijos_100	50.00	2023-06-25 00:27:33.608161	2023-06-25 00:27:33.608161	
2508	47457	20286436995	2022	9	1	fam_hijos_100	50.00	2023-06-25 00:27:33.608343	2023-06-25 00:27:33.608343	
2509	47457	20286436995	2022	10	1	fam_hijos_100	50.00	2023-06-25 00:27:33.608522	2023-06-25 00:27:33.608522	
2510	47457	20286436995	2022	11	1	fam_hijos_100	50.00	2023-06-25 00:27:33.608695	2023-06-25 00:27:33.608695	
2511	47457	20286436995	2022	12	1	fam_hijos_100	50.00	2023-06-25 00:27:33.608868	2023-06-25 00:27:33.608868	
2512	47457	20286436995	2022	1	1	fam_hijos_100	50.00	2023-06-25 00:27:33.609202	2023-06-25 00:27:33.609202	
2513	47457	20286436995	2022	2	1	fam_hijos_100	50.00	2023-06-25 00:27:33.609412	2023-06-25 00:27:33.609412	
2514	47457	20286436995	2022	3	1	fam_hijos_100	50.00	2023-06-25 00:27:33.609591	2023-06-25 00:27:33.609591	
2515	47457	20286436995	2022	4	1	fam_hijos_100	50.00	2023-06-25 00:27:33.609765	2023-06-25 00:27:33.609765	
2516	47457	20286436995	2022	5	1	fam_hijos_100	50.00	2023-06-25 00:27:33.60998	2023-06-25 00:27:33.60998	
2517	47457	20286436995	2022	6	1	fam_hijos_100	50.00	2023-06-25 00:27:33.610163	2023-06-25 00:27:33.610163	
2518	47457	20286436995	2022	7	1	fam_hijos_100	50.00	2023-06-25 00:27:33.610363	2023-06-25 00:27:33.610363	
2519	47457	20286436995	2022	8	1	fam_hijos_100	50.00	2023-06-25 00:27:33.610565	2023-06-25 00:27:33.610565	
2520	47457	20286436995	2022	9	1	fam_hijos_100	50.00	2023-06-25 00:27:33.610737	2023-06-25 00:27:33.610737	
2521	47457	20286436995	2022	10	1	fam_hijos_100	50.00	2023-06-25 00:27:33.610915	2023-06-25 00:27:33.610915	
2522	47457	20286436995	2022	11	1	fam_hijos_100	50.00	2023-06-25 00:27:33.611106	2023-06-25 00:27:33.611106	
2523	47457	20286436995	2022	12	1	fam_hijos_100	50.00	2023-06-25 00:27:33.611312	2023-06-25 00:27:33.611312	
2524	43095	20287462477	2021	1	3	ded_cuota_medica	2412.82	2023-06-25 00:27:33.616292	2023-06-25 00:27:33.616292	
2525	43095	20287462477	2021	11	3	ded_cuota_medica	317.31	2023-06-25 00:27:33.616729	2023-06-25 00:27:33.616729	
2526	43095	20287462477	2021	12	3	ded_cuota_medica	5436.04	2023-06-25 00:27:33.61715	2023-06-25 00:27:33.61715	
2527	43095	20287462477	2021	1	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.6178	2023-06-25 00:27:33.6178	
2528	43095	20287462477	2021	2	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.618188	2023-06-25 00:27:33.618188	
2529	43095	20287462477	2021	3	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.618456	2023-06-25 00:27:33.618456	
2530	43095	20287462477	2021	4	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.618727	2023-06-25 00:27:33.618727	
2531	43095	20287462477	2021	5	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.618954	2023-06-25 00:27:33.618954	
2532	43095	20287462477	2021	6	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.61963	2023-06-25 00:27:33.61963	
2533	43095	20287462477	2021	7	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.620187	2023-06-25 00:27:33.620187	
2534	43095	20287462477	2021	8	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.620528	2023-06-25 00:27:33.620528	
2535	43095	20287462477	2021	9	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.620926	2023-06-25 00:27:33.620926	
2536	43095	20287462477	2021	10	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.621808	2023-06-25 00:27:33.621808	
2537	43095	20287462477	2021	11	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.622355	2023-06-25 00:27:33.622355	
2538	43095	20287462477	2021	12	3	FECDEVDESDE	100.00	2023-06-25 00:27:33.623097	2023-06-25 00:27:33.623097	
2539	43095	20287462477	2021	1	3	fam_hijos_100	100.00	2023-06-25 00:27:33.623892	2023-06-25 00:27:33.623892	
2540	43095	20287462477	2021	2	3	fam_hijos_100	100.00	2023-06-25 00:27:33.624358	2023-06-25 00:27:33.624358	
2541	43095	20287462477	2021	3	3	fam_hijos_100	100.00	2023-06-25 00:27:33.624745	2023-06-25 00:27:33.624745	
2542	43095	20287462477	2021	4	3	fam_hijos_100	100.00	2023-06-25 00:27:33.625172	2023-06-25 00:27:33.625172	
2543	43095	20287462477	2021	5	3	fam_hijos_100	100.00	2023-06-25 00:27:33.62565	2023-06-25 00:27:33.62565	
2544	43095	20287462477	2021	6	3	fam_hijos_100	100.00	2023-06-25 00:27:33.626099	2023-06-25 00:27:33.626099	
2545	43095	20287462477	2021	7	3	fam_hijos_100	100.00	2023-06-25 00:27:33.626389	2023-06-25 00:27:33.626389	
2546	43095	20287462477	2021	8	3	fam_hijos_100	100.00	2023-06-25 00:27:33.626587	2023-06-25 00:27:33.626587	
2547	43095	20287462477	2021	9	3	fam_hijos_100	100.00	2023-06-25 00:27:33.62679	2023-06-25 00:27:33.62679	
2548	43095	20287462477	2021	10	3	fam_hijos_100	100.00	2023-06-25 00:27:33.626984	2023-06-25 00:27:33.626984	
2549	43095	20287462477	2021	11	3	fam_hijos_100	100.00	2023-06-25 00:27:33.627172	2023-06-25 00:27:33.627172	
2550	43095	20287462477	2021	12	3	fam_hijos_100	100.00	2023-06-25 00:27:33.627363	2023-06-25 00:27:33.627363	
2551	43095	20287462477	2022	1	1	ded_cuota_medica	5436.04	2023-06-25 00:27:33.632345	2023-06-25 00:27:33.632345	
2552	43095	20287462477	2022	2	1	ded_cuota_medica	4504.36	2023-06-25 00:27:33.632909	2023-06-25 00:27:33.632909	
2553	43095	20287462477	2022	1	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.63343	2023-06-25 00:27:33.63343	
2554	43095	20287462477	2022	2	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.633729	2023-06-25 00:27:33.633729	
2555	43095	20287462477	2022	3	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.633965	2023-06-25 00:27:33.633965	
2556	43095	20287462477	2022	4	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.634214	2023-06-25 00:27:33.634214	
2557	43095	20287462477	2022	5	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.634446	2023-06-25 00:27:33.634446	
2558	43095	20287462477	2022	6	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.634686	2023-06-25 00:27:33.634686	
2559	43095	20287462477	2022	7	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.635087	2023-06-25 00:27:33.635087	
2560	43095	20287462477	2022	8	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.635317	2023-06-25 00:27:33.635317	
2561	43095	20287462477	2022	9	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.635547	2023-06-25 00:27:33.635547	
2562	43095	20287462477	2022	10	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.635735	2023-06-25 00:27:33.635735	
2563	43095	20287462477	2022	11	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.635942	2023-06-25 00:27:33.635942	
2564	43095	20287462477	2022	12	1	FECDEVDESDE	100.00	2023-06-25 00:27:33.636132	2023-06-25 00:27:33.636132	
2565	43095	20287462477	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:33.636519	2023-06-25 00:27:33.636519	
2566	43095	20287462477	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:33.636698	2023-06-25 00:27:33.636698	
2567	43095	20287462477	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:33.636871	2023-06-25 00:27:33.636871	
2568	43095	20287462477	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:33.637072	2023-06-25 00:27:33.637072	
2569	43095	20287462477	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:33.637283	2023-06-25 00:27:33.637283	
2570	43095	20287462477	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:33.637529	2023-06-25 00:27:33.637529	
2571	43095	20287462477	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:33.637764	2023-06-25 00:27:33.637764	
2572	43095	20287462477	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:33.637981	2023-06-25 00:27:33.637981	
2573	43095	20287462477	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:33.638216	2023-06-25 00:27:33.638216	
2574	43095	20287462477	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:33.638416	2023-06-25 00:27:33.638416	
2575	43095	20287462477	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:33.63864	2023-06-25 00:27:33.63864	
2576	43095	20287462477	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:27:33.638857	2023-06-25 00:27:33.638857	
2577	44223	20307785197	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:33.643262	2023-06-25 00:27:33.643262	
2578	44223	20307785197	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:33.643487	2023-06-25 00:27:33.643487	
2579	44223	20307785197	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:33.64368	2023-06-25 00:27:33.64368	
2580	44223	20307785197	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:33.643875	2023-06-25 00:27:33.643875	
2581	44223	20307785197	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:33.644054	2023-06-25 00:27:33.644054	
2582	44223	20307785197	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:33.64423	2023-06-25 00:27:33.64423	
2583	44223	20307785197	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:33.644413	2023-06-25 00:27:33.644413	
2584	44223	20307785197	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:33.644589	2023-06-25 00:27:33.644589	
2585	44223	20307785197	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:33.644778	2023-06-25 00:27:33.644778	
2586	44223	20307785197	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:33.644998	2023-06-25 00:27:33.644998	
2587	44223	20307785197	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:33.645204	2023-06-25 00:27:33.645204	
2588	44223	20307785197	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:27:33.645402	2023-06-25 00:27:33.645402	
2589	44139	20323948918	2022	1	1	ded_cuota_medica	0.01	2023-06-25 00:27:33.649317	2023-06-25 00:27:33.649317	
2590	44139	20323948918	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:33.649756	2023-06-25 00:27:33.649756	
2591	44139	20323948918	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:33.65002	2023-06-25 00:27:33.65002	
2592	44139	20323948918	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:33.650244	2023-06-25 00:27:33.650244	
2593	44139	20323948918	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:33.650467	2023-06-25 00:27:33.650467	
2594	44139	20323948918	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:33.650691	2023-06-25 00:27:33.650691	
2595	44139	20323948918	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:33.650899	2023-06-25 00:27:33.650899	
2596	44139	20323948918	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:33.651494	2023-06-25 00:27:33.651494	
2597	44139	20323948918	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:33.652137	2023-06-25 00:27:33.652137	
2598	44139	20323948918	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:33.652486	2023-06-25 00:27:33.652486	
2599	44139	20323948918	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:33.652733	2023-06-25 00:27:33.652733	
2600	44139	20323948918	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:33.652982	2023-06-25 00:27:33.652982	
2601	44139	20323948918	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:27:33.654019	2023-06-25 00:27:33.654019	
2602	40082	20325658356	2021	2	3	ded_cuota_medica	197.00	2023-06-25 00:27:33.658779	2023-06-25 00:27:33.658779	
2603	40082	20325658356	2021	3	3	ded_cuota_medica	197.00	2023-06-25 00:27:33.659041	2023-06-25 00:27:33.659041	
2604	40082	20325658356	2021	4	3	ded_cuota_medica	650.00	2023-06-25 00:27:33.659415	2023-06-25 00:27:33.659415	
2605	40082	20325658356	2021	5	3	ded_cuota_medica	1252.00	2023-06-25 00:27:33.659898	2023-06-25 00:27:33.659898	
2606	40082	20325658356	2021	6	3	ded_cuota_medica	2021.00	2023-06-25 00:27:33.660359	2023-06-25 00:27:33.660359	
2607	40082	20325658356	2021	1	3	ded_domestica	18243.50	2023-06-25 00:27:33.660957	2023-06-25 00:27:33.660957	
2608	40082	20325658356	2021	2	3	ded_domestica	21445.10	2023-06-25 00:27:33.661382	2023-06-25 00:27:33.661382	
2609	40082	20325658356	2021	3	3	ded_domestica	23296.76	2023-06-25 00:27:33.661776	2023-06-25 00:27:33.661776	
2610	40082	20325658356	2021	4	3	ded_domestica	23300.09	2023-06-25 00:27:33.662116	2023-06-25 00:27:33.662116	
2611	40082	20325658356	2021	5	3	ded_domestica	23328.19	2023-06-25 00:27:33.662436	2023-06-25 00:27:33.662436	
2612	40082	20325658356	2021	6	3	ded_domestica	37660.56	2023-06-25 00:27:33.662916	2023-06-25 00:27:33.662916	
2613	40082	20325658356	2021	7	3	ded_domestica	26334.01	2023-06-25 00:27:33.663628	2023-06-25 00:27:33.663628	
2614	40082	20325658356	2021	8	3	ded_domestica	26334.01	2023-06-25 00:27:33.663892	2023-06-25 00:27:33.663892	
2615	40082	20325658356	2021	9	3	ded_domestica	29123.05	2023-06-25 00:27:33.664323	2023-06-25 00:27:33.664323	
2616	40082	20325658356	2021	10	3	ded_domestica	29123.05	2023-06-25 00:27:33.664612	2023-06-25 00:27:33.664612	
2617	40082	20325658356	2021	11	3	ded_domestica	30549.55	2023-06-25 00:27:33.665023	2023-06-25 00:27:33.665023	
2618	40082	20325658356	2021	12	3	ded_domestica	47054.05	2023-06-25 00:27:33.665533	2023-06-25 00:27:33.665533	
2619	40082	20325658356	2022	1	1	ded_cuota_medica	1500.00	2023-06-25 00:27:33.670077	2023-06-25 00:27:33.670077	
2620	40082	20325658356	2022	2	1	ded_cuota_medica	1500.00	2023-06-25 00:27:33.67032	2023-06-25 00:27:33.67032	
2621	40082	20325658356	2022	3	1	ded_cuota_medica	1500.00	2023-06-25 00:27:33.670557	2023-06-25 00:27:33.670557	
2622	40082	20325658356	2022	1	1	ded_domestica	32241.04	2023-06-25 00:27:33.671148	2023-06-25 00:27:33.671148	
2623	40082	20325658356	2022	2	1	ded_domestica	32265.92	2023-06-25 00:27:33.671561	2023-06-25 00:27:33.671561	
2624	40082	20325658356	2022	3	1	ded_domestica	34997.92	2023-06-25 00:27:33.671966	2023-06-25 00:27:33.671966	
2625	43910	20352712990	2021	10	3	ded_donaciones	30000.00	2023-06-25 00:27:33.676573	2023-06-25 00:27:33.676573	
2626	43910	20352712990	2021	11	3	ded_donaciones	25000.00	2023-06-25 00:27:33.676887	2023-06-25 00:27:33.676887	
2627	43910	20352712990	2021	11	3	ded_gastos_medicos	3240.00	2023-06-25 00:27:33.677341	2023-06-25 00:27:33.677341	
2628	43910	20352712990	2021	12	3	ded_gastos_medicos	2160.00	2023-06-25 00:27:33.677641	2023-06-25 00:27:33.677641	
2629	43910	20352712990	2022	1	2	ded_gastos_medicos	3240.00	2023-06-25 00:27:33.681474	2023-06-25 00:27:33.681474	
2630	43910	20352712990	2022	3	2	ded_gastos_medicos	2320.00	2023-06-25 00:27:33.681834	2023-06-25 00:27:33.681834	
2631	41544	20371039660	2022	4	5	ded_gastos_medicos	4000.00	2023-06-25 00:27:33.687898	2023-06-25 00:27:33.687898	
2632	41544	20371039660	2022	1	5	ded_domestica	24069.00	2023-06-25 00:27:33.689423	2023-06-25 00:27:33.689423	
2633	41544	20371039660	2022	2	5	ded_domestica	15360.00	2023-06-25 00:27:33.690117	2023-06-25 00:27:33.690117	
2634	41544	20371039660	2022	3	5	ded_domestica	16680.00	2023-06-25 00:27:33.690621	2023-06-25 00:27:33.690621	
2635	41544	20371039660	2022	4	5	ded_domestica	16680.00	2023-06-25 00:27:33.690898	2023-06-25 00:27:33.690898	
2636	17718	23145545374	2021	1	5	ded_cuota_medica	2050.03	2023-06-25 00:27:33.69669	2023-06-25 00:27:33.69669	
2637	17718	23145545374	2021	2	5	ded_cuota_medica	1656.00	2023-06-25 00:27:33.697042	2023-06-25 00:27:33.697042	
2638	17718	23145545374	2021	3	5	ded_cuota_medica	5957.00	2023-06-25 00:27:33.697955	2023-06-25 00:27:33.697955	
2639	17718	23145545374	2021	4	5	ded_cuota_medica	6009.00	2023-06-25 00:27:33.698347	2023-06-25 00:27:33.698347	
2640	17718	23145545374	2021	5	5	ded_cuota_medica	2311.00	2023-06-25 00:27:33.698642	2023-06-25 00:27:33.698642	
2641	17718	23145545374	2021	6	5	ded_cuota_medica	1940.00	2023-06-25 00:27:33.698941	2023-06-25 00:27:33.698941	
2642	17718	23145545374	2021	7	5	ded_cuota_medica	4283.00	2023-06-25 00:27:33.699223	2023-06-25 00:27:33.699223	
2643	19344	23221670094	2021	1	3	ded_cuota_medica	8543.10	2023-06-25 00:27:33.704816	2023-06-25 00:27:33.704816	
2644	19344	23221670094	2021	2	3	ded_cuota_medica	8469.05	2023-06-25 00:27:33.705256	2023-06-25 00:27:33.705256	
2645	19344	23221670094	2021	3	3	ded_cuota_medica	8625.90	2023-06-25 00:27:33.705621	2023-06-25 00:27:33.705621	
2646	19344	23221670094	2021	4	3	ded_cuota_medica	5145.67	2023-06-25 00:27:33.70595	2023-06-25 00:27:33.70595	
2647	19344	23221670094	2021	5	3	ded_cuota_medica	12765.63	2023-06-25 00:27:33.706277	2023-06-25 00:27:33.706277	
2648	19344	23221670094	2021	6	3	ded_cuota_medica	11668.51	2023-06-25 00:27:33.706593	2023-06-25 00:27:33.706593	
2649	19344	23221670094	2021	7	3	ded_cuota_medica	11668.51	2023-06-25 00:27:33.706774	2023-06-25 00:27:33.706774	
2650	19344	23221670094	2021	8	3	ded_cuota_medica	11239.57	2023-06-25 00:27:33.707065	2023-06-25 00:27:33.707065	
2651	19344	23221670094	2021	9	3	ded_cuota_medica	16414.33	2023-06-25 00:27:33.707387	2023-06-25 00:27:33.707387	
2652	19344	23221670094	2021	10	3	ded_cuota_medica	12982.96	2023-06-25 00:27:33.707676	2023-06-25 00:27:33.707676	
2653	19344	23221670094	2021	11	3	ded_cuota_medica	16121.86	2023-06-25 00:27:33.707966	2023-06-25 00:27:33.707966	
2654	19344	23221670094	2021	12	3	ded_cuota_medica	15976.90	2023-06-25 00:27:33.708252	2023-06-25 00:27:33.708252	
2655	43504	23233379379	2021	1	10	ded_cuota_medica	6067.62	2023-06-25 00:27:33.712967	2023-06-25 00:27:33.712967	
2656	43504	23233379379	2021	2	10	ded_cuota_medica	5587.24	2023-06-25 00:27:33.713333	2023-06-25 00:27:33.713333	
2657	43504	23233379379	2021	3	10	ded_cuota_medica	5940.57	2023-06-25 00:27:33.713658	2023-06-25 00:27:33.713658	
2658	43504	23233379379	2021	4	10	ded_cuota_medica	6093.03	2023-06-25 00:27:33.713976	2023-06-25 00:27:33.713976	
2659	43504	23233379379	2021	5	10	ded_cuota_medica	7193.08	2023-06-25 00:27:33.714341	2023-06-25 00:27:33.714341	
2660	43504	23233379379	2021	7	10	ded_cuota_medica	6040.06	2023-06-25 00:27:33.715218	2023-06-25 00:27:33.715218	
2661	43504	23233379379	2021	8	10	ded_cuota_medica	7676.16	2023-06-25 00:27:33.715937	2023-06-25 00:27:33.715937	
2662	43504	23233379379	2021	9	10	ded_cuota_medica	8485.88	2023-06-25 00:27:33.716933	2023-06-25 00:27:33.716933	
2663	43504	23233379379	2021	10	10	ded_cuota_medica	11141.03	2023-06-25 00:27:33.717568	2023-06-25 00:27:33.717568	
2664	43504	23233379379	2021	1	10	fam_hijos_100	100.00	2023-06-25 00:27:33.718158	2023-06-25 00:27:33.718158	
2665	43504	23233379379	2021	2	10	fam_hijos_100	100.00	2023-06-25 00:27:33.718506	2023-06-25 00:27:33.718506	
2666	43504	23233379379	2021	3	10	fam_hijos_100	100.00	2023-06-25 00:27:33.718822	2023-06-25 00:27:33.718822	
2667	43504	23233379379	2021	4	10	fam_hijos_100	100.00	2023-06-25 00:27:33.719199	2023-06-25 00:27:33.719199	
2668	43504	23233379379	2021	5	10	fam_hijos_100	100.00	2023-06-25 00:27:33.719806	2023-06-25 00:27:33.719806	
2669	43504	23233379379	2021	6	10	fam_hijos_100	100.00	2023-06-25 00:27:33.720506	2023-06-25 00:27:33.720506	
2670	43504	23233379379	2021	7	10	fam_hijos_100	100.00	2023-06-25 00:27:33.721057	2023-06-25 00:27:33.721057	
2671	43504	23233379379	2021	8	10	fam_hijos_100	100.00	2023-06-25 00:27:33.721732	2023-06-25 00:27:33.721732	
2672	43504	23233379379	2021	9	10	fam_hijos_100	100.00	2023-06-25 00:27:33.722174	2023-06-25 00:27:33.722174	
2673	43504	23233379379	2021	10	10	fam_hijos_100	100.00	2023-06-25 00:27:33.722638	2023-06-25 00:27:33.722638	
2674	43504	23233379379	2021	11	10	fam_hijos_100	100.00	2023-06-25 00:27:33.723079	2023-06-25 00:27:33.723079	
2675	43504	23233379379	2021	12	10	fam_hijos_100	100.00	2023-06-25 00:27:33.723528	2023-06-25 00:27:33.723528	
2676	43767	23270252974	2021	1	3	ded_cuota_medica	7500.00	2023-06-25 00:27:33.730225	2023-06-25 00:27:33.730225	
2677	43767	23270252974	2021	2	3	ded_cuota_medica	7500.00	2023-06-25 00:27:33.730453	2023-06-25 00:27:33.730453	
2678	43767	23270252974	2021	3	3	ded_cuota_medica	7500.00	2023-06-25 00:27:33.730659	2023-06-25 00:27:33.730659	
2679	43767	23270252974	2021	4	3	ded_cuota_medica	8200.00	2023-06-25 00:27:33.731048	2023-06-25 00:27:33.731048	
2680	43767	23270252974	2021	5	3	ded_cuota_medica	8270.00	2023-06-25 00:27:33.731473	2023-06-25 00:27:33.731473	
2681	43767	23270252974	2021	6	3	ded_cuota_medica	8630.00	2023-06-25 00:27:33.731812	2023-06-25 00:27:33.731812	
2682	43767	23270252974	2021	7	3	ded_cuota_medica	8710.00	2023-06-25 00:27:33.732168	2023-06-25 00:27:33.732168	
2683	43767	23270252974	2021	8	3	ded_cuota_medica	8710.00	2023-06-25 00:27:33.732348	2023-06-25 00:27:33.732348	
2684	43767	23270252974	2021	9	3	ded_cuota_medica	6657.11	2023-06-25 00:27:33.732814	2023-06-25 00:27:33.732814	
2685	43767	23270252974	2021	10	3	ded_cuota_medica	6657.11	2023-06-25 00:27:33.732999	2023-06-25 00:27:33.732999	
2686	43767	23270252974	2021	11	3	ded_cuota_medica	6657.11	2023-06-25 00:27:33.733178	2023-06-25 00:27:33.733178	
2687	43767	23270252974	2021	12	3	ded_cuota_medica	6657.11	2023-06-25 00:27:33.733393	2023-06-25 00:27:33.733393	
2688	43767	23270252974	2021	1	3	fam_hijos_100	100.00	2023-06-25 00:27:33.733777	2023-06-25 00:27:33.733777	
2689	43767	23270252974	2021	2	3	fam_hijos_100	100.00	2023-06-25 00:27:33.733963	2023-06-25 00:27:33.733963	
2690	43767	23270252974	2021	3	3	fam_hijos_100	100.00	2023-06-25 00:27:33.734155	2023-06-25 00:27:33.734155	
2691	43767	23270252974	2021	4	3	fam_hijos_100	100.00	2023-06-25 00:27:33.734331	2023-06-25 00:27:33.734331	
2692	43767	23270252974	2021	5	3	fam_hijos_100	100.00	2023-06-25 00:27:33.734507	2023-06-25 00:27:33.734507	
2693	43767	23270252974	2021	6	3	fam_hijos_100	100.00	2023-06-25 00:27:33.734691	2023-06-25 00:27:33.734691	
2694	43767	23270252974	2021	7	3	fam_hijos_100	100.00	2023-06-25 00:27:33.73487	2023-06-25 00:27:33.73487	
2695	43767	23270252974	2021	8	3	fam_hijos_100	100.00	2023-06-25 00:27:33.735051	2023-06-25 00:27:33.735051	
2696	43767	23270252974	2021	9	3	fam_hijos_100	100.00	2023-06-25 00:27:33.735232	2023-06-25 00:27:33.735232	
2697	43767	23270252974	2021	10	3	fam_hijos_100	100.00	2023-06-25 00:27:33.735408	2023-06-25 00:27:33.735408	
2698	43767	23270252974	2021	11	3	fam_hijos_100	100.00	2023-06-25 00:27:33.735591	2023-06-25 00:27:33.735591	
2699	43767	23270252974	2021	12	3	fam_hijos_100	100.00	2023-06-25 00:27:33.735766	2023-06-25 00:27:33.735766	
2700	42789	23307781174	2021	1	1	fam_hijos_100	100.00	2023-06-25 00:27:33.739578	2023-06-25 00:27:33.739578	
2701	42789	23307781174	2021	2	1	fam_hijos_100	100.00	2023-06-25 00:27:33.739777	2023-06-25 00:27:33.739777	
2702	42789	23307781174	2021	3	1	fam_hijos_100	100.00	2023-06-25 00:27:33.739961	2023-06-25 00:27:33.739961	
2703	42789	23307781174	2021	4	1	fam_hijos_100	100.00	2023-06-25 00:27:33.740136	2023-06-25 00:27:33.740136	
2704	42789	23307781174	2021	5	1	fam_hijos_100	100.00	2023-06-25 00:27:33.740317	2023-06-25 00:27:33.740317	
2705	42789	23307781174	2021	6	1	fam_hijos_100	100.00	2023-06-25 00:27:33.740492	2023-06-25 00:27:33.740492	
2706	42789	23307781174	2021	7	1	fam_hijos_100	100.00	2023-06-25 00:27:33.740668	2023-06-25 00:27:33.740668	
2707	42789	23307781174	2021	8	1	fam_hijos_100	100.00	2023-06-25 00:27:33.740854	2023-06-25 00:27:33.740854	
2708	42789	23307781174	2021	9	1	fam_hijos_100	100.00	2023-06-25 00:27:33.741069	2023-06-25 00:27:33.741069	
2709	42789	23307781174	2021	10	1	fam_hijos_100	100.00	2023-06-25 00:27:33.741288	2023-06-25 00:27:33.741288	
2710	42789	23307781174	2021	11	1	fam_hijos_100	100.00	2023-06-25 00:27:33.741505	2023-06-25 00:27:33.741505	
2711	42789	23307781174	2021	12	1	fam_hijos_100	100.00	2023-06-25 00:27:33.741707	2023-06-25 00:27:33.741707	
2712	42789	23307781174	2021	1	1	fam_hijos_100	100.00	2023-06-25 00:27:33.742085	2023-06-25 00:27:33.742085	
2713	42789	23307781174	2021	2	1	fam_hijos_100	100.00	2023-06-25 00:27:33.742281	2023-06-25 00:27:33.742281	
2714	42789	23307781174	2021	3	1	fam_hijos_100	100.00	2023-06-25 00:27:33.742468	2023-06-25 00:27:33.742468	
2715	42789	23307781174	2021	4	1	fam_hijos_100	100.00	2023-06-25 00:27:33.742652	2023-06-25 00:27:33.742652	
2716	42789	23307781174	2021	5	1	fam_hijos_100	100.00	2023-06-25 00:27:33.742841	2023-06-25 00:27:33.742841	
2717	42789	23307781174	2021	6	1	fam_hijos_100	100.00	2023-06-25 00:27:33.743046	2023-06-25 00:27:33.743046	
2718	42789	23307781174	2021	7	1	fam_hijos_100	100.00	2023-06-25 00:27:33.743271	2023-06-25 00:27:33.743271	
2719	42789	23307781174	2021	8	1	fam_hijos_100	100.00	2023-06-25 00:27:33.743453	2023-06-25 00:27:33.743453	
2720	42789	23307781174	2021	9	1	fam_hijos_100	100.00	2023-06-25 00:27:33.743633	2023-06-25 00:27:33.743633	
2721	42789	23307781174	2021	10	1	fam_hijos_100	100.00	2023-06-25 00:27:33.743808	2023-06-25 00:27:33.743808	
2722	42789	23307781174	2021	11	1	fam_hijos_100	100.00	2023-06-25 00:27:33.743991	2023-06-25 00:27:33.743991	
2723	42789	23307781174	2021	12	1	fam_hijos_100	100.00	2023-06-25 00:27:33.744163	2023-06-25 00:27:33.744163	
2724	42789	23307781174	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:33.74942	2023-06-25 00:27:33.74942	
2725	42789	23307781174	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:33.749835	2023-06-25 00:27:33.749835	
2726	42789	23307781174	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:33.750178	2023-06-25 00:27:33.750178	
2727	42789	23307781174	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:33.750602	2023-06-25 00:27:33.750602	
2728	42789	23307781174	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:33.750962	2023-06-25 00:27:33.750962	
2729	42789	23307781174	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:33.751237	2023-06-25 00:27:33.751237	
2730	42789	23307781174	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:33.751499	2023-06-25 00:27:33.751499	
2731	42789	23307781174	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:33.75177	2023-06-25 00:27:33.75177	
2732	42789	23307781174	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:33.752031	2023-06-25 00:27:33.752031	
2733	42789	23307781174	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:33.75228	2023-06-25 00:27:33.75228	
2734	42789	23307781174	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:33.752528	2023-06-25 00:27:33.752528	
2735	42789	23307781174	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:27:33.752774	2023-06-25 00:27:33.752774	
2736	42789	23307781174	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:33.753335	2023-06-25 00:27:33.753335	
2737	42789	23307781174	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:33.753683	2023-06-25 00:27:33.753683	
2738	42789	23307781174	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:33.753971	2023-06-25 00:27:33.753971	
2739	42789	23307781174	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:33.754272	2023-06-25 00:27:33.754272	
2740	42789	23307781174	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:33.754718	2023-06-25 00:27:33.754718	
2741	42789	23307781174	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:33.755581	2023-06-25 00:27:33.755581	
2742	42789	23307781174	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:33.755922	2023-06-25 00:27:33.755922	
2743	42789	23307781174	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:33.756241	2023-06-25 00:27:33.756241	
2744	42789	23307781174	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:33.756518	2023-06-25 00:27:33.756518	
2745	42789	23307781174	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:33.756777	2023-06-25 00:27:33.756777	
2746	42789	23307781174	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:33.75705	2023-06-25 00:27:33.75705	
2747	42789	23307781174	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:27:33.757303	2023-06-25 00:27:33.757303	
2748	36515	24244360080	2021	1	2	ded_domestica	8000.00	2023-06-25 00:27:33.765906	2023-06-25 00:27:33.765906	
2749	36515	24244360080	2021	2	2	ded_domestica	8000.00	2023-06-25 00:27:33.766218	2023-06-25 00:27:33.766218	
2750	36515	24244360080	2021	3	2	ded_domestica	10000.00	2023-06-25 00:27:33.766748	2023-06-25 00:27:33.766748	
2751	36515	24244360080	2021	4	2	ded_domestica	10000.00	2023-06-25 00:27:33.766993	2023-06-25 00:27:33.766993	
2752	36515	24244360080	2021	5	2	ded_domestica	10000.00	2023-06-25 00:27:33.767244	2023-06-25 00:27:33.767244	
2753	36515	24244360080	2021	6	2	ded_domestica	15000.00	2023-06-25 00:27:33.767658	2023-06-25 00:27:33.767658	
2754	36515	24244360080	2021	7	2	ded_domestica	10000.00	2023-06-25 00:27:33.768098	2023-06-25 00:27:33.768098	
2755	36515	24244360080	2021	8	2	ded_domestica	10000.00	2023-06-25 00:27:33.768318	2023-06-25 00:27:33.768318	
2756	36515	24244360080	2021	9	2	ded_domestica	12000.00	2023-06-25 00:27:33.768609	2023-06-25 00:27:33.768609	
2757	36515	24244360080	2021	10	2	ded_domestica	12000.00	2023-06-25 00:27:33.768795	2023-06-25 00:27:33.768795	
2758	36515	24244360080	2021	11	2	ded_domestica	12000.00	2023-06-25 00:27:33.768987	2023-06-25 00:27:33.768987	
2759	36515	24244360080	2021	12	2	ded_domestica	18000.00	2023-06-25 00:27:33.7693	2023-06-25 00:27:33.7693	
2760	19299	27106234987	2021	9	13	ded_donaciones	15000.00	2023-06-25 00:27:33.778208	2023-06-25 00:27:33.778208	
2761	19299	27106234987	2021	1	13	ded_domestica	20266.39	2023-06-25 00:27:33.779218	2023-06-25 00:27:33.779218	
2762	19299	27106234987	2021	2	13	ded_domestica	20266.39	2023-06-25 00:27:33.779616	2023-06-25 00:27:33.779616	
2763	19299	27106234987	2021	3	13	ded_domestica	21741.20	2023-06-25 00:27:33.780485	2023-06-25 00:27:33.780485	
2764	19299	27106234987	2021	4	13	ded_domestica	23558.90	2023-06-25 00:27:33.781037	2023-06-25 00:27:33.781037	
2765	19299	27106234987	2021	5	13	ded_domestica	23558.90	2023-06-25 00:27:33.78148	2023-06-25 00:27:33.78148	
2766	19299	27106234987	2021	6	13	ded_domestica	39412.36	2023-06-25 00:27:33.782108	2023-06-25 00:27:33.782108	
2767	19299	27106234987	2021	7	13	ded_domestica	26636.34	2023-06-25 00:27:33.782798	2023-06-25 00:27:33.782798	
2768	19299	27106234987	2021	8	13	ded_domestica	26642.01	2023-06-25 00:27:33.783411	2023-06-25 00:27:33.783411	
2769	19299	27106234987	2021	9	13	ded_domestica	30876.39	2023-06-25 00:27:33.783901	2023-06-25 00:27:33.783901	
2770	19299	27106234987	2021	10	13	ded_domestica	30876.39	2023-06-25 00:27:33.784176	2023-06-25 00:27:33.784176	
2771	19299	27106234987	2021	11	13	ded_domestica	32310.69	2023-06-25 00:27:33.784675	2023-06-25 00:27:33.784675	
2772	19299	27106234987	2021	12	13	ded_domestica	50568.51	2023-06-25 00:27:33.785181	2023-06-25 00:27:33.785181	
2773	19299	27106234987	2021	1	13	ded_domestica	25986.61	2023-06-25 00:27:33.78594	2023-06-25 00:27:33.78594	
2774	19299	27106234987	2021	2	13	ded_domestica	25986.61	2023-06-25 00:27:33.786218	2023-06-25 00:27:33.786218	
2775	19299	27106234987	2021	3	13	ded_domestica	27802.62	2023-06-25 00:27:33.786684	2023-06-25 00:27:33.786684	
2776	19299	27106234987	2021	4	13	ded_domestica	30045.62	2023-06-25 00:27:33.787099	2023-06-25 00:27:33.787099	
2777	19299	27106234987	2021	5	13	ded_domestica	30045.62	2023-06-25 00:27:33.787336	2023-06-25 00:27:33.787336	
2778	19299	27106234987	2021	6	13	ded_domestica	50050.73	2023-06-25 00:27:33.787683	2023-06-25 00:27:33.787683	
2779	19299	27106234987	2021	7	13	ded_domestica	34198.21	2023-06-25 00:27:33.788006	2023-06-25 00:27:33.788006	
2780	19299	27106234987	2021	8	13	ded_domestica	34203.88	2023-06-25 00:27:33.788331	2023-06-25 00:27:33.788331	
2781	19299	27106234987	2021	9	13	ded_domestica	38013.61	2023-06-25 00:27:33.788656	2023-06-25 00:27:33.788656	
2782	19299	27106234987	2021	10	13	ded_domestica	38013.61	2023-06-25 00:27:33.788836	2023-06-25 00:27:33.788836	
2783	19299	27106234987	2021	11	13	ded_domestica	40101.55	2023-06-25 00:27:33.78916	2023-06-25 00:27:33.78916	
2784	19299	27106234987	2021	12	13	ded_domestica	62061.61	2023-06-25 00:27:33.789479	2023-06-25 00:27:33.789479	
2785	19263	27124036548	2022	1	1	ded_cuota_medica	1380.00	2023-06-25 00:27:33.794967	2023-06-25 00:27:33.794967	
2786	19263	27124036548	2022	2	1	ded_cuota_medica	1380.00	2023-06-25 00:27:33.79519	2023-06-25 00:27:33.79519	
2787	19263	27124036548	2022	3	1	ded_cuota_medica	1380.00	2023-06-25 00:27:33.795377	2023-06-25 00:27:33.795377	
2788	31763	27124623176	2021	1	1	ded_cuota_medica	12289.59	2023-06-25 00:27:33.801838	2023-06-25 00:27:33.801838	
2789	31763	27124623176	2021	2	1	ded_cuota_medica	12289.59	2023-06-25 00:27:33.802179	2023-06-25 00:27:33.802179	
2790	31763	27124623176	2021	3	1	ded_cuota_medica	12719.46	2023-06-25 00:27:33.802651	2023-06-25 00:27:33.802651	
2791	31763	27124623176	2021	4	1	ded_cuota_medica	13706.79	2023-06-25 00:27:33.803114	2023-06-25 00:27:33.803114	
2792	31763	27124623176	2021	5	1	ded_cuota_medica	14021.72	2023-06-25 00:27:33.803577	2023-06-25 00:27:33.803577	
2793	31763	27124623176	2021	6	1	ded_cuota_medica	14021.72	2023-06-25 00:27:33.803887	2023-06-25 00:27:33.803887	
2794	31763	27124623176	2021	7	1	ded_cuota_medica	14021.72	2023-06-25 00:27:33.804187	2023-06-25 00:27:33.804187	
2795	31763	27124623176	2021	8	1	ded_cuota_medica	15283.26	2023-06-25 00:27:33.804635	2023-06-25 00:27:33.804635	
2796	31763	27124623176	2021	9	1	ded_cuota_medica	16657.92	2023-06-25 00:27:33.805047	2023-06-25 00:27:33.805047	
2797	31763	27124623176	2021	10	1	ded_cuota_medica	18156.56	2023-06-25 00:27:33.805535	2023-06-25 00:27:33.805535	
2798	31763	27124623176	2021	11	1	ded_cuota_medica	18156.56	2023-06-25 00:27:33.805828	2023-06-25 00:27:33.805828	
2799	31763	27124623176	2021	12	1	ded_cuota_medica	18156.56	2023-06-25 00:27:33.806248	2023-06-25 00:27:33.806248	
2800	18146	27140426879	2021	1	12	ded_cuota_medica	1329.97	2023-06-25 00:27:33.815512	2023-06-25 00:27:33.815512	
2801	18146	27140426879	2021	2	12	ded_cuota_medica	8889.61	2023-06-25 00:27:33.816523	2023-06-25 00:27:33.816523	
2802	18146	27140426879	2021	3	12	ded_cuota_medica	9881.26	2023-06-25 00:27:33.817144	2023-06-25 00:27:33.817144	
2803	18146	27140426879	2021	4	12	ded_cuota_medica	5888.34	2023-06-25 00:27:33.817733	2023-06-25 00:27:33.817733	
2804	18146	27140426879	2021	5	12	ded_cuota_medica	10319.43	2023-06-25 00:27:33.818274	2023-06-25 00:27:33.818274	
2805	18146	27140426879	2021	6	12	ded_cuota_medica	9094.37	2023-06-25 00:27:33.818715	2023-06-25 00:27:33.818715	
2806	18146	27140426879	2021	7	12	ded_cuota_medica	12527.26	2023-06-25 00:27:33.819087	2023-06-25 00:27:33.819087	
2807	18146	27140426879	2021	8	12	ded_cuota_medica	4728.46	2023-06-25 00:27:33.819474	2023-06-25 00:27:33.819474	
2808	18146	27140426879	2021	9	12	ded_cuota_medica	11296.47	2023-06-25 00:27:33.819828	2023-06-25 00:27:33.819828	
2809	18146	27140426879	2021	10	12	ded_cuota_medica	12755.84	2023-06-25 00:27:33.820143	2023-06-25 00:27:33.820143	
2810	18146	27140426879	2021	11	12	ded_cuota_medica	15938.43	2023-06-25 00:27:33.820465	2023-06-25 00:27:33.820465	
2811	18146	27140426879	2021	12	12	ded_cuota_medica	15938.43	2023-06-25 00:27:33.820671	2023-06-25 00:27:33.820671	
2812	18146	27140426879	2021	1	12	ded_domestica	14400.00	2023-06-25 00:27:33.821119	2023-06-25 00:27:33.821119	
2813	18146	27140426879	2021	2	12	ded_domestica	14400.00	2023-06-25 00:27:33.821539	2023-06-25 00:27:33.821539	
2814	18146	27140426879	2021	3	12	ded_domestica	20772.00	2023-06-25 00:27:33.822134	2023-06-25 00:27:33.822134	
2815	18146	27140426879	2021	4	12	ded_domestica	18549.00	2023-06-25 00:27:33.822649	2023-06-25 00:27:33.822649	
2816	18146	27140426879	2021	5	12	ded_domestica	17680.00	2023-06-25 00:27:33.823236	2023-06-25 00:27:33.823236	
2817	18146	27140426879	2021	6	12	ded_domestica	30580.00	2023-06-25 00:27:33.823915	2023-06-25 00:27:33.823915	
2818	18146	27140426879	2021	7	12	ded_domestica	19800.00	2023-06-25 00:27:33.824367	2023-06-25 00:27:33.824367	
2819	18146	27140426879	2021	8	12	ded_domestica	21760.00	2023-06-25 00:27:33.8247	2023-06-25 00:27:33.8247	
2820	18146	27140426879	2021	9	12	ded_domestica	23270.00	2023-06-25 00:27:33.825003	2023-06-25 00:27:33.825003	
2821	18146	27140426879	2021	10	12	ded_domestica	23420.00	2023-06-25 00:27:33.825348	2023-06-25 00:27:33.825348	
2822	18146	27140426879	2021	11	12	ded_domestica	24300.00	2023-06-25 00:27:33.825774	2023-06-25 00:27:33.825774	
2823	18146	27140426879	2021	12	12	ded_domestica	34405.00	2023-06-25 00:27:33.826188	2023-06-25 00:27:33.826188	
2824	18146	27140426879	2021	1	12	otro_sindicato	1889.64	2023-06-25 00:27:33.835593	2023-06-25 00:27:33.835593	
2825	18146	27140426879	2021	1	12	otro_ex_nogan	109710.71	2023-06-25 00:27:33.836065	2023-06-25 00:27:33.836065	
2826	18146	27140426879	2021	1	12	otro_ret_gan	1295.04	2023-06-25 00:27:33.836442	2023-06-25 00:27:33.836442	
2827	18146	27140426879	2021	1	12	otro_seg_soc	9152.88	2023-06-25 00:27:33.836801	2023-06-25 00:27:33.836801	
2828	18146	27140426879	2021	2	12	otro_ex_nogan	114862.54	2023-06-25 00:27:33.837423	2023-06-25 00:27:33.837423	
2829	18146	27140426879	2021	2	12	otro_sindicato	1889.03	2023-06-25 00:27:33.837841	2023-06-25 00:27:33.837841	
2830	18146	27140426879	2021	2	12	otro_seg_soc	10342.01	2023-06-25 00:27:33.838248	2023-06-25 00:27:33.838248	
2831	18146	27140426879	2021	3	12	otro_ex_nogan	133724.16	2023-06-25 00:27:33.839586	2023-06-25 00:27:33.839586	
2832	18146	27140426879	2021	3	12	otro_sindicato	3452.11	2023-06-25 00:27:33.8402	2023-06-25 00:27:33.8402	
2833	18146	27140426879	2021	3	12	otro_seg_soc	9186.72	2023-06-25 00:27:33.841301	2023-06-25 00:27:33.841301	
2834	18146	27140426879	2021	4	12	otro_sindicato	3452.11	2023-06-25 00:27:33.842367	2023-06-25 00:27:33.842367	
2835	18146	27140426879	2021	4	12	otro_ex_nogan	116770.64	2023-06-25 00:27:33.843104	2023-06-25 00:27:33.843104	
2836	18146	27140426879	2021	4	12	otro_seg_soc	9186.72	2023-06-25 00:27:33.843941	2023-06-25 00:27:33.843941	
2837	18146	27140426879	2021	5	12	otro_seg_soc	9186.72	2023-06-25 00:27:33.844843	2023-06-25 00:27:33.844843	
2838	18146	27140426879	2021	5	12	otro_ex_nogan	123889.64	2023-06-25 00:27:33.845547	2023-06-25 00:27:33.845547	
2839	18146	27140426879	2021	5	12	otro_sindicato	3452.11	2023-06-25 00:27:33.846291	2023-06-25 00:27:33.846291	
2840	18146	27140426879	2021	6	12	otro_seg_soc	11122.50	2023-06-25 00:27:33.84773	2023-06-25 00:27:33.84773	
2841	18146	27140426879	2021	6	12	otro_sindicato	6899.69	2023-06-25 00:27:33.848416	2023-06-25 00:27:33.848416	
2842	18146	27140426879	2021	6	12	otro_ex_nogan	159072.38	2023-06-25 00:27:33.849072	2023-06-25 00:27:33.849072	
2843	18146	27140426879	2021	7	12	otro_ex_nogan	118397.11	2023-06-25 00:27:33.849985	2023-06-25 00:27:33.849985	
2844	18146	27140426879	2021	7	12	otro_sindicato	4660.55	2023-06-25 00:27:33.850546	2023-06-25 00:27:33.850546	
2845	18146	27140426879	2021	7	12	otro_seg_soc	9574.58	2023-06-25 00:27:33.851159	2023-06-25 00:27:33.851159	
2846	18146	27140426879	2021	8	12	otro_sindicato	4091.17	2023-06-25 00:27:33.851922	2023-06-25 00:27:33.851922	
2847	18146	27140426879	2021	8	12	otro_ex_nogan	102695.35	2023-06-25 00:27:33.852351	2023-06-25 00:27:33.852351	
2848	18146	27140426879	2021	8	12	otro_seg_soc	8597.14	2023-06-25 00:27:33.852732	2023-06-25 00:27:33.852732	
2849	18146	27140426879	2021	9	12	otro_seg_soc	9056.81	2023-06-25 00:27:33.853406	2023-06-25 00:27:33.853406	
2850	18146	27140426879	2021	9	12	otro_sindicato	6774.62	2023-06-25 00:27:33.853836	2023-06-25 00:27:33.853836	
2851	18146	27140426879	2021	9	12	otro_ex_nogan	153750.68	2023-06-25 00:27:33.8543	2023-06-25 00:27:33.8543	
2852	18146	27140426879	2021	10	12	otro_seg_soc	12696.92	2023-06-25 00:27:33.854902	2023-06-25 00:27:33.854902	
2853	18146	27140426879	2021	10	12	otro_gan_brut	133691.70	2023-06-25 00:27:33.85538	2023-06-25 00:27:33.85538	
2854	18146	27140426879	2021	10	12	otro_ex_nogan	7188.00	2023-06-25 00:27:33.855787	2023-06-25 00:27:33.855787	
2855	18146	27140426879	2021	10	12	otro_sindicato	4740.83	2023-06-25 00:27:33.856165	2023-06-25 00:27:33.856165	
2856	18146	27140426879	2021	11	12	otro_seg_soc	12655.02	2023-06-25 00:27:33.856743	2023-06-25 00:27:33.856743	
2857	18146	27140426879	2021	11	12	otro_gan_brut	150437.45	2023-06-25 00:27:33.857151	2023-06-25 00:27:33.857151	
2858	18146	27140426879	2021	11	12	otro_sindicato	4740.83	2023-06-25 00:27:33.858034	2023-06-25 00:27:33.858034	
2859	18146	27140426879	2021	11	12	otro_ex_nogan	7188.00	2023-06-25 00:27:33.858471	2023-06-25 00:27:33.858471	
2860	18146	27140426879	2021	12	12	otro_gan_brut	162998.06	2023-06-25 00:27:33.859037	2023-06-25 00:27:33.859037	
2861	18146	27140426879	2021	12	12	otro_seg_soc	13957.04	2023-06-25 00:27:33.85946	2023-06-25 00:27:33.85946	
2862	18146	27140426879	2021	12	12	otro_ex_nogan	7188.00	2023-06-25 00:27:33.859953	2023-06-25 00:27:33.859953	
2863	18146	27140426879	2021	12	12	otro_sindicato	4665.10	2023-06-25 00:27:33.86042	2023-06-25 00:27:33.86042	
2864	18146	27140426879	2022	2	3	ded_cuota_medica	12566.45	2023-06-25 00:27:33.864582	2023-06-25 00:27:33.864582	
2865	18146	27140426879	2022	3	3	ded_cuota_medica	15516.35	2023-06-25 00:27:33.864879	2023-06-25 00:27:33.864879	
2866	18146	27140426879	2022	1	3	ded_domestica	20480.00	2023-06-25 00:27:33.865308	2023-06-25 00:27:33.865308	
2867	18146	27140426879	2022	2	3	ded_domestica	31107.00	2023-06-25 00:27:33.865618	2023-06-25 00:27:33.865618	
2868	18146	27140426879	2022	3	3	ded_domestica	26688.00	2023-06-25 00:27:33.865892	2023-06-25 00:27:33.865892	
2869	18146	27140426879	2022	1	3	otro_seg_soc	14232.68	2023-06-25 00:27:33.869176	2023-06-25 00:27:33.869176	
2870	18146	27140426879	2022	1	3	otro_gan_brut	187089.87	2023-06-25 00:27:33.869628	2023-06-25 00:27:33.869628	
2871	18146	27140426879	2022	1	3	otro_sindicato	4897.31	2023-06-25 00:27:33.870062	2023-06-25 00:27:33.870062	
2872	18146	27140426879	2022	2	3	otro_sindicato	4897.31	2023-06-25 00:27:33.870674	2023-06-25 00:27:33.870674	
2873	18146	27140426879	2022	2	3	otro_seg_soc	14232.68	2023-06-25 00:27:33.871179	2023-06-25 00:27:33.871179	
2874	18146	27140426879	2022	2	3	otro_gan_brut	187089.82	2023-06-25 00:27:33.872114	2023-06-25 00:27:33.872114	
2875	18146	27140426879	2022	3	3	otro_sindicato	4943.96	2023-06-25 00:27:33.873135	2023-06-25 00:27:33.873135	
2876	18146	27140426879	2022	3	3	otro_gan_brut	157123.26	2023-06-25 00:27:33.873784	2023-06-25 00:27:33.873784	
2877	18146	27140426879	2022	3	3	otro_seg_soc	13281.65	2023-06-25 00:27:33.874448	2023-06-25 00:27:33.874448	
2878	17608	27148204530	2021	1	2	otro_seg_soc	5584.64	2023-06-25 00:27:33.879966	2023-06-25 00:27:33.879966	
2879	17608	27148204530	2021	1	2	otro_gan_brut	34948.04	2023-06-25 00:27:33.88102	2023-06-25 00:27:33.88102	
2880	17608	27148204530	2021	2	2	otro_seg_soc	5803.66	2023-06-25 00:27:33.881971	2023-06-25 00:27:33.881971	
2881	17608	27148204530	2021	2	2	otro_gan_brut	36316.84	2023-06-25 00:27:33.882527	2023-06-25 00:27:33.882527	
2882	17608	27148204530	2021	3	2	otro_seg_soc	6022.66	2023-06-25 00:27:33.883399	2023-06-25 00:27:33.883399	
2883	17608	27148204530	2021	3	2	otro_gan_brut	37685.64	2023-06-25 00:27:33.883917	2023-06-25 00:27:33.883917	
2884	17608	27148204530	2021	4	2	otro_gan_brut	38946.40	2023-06-25 00:27:33.884708	2023-06-25 00:27:33.884708	
2885	17608	27148204530	2021	4	2	otro_seg_soc	6224.38	2023-06-25 00:27:33.885281	2023-06-25 00:27:33.885281	
2886	17608	27148204530	2021	5	2	otro_gan_brut	44077.98	2023-06-25 00:27:33.886069	2023-06-25 00:27:33.886069	
2887	17608	27148204530	2021	5	2	otro_seg_soc	6885.44	2023-06-25 00:27:33.886492	2023-06-25 00:27:33.886492	
2888	17608	27148204530	2021	6	2	otro_seg_soc	10298.77	2023-06-25 00:27:33.887081	2023-06-25 00:27:33.887081	
2889	17608	27148204530	2021	6	2	otro_gan_brut	43411.28	2023-06-25 00:27:33.887547	2023-06-25 00:27:33.887547	
2890	17608	27148204530	2021	6	2	otro_sac	22000.00	2023-06-25 00:27:33.887947	2023-06-25 00:27:33.887947	
2891	17608	27148204530	2021	7	2	otro_seg_soc	3432.72	2023-06-25 00:27:33.888505	2023-06-25 00:27:33.888505	
2892	17608	27148204530	2021	7	2	otro_gan_brut	22477.76	2023-06-25 00:27:33.888944	2023-06-25 00:27:33.888944	
2893	17608	27148204530	2021	8	2	otro_seg_soc	3553.38	2023-06-25 00:27:33.889594	2023-06-25 00:27:33.889594	
2894	17608	27148204530	2021	8	2	otro_gan_brut	23230.61	2023-06-25 00:27:33.890011	2023-06-25 00:27:33.890011	
2895	17608	27148204530	2021	9	2	otro_seg_soc	3734.97	2023-06-25 00:27:33.890682	2023-06-25 00:27:33.890682	
2896	17608	27148204530	2021	9	2	otro_gan_brut	24359.87	2023-06-25 00:27:33.891092	2023-06-25 00:27:33.891092	
2897	17608	27148204530	2021	10	2	otro_gan_brut	26677.36	2023-06-25 00:27:33.891691	2023-06-25 00:27:33.891691	
2898	17608	27148204530	2021	10	2	otro_seg_soc	3944.86	2023-06-25 00:27:33.892155	2023-06-25 00:27:33.892155	
2899	17608	27148204530	2021	11	2	otro_seg_soc	3944.86	2023-06-25 00:27:33.892776	2023-06-25 00:27:33.892776	
2900	17608	27148204530	2021	11	2	otro_gan_brut	26677.36	2023-06-25 00:27:33.893725	2023-06-25 00:27:33.893725	
2901	17608	27148204530	2021	12	2	otro_sac	13900.00	2023-06-25 00:27:33.894573	2023-06-25 00:27:33.894573	
2902	17608	27148204530	2021	12	2	otro_seg_soc	6233.49	2023-06-25 00:27:33.895038	2023-06-25 00:27:33.895038	
2903	17608	27148204530	2021	12	2	otro_gan_brut	26677.36	2023-06-25 00:27:33.895481	2023-06-25 00:27:33.895481	
2904	17608	27148204530	2022	1	1	otro_seg_soc	4276.10	2023-06-25 00:27:33.899962	2023-06-25 00:27:33.899962	
2905	17608	27148204530	2022	1	1	otro_gan_brut	28747.68	2023-06-25 00:27:33.900434	2023-06-25 00:27:33.900434	
2906	17681	27163213287	2022	1	4	ded_gastos_medicos	1200.00	2023-06-25 00:27:33.906863	2023-06-25 00:27:33.906863	
2907	17681	27163213287	2022	2	4	ded_gastos_medicos	1600.00	2023-06-25 00:27:33.907527	2023-06-25 00:27:33.907527	
2908	17681	27163213287	2022	3	4	ded_gastos_medicos	1600.00	2023-06-25 00:27:33.907902	2023-06-25 00:27:33.907902	
2909	17430	27166775006	2021	1	13	ded_cuota_medica	1662.72	2023-06-25 00:27:33.912425	2023-06-25 00:27:33.912425	
2910	17430	27166775006	2021	2	13	ded_cuota_medica	1142.76	2023-06-25 00:27:33.912851	2023-06-25 00:27:33.912851	
2911	17430	27166775006	2021	5	13	ded_cuota_medica	296.28	2023-06-25 00:27:33.913307	2023-06-25 00:27:33.913307	
2912	17430	27166775006	2021	6	13	ded_cuota_medica	1233.94	2023-06-25 00:27:33.914226	2023-06-25 00:27:33.914226	
2913	17430	27166775006	2021	7	13	ded_cuota_medica	596.66	2023-06-25 00:27:33.914951	2023-06-25 00:27:33.914951	
2914	17430	27166775006	2021	8	13	ded_cuota_medica	596.66	2023-06-25 00:27:33.915238	2023-06-25 00:27:33.915238	
2915	17430	27166775006	2021	9	13	ded_cuota_medica	1023.00	2023-06-25 00:27:33.915676	2023-06-25 00:27:33.915676	
2916	17430	27166775006	2021	11	13	ded_cuota_medica	1075.44	2023-06-25 00:27:33.916168	2023-06-25 00:27:33.916168	
2917	17430	27166775006	2021	12	13	ded_cuota_medica	886.34	2023-06-25 00:27:33.916677	2023-06-25 00:27:33.916677	
2918	17430	27166775006	2022	1	5	ded_cuota_medica	2194.26	2023-06-25 00:27:33.924816	2023-06-25 00:27:33.924816	
2919	17430	27166775006	2022	2	5	ded_cuota_medica	1192.42	2023-06-25 00:27:33.925238	2023-06-25 00:27:33.925238	
2920	17730	27168506568	2021	1	8	ded_cuota_medica	12749.41	2023-06-25 00:27:33.935654	2023-06-25 00:27:33.935654	
2921	17730	27168506568	2021	2	8	ded_cuota_medica	11993.94	2023-06-25 00:27:33.93641	2023-06-25 00:27:33.93641	
2922	17730	27168506568	2021	3	8	ded_cuota_medica	12890.31	2023-06-25 00:27:33.936956	2023-06-25 00:27:33.936956	
2923	17730	27168506568	2021	4	8	ded_cuota_medica	12766.45	2023-06-25 00:27:33.937512	2023-06-25 00:27:33.937512	
2924	17730	27168506568	2021	5	8	ded_cuota_medica	14308.87	2023-06-25 00:27:33.937995	2023-06-25 00:27:33.937995	
2925	17730	27168506568	2021	6	8	ded_cuota_medica	7158.76	2023-06-25 00:27:33.938465	2023-06-25 00:27:33.938465	
2926	17730	27168506568	2021	7	8	ded_cuota_medica	11002.38	2023-06-25 00:27:33.938916	2023-06-25 00:27:33.938916	
2927	17730	27168506568	2021	8	8	ded_cuota_medica	14460.92	2023-06-25 00:27:33.939456	2023-06-25 00:27:33.939456	
2928	17730	27168506568	2021	9	8	ded_cuota_medica	15264.82	2023-06-25 00:27:33.94009	2023-06-25 00:27:33.94009	
2929	17730	27168506568	2021	11	8	ded_cuota_medica	17582.98	2023-06-25 00:27:33.940959	2023-06-25 00:27:33.940959	
2930	17730	27168506568	2021	12	8	ded_cuota_medica	8157.04	2023-06-25 00:27:33.941454	2023-06-25 00:27:33.941454	
2931	17730	27168506568	2021	6	8	ded_gastos_medicos	2000.00	2023-06-25 00:27:33.942218	2023-06-25 00:27:33.942218	
2932	17730	27168506568	2021	8	8	ded_gastos_medicos	1000.00	2023-06-25 00:27:33.942755	2023-06-25 00:27:33.942755	
2933	17730	27168506568	2021	9	8	ded_gastos_medicos	1000.00	2023-06-25 00:27:33.943284	2023-06-25 00:27:33.943284	
2934	17730	27168506568	2021	10	8	ded_gastos_medicos	1000.00	2023-06-25 00:27:33.943794	2023-06-25 00:27:33.943794	
2935	17730	27168506568	2021	11	8	ded_gastos_medicos	1000.00	2023-06-25 00:27:33.944338	2023-06-25 00:27:33.944338	
2936	17730	27168506568	2021	1	8	fam_hijos_disc_50	100.00	2023-06-25 00:27:33.944786	2023-06-25 00:27:33.944786	
2937	17730	27168506568	2021	2	8	fam_hijos_disc_50	100.00	2023-06-25 00:27:33.945017	2023-06-25 00:27:33.945017	
2938	17730	27168506568	2021	3	8	fam_hijos_disc_50	100.00	2023-06-25 00:27:33.945259	2023-06-25 00:27:33.945259	
2939	17730	27168506568	2021	4	8	fam_hijos_disc_50	100.00	2023-06-25 00:27:33.945479	2023-06-25 00:27:33.945479	
2940	17730	27168506568	2022	1	3	ded_cuota_medica	19860.37	2023-06-25 00:27:33.950721	2023-06-25 00:27:33.950721	
2941	17730	27168506568	2022	2	3	ded_cuota_medica	19860.37	2023-06-25 00:27:33.951076	2023-06-25 00:27:33.951076	
2942	17730	27168506568	2022	1	3	ded_gastos_medicos	2000.00	2023-06-25 00:27:33.952535	2023-06-25 00:27:33.952535	
2943	17730	27168506568	2022	3	3	ded_gastos_medicos	1120.00	2023-06-25 00:27:33.952953	2023-06-25 00:27:33.952953	
2944	17730	27168506568	2022	4	3	ded_gastos_medicos	112.00	2023-06-25 00:27:33.953821	2023-06-25 00:27:33.953821	
2945	17602	27168933105	2021	1	12	ded_cuota_medica	6097.95	2023-06-25 00:27:33.958035	2023-06-25 00:27:33.958035	
2946	17602	27168933105	2021	2	12	ded_cuota_medica	5376.87	2023-06-25 00:27:33.958356	2023-06-25 00:27:33.958356	
2947	17602	27168933105	2021	4	12	ded_cuota_medica	12711.38	2023-06-25 00:27:33.958675	2023-06-25 00:27:33.958675	
2948	17602	27168933105	2021	5	12	ded_cuota_medica	846.53	2023-06-25 00:27:33.95899	2023-06-25 00:27:33.95899	
2949	17602	27168933105	2021	6	12	ded_cuota_medica	6528.67	2023-06-25 00:27:33.959295	2023-06-25 00:27:33.959295	
2950	17602	27168933105	2021	7	12	ded_cuota_medica	5602.84	2023-06-25 00:27:33.959613	2023-06-25 00:27:33.959613	
2951	17602	27168933105	2021	8	12	ded_cuota_medica	5278.14	2023-06-25 00:27:33.96001	2023-06-25 00:27:33.96001	
2952	17602	27168933105	2021	9	12	ded_cuota_medica	4593.30	2023-06-25 00:27:33.960389	2023-06-25 00:27:33.960389	
2953	17602	27168933105	2021	10	12	ded_cuota_medica	8271.37	2023-06-25 00:27:33.960748	2023-06-25 00:27:33.960748	
2954	17602	27168933105	2021	11	12	ded_cuota_medica	8311.39	2023-06-25 00:27:33.961094	2023-06-25 00:27:33.961094	
2955	17602	27168933105	2021	12	12	ded_cuota_medica	7076.26	2023-06-25 00:27:33.961459	2023-06-25 00:27:33.961459	
2956	17602	27168933105	2022	1	4	ded_cuota_medica	11077.65	2023-06-25 00:27:33.967459	2023-06-25 00:27:33.967459	
2957	17602	27168933105	2022	2	4	ded_cuota_medica	9482.55	2023-06-25 00:27:33.968073	2023-06-25 00:27:33.968073	
2958	17602	27168933105	2022	3	4	ded_cuota_medica	543.84	2023-06-25 00:27:33.968629	2023-06-25 00:27:33.968629	
2959	17602	27168933105	2022	4	4	ded_cuota_medica	13628.66	2023-06-25 00:27:33.969178	2023-06-25 00:27:33.969178	
2960	15591	27171033247	2021	9	14	ded_donaciones	15000.00	2023-06-25 00:27:33.974313	2023-06-25 00:27:33.974313	
2961	15591	27171033247	2021	1	14	ded_domestica	6721.35	2023-06-25 00:27:33.974994	2023-06-25 00:27:33.974994	
2962	15591	27171033247	2021	2	14	ded_domestica	7203.35	2023-06-25 00:27:33.9754	2023-06-25 00:27:33.9754	
2963	15591	27171033247	2021	3	14	ded_domestica	7263.86	2023-06-25 00:27:33.975775	2023-06-25 00:27:33.975775	
2964	15591	27171033247	2021	4	14	ded_domestica	7823.86	2023-06-25 00:27:33.976164	2023-06-25 00:27:33.976164	
2965	15591	27171033247	2021	5	14	ded_domestica	7864.22	2023-06-25 00:27:33.97656	2023-06-25 00:27:33.97656	
2966	15591	27171033247	2021	6	14	ded_domestica	13069.34	2023-06-25 00:27:33.976899	2023-06-25 00:27:33.976899	
2967	15591	27171033247	2021	7	14	ded_domestica	8879.34	2023-06-25 00:27:33.977266	2023-06-25 00:27:33.977266	
2968	15591	27171033247	2021	8	14	ded_domestica	9168.82	2023-06-25 00:27:33.977602	2023-06-25 00:27:33.977602	
2969	15591	27171033247	2021	9	14	ded_domestica	10816.82	2023-06-25 00:27:33.977931	2023-06-25 00:27:33.977931	
2970	15591	27171033247	2021	10	14	ded_domestica	10816.82	2023-06-25 00:27:33.978136	2023-06-25 00:27:33.978136	
2971	15591	27171033247	2021	11	14	ded_domestica	10856.25	2023-06-25 00:27:33.978529	2023-06-25 00:27:33.978529	
2972	15591	27171033247	2021	12	14	ded_domestica	16591.46	2023-06-25 00:27:33.978847	2023-06-25 00:27:33.978847	
2973	15591	27171033247	2022	1	2	ded_domestica	11164.26	2023-06-25 00:27:33.98395	2023-06-25 00:27:33.98395	
2974	15591	27171033247	2022	2	2	ded_domestica	10943.88	2023-06-25 00:27:33.984302	2023-06-25 00:27:33.984302	
2975	15591	27171033247	2022	3	2	ded_domestica	11819.50	2023-06-25 00:27:33.984617	2023-06-25 00:27:33.984617	
2976	16409	27172130327	2021	1	26	ded_cuota_medica	3224.04	2023-06-25 00:27:33.989414	2023-06-25 00:27:33.989414	
2977	16409	27172130327	2021	2	26	ded_cuota_medica	3246.11	2023-06-25 00:27:33.989776	2023-06-25 00:27:33.989776	
2978	16409	27172130327	2021	3	26	ded_cuota_medica	3170.89	2023-06-25 00:27:33.990125	2023-06-25 00:27:33.990125	
2979	16409	27172130327	2021	5	26	ded_cuota_medica	4325.72	2023-06-25 00:27:33.990453	2023-06-25 00:27:33.990453	
2980	16409	27172130327	2021	6	26	ded_cuota_medica	3335.71	2023-06-25 00:27:33.990751	2023-06-25 00:27:33.990751	
2981	16409	27172130327	2021	7	26	ded_cuota_medica	3280.28	2023-06-25 00:27:33.991416	2023-06-25 00:27:33.991416	
2982	16409	27172130327	2021	8	26	ded_cuota_medica	2787.70	2023-06-25 00:27:33.992012	2023-06-25 00:27:33.992012	
2983	16409	27172130327	2021	9	26	ded_cuota_medica	6465.83	2023-06-25 00:27:33.992371	2023-06-25 00:27:33.992371	
2984	16409	27172130327	2021	10	26	ded_cuota_medica	1956.48	2023-06-25 00:27:33.99269	2023-06-25 00:27:33.99269	
2985	16409	27172130327	2021	11	26	ded_cuota_medica	6474.47	2023-06-25 00:27:33.993001	2023-06-25 00:27:33.993001	
2986	16409	27172130327	2021	12	26	ded_cuota_medica	6257.93	2023-06-25 00:27:33.993375	2023-06-25 00:27:33.993375	
2987	16409	27172130327	2021	1	26	otro_gan_brut	15887.25	2023-06-25 00:27:33.99427	2023-06-25 00:27:33.99427	
2988	16409	27172130327	2021	1	26	otro_ex_nogan	17736.00	2023-06-25 00:27:33.994841	2023-06-25 00:27:33.994841	
2989	16409	27172130327	2021	2	26	otro_gan_brut	15887.25	2023-06-25 00:27:33.995528	2023-06-25 00:27:33.995528	
2990	16409	27172130327	2021	2	26	otro_ex_nogan	17736.00	2023-06-25 00:27:33.99601	2023-06-25 00:27:33.99601	
2991	16409	27172130327	2021	3	26	otro_gan_brut	15887.25	2023-06-25 00:27:33.997332	2023-06-25 00:27:33.997332	
2992	16409	27172130327	2021	3	26	otro_ex_nogan	17736.00	2023-06-25 00:27:33.998116	2023-06-25 00:27:33.998116	
2993	16409	27172130327	2021	4	26	otro_gan_brut	13125.00	2023-06-25 00:27:33.999369	2023-06-25 00:27:33.999369	
2994	16409	27172130327	2021	4	26	otro_ex_nogan	24750.00	2023-06-25 00:27:34.000036	2023-06-25 00:27:34.000036	
2995	16409	27172130327	2021	5	26	otro_gan_brut	13125.00	2023-06-25 00:27:34.00091	2023-06-25 00:27:34.00091	
2996	16409	27172130327	2021	5	26	otro_ex_nogan	24750.00	2023-06-25 00:27:34.001643	2023-06-25 00:27:34.001643	
2997	16409	27172130327	2021	6	26	otro_gan_brut	13125.00	2023-06-25 00:27:34.002576	2023-06-25 00:27:34.002576	
2998	16409	27172130327	2021	6	26	otro_ex_nogan	43687.50	2023-06-25 00:27:34.003156	2023-06-25 00:27:34.003156	
2999	16409	27172130327	2021	7	26	otro_gan_brut	14437.50	2023-06-25 00:27:34.004026	2023-06-25 00:27:34.004026	
3000	16409	27172130327	2021	7	26	otro_ex_nogan	26250.00	2023-06-25 00:27:34.004542	2023-06-25 00:27:34.004542	
3001	16409	27172130327	2021	8	26	otro_ex_nogan	26250.00	2023-06-25 00:27:34.005316	2023-06-25 00:27:34.005316	
3002	16409	27172130327	2021	8	26	otro_gan_brut	16687.50	2023-06-25 00:27:34.00578	2023-06-25 00:27:34.00578	
3003	16409	27172130327	2021	9	26	otro_gan_brut	16687.50	2023-06-25 00:27:34.006414	2023-06-25 00:27:34.006414	
3004	16409	27172130327	2021	9	26	otro_ex_nogan	26250.00	2023-06-25 00:27:34.006853	2023-06-25 00:27:34.006853	
3005	16409	27172130327	2021	10	26	otro_ex_nogan	26250.00	2023-06-25 00:27:34.007627	2023-06-25 00:27:34.007627	
3006	16409	27172130327	2021	10	26	otro_gan_brut	16687.50	2023-06-25 00:27:34.008114	2023-06-25 00:27:34.008114	
3007	16409	27172130327	2021	11	26	otro_gan_brut	18375.00	2023-06-25 00:27:34.008717	2023-06-25 00:27:34.008717	
3008	16409	27172130327	2021	11	26	otro_ex_nogan	28500.00	2023-06-25 00:27:34.009146	2023-06-25 00:27:34.009146	
3009	16409	27172130327	2021	12	26	otro_gan_brut	18375.00	2023-06-25 00:27:34.010365	2023-06-25 00:27:34.010365	
3010	16409	27172130327	2021	12	26	otro_ex_nogan	51937.50	2023-06-25 00:27:34.010846	2023-06-25 00:27:34.010846	
3011	16409	27172130327	2022	1	5	ded_cuota_medica	6257.93	2023-06-25 00:27:34.016344	2023-06-25 00:27:34.016344	
3012	16409	27172130327	2022	2	5	ded_cuota_medica	7134.64	2023-06-25 00:27:34.016737	2023-06-25 00:27:34.016737	
3013	16409	27172130327	2022	3	5	ded_cuota_medica	6705.18	2023-06-25 00:27:34.017102	2023-06-25 00:27:34.017102	
3014	16409	27172130327	2022	4	5	ded_cuota_medica	4678.49	2023-06-25 00:27:34.017462	2023-06-25 00:27:34.017462	
3015	16409	27172130327	2022	1	5	otro_gan_brut	18375.00	2023-06-25 00:27:34.018288	2023-06-25 00:27:34.018288	
3016	16409	27172130327	2022	1	5	otro_ex_nogan	28500.00	2023-06-25 00:27:34.018769	2023-06-25 00:27:34.018769	
3017	16409	27172130327	2022	2	5	otro_ex_nogan	28500.00	2023-06-25 00:27:34.019421	2023-06-25 00:27:34.019421	
3018	16409	27172130327	2022	2	5	otro_gan_brut	18375.00	2023-06-25 00:27:34.019879	2023-06-25 00:27:34.019879	
3019	16409	27172130327	2022	3	5	otro_ex_nogan	28500.00	2023-06-25 00:27:34.020583	2023-06-25 00:27:34.020583	
3020	16409	27172130327	2022	3	5	otro_gan_brut	18375.00	2023-06-25 00:27:34.021007	2023-06-25 00:27:34.021007	
3021	14823	27172609800	2021	2	12	ded_cuota_medica	5935.41	2023-06-25 00:27:34.027544	2023-06-25 00:27:34.027544	
3022	14823	27172609800	2021	3	12	ded_cuota_medica	9599.81	2023-06-25 00:27:34.028105	2023-06-25 00:27:34.028105	
3023	14823	27172609800	2021	4	12	ded_cuota_medica	9098.36	2023-06-25 00:27:34.028606	2023-06-25 00:27:34.028606	
3024	14823	27172609800	2021	5	12	ded_cuota_medica	9533.98	2023-06-25 00:27:34.029095	2023-06-25 00:27:34.029095	
3025	14823	27172609800	2021	6	12	ded_cuota_medica	9723.51	2023-06-25 00:27:34.029843	2023-06-25 00:27:34.029843	
3026	14823	27172609800	2021	7	12	ded_cuota_medica	11311.55	2023-06-25 00:27:34.030579	2023-06-25 00:27:34.030579	
3027	14823	27172609800	2021	8	12	ded_cuota_medica	6685.96	2023-06-25 00:27:34.031131	2023-06-25 00:27:34.031131	
3028	14823	27172609800	2021	9	12	ded_cuota_medica	9969.52	2023-06-25 00:27:34.032039	2023-06-25 00:27:34.032039	
3029	14823	27172609800	2021	10	12	ded_cuota_medica	11730.92	2023-06-25 00:27:34.032565	2023-06-25 00:27:34.032565	
3030	14823	27172609800	2021	11	12	ded_cuota_medica	13003.02	2023-06-25 00:27:34.033214	2023-06-25 00:27:34.033214	
3031	14823	27172609800	2021	12	12	ded_cuota_medica	15713.86	2023-06-25 00:27:34.033795	2023-06-25 00:27:34.033795	
3032	14823	27172609800	2022	1	3	ded_cuota_medica	14446.12	2023-06-25 00:27:34.040916	2023-06-25 00:27:34.040916	
3033	14823	27172609800	2022	2	3	ded_cuota_medica	18081.12	2023-06-25 00:27:34.041579	2023-06-25 00:27:34.041579	
3034	48353	27175432650	2022	1	1	ded_cuota_medica	25180.74	2023-06-25 00:27:34.045869	2023-06-25 00:27:34.045869	
3035	48353	27175432650	2022	2	1	ded_cuota_medica	25180.74	2023-06-25 00:27:34.046153	2023-06-25 00:27:34.046153	
3036	48353	27175432650	2022	1	1	ded_seguros	833.55	2023-06-25 00:27:34.046718	2023-06-25 00:27:34.046718	
3037	48353	27175432650	2022	2	1	ded_seguros	833.55	2023-06-25 00:27:34.047012	2023-06-25 00:27:34.047012	
3038	48353	27175432650	2022	1	1	ded_donaciones	800.00	2023-06-25 00:27:34.047648	2023-06-25 00:27:34.047648	
3039	48353	27175432650	2022	2	1	ded_donaciones	800.00	2023-06-25 00:27:34.047856	2023-06-25 00:27:34.047856	
3040	43517	27177107382	2021	1	5	ded_cuota_medica	759.00	2023-06-25 00:27:34.051635	2023-06-25 00:27:34.051635	
3041	43517	27177107382	2021	2	5	ded_cuota_medica	1077.00	2023-06-25 00:27:34.051947	2023-06-25 00:27:34.051947	
3042	43517	27177107382	2021	3	5	ded_cuota_medica	1077.00	2023-06-25 00:27:34.052146	2023-06-25 00:27:34.052146	
3043	43517	27177107382	2021	4	5	ded_cuota_medica	1077.00	2023-06-25 00:27:34.052345	2023-06-25 00:27:34.052345	
3044	43517	27177107382	2021	6	5	ded_cuota_medica	1845.00	2023-06-25 00:27:34.052645	2023-06-25 00:27:34.052645	
3045	43517	27177107382	2021	10	5	ded_cuota_medica	1592.00	2023-06-25 00:27:34.052953	2023-06-25 00:27:34.052953	
3046	43517	27177107382	2021	11	5	ded_cuota_medica	1592.00	2023-06-25 00:27:34.053149	2023-06-25 00:27:34.053149	
3047	43517	27177107382	2022	1	2	ded_cuota_medica	1831.00	2023-06-25 00:27:34.056887	2023-06-25 00:27:34.056887	
3048	43517	27177107382	2022	2	2	ded_cuota_medica	1831.00	2023-06-25 00:27:34.05712	2023-06-25 00:27:34.05712	
3049	43517	27177107382	2022	1	2	ded_domestica	20000.00	2023-06-25 00:27:34.057599	2023-06-25 00:27:34.057599	
3050	43517	27177107382	2022	2	2	ded_domestica	24000.00	2023-06-25 00:27:34.057934	2023-06-25 00:27:34.057934	
3051	39453	27178240256	2021	1	8	ded_cuota_medica	3500.00	2023-06-25 00:27:34.068678	2023-06-25 00:27:34.068678	
3052	39453	27178240256	2021	2	8	ded_cuota_medica	3500.00	2023-06-25 00:27:34.068942	2023-06-25 00:27:34.068942	
3053	39453	27178240256	2021	3	8	ded_cuota_medica	3500.00	2023-06-25 00:27:34.069188	2023-06-25 00:27:34.069188	
3054	39453	27178240256	2021	4	8	ded_cuota_medica	3500.00	2023-06-25 00:27:34.069873	2023-06-25 00:27:34.069873	
3055	39453	27178240256	2021	5	8	ded_cuota_medica	3500.00	2023-06-25 00:27:34.070185	2023-06-25 00:27:34.070185	
3056	39453	27178240256	2021	6	8	ded_cuota_medica	3500.00	2023-06-25 00:27:34.070463	2023-06-25 00:27:34.070463	
3057	39453	27178240256	2021	7	8	ded_cuota_medica	5000.00	2023-06-25 00:27:34.070795	2023-06-25 00:27:34.070795	
3058	39453	27178240256	2021	8	8	ded_cuota_medica	3500.00	2023-06-25 00:27:34.071113	2023-06-25 00:27:34.071113	
3059	39453	27178240256	2021	9	8	ded_cuota_medica	3500.00	2023-06-25 00:27:34.071315	2023-06-25 00:27:34.071315	
3060	39453	27178240256	2021	10	8	ded_cuota_medica	3500.00	2023-06-25 00:27:34.071515	2023-06-25 00:27:34.071515	
3061	39453	27178240256	2021	11	8	ded_cuota_medica	4000.00	2023-06-25 00:27:34.071819	2023-06-25 00:27:34.071819	
3062	39453	27178240256	2021	12	8	ded_cuota_medica	4000.00	2023-06-25 00:27:34.072015	2023-06-25 00:27:34.072015	
3063	39453	27178240256	2021	6	8	ded_gastos_medicos	6360.00	2023-06-25 00:27:34.072455	2023-06-25 00:27:34.072455	
3064	39453	27178240256	2021	5	8	ded_gastos_medicos	1000.00	2023-06-25 00:27:34.072881	2023-06-25 00:27:34.072881	
3065	39453	27178240256	2021	10	8	ded_gastos_medicos	2340.00	2023-06-25 00:27:34.073318	2023-06-25 00:27:34.073318	
3066	39453	27178240256	2021	11	8	ded_gastos_medicos	868.00	2023-06-25 00:27:34.073623	2023-06-25 00:27:34.073623	
3067	39453	27178240256	2021	1	8	FECDEVDESDE	100.00	2023-06-25 00:27:34.073963	2023-06-25 00:27:34.073963	
3068	39453	27178240256	2021	2	8	FECDEVDESDE	100.00	2023-06-25 00:27:34.074175	2023-06-25 00:27:34.074175	
3069	39453	27178240256	2021	3	8	FECDEVDESDE	100.00	2023-06-25 00:27:34.074384	2023-06-25 00:27:34.074384	
3070	39453	27178240256	2021	4	8	FECDEVDESDE	100.00	2023-06-25 00:27:34.074588	2023-06-25 00:27:34.074588	
3071	39453	27178240256	2021	5	8	FECDEVDESDE	100.00	2023-06-25 00:27:34.074793	2023-06-25 00:27:34.074793	
3072	39453	27178240256	2021	6	8	FECDEVDESDE	100.00	2023-06-25 00:27:34.074999	2023-06-25 00:27:34.074999	
3073	39453	27178240256	2021	7	8	FECDEVDESDE	100.00	2023-06-25 00:27:34.075207	2023-06-25 00:27:34.075207	
3074	39453	27178240256	2021	8	8	FECDEVDESDE	100.00	2023-06-25 00:27:34.075412	2023-06-25 00:27:34.075412	
3075	39453	27178240256	2021	9	8	FECDEVDESDE	100.00	2023-06-25 00:27:34.075615	2023-06-25 00:27:34.075615	
3076	39453	27178240256	2021	10	8	FECDEVDESDE	100.00	2023-06-25 00:27:34.075825	2023-06-25 00:27:34.075825	
3077	39453	27178240256	2021	11	8	FECDEVDESDE	100.00	2023-06-25 00:27:34.076038	2023-06-25 00:27:34.076038	
3078	39453	27178240256	2021	12	8	FECDEVDESDE	100.00	2023-06-25 00:27:34.076257	2023-06-25 00:27:34.076257	
3079	34687	27179707069	2021	5	9	ded_cuota_medica	5022.58	2023-06-25 00:27:34.080495	2023-06-25 00:27:34.080495	
3080	34687	27179707069	2021	6	9	ded_cuota_medica	6880.84	2023-06-25 00:27:34.080896	2023-06-25 00:27:34.080896	
3081	34687	27179707069	2021	7	9	ded_cuota_medica	6373.66	2023-06-25 00:27:34.081244	2023-06-25 00:27:34.081244	
3082	34687	27179707069	2021	8	9	ded_cuota_medica	2777.72	2023-06-25 00:27:34.081591	2023-06-25 00:27:34.081591	
3083	34687	27179707069	2021	9	9	ded_cuota_medica	8161.38	2023-06-25 00:27:34.081951	2023-06-25 00:27:34.081951	
3084	34687	27179707069	2021	10	9	ded_cuota_medica	8995.47	2023-06-25 00:27:34.082292	2023-06-25 00:27:34.082292	
3085	34687	27179707069	2021	11	9	ded_cuota_medica	8662.74	2023-06-25 00:27:34.083224	2023-06-25 00:27:34.083224	
3086	34687	27179707069	2021	12	9	ded_cuota_medica	8279.97	2023-06-25 00:27:34.083587	2023-06-25 00:27:34.083587	
3087	34687	27179707069	2021	1	9	ded_cuota_medica	2122.90	2023-06-25 00:27:34.084074	2023-06-25 00:27:34.084074	
3088	34687	27179707069	2021	2	9	ded_cuota_medica	2606.61	2023-06-25 00:27:34.084401	2023-06-25 00:27:34.084401	
3089	34687	27179707069	2021	4	9	ded_cuota_medica	854.73	2023-06-25 00:27:34.084739	2023-06-25 00:27:34.084739	
3090	17346	27183191530	2021	1	15	ded_cuota_medica	4116.00	2023-06-25 00:27:34.090013	2023-06-25 00:27:34.090013	
3091	17346	27183191530	2021	2	15	ded_cuota_medica	3798.00	2023-06-25 00:27:34.091172	2023-06-25 00:27:34.091172	
3092	17346	27183191530	2021	4	15	ded_cuota_medica	8008.00	2023-06-25 00:27:34.09184	2023-06-25 00:27:34.09184	
3093	17346	27183191530	2021	5	15	ded_cuota_medica	4685.00	2023-06-25 00:27:34.092387	2023-06-25 00:27:34.092387	
3094	17346	27183191530	2021	6	15	ded_cuota_medica	4296.00	2023-06-25 00:27:34.092878	2023-06-25 00:27:34.092878	
3095	17346	27183191530	2021	7	15	ded_cuota_medica	3305.00	2023-06-25 00:27:34.09338	2023-06-25 00:27:34.09338	
3096	17346	27183191530	2021	8	15	ded_cuota_medica	5802.00	2023-06-25 00:27:34.093835	2023-06-25 00:27:34.093835	
3097	17346	27183191530	2021	9	15	ded_cuota_medica	1044.00	2023-06-25 00:27:34.094317	2023-06-25 00:27:34.094317	
3098	17346	27183191530	2021	10	15	ded_cuota_medica	6973.00	2023-06-25 00:27:34.094778	2023-06-25 00:27:34.094778	
3099	17346	27183191530	2021	11	15	ded_cuota_medica	7744.00	2023-06-25 00:27:34.095332	2023-06-25 00:27:34.095332	
3100	17346	27183191530	2021	12	15	ded_cuota_medica	7019.00	2023-06-25 00:27:34.095712	2023-06-25 00:27:34.095712	
3101	17346	27183191530	2022	1	3	ded_cuota_medica	7019.00	2023-06-25 00:27:34.100635	2023-06-25 00:27:34.100635	
3102	17346	27183191530	2022	2	3	ded_cuota_medica	7837.00	2023-06-25 00:27:34.101062	2023-06-25 00:27:34.101062	
3103	17346	27183191530	2022	3	3	ded_cuota_medica	9360.00	2023-06-25 00:27:34.101608	2023-06-25 00:27:34.101608	
3104	18191	27208638934	2021	1	4	ded_cuota_medica	1.00	2023-06-25 00:27:34.105946	2023-06-25 00:27:34.105946	
3105	18191	27208638934	2021	9	4	ded_donaciones	10000.00	2023-06-25 00:27:34.10639	2023-06-25 00:27:34.10639	
3106	18191	27208638934	2021	10	4	ded_donaciones	30000.00	2023-06-25 00:27:34.106743	2023-06-25 00:27:34.106743	
3107	18191	27208638934	2021	1	4	fam_hijos_100	100.00	2023-06-25 00:27:34.107078	2023-06-25 00:27:34.107078	
3108	18191	27208638934	2021	2	4	fam_hijos_100	100.00	2023-06-25 00:27:34.107277	2023-06-25 00:27:34.107277	
3109	18191	27208638934	2021	3	4	fam_hijos_100	100.00	2023-06-25 00:27:34.107473	2023-06-25 00:27:34.107473	
3110	18191	27208638934	2021	4	4	fam_hijos_100	100.00	2023-06-25 00:27:34.107666	2023-06-25 00:27:34.107666	
3111	18191	27208638934	2021	5	4	fam_hijos_100	100.00	2023-06-25 00:27:34.107858	2023-06-25 00:27:34.107858	
3112	18191	27208638934	2021	6	4	fam_hijos_100	100.00	2023-06-25 00:27:34.108054	2023-06-25 00:27:34.108054	
3113	18191	27208638934	2021	7	4	fam_hijos_100	100.00	2023-06-25 00:27:34.108246	2023-06-25 00:27:34.108246	
3114	18191	27208638934	2021	8	4	fam_hijos_100	100.00	2023-06-25 00:27:34.108436	2023-06-25 00:27:34.108436	
3115	18191	27208638934	2021	9	4	fam_hijos_100	100.00	2023-06-25 00:27:34.108628	2023-06-25 00:27:34.108628	
3116	18191	27208638934	2021	10	4	fam_hijos_100	100.00	2023-06-25 00:27:34.108819	2023-06-25 00:27:34.108819	
3117	18191	27208638934	2021	11	4	fam_hijos_100	100.00	2023-06-25 00:27:34.109008	2023-06-25 00:27:34.109008	
3118	18191	27208638934	2021	12	4	fam_hijos_100	100.00	2023-06-25 00:27:34.109212	2023-06-25 00:27:34.109212	
3119	18191	27208638934	2021	1	4	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.10954	2023-06-25 00:27:34.10954	
3120	18191	27208638934	2021	2	4	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.109749	2023-06-25 00:27:34.109749	
3121	18191	27208638934	2021	3	4	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.109957	2023-06-25 00:27:34.109957	
3122	18191	27208638934	2021	4	4	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.110185	2023-06-25 00:27:34.110185	
3123	18191	27208638934	2021	5	4	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.11039	2023-06-25 00:27:34.11039	
3124	18191	27208638934	2021	6	4	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.110591	2023-06-25 00:27:34.110591	
3125	18191	27208638934	2021	7	4	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.110791	2023-06-25 00:27:34.110791	
3126	18191	27208638934	2021	8	4	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.110994	2023-06-25 00:27:34.110994	
3127	18191	27208638934	2021	9	4	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.111193	2023-06-25 00:27:34.111193	
3128	18191	27208638934	2021	10	4	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.111393	2023-06-25 00:27:34.111393	
3129	18191	27208638934	2021	11	4	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.11161	2023-06-25 00:27:34.11161	
3130	18191	27208638934	2021	12	4	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.111804	2023-06-25 00:27:34.111804	
3131	18191	27208638934	2022	1	1	ded_cuota_medica	0.01	2023-06-25 00:27:34.116231	2023-06-25 00:27:34.116231	
3132	18191	27208638934	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:34.116566	2023-06-25 00:27:34.116566	
3133	18191	27208638934	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:34.116768	2023-06-25 00:27:34.116768	
3134	18191	27208638934	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:34.116962	2023-06-25 00:27:34.116962	
3135	18191	27208638934	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:34.117153	2023-06-25 00:27:34.117153	
3136	18191	27208638934	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:34.117364	2023-06-25 00:27:34.117364	
3137	18191	27208638934	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:34.117558	2023-06-25 00:27:34.117558	
3138	18191	27208638934	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:34.117751	2023-06-25 00:27:34.117751	
3139	18191	27208638934	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:34.117946	2023-06-25 00:27:34.117946	
3140	18191	27208638934	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:34.118135	2023-06-25 00:27:34.118135	
3141	18191	27208638934	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:34.118334	2023-06-25 00:27:34.118334	
3142	18191	27208638934	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:34.118527	2023-06-25 00:27:34.118527	
3143	18191	27208638934	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:27:34.11872	2023-06-25 00:27:34.11872	
3144	18191	27208638934	2022	1	1	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.119627	2023-06-25 00:27:34.119627	
3145	18191	27208638934	2022	2	1	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.120606	2023-06-25 00:27:34.120606	
3146	18191	27208638934	2022	3	1	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.120894	2023-06-25 00:27:34.120894	
3147	18191	27208638934	2022	4	1	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.121111	2023-06-25 00:27:34.121111	
3148	18191	27208638934	2022	5	1	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.12134	2023-06-25 00:27:34.12134	
3149	18191	27208638934	2022	6	1	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.121556	2023-06-25 00:27:34.121556	
3150	18191	27208638934	2022	7	1	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.121767	2023-06-25 00:27:34.121767	
3151	18191	27208638934	2022	8	1	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.122581	2023-06-25 00:27:34.122581	
3152	18191	27208638934	2022	9	1	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.123094	2023-06-25 00:27:34.123094	
3153	18191	27208638934	2022	10	1	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.123786	2023-06-25 00:27:34.123786	
3154	18191	27208638934	2022	11	1	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.124281	2023-06-25 00:27:34.124281	
3155	18191	27208638934	2022	12	1	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.124775	2023-06-25 00:27:34.124775	
3156	19668	27208670870	2021	7	11	ded_cuota_medica	640.00	2023-06-25 00:27:34.130233	2023-06-25 00:27:34.130233	
3157	19668	27208670870	2021	8	11	ded_cuota_medica	290.00	2023-06-25 00:27:34.131399	2023-06-25 00:27:34.131399	
3158	19668	27208670870	2021	9	11	ded_cuota_medica	80.00	2023-06-25 00:27:34.132007	2023-06-25 00:27:34.132007	
3159	19668	27208670870	2021	10	11	ded_cuota_medica	440.00	2023-06-25 00:27:34.132516	2023-06-25 00:27:34.132516	
3160	19668	27208670870	2021	12	11	ded_cuota_medica	140.00	2023-06-25 00:27:34.132921	2023-06-25 00:27:34.132921	
3161	35799	27215526491	2021	5	7	ded_alquiler	8000.00	2023-06-25 00:27:34.146159	2023-06-25 00:27:34.146159	
3162	35799	27215526491	2021	6	7	ded_alquiler	8000.00	2023-06-25 00:27:34.146439	2023-06-25 00:27:34.146439	
3163	35799	27215526491	2021	7	7	ded_alquiler	8000.00	2023-06-25 00:27:34.146635	2023-06-25 00:27:34.146635	
3164	35799	27215526491	2021	8	7	ded_alquiler	8000.00	2023-06-25 00:27:34.146884	2023-06-25 00:27:34.146884	
3165	35799	27215526491	2021	9	7	ded_alquiler	8000.00	2023-06-25 00:27:34.147084	2023-06-25 00:27:34.147084	
3166	35799	27215526491	2021	10	7	ded_alquiler	8000.00	2023-06-25 00:27:34.147304	2023-06-25 00:27:34.147304	
3167	35799	27215526491	2021	11	7	ded_alquiler	8000.00	2023-06-25 00:27:34.147499	2023-06-25 00:27:34.147499	
3168	35799	27215526491	2021	12	7	ded_alquiler	8000.00	2023-06-25 00:27:34.147694	2023-06-25 00:27:34.147694	
3169	35799	27215526491	2021	1	7	ded_alquiler	4000.00	2023-06-25 00:27:34.148136	2023-06-25 00:27:34.148136	
3170	35799	27215526491	2021	2	7	ded_alquiler	4000.00	2023-06-25 00:27:34.148331	2023-06-25 00:27:34.148331	
3171	35799	27215526491	2021	3	7	ded_alquiler	4000.00	2023-06-25 00:27:34.148526	2023-06-25 00:27:34.148526	
3172	35799	27215526491	2021	4	7	ded_alquiler	4000.00	2023-06-25 00:27:34.148711	2023-06-25 00:27:34.148711	
3173	35799	27215526491	2022	1	2	ded_alquiler	8000.00	2023-06-25 00:27:34.152519	2023-06-25 00:27:34.152519	
3174	35799	27215526491	2022	2	2	ded_alquiler	8000.00	2023-06-25 00:27:34.153026	2023-06-25 00:27:34.153026	
3175	35799	27215526491	2022	3	2	ded_alquiler	8000.00	2023-06-25 00:27:34.153579	2023-06-25 00:27:34.153579	
3176	19207	27218720914	2021	2	3	ded_gastos_medicos	14000.00	2023-06-25 00:27:34.158386	2023-06-25 00:27:34.158386	
3177	19207	27218720914	2021	4	3	ded_gastos_medicos	4000.00	2023-06-25 00:27:34.158918	2023-06-25 00:27:34.158918	
3178	19207	27218720914	2021	8	3	ded_gastos_medicos	4800.00	2023-06-25 00:27:34.159256	2023-06-25 00:27:34.159256	
3179	19207	27218720914	2021	9	3	ded_gastos_medicos	6000.00	2023-06-25 00:27:34.159619	2023-06-25 00:27:34.159619	
3180	19207	27218720914	2021	12	3	ded_indumentaria	34000.00	2023-06-25 00:27:34.1609	2023-06-25 00:27:34.1609	
3181	19207	27218720914	2021	3	3	ded_indumentaria	8000.00	2023-06-25 00:27:34.161518	2023-06-25 00:27:34.161518	
3182	19199	27219725529	2021	1	11	ded_cuota_medica	7736.00	2023-06-25 00:27:34.16995	2023-06-25 00:27:34.16995	
3183	19199	27219725529	2021	2	11	ded_cuota_medica	7736.00	2023-06-25 00:27:34.170169	2023-06-25 00:27:34.170169	
3184	19199	27219725529	2021	3	11	ded_cuota_medica	7736.00	2023-06-25 00:27:34.170355	2023-06-25 00:27:34.170355	
3185	19199	27219725529	2021	4	11	ded_cuota_medica	7736.00	2023-06-25 00:27:34.170535	2023-06-25 00:27:34.170535	
3186	19199	27219725529	2021	5	11	ded_cuota_medica	8665.00	2023-06-25 00:27:34.170819	2023-06-25 00:27:34.170819	
3187	19199	27219725529	2021	6	11	ded_cuota_medica	8665.00	2023-06-25 00:27:34.170995	2023-06-25 00:27:34.170995	
3188	19199	27219725529	2021	7	11	ded_cuota_medica	9964.00	2023-06-25 00:27:34.171269	2023-06-25 00:27:34.171269	
3189	19199	27219725529	2021	8	11	ded_cuota_medica	9964.00	2023-06-25 00:27:34.171445	2023-06-25 00:27:34.171445	
3190	19199	27219725529	2021	9	11	ded_cuota_medica	11458.00	2023-06-25 00:27:34.171719	2023-06-25 00:27:34.171719	
3191	19199	27219725529	2021	10	11	ded_cuota_medica	11458.00	2023-06-25 00:27:34.171902	2023-06-25 00:27:34.171902	
3192	19199	27219725529	2021	11	11	ded_cuota_medica	11458.00	2023-06-25 00:27:34.172078	2023-06-25 00:27:34.172078	
3193	19199	27219725529	2021	12	11	ded_cuota_medica	12375.00	2023-06-25 00:27:34.17235	2023-06-25 00:27:34.17235	
3194	19199	27219725529	2021	9	11	ded_cuota_medica	6260.00	2023-06-25 00:27:34.172797	2023-06-25 00:27:34.172797	
3195	19199	27219725529	2021	10	11	ded_cuota_medica	6260.00	2023-06-25 00:27:34.172978	2023-06-25 00:27:34.172978	
3196	19199	27219725529	2021	11	11	ded_cuota_medica	6260.00	2023-06-25 00:27:34.173174	2023-06-25 00:27:34.173174	
3197	19199	27219725529	2021	12	11	ded_cuota_medica	6260.00	2023-06-25 00:27:34.173906	2023-06-25 00:27:34.173906	
3198	19199	27219725529	2021	1	11	ded_seguros	2025.00	2023-06-25 00:27:34.174436	2023-06-25 00:27:34.174436	
3199	19199	27219725529	2021	2	11	ded_seguros	2025.00	2023-06-25 00:27:34.174624	2023-06-25 00:27:34.174624	
3200	19199	27219725529	2021	3	11	ded_seguros	2025.00	2023-06-25 00:27:34.174808	2023-06-25 00:27:34.174808	
3201	19199	27219725529	2021	4	11	ded_seguros	2025.00	2023-06-25 00:27:34.175001	2023-06-25 00:27:34.175001	
3202	19199	27219725529	2021	5	11	ded_seguros	2025.00	2023-06-25 00:27:34.175173	2023-06-25 00:27:34.175173	
3203	19199	27219725529	2021	6	11	ded_seguros	2025.00	2023-06-25 00:27:34.175337	2023-06-25 00:27:34.175337	
3204	19199	27219725529	2021	7	11	ded_seguros	2025.00	2023-06-25 00:27:34.17551	2023-06-25 00:27:34.17551	
3205	19199	27219725529	2021	8	11	ded_seguros	2025.00	2023-06-25 00:27:34.175706	2023-06-25 00:27:34.175706	
3206	19199	27219725529	2021	9	11	ded_seguros	2025.00	2023-06-25 00:27:34.175916	2023-06-25 00:27:34.175916	
3207	19199	27219725529	2021	10	11	ded_seguros	2050.00	2023-06-25 00:27:34.176246	2023-06-25 00:27:34.176246	
3208	19199	27219725529	2021	11	11	ded_seguros	2050.00	2023-06-25 00:27:34.176497	2023-06-25 00:27:34.176497	
3209	19199	27219725529	2021	12	11	ded_seguros	2050.00	2023-06-25 00:27:34.176737	2023-06-25 00:27:34.176737	
3210	19199	27219725529	2021	12	11	ded_donaciones	75000.00	2023-06-25 00:27:34.177307	2023-06-25 00:27:34.177307	
3211	19199	27219725529	2021	1	11	ded_donaciones	1200.00	2023-06-25 00:27:34.177869	2023-06-25 00:27:34.177869	
3212	19199	27219725529	2021	2	11	ded_donaciones	1200.00	2023-06-25 00:27:34.178096	2023-06-25 00:27:34.178096	
3213	19199	27219725529	2021	3	11	ded_donaciones	1200.00	2023-06-25 00:27:34.178335	2023-06-25 00:27:34.178335	
3214	19199	27219725529	2021	4	11	ded_donaciones	1200.00	2023-06-25 00:27:34.178546	2023-06-25 00:27:34.178546	
3215	19199	27219725529	2021	5	11	ded_donaciones	1200.00	2023-06-25 00:27:34.178772	2023-06-25 00:27:34.178772	
3216	19199	27219725529	2021	6	11	ded_donaciones	1200.00	2023-06-25 00:27:34.178976	2023-06-25 00:27:34.178976	
3217	19199	27219725529	2021	7	11	ded_donaciones	1200.00	2023-06-25 00:27:34.179175	2023-06-25 00:27:34.179175	
3218	19199	27219725529	2021	8	11	ded_donaciones	1200.00	2023-06-25 00:27:34.179376	2023-06-25 00:27:34.179376	
3219	19199	27219725529	2021	9	11	ded_donaciones	1200.00	2023-06-25 00:27:34.179576	2023-06-25 00:27:34.179576	
3220	19199	27219725529	2021	10	11	ded_donaciones	1200.00	2023-06-25 00:27:34.179776	2023-06-25 00:27:34.179776	
3221	19199	27219725529	2021	11	11	ded_donaciones	1200.00	2023-06-25 00:27:34.179975	2023-06-25 00:27:34.179975	
3222	19199	27219725529	2021	12	11	ded_donaciones	1200.00	2023-06-25 00:27:34.180188	2023-06-25 00:27:34.180188	
3223	19199	27219725529	2021	1	11	ded_int_hipotecarios	2475.00	2023-06-25 00:27:34.180613	2023-06-25 00:27:34.180613	
3224	19199	27219725529	2021	2	11	ded_int_hipotecarios	2475.00	2023-06-25 00:27:34.180818	2023-06-25 00:27:34.180818	
3225	19199	27219725529	2021	3	11	ded_int_hipotecarios	2475.00	2023-06-25 00:27:34.181013	2023-06-25 00:27:34.181013	
3226	19199	27219725529	2021	4	11	ded_int_hipotecarios	2475.00	2023-06-25 00:27:34.181213	2023-06-25 00:27:34.181213	
3227	19199	27219725529	2021	5	11	ded_int_hipotecarios	2475.00	2023-06-25 00:27:34.181454	2023-06-25 00:27:34.181454	
3228	19199	27219725529	2021	6	11	ded_int_hipotecarios	2475.00	2023-06-25 00:27:34.181662	2023-06-25 00:27:34.181662	
3229	19199	27219725529	2021	7	11	ded_int_hipotecarios	2475.00	2023-06-25 00:27:34.181862	2023-06-25 00:27:34.181862	
3230	19199	27219725529	2021	8	11	ded_int_hipotecarios	2475.00	2023-06-25 00:27:34.182183	2023-06-25 00:27:34.182183	
3231	19199	27219725529	2021	9	11	ded_int_hipotecarios	2475.00	2023-06-25 00:27:34.182431	2023-06-25 00:27:34.182431	
3232	19199	27219725529	2021	10	11	ded_int_hipotecarios	2475.00	2023-06-25 00:27:34.182679	2023-06-25 00:27:34.182679	
3233	19199	27219725529	2021	11	11	ded_int_hipotecarios	2475.00	2023-06-25 00:27:34.182923	2023-06-25 00:27:34.182923	
3234	19199	27219725529	2021	12	11	ded_int_hipotecarios	2475.00	2023-06-25 00:27:34.183138	2023-06-25 00:27:34.183138	
3235	19199	27219725529	2021	2	11	ded_gastos_medicos	2000.00	2023-06-25 00:27:34.183639	2023-06-25 00:27:34.183639	
3236	19199	27219725529	2021	3	11	ded_gastos_medicos	4240.00	2023-06-25 00:27:34.184461	2023-06-25 00:27:34.184461	
3237	19199	27219725529	2021	4	11	ded_gastos_medicos	1520.00	2023-06-25 00:27:34.184952	2023-06-25 00:27:34.184952	
3238	19199	27219725529	2021	6	11	ded_gastos_medicos	600.00	2023-06-25 00:27:34.185643	2023-06-25 00:27:34.185643	
3239	19199	27219725529	2021	9	11	ded_gastos_medicos	800.00	2023-06-25 00:27:34.186225	2023-06-25 00:27:34.186225	
3240	19199	27219725529	2021	7	11	ded_gastos_medicos	9600.00	2023-06-25 00:27:34.187175	2023-06-25 00:27:34.187175	
3241	19199	27219725529	2021	9	11	ded_gastos_medicos	10000.00	2023-06-25 00:27:34.187591	2023-06-25 00:27:34.187591	
3242	19199	27219725529	2021	7	11	ded_gastos_medicos	2400.00	2023-06-25 00:27:34.188179	2023-06-25 00:27:34.188179	
3243	19199	27219725529	2021	1	11	ded_gastos_medicos	8200.00	2023-06-25 00:27:34.188694	2023-06-25 00:27:34.188694	
3244	19199	27219725529	2021	3	11	ded_gastos_medicos	8600.00	2023-06-25 00:27:34.189104	2023-06-25 00:27:34.189104	
3245	19199	27219725529	2021	5	11	ded_gastos_medicos	9000.00	2023-06-25 00:27:34.189531	2023-06-25 00:27:34.189531	
3246	19199	27219725529	2021	2	11	ded_gastos_medicos	9400.00	2023-06-25 00:27:34.190176	2023-06-25 00:27:34.190176	
3247	19199	27219725529	2021	4	11	ded_gastos_medicos	9800.00	2023-06-25 00:27:34.190595	2023-06-25 00:27:34.190595	
3248	19199	27219725529	2021	6	11	ded_gastos_medicos	10200.00	2023-06-25 00:27:34.190975	2023-06-25 00:27:34.190975	
3249	19199	27219725529	2021	8	11	ded_gastos_medicos	10600.00	2023-06-25 00:27:34.191361	2023-06-25 00:27:34.191361	
3250	19199	27219725529	2021	8	11	ded_gastos_medicos	1120.00	2023-06-25 00:27:34.192107	2023-06-25 00:27:34.192107	
3251	19199	27219725529	2021	9	11	ded_gastos_medicos	1120.00	2023-06-25 00:27:34.192703	2023-06-25 00:27:34.192703	
3252	19199	27219725529	2021	10	11	ded_gastos_medicos	1120.00	2023-06-25 00:27:34.193423	2023-06-25 00:27:34.193423	
3253	19199	27219725529	2021	10	11	ded_gastos_medicos	9200.00	2023-06-25 00:27:34.19442	2023-06-25 00:27:34.19442	
3254	19199	27219725529	2021	12	11	ded_gastos_medicos	9400.00	2023-06-25 00:27:34.19476	2023-06-25 00:27:34.19476	
3255	19199	27219725529	2021	11	11	ded_gastos_medicos	4200.00	2023-06-25 00:27:34.19525	2023-06-25 00:27:34.19525	
3256	19199	27219725529	2021	1	11	ded_retiro	2050.00	2023-06-25 00:27:34.1957	2023-06-25 00:27:34.1957	
3257	19199	27219725529	2021	2	11	ded_retiro	2050.00	2023-06-25 00:27:34.19589	2023-06-25 00:27:34.19589	
3258	19199	27219725529	2021	3	11	ded_retiro	2050.00	2023-06-25 00:27:34.196077	2023-06-25 00:27:34.196077	
3259	19199	27219725529	2021	4	11	ded_retiro	2050.00	2023-06-25 00:27:34.196258	2023-06-25 00:27:34.196258	
3260	19199	27219725529	2021	5	11	ded_retiro	2050.00	2023-06-25 00:27:34.196438	2023-06-25 00:27:34.196438	
3261	19199	27219725529	2021	6	11	ded_retiro	2050.00	2023-06-25 00:27:34.196616	2023-06-25 00:27:34.196616	
3262	19199	27219725529	2021	7	11	ded_retiro	2050.00	2023-06-25 00:27:34.196801	2023-06-25 00:27:34.196801	
3263	19199	27219725529	2021	8	11	ded_retiro	2050.00	2023-06-25 00:27:34.196981	2023-06-25 00:27:34.196981	
3264	19199	27219725529	2021	9	11	ded_retiro	2050.00	2023-06-25 00:27:34.19716	2023-06-25 00:27:34.19716	
3265	19199	27219725529	2021	10	11	ded_retiro	2050.00	2023-06-25 00:27:34.197554	2023-06-25 00:27:34.197554	
3266	19199	27219725529	2021	11	11	ded_retiro	2050.00	2023-06-25 00:27:34.197767	2023-06-25 00:27:34.197767	
3267	19199	27219725529	2021	12	11	ded_retiro	2050.00	2023-06-25 00:27:34.19798	2023-06-25 00:27:34.19798	
3268	19199	27219725529	2022	1	1	ded_cuota_medica	12375.00	2023-06-25 00:27:34.202782	2023-06-25 00:27:34.202782	
3269	19199	27219725529	2022	2	1	ded_cuota_medica	12375.00	2023-06-25 00:27:34.202965	2023-06-25 00:27:34.202965	
3270	19199	27219725529	2022	3	1	ded_cuota_medica	12375.00	2023-06-25 00:27:34.203135	2023-06-25 00:27:34.203135	
3271	19199	27219725529	2022	4	1	ded_cuota_medica	12375.00	2023-06-25 00:27:34.203301	2023-06-25 00:27:34.203301	
3272	19199	27219725529	2022	1	1	ded_cuota_medica	6260.00	2023-06-25 00:27:34.203697	2023-06-25 00:27:34.203697	
3273	19199	27219725529	2022	2	1	ded_cuota_medica	6260.00	2023-06-25 00:27:34.203876	2023-06-25 00:27:34.203876	
3274	19199	27219725529	2022	3	1	ded_cuota_medica	6260.00	2023-06-25 00:27:34.204043	2023-06-25 00:27:34.204043	
3275	19199	27219725529	2022	4	1	ded_cuota_medica	6260.00	2023-06-25 00:27:34.204209	2023-06-25 00:27:34.204209	
3276	19199	27219725529	2022	1	1	ded_seguros	2050.00	2023-06-25 00:27:34.204599	2023-06-25 00:27:34.204599	
3277	19199	27219725529	2022	2	1	ded_seguros	2050.00	2023-06-25 00:27:34.204772	2023-06-25 00:27:34.204772	
3278	19199	27219725529	2022	3	1	ded_seguros	2050.00	2023-06-25 00:27:34.204944	2023-06-25 00:27:34.204944	
3279	19199	27219725529	2022	4	1	ded_seguros	2050.00	2023-06-25 00:27:34.205119	2023-06-25 00:27:34.205119	
3280	19199	27219725529	2022	1	1	ded_donaciones	5200.00	2023-06-25 00:27:34.205533	2023-06-25 00:27:34.205533	
3281	19199	27219725529	2022	2	1	ded_donaciones	5200.00	2023-06-25 00:27:34.205714	2023-06-25 00:27:34.205714	
3282	19199	27219725529	2022	3	1	ded_donaciones	5200.00	2023-06-25 00:27:34.205882	2023-06-25 00:27:34.205882	
3283	19199	27219725529	2022	4	1	ded_donaciones	5200.00	2023-06-25 00:27:34.20605	2023-06-25 00:27:34.20605	
3284	19199	27219725529	2022	1	1	ded_int_hipotecarios	2455.00	2023-06-25 00:27:34.206456	2023-06-25 00:27:34.206456	
3285	19199	27219725529	2022	2	1	ded_int_hipotecarios	2455.00	2023-06-25 00:27:34.206639	2023-06-25 00:27:34.206639	
3286	19199	27219725529	2022	3	1	ded_int_hipotecarios	2455.00	2023-06-25 00:27:34.20681	2023-06-25 00:27:34.20681	
3287	19199	27219725529	2022	4	1	ded_int_hipotecarios	2455.00	2023-06-25 00:27:34.206986	2023-06-25 00:27:34.206986	
3288	19199	27219725529	2022	1	1	ded_retiro	2050.00	2023-06-25 00:27:34.207378	2023-06-25 00:27:34.207378	
3289	19199	27219725529	2022	2	1	ded_retiro	2050.00	2023-06-25 00:27:34.207551	2023-06-25 00:27:34.207551	
3290	19199	27219725529	2022	3	1	ded_retiro	2050.00	2023-06-25 00:27:34.207721	2023-06-25 00:27:34.207721	
3291	19199	27219725529	2022	4	1	ded_retiro	2050.00	2023-06-25 00:27:34.207888	2023-06-25 00:27:34.207888	
3292	37222	27225268938	2021	5	7	ded_cuota_medica	778.12	2023-06-25 00:27:34.212118	2023-06-25 00:27:34.212118	
3293	37222	27225268938	2021	9	7	ded_cuota_medica	1322.32	2023-06-25 00:27:34.212411	2023-06-25 00:27:34.212411	
3294	37222	27225268938	2021	11	7	ded_cuota_medica	976.81	2023-06-25 00:27:34.2127	2023-06-25 00:27:34.2127	
3295	37222	27225268938	2021	12	7	ded_cuota_medica	650.99	2023-06-25 00:27:34.212979	2023-06-25 00:27:34.212979	
3296	37222	27225268938	2021	1	7	ded_seguros	135.00	2023-06-25 00:27:34.21351	2023-06-25 00:27:34.21351	
3297	37222	27225268938	2021	2	7	ded_seguros	135.00	2023-06-25 00:27:34.213746	2023-06-25 00:27:34.213746	
3298	37222	27225268938	2021	3	7	ded_seguros	135.00	2023-06-25 00:27:34.21397	2023-06-25 00:27:34.21397	
3299	37222	27225268938	2021	4	7	ded_seguros	135.00	2023-06-25 00:27:34.214196	2023-06-25 00:27:34.214196	
3300	37222	27225268938	2021	5	7	ded_seguros	135.00	2023-06-25 00:27:34.214424	2023-06-25 00:27:34.214424	
3301	37222	27225268938	2021	6	7	ded_seguros	135.00	2023-06-25 00:27:34.214642	2023-06-25 00:27:34.214642	
3302	37222	27225268938	2021	7	7	ded_seguros	135.00	2023-06-25 00:27:34.214864	2023-06-25 00:27:34.214864	
3303	37222	27225268938	2021	8	7	ded_seguros	155.00	2023-06-25 00:27:34.2154	2023-06-25 00:27:34.2154	
3304	37222	27225268938	2021	10	7	ded_seguros	306.88	2023-06-25 00:27:34.216174	2023-06-25 00:27:34.216174	
3305	37222	27225268938	2021	11	7	ded_seguros	154.00	2023-06-25 00:27:34.216777	2023-06-25 00:27:34.216777	
3306	37222	27225268938	2021	12	7	ded_seguros	155.00	2023-06-25 00:27:34.217479	2023-06-25 00:27:34.217479	
3307	37222	27225268938	2021	3	7	ded_gastos_medicos	2600.00	2023-06-25 00:27:34.218655	2023-06-25 00:27:34.218655	
3308	37222	27225268938	2021	8	7	ded_gastos_medicos	3000.00	2023-06-25 00:27:34.219204	2023-06-25 00:27:34.219204	
3309	37222	27225268938	2021	2	7	ded_gastos_medicos	1200.00	2023-06-25 00:27:34.219998	2023-06-25 00:27:34.219998	
3310	37222	27225268938	2021	4	7	ded_gastos_medicos	1200.00	2023-06-25 00:27:34.220599	2023-06-25 00:27:34.220599	
3311	37222	27225268938	2021	7	7	ded_gastos_medicos	1600.00	2023-06-25 00:27:34.221129	2023-06-25 00:27:34.221129	
3312	37222	27225268938	2021	9	7	ded_gastos_medicos	1600.00	2023-06-25 00:27:34.221737	2023-06-25 00:27:34.221737	
3313	37222	27225268938	2021	10	7	ded_gastos_medicos	3800.00	2023-06-25 00:27:34.223056	2023-06-25 00:27:34.223056	
3314	37222	27225268938	2021	12	7	ded_gastos_medicos	1800.00	2023-06-25 00:27:34.224055	2023-06-25 00:27:34.224055	
3315	37222	27225268938	2021	3	7	ded_gastos_medicos	800.00	2023-06-25 00:27:34.225351	2023-06-25 00:27:34.225351	
3316	37222	27225268938	2021	6	7	ded_gastos_medicos	1000.00	2023-06-25 00:27:34.226016	2023-06-25 00:27:34.226016	
3317	37222	27225268938	2021	9	7	ded_gastos_medicos	1120.00	2023-06-25 00:27:34.226561	2023-06-25 00:27:34.226561	
3318	37222	27225268938	2021	9	7	ded_gastos_medicos	856.52	2023-06-25 00:27:34.227313	2023-06-25 00:27:34.227313	
3319	37222	27225268938	2021	1	7	ded_indumentaria	30642.00	2023-06-25 00:27:34.227833	2023-06-25 00:27:34.227833	
3320	37222	27225268938	2021	11	7	ded_indumentaria	3561.40	2023-06-25 00:27:34.228189	2023-06-25 00:27:34.228189	
3321	37222	27225268938	2021	1	7	fam_hijos_100	100.00	2023-06-25 00:27:34.228545	2023-06-25 00:27:34.228545	
3322	37222	27225268938	2021	2	7	fam_hijos_100	100.00	2023-06-25 00:27:34.228768	2023-06-25 00:27:34.228768	
3323	37222	27225268938	2021	3	7	fam_hijos_100	100.00	2023-06-25 00:27:34.229054	2023-06-25 00:27:34.229054	
3324	37222	27225268938	2021	4	7	fam_hijos_100	100.00	2023-06-25 00:27:34.229527	2023-06-25 00:27:34.229527	
3325	37222	27225268938	2021	5	7	fam_hijos_100	100.00	2023-06-25 00:27:34.229977	2023-06-25 00:27:34.229977	
3326	37222	27225268938	2021	6	7	fam_hijos_100	100.00	2023-06-25 00:27:34.230212	2023-06-25 00:27:34.230212	
3327	37222	27225268938	2021	7	7	fam_hijos_100	100.00	2023-06-25 00:27:34.230431	2023-06-25 00:27:34.230431	
3328	37222	27225268938	2021	8	7	fam_hijos_100	100.00	2023-06-25 00:27:34.230649	2023-06-25 00:27:34.230649	
3329	37222	27225268938	2021	9	7	fam_hijos_100	100.00	2023-06-25 00:27:34.230861	2023-06-25 00:27:34.230861	
3330	37222	27225268938	2021	10	7	fam_hijos_100	100.00	2023-06-25 00:27:34.231064	2023-06-25 00:27:34.231064	
3331	37222	27225268938	2021	11	7	fam_hijos_100	100.00	2023-06-25 00:27:34.231268	2023-06-25 00:27:34.231268	
3332	37222	27225268938	2021	12	7	fam_hijos_100	100.00	2023-06-25 00:27:34.23147	2023-06-25 00:27:34.23147	
3333	37222	27225268938	2021	1	7	FECDEVDESDE	100.00	2023-06-25 00:27:34.231819	2023-06-25 00:27:34.231819	
3334	37222	27225268938	2021	2	7	FECDEVDESDE	100.00	2023-06-25 00:27:34.232047	2023-06-25 00:27:34.232047	
3335	37222	27225268938	2021	3	7	FECDEVDESDE	100.00	2023-06-25 00:27:34.232264	2023-06-25 00:27:34.232264	
3336	37222	27225268938	2021	4	7	FECDEVDESDE	100.00	2023-06-25 00:27:34.232486	2023-06-25 00:27:34.232486	
3337	37222	27225268938	2021	5	7	FECDEVDESDE	100.00	2023-06-25 00:27:34.232782	2023-06-25 00:27:34.232782	
3338	37222	27225268938	2021	6	7	FECDEVDESDE	100.00	2023-06-25 00:27:34.233015	2023-06-25 00:27:34.233015	
3339	37222	27225268938	2021	7	7	FECDEVDESDE	100.00	2023-06-25 00:27:34.233257	2023-06-25 00:27:34.233257	
3340	37222	27225268938	2021	8	7	FECDEVDESDE	100.00	2023-06-25 00:27:34.233491	2023-06-25 00:27:34.233491	
3341	37222	27225268938	2021	9	7	FECDEVDESDE	100.00	2023-06-25 00:27:34.233712	2023-06-25 00:27:34.233712	
3342	37222	27225268938	2021	10	7	FECDEVDESDE	100.00	2023-06-25 00:27:34.233939	2023-06-25 00:27:34.233939	
3343	37222	27225268938	2021	11	7	FECDEVDESDE	100.00	2023-06-25 00:27:34.234157	2023-06-25 00:27:34.234157	
3344	37222	27225268938	2021	12	7	FECDEVDESDE	100.00	2023-06-25 00:27:34.234379	2023-06-25 00:27:34.234379	
3345	37222	27225268938	2021	1	7	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.234716	2023-06-25 00:27:34.234716	
3346	37222	27225268938	2021	2	7	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.234928	2023-06-25 00:27:34.234928	
3347	37222	27225268938	2021	3	7	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.23515	2023-06-25 00:27:34.23515	
3348	37222	27225268938	2021	4	7	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.235354	2023-06-25 00:27:34.235354	
3349	37222	27225268938	2021	5	7	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.23556	2023-06-25 00:27:34.23556	
3350	37222	27225268938	2021	6	7	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.235772	2023-06-25 00:27:34.235772	
3351	37222	27225268938	2021	7	7	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.235985	2023-06-25 00:27:34.235985	
3352	37222	27225268938	2021	8	7	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.23619	2023-06-25 00:27:34.23619	
3353	37222	27225268938	2021	9	7	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.236404	2023-06-25 00:27:34.236404	
3354	37222	27225268938	2021	10	7	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.23664	2023-06-25 00:27:34.23664	
3355	37222	27225268938	2021	11	7	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.236869	2023-06-25 00:27:34.236869	
3356	37222	27225268938	2021	12	7	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.237086	2023-06-25 00:27:34.237086	
3357	37222	27225268938	2022	1	2	ded_cuota_medica	1687.56	2023-06-25 00:27:34.243338	2023-06-25 00:27:34.243338	
3358	37222	27225268938	2022	2	2	ded_cuota_medica	1485.65	2023-06-25 00:27:34.243755	2023-06-25 00:27:34.243755	
3359	37222	27225268938	2022	3	2	ded_cuota_medica	988.80	2023-06-25 00:27:34.244205	2023-06-25 00:27:34.244205	
3360	37222	27225268938	2022	1	2	ded_gastos_medicos	1200.00	2023-06-25 00:27:34.244878	2023-06-25 00:27:34.244878	
3361	37222	27225268938	2022	1	2	fam_hijos_100	100.00	2023-06-25 00:27:34.24537	2023-06-25 00:27:34.24537	
3362	37222	27225268938	2022	1	2	FECDEVDESDE	100.00	2023-06-25 00:27:34.245846	2023-06-25 00:27:34.245846	
3363	37222	27225268938	2022	2	2	FECDEVDESDE	100.00	2023-06-25 00:27:34.246099	2023-06-25 00:27:34.246099	
3364	37222	27225268938	2022	3	2	FECDEVDESDE	100.00	2023-06-25 00:27:34.246361	2023-06-25 00:27:34.246361	
3365	37222	27225268938	2022	4	2	FECDEVDESDE	100.00	2023-06-25 00:27:34.247116	2023-06-25 00:27:34.247116	
3366	37222	27225268938	2022	5	2	FECDEVDESDE	100.00	2023-06-25 00:27:34.247577	2023-06-25 00:27:34.247577	
3367	37222	27225268938	2022	6	2	FECDEVDESDE	100.00	2023-06-25 00:27:34.248067	2023-06-25 00:27:34.248067	
3368	37222	27225268938	2022	7	2	FECDEVDESDE	100.00	2023-06-25 00:27:34.248745	2023-06-25 00:27:34.248745	
3369	37222	27225268938	2022	8	2	FECDEVDESDE	100.00	2023-06-25 00:27:34.249137	2023-06-25 00:27:34.249137	
3370	37222	27225268938	2022	9	2	FECDEVDESDE	100.00	2023-06-25 00:27:34.249524	2023-06-25 00:27:34.249524	
3371	37222	27225268938	2022	10	2	FECDEVDESDE	100.00	2023-06-25 00:27:34.249793	2023-06-25 00:27:34.249793	
3372	37222	27225268938	2022	11	2	FECDEVDESDE	100.00	2023-06-25 00:27:34.250073	2023-06-25 00:27:34.250073	
3373	37222	27225268938	2022	12	2	FECDEVDESDE	100.00	2023-06-25 00:27:34.250332	2023-06-25 00:27:34.250332	
3374	37222	27225268938	2022	1	2	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.250818	2023-06-25 00:27:34.250818	
3375	37222	27225268938	2022	2	2	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.2511	2023-06-25 00:27:34.2511	
3376	37222	27225268938	2022	3	2	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.251391	2023-06-25 00:27:34.251391	
3377	37222	27225268938	2022	4	2	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.251679	2023-06-25 00:27:34.251679	
3378	37222	27225268938	2022	5	2	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.251947	2023-06-25 00:27:34.251947	
3379	37222	27225268938	2022	6	2	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.252219	2023-06-25 00:27:34.252219	
3380	37222	27225268938	2022	7	2	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.252494	2023-06-25 00:27:34.252494	
3381	37222	27225268938	2022	8	2	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.252728	2023-06-25 00:27:34.252728	
3382	37222	27225268938	2022	9	2	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.252974	2023-06-25 00:27:34.252974	
3383	37222	27225268938	2022	10	2	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.253215	2023-06-25 00:27:34.253215	
3384	37222	27225268938	2022	11	2	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.253446	2023-06-25 00:27:34.253446	
3385	37222	27225268938	2022	12	2	fam_hijos_disc_50	100.00	2023-06-25 00:27:34.253692	2023-06-25 00:27:34.253692	
3386	19832	27227082424	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:34.2578	2023-06-25 00:27:34.2578	
3387	19832	27227082424	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:34.258106	2023-06-25 00:27:34.258106	
3388	19832	27227082424	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:34.258358	2023-06-25 00:27:34.258358	
3389	19832	27227082424	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:34.258653	2023-06-25 00:27:34.258653	
3390	19832	27227082424	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:34.258926	2023-06-25 00:27:34.258926	
3391	19832	27227082424	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:34.259208	2023-06-25 00:27:34.259208	
3392	19832	27227082424	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:34.259439	2023-06-25 00:27:34.259439	
3393	19832	27227082424	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:34.259634	2023-06-25 00:27:34.259634	
3394	19832	27227082424	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:34.25981	2023-06-25 00:27:34.25981	
3395	19832	27227082424	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:34.26	2023-06-25 00:27:34.26	
3396	19832	27227082424	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:34.260299	2023-06-25 00:27:34.260299	
3397	19832	27227082424	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:27:34.260552	2023-06-25 00:27:34.260552	
3398	19832	27227082424	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:34.260935	2023-06-25 00:27:34.260935	
3399	19832	27227082424	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:34.261141	2023-06-25 00:27:34.261141	
3400	19832	27227082424	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:34.261967	2023-06-25 00:27:34.261967	
3401	19832	27227082424	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:34.262252	2023-06-25 00:27:34.262252	
3402	19832	27227082424	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:34.26264	2023-06-25 00:27:34.26264	
3403	19832	27227082424	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:34.263284	2023-06-25 00:27:34.263284	
3404	19832	27227082424	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:34.263591	2023-06-25 00:27:34.263591	
3405	19832	27227082424	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:34.263863	2023-06-25 00:27:34.263863	
3406	19832	27227082424	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:34.264083	2023-06-25 00:27:34.264083	
3407	19832	27227082424	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:34.264315	2023-06-25 00:27:34.264315	
3408	19832	27227082424	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:34.26451	2023-06-25 00:27:34.26451	
3409	19832	27227082424	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:27:34.264722	2023-06-25 00:27:34.264722	
3410	33392	27230605578	2022	1	2	ded_cuota_medica	10490.87	2023-06-25 00:27:34.268545	2023-06-25 00:27:34.268545	
3411	33392	27230605578	2022	2	2	ded_cuota_medica	10490.87	2023-06-25 00:27:34.268733	2023-06-25 00:27:34.268733	
3412	33392	27230605578	2022	3	2	ded_cuota_medica	10490.87	2023-06-25 00:27:34.268911	2023-06-25 00:27:34.268911	
3413	33392	27230605578	2022	3	2	ded_indumentaria	6018.71	2023-06-25 00:27:34.269342	2023-06-25 00:27:34.269342	
3414	33392	27230605578	2022	3	2	ded_indumentaria	6103.89	2023-06-25 00:27:34.269792	2023-06-25 00:27:34.269792	
3415	33392	27230605578	2022	2	2	ded_indumentaria	3808.75	2023-06-25 00:27:34.270327	2023-06-25 00:27:34.270327	
3416	33392	27230605578	2022	3	2	ded_indumentaria	2974.04	2023-06-25 00:27:34.270729	2023-06-25 00:27:34.270729	
3417	33392	27230605578	2022	1	2	fam_hijos_100	100.00	2023-06-25 00:27:34.271097	2023-06-25 00:27:34.271097	
3418	33392	27230605578	2022	2	2	fam_hijos_100	100.00	2023-06-25 00:27:34.271297	2023-06-25 00:27:34.271297	
3419	33392	27230605578	2022	3	2	fam_hijos_100	100.00	2023-06-25 00:27:34.271477	2023-06-25 00:27:34.271477	
3420	33392	27230605578	2022	4	2	fam_hijos_100	100.00	2023-06-25 00:27:34.271654	2023-06-25 00:27:34.271654	
3421	33392	27230605578	2022	5	2	fam_hijos_100	100.00	2023-06-25 00:27:34.271872	2023-06-25 00:27:34.271872	
3422	33392	27230605578	2022	6	2	fam_hijos_100	100.00	2023-06-25 00:27:34.272062	2023-06-25 00:27:34.272062	
3423	33392	27230605578	2022	7	2	fam_hijos_100	100.00	2023-06-25 00:27:34.27227	2023-06-25 00:27:34.27227	
3424	33392	27230605578	2022	8	2	fam_hijos_100	100.00	2023-06-25 00:27:34.272453	2023-06-25 00:27:34.272453	
3425	33392	27230605578	2022	9	2	fam_hijos_100	100.00	2023-06-25 00:27:34.272655	2023-06-25 00:27:34.272655	
3426	33392	27230605578	2022	10	2	fam_hijos_100	100.00	2023-06-25 00:27:34.272828	2023-06-25 00:27:34.272828	
3427	33392	27230605578	2022	11	2	fam_hijos_100	100.00	2023-06-25 00:27:34.273002	2023-06-25 00:27:34.273002	
3428	33392	27230605578	2022	12	2	fam_hijos_100	100.00	2023-06-25 00:27:34.273187	2023-06-25 00:27:34.273187	
3429	41231	27237809152	2021	1	7	ded_seguros	2000.00	2023-06-25 00:27:34.285955	2023-06-25 00:27:34.285955	
3430	41231	27237809152	2021	2	7	ded_seguros	2000.00	2023-06-25 00:27:34.286172	2023-06-25 00:27:34.286172	
3431	41231	27237809152	2021	3	7	ded_seguros	2000.00	2023-06-25 00:27:34.286379	2023-06-25 00:27:34.286379	
3432	41231	27237809152	2021	4	7	ded_seguros	2000.00	2023-06-25 00:27:34.286573	2023-06-25 00:27:34.286573	
3433	41231	27237809152	2021	5	7	ded_seguros	2000.00	2023-06-25 00:27:34.286777	2023-06-25 00:27:34.286777	
3434	41231	27237809152	2021	6	7	ded_seguros	2000.00	2023-06-25 00:27:34.286972	2023-06-25 00:27:34.286972	
3435	41231	27237809152	2021	7	7	ded_seguros	2000.00	2023-06-25 00:27:34.287151	2023-06-25 00:27:34.287151	
3436	41231	27237809152	2021	8	7	ded_seguros	2500.00	2023-06-25 00:27:34.287475	2023-06-25 00:27:34.287475	
3437	41231	27237809152	2021	9	7	ded_seguros	2500.00	2023-06-25 00:27:34.287654	2023-06-25 00:27:34.287654	
3438	41231	27237809152	2021	10	7	ded_seguros	2500.00	2023-06-25 00:27:34.287833	2023-06-25 00:27:34.287833	
3439	41231	27237809152	2021	11	7	ded_seguros	2500.00	2023-06-25 00:27:34.288007	2023-06-25 00:27:34.288007	
3440	41231	27237809152	2021	12	7	ded_seguros	2500.00	2023-06-25 00:27:34.288192	2023-06-25 00:27:34.288192	
3441	41231	27237809152	2021	10	7	ded_gastos_medicos	920.00	2023-06-25 00:27:34.288671	2023-06-25 00:27:34.288671	
3442	41231	27237809152	2021	3	7	ded_indumentaria	5940.00	2023-06-25 00:27:34.289125	2023-06-25 00:27:34.289125	
3443	41231	27237809152	2021	7	7	ded_indumentaria	11800.00	2023-06-25 00:27:34.290276	2023-06-25 00:27:34.290276	
3444	41231	27237809152	2021	10	7	ded_indumentaria	1699.90	2023-06-25 00:27:34.290786	2023-06-25 00:27:34.290786	
3445	41231	27237809152	2021	1	7	ded_indumentaria	6580.00	2023-06-25 00:27:34.291263	2023-06-25 00:27:34.291263	
3446	41231	27237809152	2021	4	7	ded_indumentaria	4899.00	2023-06-25 00:27:34.291729	2023-06-25 00:27:34.291729	
3447	41231	27237809152	2021	6	7	ded_indumentaria	28594.00	2023-06-25 00:27:34.292065	2023-06-25 00:27:34.292065	
3448	41231	27237809152	2021	9	7	ded_indumentaria	14597.00	2023-06-25 00:27:34.292398	2023-06-25 00:27:34.292398	
3449	41231	27237809152	2021	9	7	ded_indumentaria	10900.00	2023-06-25 00:27:34.292864	2023-06-25 00:27:34.292864	
3450	41231	27237809152	2021	10	7	ded_indumentaria	9400.00	2023-06-25 00:27:34.293338	2023-06-25 00:27:34.293338	
3451	41231	27237809152	2021	1	7	fam_hijos_100	50.00	2023-06-25 00:27:34.294157	2023-06-25 00:27:34.294157	
3452	41231	27237809152	2021	2	7	fam_hijos_100	50.00	2023-06-25 00:27:34.294348	2023-06-25 00:27:34.294348	
3453	41231	27237809152	2021	3	7	fam_hijos_100	50.00	2023-06-25 00:27:34.2946	2023-06-25 00:27:34.2946	
3454	41231	27237809152	2021	4	7	fam_hijos_100	50.00	2023-06-25 00:27:34.294787	2023-06-25 00:27:34.294787	
3455	41231	27237809152	2021	5	7	fam_hijos_100	50.00	2023-06-25 00:27:34.294966	2023-06-25 00:27:34.294966	
3456	41231	27237809152	2021	6	7	fam_hijos_100	50.00	2023-06-25 00:27:34.295147	2023-06-25 00:27:34.295147	
3457	41231	27237809152	2021	7	7	fam_hijos_100	50.00	2023-06-25 00:27:34.295323	2023-06-25 00:27:34.295323	
3458	41231	27237809152	2021	8	7	fam_hijos_100	50.00	2023-06-25 00:27:34.295502	2023-06-25 00:27:34.295502	
3459	41231	27237809152	2021	9	7	fam_hijos_100	50.00	2023-06-25 00:27:34.295678	2023-06-25 00:27:34.295678	
3460	41231	27237809152	2021	10	7	fam_hijos_100	50.00	2023-06-25 00:27:34.295887	2023-06-25 00:27:34.295887	
3461	41231	27237809152	2021	11	7	fam_hijos_100	50.00	2023-06-25 00:27:34.296116	2023-06-25 00:27:34.296116	
3462	41231	27237809152	2021	12	7	fam_hijos_100	50.00	2023-06-25 00:27:34.296333	2023-06-25 00:27:34.296333	
3463	41231	27237809152	2021	1	7	otro_gan_brut	28772.75	2023-06-25 00:27:34.297275	2023-06-25 00:27:34.297275	
3464	41231	27237809152	2021	1	7	otro_obra_soc	833.18	2023-06-25 00:27:34.297923	2023-06-25 00:27:34.297923	
3465	41231	27237809152	2021	1	7	otro_seg_soc	4443.64	2023-06-25 00:27:34.298779	2023-06-25 00:27:34.298779	
3466	41231	27237809152	2021	2	7	otro_seg_soc	4613.44	2023-06-25 00:27:34.299575	2023-06-25 00:27:34.299575	
3467	41231	27237809152	2021	2	7	otro_obra_soc	865.25	2023-06-25 00:27:34.299989	2023-06-25 00:27:34.299989	
3468	41231	27237809152	2021	2	7	otro_gan_brut	28833.99	2023-06-25 00:27:34.300388	2023-06-25 00:27:34.300388	
3469	41231	27237809152	2021	3	7	otro_obra_soc	896.96	2023-06-25 00:27:34.300955	2023-06-25 00:27:34.300955	
3470	41231	27237809152	2021	3	7	otro_gan_brut	29895.22	2023-06-25 00:27:34.30139	2023-06-25 00:27:34.30139	
3471	41231	27237809152	2021	3	7	otro_seg_soc	4783.23	2023-06-25 00:27:34.301834	2023-06-25 00:27:34.301834	
3472	41231	27237809152	2022	1	1	ded_seguros	2500.00	2023-06-25 00:27:34.307132	2023-06-25 00:27:34.307132	
3473	41231	27237809152	2022	2	1	ded_seguros	2500.00	2023-06-25 00:27:34.307406	2023-06-25 00:27:34.307406	
3474	41231	27237809152	2022	3	1	ded_seguros	2500.00	2023-06-25 00:27:34.307661	2023-06-25 00:27:34.307661	
3475	41231	27237809152	2022	3	1	ded_indumentaria	17197.00	2023-06-25 00:27:34.308929	2023-06-25 00:27:34.308929	
3476	41231	27237809152	2022	1	1	ded_indumentaria	4764.00	2023-06-25 00:27:34.309883	2023-06-25 00:27:34.309883	
3477	41231	27237809152	2022	1	1	fam_hijos_100	50.00	2023-06-25 00:27:34.310438	2023-06-25 00:27:34.310438	
3478	41231	27237809152	2022	2	1	fam_hijos_100	50.00	2023-06-25 00:27:34.310725	2023-06-25 00:27:34.310725	
3479	41231	27237809152	2022	3	1	fam_hijos_100	50.00	2023-06-25 00:27:34.310985	2023-06-25 00:27:34.310985	
3480	41231	27237809152	2022	4	1	fam_hijos_100	50.00	2023-06-25 00:27:34.311238	2023-06-25 00:27:34.311238	
3481	41231	27237809152	2022	5	1	fam_hijos_100	50.00	2023-06-25 00:27:34.311545	2023-06-25 00:27:34.311545	
3482	41231	27237809152	2022	6	1	fam_hijos_100	50.00	2023-06-25 00:27:34.311835	2023-06-25 00:27:34.311835	
3483	41231	27237809152	2022	7	1	fam_hijos_100	50.00	2023-06-25 00:27:34.312071	2023-06-25 00:27:34.312071	
3484	41231	27237809152	2022	8	1	fam_hijos_100	50.00	2023-06-25 00:27:34.312249	2023-06-25 00:27:34.312249	
3485	41231	27237809152	2022	9	1	fam_hijos_100	50.00	2023-06-25 00:27:34.312412	2023-06-25 00:27:34.312412	
3486	41231	27237809152	2022	10	1	fam_hijos_100	50.00	2023-06-25 00:27:34.312574	2023-06-25 00:27:34.312574	
3487	41231	27237809152	2022	11	1	fam_hijos_100	50.00	2023-06-25 00:27:34.312757	2023-06-25 00:27:34.312757	
3488	41231	27237809152	2022	12	1	fam_hijos_100	50.00	2023-06-25 00:27:34.312925	2023-06-25 00:27:34.312925	
3489	35774	27238794027	2021	5	15	ded_cuota_medica	4562.00	2023-06-25 00:27:34.318442	2023-06-25 00:27:34.318442	
3490	35774	27238794027	2021	6	15	ded_cuota_medica	5877.00	2023-06-25 00:27:34.318975	2023-06-25 00:27:34.318975	
3491	35774	27238794027	2021	8	15	ded_cuota_medica	5798.43	2023-06-25 00:27:34.319301	2023-06-25 00:27:34.319301	
3492	35774	27238794027	2021	9	15	ded_cuota_medica	9583.02	2023-06-25 00:27:34.319598	2023-06-25 00:27:34.319598	
3493	35774	27238794027	2021	10	15	ded_cuota_medica	10224.24	2023-06-25 00:27:34.31989	2023-06-25 00:27:34.31989	
3494	35774	27238794027	2021	9	15	ded_cuota_medica	2045.30	2023-06-25 00:27:34.320348	2023-06-25 00:27:34.320348	
3495	35774	27238794027	2021	10	15	ded_cuota_medica	2045.30	2023-06-25 00:27:34.320536	2023-06-25 00:27:34.320536	
3496	35774	27238794027	2021	11	15	ded_cuota_medica	2264.44	2023-06-25 00:27:34.320836	2023-06-25 00:27:34.320836	
3497	35774	27238794027	2021	12	15	ded_cuota_medica	2264.44	2023-06-25 00:27:34.321027	2023-06-25 00:27:34.321027	
3498	35774	27238794027	2021	1	15	ded_cuota_medica	912.22	2023-06-25 00:27:34.321483	2023-06-25 00:27:34.321483	
3499	35774	27238794027	2021	3	15	ded_cuota_medica	986.57	2023-06-25 00:27:34.321788	2023-06-25 00:27:34.321788	
3500	35774	27238794027	2021	4	15	ded_cuota_medica	1072.21	2023-06-25 00:27:34.322074	2023-06-25 00:27:34.322074	
3501	35774	27238794027	2021	8	15	ded_cuota_medica	1236.47	2023-06-25 00:27:34.322353	2023-06-25 00:27:34.322353	
3502	35774	27238794027	2021	9	15	ded_cuota_medica	1345.07	2023-06-25 00:27:34.32263	2023-06-25 00:27:34.32263	
3503	35774	27238794027	2021	10	15	ded_cuota_medica	1410.99	2023-06-25 00:27:34.322961	2023-06-25 00:27:34.322961	
3504	35774	27238794027	2021	1	15	ded_cuota_medica	903.32	2023-06-25 00:27:34.323702	2023-06-25 00:27:34.323702	
3505	35774	27238794027	2021	2	15	ded_cuota_medica	1375.48	2023-06-25 00:27:34.324272	2023-06-25 00:27:34.324272	
3506	35774	27238794027	2021	3	15	ded_cuota_medica	0.01	2023-06-25 00:27:34.324771	2023-06-25 00:27:34.324771	
3507	35774	27238794027	2021	4	15	ded_cuota_medica	925.04	2023-06-25 00:27:34.325394	2023-06-25 00:27:34.325394	
3508	35774	27238794027	2021	6	15	ded_cuota_medica	1127.97	2023-06-25 00:27:34.326782	2023-06-25 00:27:34.326782	
3509	35774	27238794027	2021	8	15	ded_gastos_medicos	800.00	2023-06-25 00:27:34.327507	2023-06-25 00:27:34.327507	
3510	35774	27238794027	2021	12	15	ded_indumentaria	9630.00	2023-06-25 00:27:34.328002	2023-06-25 00:27:34.328002	
3511	35774	27238794027	2021	2	15	ded_indumentaria	22488.00	2023-06-25 00:27:34.328457	2023-06-25 00:27:34.328457	
3512	35774	27238794027	2021	12	15	ded_indumentaria	1500.00	2023-06-25 00:27:34.328906	2023-06-25 00:27:34.328906	
3513	35774	27238794027	2021	12	15	ded_indumentaria	2750.00	2023-06-25 00:27:34.329481	2023-06-25 00:27:34.329481	
3514	35774	27238794027	2021	12	15	ded_indumentaria	2990.00	2023-06-25 00:27:34.32997	2023-06-25 00:27:34.32997	
3515	35774	27238794027	2021	1	15	fam_hijos_100	100.00	2023-06-25 00:27:34.330327	2023-06-25 00:27:34.330327	
3516	35774	27238794027	2021	2	15	fam_hijos_100	100.00	2023-06-25 00:27:34.330536	2023-06-25 00:27:34.330536	
3517	35774	27238794027	2021	3	15	fam_hijos_100	100.00	2023-06-25 00:27:34.330745	2023-06-25 00:27:34.330745	
3518	35774	27238794027	2021	4	15	fam_hijos_100	100.00	2023-06-25 00:27:34.33095	2023-06-25 00:27:34.33095	
3519	35774	27238794027	2021	5	15	fam_hijos_100	100.00	2023-06-25 00:27:34.331152	2023-06-25 00:27:34.331152	
3520	35774	27238794027	2021	6	15	fam_hijos_100	100.00	2023-06-25 00:27:34.331354	2023-06-25 00:27:34.331354	
3521	35774	27238794027	2021	7	15	fam_hijos_100	100.00	2023-06-25 00:27:34.331652	2023-06-25 00:27:34.331652	
3522	35774	27238794027	2021	8	15	fam_hijos_100	100.00	2023-06-25 00:27:34.331883	2023-06-25 00:27:34.331883	
3523	35774	27238794027	2021	9	15	fam_hijos_100	100.00	2023-06-25 00:27:34.332068	2023-06-25 00:27:34.332068	
3524	35774	27238794027	2021	10	15	fam_hijos_100	100.00	2023-06-25 00:27:34.332288	2023-06-25 00:27:34.332288	
3525	35774	27238794027	2021	11	15	fam_hijos_100	100.00	2023-06-25 00:27:34.332472	2023-06-25 00:27:34.332472	
3526	35774	27238794027	2021	12	15	fam_hijos_100	100.00	2023-06-25 00:27:34.332656	2023-06-25 00:27:34.332656	
3527	35774	27238794027	2022	1	3	ded_cuota_medica	2512.98	2023-06-25 00:27:34.337313	2023-06-25 00:27:34.337313	
3528	35774	27238794027	2022	1	3	ded_cuota_medica	1467.99	2023-06-25 00:27:34.337971	2023-06-25 00:27:34.337971	
3529	35774	27238794027	2022	3	3	ded_cuota_medica	1500.00	2023-06-25 00:27:34.338513	2023-06-25 00:27:34.338513	
3530	35774	27238794027	2022	1	3	ded_cuota_medica	200.00	2023-06-25 00:27:34.338985	2023-06-25 00:27:34.338985	
3531	35774	27238794027	2022	2	3	ded_indumentaria	3920.00	2023-06-25 00:27:34.339443	2023-06-25 00:27:34.339443	
3532	35774	27238794027	2022	2	3	ded_indumentaria	10798.00	2023-06-25 00:27:34.34076	2023-06-25 00:27:34.34076	
3533	35774	27238794027	2022	1	3	ded_indumentaria	3900.00	2023-06-25 00:27:34.341873	2023-06-25 00:27:34.341873	
3534	35774	27238794027	2022	1	3	fam_hijos_100	100.00	2023-06-25 00:27:34.342482	2023-06-25 00:27:34.342482	
3535	35774	27238794027	2022	2	3	fam_hijos_100	100.00	2023-06-25 00:27:34.342779	2023-06-25 00:27:34.342779	
3536	35774	27238794027	2022	3	3	fam_hijos_100	100.00	2023-06-25 00:27:34.343047	2023-06-25 00:27:34.343047	
3537	35774	27238794027	2022	4	3	fam_hijos_100	100.00	2023-06-25 00:27:34.343346	2023-06-25 00:27:34.343346	
3538	35774	27238794027	2022	5	3	fam_hijos_100	100.00	2023-06-25 00:27:34.343668	2023-06-25 00:27:34.343668	
3539	35774	27238794027	2022	6	3	fam_hijos_100	100.00	2023-06-25 00:27:34.344001	2023-06-25 00:27:34.344001	
3540	35774	27238794027	2022	7	3	fam_hijos_100	100.00	2023-06-25 00:27:34.344186	2023-06-25 00:27:34.344186	
3541	35774	27238794027	2022	8	3	fam_hijos_100	100.00	2023-06-25 00:27:34.344427	2023-06-25 00:27:34.344427	
3542	35774	27238794027	2022	9	3	fam_hijos_100	100.00	2023-06-25 00:27:34.344705	2023-06-25 00:27:34.344705	
3543	35774	27238794027	2022	10	3	fam_hijos_100	100.00	2023-06-25 00:27:34.344935	2023-06-25 00:27:34.344935	
3544	35774	27238794027	2022	11	3	fam_hijos_100	100.00	2023-06-25 00:27:34.345139	2023-06-25 00:27:34.345139	
3545	35774	27238794027	2022	12	3	fam_hijos_100	100.00	2023-06-25 00:27:34.345533	2023-06-25 00:27:34.345533	
3546	36498	27250276422	2022	1	1	ded_cuota_medica	7854.32	2023-06-25 00:27:34.351072	2023-06-25 00:27:34.351072	
3547	36498	27250276422	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:34.351635	2023-06-25 00:27:34.351635	
3548	36498	27250276422	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:34.351877	2023-06-25 00:27:34.351877	
3549	36498	27250276422	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:34.352096	2023-06-25 00:27:34.352096	
3550	36498	27250276422	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:34.352278	2023-06-25 00:27:34.352278	
3551	36498	27250276422	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:34.352463	2023-06-25 00:27:34.352463	
3552	36498	27250276422	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:34.35266	2023-06-25 00:27:34.35266	
3553	36498	27250276422	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:34.352847	2023-06-25 00:27:34.352847	
3554	36498	27250276422	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:34.35303	2023-06-25 00:27:34.35303	
3555	36498	27250276422	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:34.353228	2023-06-25 00:27:34.353228	
3556	36498	27250276422	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:34.353647	2023-06-25 00:27:34.353647	
3557	36498	27250276422	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:34.353887	2023-06-25 00:27:34.353887	
3558	36498	27250276422	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:27:34.354136	2023-06-25 00:27:34.354136	
3559	36498	27250276422	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:34.354448	2023-06-25 00:27:34.354448	
3560	36498	27250276422	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:34.354645	2023-06-25 00:27:34.354645	
3561	36498	27250276422	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:34.354816	2023-06-25 00:27:34.354816	
3562	36498	27250276422	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:34.354988	2023-06-25 00:27:34.354988	
3563	36498	27250276422	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:34.355158	2023-06-25 00:27:34.355158	
3564	36498	27250276422	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:34.355325	2023-06-25 00:27:34.355325	
3565	36498	27250276422	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:34.355496	2023-06-25 00:27:34.355496	
3566	36498	27250276422	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:34.355661	2023-06-25 00:27:34.355661	
3567	36498	27250276422	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:34.355823	2023-06-25 00:27:34.355823	
3568	36498	27250276422	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:34.355989	2023-06-25 00:27:34.355989	
3569	36498	27250276422	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:34.356151	2023-06-25 00:27:34.356151	
3570	36498	27250276422	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:27:34.356313	2023-06-25 00:27:34.356313	
3571	41266	27251216652	2022	1	3	ded_indumentaria	24999.00	2023-06-25 00:27:34.360991	2023-06-25 00:27:34.360991	
3572	18989	27253986048	2021	1	7	ded_cuota_medica	4236.74	2023-06-25 00:27:34.365973	2023-06-25 00:27:34.365973	
3573	18989	27253986048	2021	2	7	ded_cuota_medica	895.05	2023-06-25 00:27:34.366297	2023-06-25 00:27:34.366297	
3574	18989	27253986048	2021	3	7	ded_cuota_medica	4757.55	2023-06-25 00:27:34.366602	2023-06-25 00:27:34.366602	
3575	18989	27253986048	2021	4	7	ded_cuota_medica	4405.29	2023-06-25 00:27:34.366884	2023-06-25 00:27:34.366884	
3576	18989	27253986048	2021	5	7	ded_cuota_medica	4601.72	2023-06-25 00:27:34.367171	2023-06-25 00:27:34.367171	
3577	18989	27253986048	2021	6	7	ded_cuota_medica	4831.17	2023-06-25 00:27:34.36747	2023-06-25 00:27:34.36747	
3578	40310	27255514437	2021	1	2	fam_hijos_100	100.00	2023-06-25 00:27:34.37525	2023-06-25 00:27:34.37525	
3579	40310	27255514437	2021	2	2	fam_hijos_100	100.00	2023-06-25 00:27:34.375505	2023-06-25 00:27:34.375505	
3580	40310	27255514437	2021	3	2	fam_hijos_100	100.00	2023-06-25 00:27:34.37577	2023-06-25 00:27:34.37577	
3581	40310	27255514437	2021	4	2	fam_hijos_100	100.00	2023-06-25 00:27:34.375958	2023-06-25 00:27:34.375958	
3582	40310	27255514437	2021	5	2	fam_hijos_100	100.00	2023-06-25 00:27:34.376152	2023-06-25 00:27:34.376152	
3583	40310	27255514437	2021	6	2	fam_hijos_100	100.00	2023-06-25 00:27:34.376384	2023-06-25 00:27:34.376384	
3584	40310	27255514437	2021	7	2	fam_hijos_100	100.00	2023-06-25 00:27:34.376576	2023-06-25 00:27:34.376576	
3585	40310	27255514437	2021	8	2	fam_hijos_100	100.00	2023-06-25 00:27:34.376778	2023-06-25 00:27:34.376778	
3586	40310	27255514437	2021	9	2	fam_hijos_100	100.00	2023-06-25 00:27:34.376977	2023-06-25 00:27:34.376977	
3587	40310	27255514437	2021	10	2	fam_hijos_100	100.00	2023-06-25 00:27:34.377232	2023-06-25 00:27:34.377232	
3588	40310	27255514437	2021	11	2	fam_hijos_100	100.00	2023-06-25 00:27:34.377613	2023-06-25 00:27:34.377613	
3589	40310	27255514437	2021	12	2	fam_hijos_100	100.00	2023-06-25 00:27:34.377805	2023-06-25 00:27:34.377805	
3590	40359	27260108072	2022	1	1	ded_cuota_medica	21468.00	2023-06-25 00:27:34.384703	2023-06-25 00:27:34.384703	
3591	46718	27264662872	2022	1	2	ded_cuota_medica	1702.25	2023-06-25 00:27:34.389861	2023-06-25 00:27:34.389861	
3592	46718	27264662872	2022	2	2	ded_cuota_medica	1158.49	2023-06-25 00:27:34.390357	2023-06-25 00:27:34.390357	
3593	46718	27264662872	2022	3	2	ded_cuota_medica	229.90	2023-06-25 00:27:34.390727	2023-06-25 00:27:34.390727	
3594	46718	27264662872	2022	1	2	fam_hijos_100	100.00	2023-06-25 00:27:34.392027	2023-06-25 00:27:34.392027	
3595	46718	27264662872	2022	2	2	fam_hijos_100	100.00	2023-06-25 00:27:34.392225	2023-06-25 00:27:34.392225	
3596	46718	27264662872	2022	3	2	fam_hijos_100	100.00	2023-06-25 00:27:34.392418	2023-06-25 00:27:34.392418	
3597	46718	27264662872	2022	4	2	fam_hijos_100	100.00	2023-06-25 00:27:34.392641	2023-06-25 00:27:34.392641	
3598	46718	27264662872	2022	5	2	fam_hijos_100	100.00	2023-06-25 00:27:34.392839	2023-06-25 00:27:34.392839	
3599	46718	27264662872	2022	6	2	fam_hijos_100	100.00	2023-06-25 00:27:34.393042	2023-06-25 00:27:34.393042	
3600	46718	27264662872	2022	7	2	fam_hijos_100	100.00	2023-06-25 00:27:34.393254	2023-06-25 00:27:34.393254	
3601	46718	27264662872	2022	8	2	fam_hijos_100	100.00	2023-06-25 00:27:34.393467	2023-06-25 00:27:34.393467	
3602	46718	27264662872	2022	9	2	fam_hijos_100	100.00	2023-06-25 00:27:34.393684	2023-06-25 00:27:34.393684	
3603	46718	27264662872	2022	10	2	fam_hijos_100	100.00	2023-06-25 00:27:34.393942	2023-06-25 00:27:34.393942	
3604	46718	27264662872	2022	11	2	fam_hijos_100	100.00	2023-06-25 00:27:34.394143	2023-06-25 00:27:34.394143	
3605	46718	27264662872	2022	12	2	fam_hijos_100	100.00	2023-06-25 00:27:34.394379	2023-06-25 00:27:34.394379	
3606	38128	27275650590	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:34.398182	2023-06-25 00:27:34.398182	
3607	38128	27275650590	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:34.398412	2023-06-25 00:27:34.398412	
3608	38128	27275650590	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:34.398627	2023-06-25 00:27:34.398627	
3609	38128	27275650590	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:34.398835	2023-06-25 00:27:34.398835	
3610	38128	27275650590	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:34.399066	2023-06-25 00:27:34.399066	
3611	38128	27275650590	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:34.399258	2023-06-25 00:27:34.399258	
3612	38128	27275650590	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:34.399449	2023-06-25 00:27:34.399449	
3613	38128	27275650590	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:34.399642	2023-06-25 00:27:34.399642	
3614	38128	27275650590	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:34.39987	2023-06-25 00:27:34.39987	
3615	38128	27275650590	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:34.400057	2023-06-25 00:27:34.400057	
3616	38128	27275650590	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:34.400301	2023-06-25 00:27:34.400301	
3617	38128	27275650590	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:27:34.400489	2023-06-25 00:27:34.400489	
3618	38128	27275650590	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:34.400805	2023-06-25 00:27:34.400805	
3619	38128	27275650590	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:34.401011	2023-06-25 00:27:34.401011	
3620	38128	27275650590	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:34.401249	2023-06-25 00:27:34.401249	
3621	38128	27275650590	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:34.401461	2023-06-25 00:27:34.401461	
3622	38128	27275650590	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:34.401687	2023-06-25 00:27:34.401687	
3623	38128	27275650590	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:34.401903	2023-06-25 00:27:34.401903	
3624	38128	27275650590	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:34.402209	2023-06-25 00:27:34.402209	
3625	38128	27275650590	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:34.402531	2023-06-25 00:27:34.402531	
3626	38128	27275650590	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:34.402895	2023-06-25 00:27:34.402895	
3627	38128	27275650590	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:34.403398	2023-06-25 00:27:34.403398	
3628	38128	27275650590	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:34.403652	2023-06-25 00:27:34.403652	
3629	38128	27275650590	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:27:34.404054	2023-06-25 00:27:34.404054	
3630	45548	27277784675	2021	1	3	ded_cuota_medica	8304.97	2023-06-25 00:27:34.410283	2023-06-25 00:27:34.410283	
3631	45548	27277784675	2021	2	3	ded_cuota_medica	8001.51	2023-06-25 00:27:34.410698	2023-06-25 00:27:34.410698	
3632	45548	27277784675	2021	3	3	ded_cuota_medica	7269.28	2023-06-25 00:27:34.41106	2023-06-25 00:27:34.41106	
3633	45548	27277784675	2021	4	3	ded_cuota_medica	337.83	2023-06-25 00:27:34.411427	2023-06-25 00:27:34.411427	
3634	45548	27277784675	2021	5	3	ded_cuota_medica	10286.58	2023-06-25 00:27:34.411778	2023-06-25 00:27:34.411778	
3635	45548	27277784675	2021	6	3	ded_cuota_medica	2261.84	2023-06-25 00:27:34.41212	2023-06-25 00:27:34.41212	
3636	45548	27277784675	2021	7	3	ded_cuota_medica	7587.61	2023-06-25 00:27:34.412461	2023-06-25 00:27:34.412461	
3637	45548	27277784675	2021	8	3	ded_cuota_medica	6992.06	2023-06-25 00:27:34.412807	2023-06-25 00:27:34.412807	
3638	45548	27277784675	2021	9	3	ded_cuota_medica	13390.13	2023-06-25 00:27:34.413129	2023-06-25 00:27:34.413129	
3639	45548	27277784675	2021	10	3	ded_cuota_medica	4191.20	2023-06-25 00:27:34.414028	2023-06-25 00:27:34.414028	
3640	45548	27277784675	2021	11	3	ded_cuota_medica	19236.85	2023-06-25 00:27:34.41451	2023-06-25 00:27:34.41451	
3641	45548	27277784675	2021	12	3	ded_cuota_medica	12089.63	2023-06-25 00:27:34.415043	2023-06-25 00:27:34.415043	
3642	45548	27277784675	2021	1	3	fam_hijos_100	100.00	2023-06-25 00:27:34.415513	2023-06-25 00:27:34.415513	
3643	45548	27277784675	2021	2	3	fam_hijos_100	100.00	2023-06-25 00:27:34.415779	2023-06-25 00:27:34.415779	
3644	45548	27277784675	2021	3	3	fam_hijos_100	100.00	2023-06-25 00:27:34.416026	2023-06-25 00:27:34.416026	
3645	45548	27277784675	2021	4	3	fam_hijos_100	100.00	2023-06-25 00:27:34.416273	2023-06-25 00:27:34.416273	
3646	45548	27277784675	2021	5	3	fam_hijos_100	100.00	2023-06-25 00:27:34.416517	2023-06-25 00:27:34.416517	
3647	45548	27277784675	2021	6	3	fam_hijos_100	100.00	2023-06-25 00:27:34.416752	2023-06-25 00:27:34.416752	
3648	45548	27277784675	2021	7	3	fam_hijos_100	100.00	2023-06-25 00:27:34.416987	2023-06-25 00:27:34.416987	
3649	45548	27277784675	2021	8	3	fam_hijos_100	100.00	2023-06-25 00:27:34.417265	2023-06-25 00:27:34.417265	
3650	45548	27277784675	2021	9	3	fam_hijos_100	100.00	2023-06-25 00:27:34.417561	2023-06-25 00:27:34.417561	
3651	45548	27277784675	2021	10	3	fam_hijos_100	100.00	2023-06-25 00:27:34.417855	2023-06-25 00:27:34.417855	
3652	45548	27277784675	2021	11	3	fam_hijos_100	100.00	2023-06-25 00:27:34.418074	2023-06-25 00:27:34.418074	
3653	45548	27277784675	2021	12	3	fam_hijos_100	100.00	2023-06-25 00:27:34.418272	2023-06-25 00:27:34.418272	
3654	45548	27277784675	2021	1	3	fam_hijos_100	100.00	2023-06-25 00:27:34.418596	2023-06-25 00:27:34.418596	
3655	45548	27277784675	2021	2	3	fam_hijos_100	100.00	2023-06-25 00:27:34.418786	2023-06-25 00:27:34.418786	
3656	45548	27277784675	2021	3	3	fam_hijos_100	100.00	2023-06-25 00:27:34.418956	2023-06-25 00:27:34.418956	
3657	45548	27277784675	2021	4	3	fam_hijos_100	100.00	2023-06-25 00:27:34.419764	2023-06-25 00:27:34.419764	
3658	45548	27277784675	2021	5	3	fam_hijos_100	100.00	2023-06-25 00:27:34.420007	2023-06-25 00:27:34.420007	
3659	45548	27277784675	2021	6	3	fam_hijos_100	100.00	2023-06-25 00:27:34.420212	2023-06-25 00:27:34.420212	
3660	45548	27277784675	2021	7	3	fam_hijos_100	100.00	2023-06-25 00:27:34.4204	2023-06-25 00:27:34.4204	
3661	45548	27277784675	2021	8	3	fam_hijos_100	100.00	2023-06-25 00:27:34.420601	2023-06-25 00:27:34.420601	
3662	45548	27277784675	2021	9	3	fam_hijos_100	100.00	2023-06-25 00:27:34.420781	2023-06-25 00:27:34.420781	
3663	45548	27277784675	2021	10	3	fam_hijos_100	100.00	2023-06-25 00:27:34.420958	2023-06-25 00:27:34.420958	
3664	45548	27277784675	2021	11	3	fam_hijos_100	100.00	2023-06-25 00:27:34.421132	2023-06-25 00:27:34.421132	
3665	45548	27277784675	2021	12	3	fam_hijos_100	100.00	2023-06-25 00:27:34.421574	2023-06-25 00:27:34.421574	
3666	45548	27277784675	2022	1	1	ded_cuota_medica	13114.48	2023-06-25 00:27:34.429224	2023-06-25 00:27:34.429224	
3667	45548	27277784675	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:34.429624	2023-06-25 00:27:34.429624	
3668	45548	27277784675	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:34.429847	2023-06-25 00:27:34.429847	
3669	45548	27277784675	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:34.430021	2023-06-25 00:27:34.430021	
3670	45548	27277784675	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:34.430194	2023-06-25 00:27:34.430194	
3671	45548	27277784675	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:34.430365	2023-06-25 00:27:34.430365	
3672	45548	27277784675	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:34.430531	2023-06-25 00:27:34.430531	
3673	45548	27277784675	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:34.4307	2023-06-25 00:27:34.4307	
3674	45548	27277784675	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:34.430874	2023-06-25 00:27:34.430874	
3675	45548	27277784675	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:34.431049	2023-06-25 00:27:34.431049	
3676	45548	27277784675	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:34.431214	2023-06-25 00:27:34.431214	
3677	45548	27277784675	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:34.431382	2023-06-25 00:27:34.431382	
3678	45548	27277784675	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:27:34.431546	2023-06-25 00:27:34.431546	
3679	45548	27277784675	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:34.431827	2023-06-25 00:27:34.431827	
3680	45548	27277784675	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:34.431998	2023-06-25 00:27:34.431998	
3681	45548	27277784675	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:34.432175	2023-06-25 00:27:34.432175	
3682	45548	27277784675	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:34.432379	2023-06-25 00:27:34.432379	
3683	45548	27277784675	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:34.432584	2023-06-25 00:27:34.432584	
3684	45548	27277784675	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:34.432782	2023-06-25 00:27:34.432782	
3685	45548	27277784675	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:34.432971	2023-06-25 00:27:34.432971	
3686	45548	27277784675	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:34.43321	2023-06-25 00:27:34.43321	
3687	45548	27277784675	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:34.433421	2023-06-25 00:27:34.433421	
3688	45548	27277784675	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:34.433633	2023-06-25 00:27:34.433633	
3689	45548	27277784675	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:34.433849	2023-06-25 00:27:34.433849	
3690	45548	27277784675	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:27:34.434712	2023-06-25 00:27:34.434712	
3691	40527	27280858124	2021	1	1	fam_hijos_100	100.00	2023-06-25 00:27:34.440306	2023-06-25 00:27:34.440306	
3692	40527	27280858124	2021	2	1	fam_hijos_100	100.00	2023-06-25 00:27:34.440886	2023-06-25 00:27:34.440886	
3693	40527	27280858124	2021	3	1	fam_hijos_100	100.00	2023-06-25 00:27:34.441286	2023-06-25 00:27:34.441286	
3694	40527	27280858124	2021	4	1	fam_hijos_100	100.00	2023-06-25 00:27:34.441665	2023-06-25 00:27:34.441665	
3695	40527	27280858124	2021	5	1	fam_hijos_100	100.00	2023-06-25 00:27:34.441887	2023-06-25 00:27:34.441887	
3696	40527	27280858124	2021	6	1	fam_hijos_100	100.00	2023-06-25 00:27:34.442111	2023-06-25 00:27:34.442111	
3697	40527	27280858124	2021	7	1	fam_hijos_100	100.00	2023-06-25 00:27:34.442295	2023-06-25 00:27:34.442295	
3698	40527	27280858124	2021	8	1	fam_hijos_100	100.00	2023-06-25 00:27:34.442477	2023-06-25 00:27:34.442477	
3699	40527	27280858124	2021	9	1	fam_hijos_100	100.00	2023-06-25 00:27:34.44266	2023-06-25 00:27:34.44266	
3700	40527	27280858124	2021	10	1	fam_hijos_100	100.00	2023-06-25 00:27:34.442868	2023-06-25 00:27:34.442868	
3701	40527	27280858124	2021	11	1	fam_hijos_100	100.00	2023-06-25 00:27:34.443057	2023-06-25 00:27:34.443057	
3702	40527	27280858124	2021	12	1	fam_hijos_100	100.00	2023-06-25 00:27:34.443292	2023-06-25 00:27:34.443292	
3703	40527	27280858124	2021	1	1	fam_hijos_100	100.00	2023-06-25 00:27:34.443805	2023-06-25 00:27:34.443805	
3704	40527	27280858124	2021	2	1	fam_hijos_100	100.00	2023-06-25 00:27:34.444086	2023-06-25 00:27:34.444086	
3705	40527	27280858124	2021	3	1	fam_hijos_100	100.00	2023-06-25 00:27:34.444352	2023-06-25 00:27:34.444352	
3706	40527	27280858124	2021	4	1	fam_hijos_100	100.00	2023-06-25 00:27:34.444611	2023-06-25 00:27:34.444611	
3707	40527	27280858124	2021	5	1	fam_hijos_100	100.00	2023-06-25 00:27:34.444857	2023-06-25 00:27:34.444857	
3708	40527	27280858124	2021	6	1	fam_hijos_100	100.00	2023-06-25 00:27:34.445067	2023-06-25 00:27:34.445067	
3709	40527	27280858124	2021	7	1	fam_hijos_100	100.00	2023-06-25 00:27:34.445689	2023-06-25 00:27:34.445689	
3710	40527	27280858124	2021	8	1	fam_hijos_100	100.00	2023-06-25 00:27:34.44615	2023-06-25 00:27:34.44615	
3711	40527	27280858124	2021	9	1	fam_hijos_100	100.00	2023-06-25 00:27:34.446376	2023-06-25 00:27:34.446376	
3712	40527	27280858124	2021	10	1	fam_hijos_100	100.00	2023-06-25 00:27:34.446588	2023-06-25 00:27:34.446588	
3713	40527	27280858124	2021	11	1	fam_hijos_100	100.00	2023-06-25 00:27:34.446761	2023-06-25 00:27:34.446761	
3714	40527	27280858124	2021	12	1	fam_hijos_100	100.00	2023-06-25 00:27:34.446962	2023-06-25 00:27:34.446962	
3715	48462	27290066242	2022	1	1	fam_hijos_100	100.00	2023-06-25 00:27:34.460265	2023-06-25 00:27:34.460265	
3716	48462	27290066242	2022	2	1	fam_hijos_100	100.00	2023-06-25 00:27:34.460535	2023-06-25 00:27:34.460535	
3717	48462	27290066242	2022	3	1	fam_hijos_100	100.00	2023-06-25 00:27:34.460766	2023-06-25 00:27:34.460766	
3718	48462	27290066242	2022	4	1	fam_hijos_100	100.00	2023-06-25 00:27:34.460954	2023-06-25 00:27:34.460954	
3719	48462	27290066242	2022	5	1	fam_hijos_100	100.00	2023-06-25 00:27:34.461149	2023-06-25 00:27:34.461149	
3720	48462	27290066242	2022	6	1	fam_hijos_100	100.00	2023-06-25 00:27:34.461344	2023-06-25 00:27:34.461344	
3721	48462	27290066242	2022	7	1	fam_hijos_100	100.00	2023-06-25 00:27:34.461523	2023-06-25 00:27:34.461523	
3722	48462	27290066242	2022	8	1	fam_hijos_100	100.00	2023-06-25 00:27:34.461693	2023-06-25 00:27:34.461693	
3723	48462	27290066242	2022	9	1	fam_hijos_100	100.00	2023-06-25 00:27:34.461867	2023-06-25 00:27:34.461867	
3724	48462	27290066242	2022	10	1	fam_hijos_100	100.00	2023-06-25 00:27:34.462031	2023-06-25 00:27:34.462031	
3725	48462	27290066242	2022	11	1	fam_hijos_100	100.00	2023-06-25 00:27:34.46282	2023-06-25 00:27:34.46282	
3726	48462	27290066242	2022	12	1	fam_hijos_100	100.00	2023-06-25 00:27:34.463153	2023-06-25 00:27:34.463153	
3727	37819	27292776425	2021	1	8	ded_cuota_medica	4421.00	2023-06-25 00:27:34.469209	2023-06-25 00:27:34.469209	
3728	37819	27292776425	2021	2	8	ded_cuota_medica	2524.71	2023-06-25 00:27:34.469756	2023-06-25 00:27:34.469756	
3729	37819	27292776425	2021	3	8	ded_cuota_medica	2524.71	2023-06-25 00:27:34.470008	2023-06-25 00:27:34.470008	
3730	37819	27292776425	2021	4	8	ded_cuota_medica	2524.71	2023-06-25 00:27:34.470289	2023-06-25 00:27:34.470289	
3731	37819	27292776425	2021	5	8	ded_cuota_medica	3120.00	2023-06-25 00:27:34.470696	2023-06-25 00:27:34.470696	
3732	37819	27292776425	2021	6	8	ded_cuota_medica	3120.00	2023-06-25 00:27:34.470967	2023-06-25 00:27:34.470967	
3733	37819	27292776425	2021	8	8	ded_cuota_medica	2437.29	2023-06-25 00:27:34.471403	2023-06-25 00:27:34.471403	
3734	37819	27292776425	2021	9	8	ded_cuota_medica	4311.58	2023-06-25 00:27:34.471894	2023-06-25 00:27:34.471894	
3735	37819	27292776425	2021	10	8	ded_cuota_medica	7001.48	2023-06-25 00:27:34.472239	2023-06-25 00:27:34.472239	
3736	37819	27292776425	2021	11	8	ded_cuota_medica	5571.68	2023-06-25 00:27:34.472533	2023-06-25 00:27:34.472533	
3737	37819	27292776425	2021	9	8	ded_donaciones	20000.00	2023-06-25 00:27:34.473011	2023-06-25 00:27:34.473011	
3738	37819	27292776425	2021	11	8	ded_donaciones	30000.00	2023-06-25 00:27:34.473316	2023-06-25 00:27:34.473316	
3739	37819	27292776425	2021	3	8	ded_gastos_medicos	1280.00	2023-06-25 00:27:34.473744	2023-06-25 00:27:34.473744	
3740	37819	27292776425	2021	7	8	ded_gastos_medicos	600.00	2023-06-25 00:27:34.474046	2023-06-25 00:27:34.474046	
3741	37819	27292776425	2021	8	8	ded_gastos_medicos	600.00	2023-06-25 00:27:34.474329	2023-06-25 00:27:34.474329	
3742	37819	27292776425	2021	9	8	ded_gastos_medicos	600.00	2023-06-25 00:27:34.474685	2023-06-25 00:27:34.474685	
3743	37819	27292776425	2021	10	8	ded_gastos_medicos	600.00	2023-06-25 00:27:34.475023	2023-06-25 00:27:34.475023	
3744	37819	27292776425	2021	11	8	ded_gastos_medicos	1200.00	2023-06-25 00:27:34.475355	2023-06-25 00:27:34.475355	
3745	37819	27292776425	2021	12	8	ded_gastos_medicos	1200.00	2023-06-25 00:27:34.475709	2023-06-25 00:27:34.475709	
3746	37819	27292776425	2021	6	8	ded_domestica	7999.34	2023-06-25 00:27:34.476294	2023-06-25 00:27:34.476294	
3747	37819	27292776425	2021	7	8	ded_domestica	7999.34	2023-06-25 00:27:34.476484	2023-06-25 00:27:34.476484	
3748	37819	27292776425	2021	8	8	ded_domestica	8905.01	2023-06-25 00:27:34.476769	2023-06-25 00:27:34.476769	
3749	37819	27292776425	2021	9	8	ded_domestica	8937.42	2023-06-25 00:27:34.477094	2023-06-25 00:27:34.477094	
3750	37819	27292776425	2021	10	8	ded_domestica	8937.42	2023-06-25 00:27:34.477771	2023-06-25 00:27:34.477771	
3751	37819	27292776425	2021	11	8	ded_domestica	8976.85	2023-06-25 00:27:34.478249	2023-06-25 00:27:34.478249	
3752	37819	27292776425	2021	12	8	ded_domestica	13176.85	2023-06-25 00:27:34.478719	2023-06-25 00:27:34.478719	
3753	48394	27340209929	2021	1	15	ded_alquiler	7349.20	2023-06-25 00:27:34.486915	2023-06-25 00:27:34.486915	
3754	48394	27340209929	2021	2	15	ded_alquiler	8349.20	2023-06-25 00:27:34.487266	2023-06-25 00:27:34.487266	
3755	48394	27340209929	2021	3	15	ded_alquiler	8349.20	2023-06-25 00:27:34.487448	2023-06-25 00:27:34.487448	
3756	48394	27340209929	2021	4	15	ded_alquiler	8349.20	2023-06-25 00:27:34.487624	2023-06-25 00:27:34.487624	
3757	48394	27340209929	2021	5	15	ded_alquiler	8349.20	2023-06-25 00:27:34.487797	2023-06-25 00:27:34.487797	
3758	48394	27340209929	2021	6	15	ded_alquiler	8349.20	2023-06-25 00:27:34.487969	2023-06-25 00:27:34.487969	
3759	48394	27340209929	2021	7	15	ded_alquiler	8349.20	2023-06-25 00:27:34.488148	2023-06-25 00:27:34.488148	
3760	48394	27340209929	2021	8	15	ded_alquiler	9349.20	2023-06-25 00:27:34.488499	2023-06-25 00:27:34.488499	
3761	48394	27340209929	2021	9	15	ded_alquiler	9349.20	2023-06-25 00:27:34.488678	2023-06-25 00:27:34.488678	
3762	48394	27340209929	2021	10	15	ded_alquiler	9349.20	2023-06-25 00:27:34.488858	2023-06-25 00:27:34.488858	
3763	48394	27340209929	2021	11	15	ded_alquiler	9349.20	2023-06-25 00:27:34.489076	2023-06-25 00:27:34.489076	
3764	48394	27340209929	2021	12	15	ded_alquiler	9349.20	2023-06-25 00:27:34.489298	2023-06-25 00:27:34.489298	
3765	48394	27340209929	2022	1	4	ded_alquiler	9624.00	2023-06-25 00:27:34.494115	2023-06-25 00:27:34.494115	
3766	48394	27340209929	2022	2	4	ded_alquiler	10624.00	2023-06-25 00:27:34.494444	2023-06-25 00:27:34.494444	
3767	48394	27340209929	2022	3	4	ded_alquiler	10624.00	2023-06-25 00:27:34.494632	2023-06-25 00:27:34.494632	
3768	48394	27340209929	2022	4	4	ded_alquiler	10624.00	2023-06-25 00:27:34.494811	2023-06-25 00:27:34.494811	
3769	43250	27361629731	2022	4	2	ded_gastos_medicos	12000.00	2023-06-25 00:27:34.505612	2023-06-25 00:27:34.505612	
3770	43250	27361629731	2022	3	2	ded_gastos_medicos	14800.00	2023-06-25 00:27:34.506282	2023-06-25 00:27:34.506282	
3771	19851	27925229070	2021	1	18	ded_seguros	75.13	2023-06-25 00:27:34.528634	2023-06-25 00:27:34.528634	
3772	19851	27925229070	2021	2	18	ded_seguros	75.00	2023-06-25 00:27:34.529414	2023-06-25 00:27:34.529414	
3773	19851	27925229070	2021	3	18	ded_seguros	74.86	2023-06-25 00:27:34.530258	2023-06-25 00:27:34.530258	
3774	19851	27925229070	2021	4	18	ded_seguros	74.71	2023-06-25 00:27:34.531049	2023-06-25 00:27:34.531049	
3775	19851	27925229070	2021	5	18	ded_seguros	74.56	2023-06-25 00:27:34.531719	2023-06-25 00:27:34.531719	
3776	19851	27925229070	2021	6	18	ded_seguros	74.41	2023-06-25 00:27:34.532186	2023-06-25 00:27:34.532186	
3777	19851	27925229070	2021	7	18	ded_seguros	74.25	2023-06-25 00:27:34.532687	2023-06-25 00:27:34.532687	
3778	19851	27925229070	2021	8	18	ded_seguros	74.09	2023-06-25 00:27:34.533158	2023-06-25 00:27:34.533158	
3779	19851	27925229070	2021	9	18	ded_seguros	73.92	2023-06-25 00:27:34.533672	2023-06-25 00:27:34.533672	
3780	19851	27925229070	2021	10	18	ded_seguros	73.75	2023-06-25 00:27:34.534149	2023-06-25 00:27:34.534149	
3781	19851	27925229070	2021	11	18	ded_seguros	73.57	2023-06-25 00:27:34.534658	2023-06-25 00:27:34.534658	
3782	19851	27925229070	2021	12	18	ded_seguros	73.39	2023-06-25 00:27:34.535024	2023-06-25 00:27:34.535024	
3783	19851	27925229070	2021	9	18	ded_donaciones	8000.00	2023-06-25 00:27:34.535521	2023-06-25 00:27:34.535521	
3784	19851	27925229070	2021	1	18	ded_int_hipotecarios	2308.72	2023-06-25 00:27:34.536004	2023-06-25 00:27:34.536004	
3785	19851	27925229070	2021	2	18	ded_int_hipotecarios	2304.08	2023-06-25 00:27:34.536354	2023-06-25 00:27:34.536354	
3786	19851	27925229070	2021	3	18	ded_int_hipotecarios	2302.40	2023-06-25 00:27:34.536694	2023-06-25 00:27:34.536694	
3787	19851	27925229070	2021	4	18	ded_int_hipotecarios	2295.65	2023-06-25 00:27:34.536997	2023-06-25 00:27:34.536997	
3788	19851	27925229070	2021	5	18	ded_int_hipotecarios	2291.24	2023-06-25 00:27:34.537314	2023-06-25 00:27:34.537314	
3789	19851	27925229070	2021	6	18	ded_int_hipotecarios	2286.08	2023-06-25 00:27:34.537625	2023-06-25 00:27:34.537625	
3790	19851	27925229070	2021	7	18	ded_int_hipotecarios	2275.26	2023-06-25 00:27:34.537929	2023-06-25 00:27:34.537929	
3791	19851	27925229070	2021	8	18	ded_int_hipotecarios	2277.14	2023-06-25 00:27:34.538241	2023-06-25 00:27:34.538241	
3792	19851	27925229070	2021	9	18	ded_int_hipotecarios	2267.89	2023-06-25 00:27:34.538553	2023-06-25 00:27:34.538553	
3793	19851	27925229070	2021	10	18	ded_int_hipotecarios	2265.17	2023-06-25 00:27:34.538899	2023-06-25 00:27:34.538899	
3794	19851	27925229070	2021	11	18	ded_int_hipotecarios	2264.12	2023-06-25 00:27:34.539254	2023-06-25 00:27:34.539254	
3795	19851	27925229070	2021	12	18	ded_int_hipotecarios	2259.87	2023-06-25 00:27:34.539579	2023-06-25 00:27:34.539579	
3796	19851	27925229070	2021	4	18	ded_gastos_medicos	3120.00	2023-06-25 00:27:34.540031	2023-06-25 00:27:34.540031	
3797	19851	27925229070	2022	1	3	ded_seguros	73.20	2023-06-25 00:27:34.558139	2023-06-25 00:27:34.558139	
3798	19851	27925229070	2022	2	3	ded_seguros	73.02	2023-06-25 00:27:34.558482	2023-06-25 00:27:34.558482	
3799	19851	27925229070	2022	1	3	ded_int_hipotecarios	2251.83	2023-06-25 00:27:34.559641	2023-06-25 00:27:34.559641	
3800	19851	27925229070	2022	2	3	ded_int_hipotecarios	2328.61	2023-06-25 00:27:34.560365	2023-06-25 00:27:34.560365	
3801	48002	27947155569	2021	1	9	otro_gan_brut	95431.94	2023-06-25 00:27:34.574526	2023-06-25 00:27:34.574526	
3802	48002	27947155569	2021	1	9	otro_seg_soc	5492.71	2023-06-25 00:27:34.574992	2023-06-25 00:27:34.574992	
3803	48002	27947155569	2021	1	9	otro_sindicato	990.76	2023-06-25 00:27:34.575433	2023-06-25 00:27:34.575433	
3804	48002	27947155569	2021	1	9	otro_obra_soc	2996.02	2023-06-25 00:27:34.57584	2023-06-25 00:27:34.57584	
\.


--
-- Data for Name: f572_siradiglogs; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_siradiglogs (id, fechahora, tipo, descripcion, referencia, sessid) FROM stdin;
\.


--
-- Name: f572_archivos_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_archivos_id_seq', 1, false);


--
-- Name: f572_cargasfamilia_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_cargasfamilia_id_seq', 128, true);


--
-- Name: f572_datadicional_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_datadicional_id_seq', 18, true);


--
-- Name: f572_deducciones_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_deducciones_id_seq', 592, true);


--
-- Name: f572_deduccionesdetalle_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_deduccionesdetalle_id_seq', 476, true);


--
-- Name: f572_deduccionesperiodo_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_deduccionesperiodo_id_seq', 1114, true);


--
-- Name: f572_otrosempl_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_otrosempl_id_seq', 46, true);


--
-- Name: f572_otrosemplingaporte_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_otrosemplingaporte_id_seq', 250, true);


--
-- Name: f572_presentacion_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_presentacion_id_seq', 236, true);


--
-- Name: f572_presentacionb_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_presentacionb_id_seq', 22, true);


--
-- Name: f572_retperpagos_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_retperpagos_id_seq', 108, true);


--
-- Name: f572_retperpagosdetalle_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_retperpagosdetalle_id_seq', 30, true);


--
-- Name: f572_retperpagosperiodo_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_retperpagosperiodo_id_seq', 518, true);


--
-- Name: f572_sajustes_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_sajustes_id_seq', 1, false);


--
-- Name: f572_sajustesdetalle_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_sajustesdetalle_id_seq', 1, false);


--
-- Name: f572_siradigconceptos_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_siradigconceptos_id_seq', 3804, true);


--
-- Name: f572_siradiglogs_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_siradiglogs_id_seq', 1, false);


--
-- Name: extra_cargo extra_cargo_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.extra_cargo
    ADD CONSTRAINT extra_cargo_pkey PRIMARY KEY (anio, mes, nro_legajo, nro_cargo);


--
-- Name: extra_siradig extra_siradig_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.extra_siradig
    ADD CONSTRAINT extra_siradig_pkey PRIMARY KEY (legajo, anio, mes, nrover, atributo);


--
-- Name: f572_archivos f572_archivos_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_archivos
    ADD CONSTRAINT f572_archivos_pkey PRIMARY KEY (id);


--
-- Name: f572_cargasfamilia f572_cargasfamilia_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_cargasfamilia
    ADD CONSTRAINT f572_cargasfamilia_pkey PRIMARY KEY (id);


--
-- Name: f572_datadicional f572_datadicional_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_datadicional
    ADD CONSTRAINT f572_datadicional_pkey PRIMARY KEY (id);


--
-- Name: f572_deducciones f572_deducciones_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deducciones
    ADD CONSTRAINT f572_deducciones_pkey PRIMARY KEY (id);


--
-- Name: f572_deduccionesdetalle f572_deduccionesdetalle_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deduccionesdetalle
    ADD CONSTRAINT f572_deduccionesdetalle_pkey PRIMARY KEY (id);


--
-- Name: f572_deduccionesperiodo f572_deduccionesperiodo_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deduccionesperiodo
    ADD CONSTRAINT f572_deduccionesperiodo_pkey PRIMARY KEY (id);


--
-- Name: f572_otrosempl f572_otrosempl_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_otrosempl
    ADD CONSTRAINT f572_otrosempl_pkey PRIMARY KEY (id);


--
-- Name: f572_otrosemplingaporte f572_otrosemplingaporte_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_otrosemplingaporte
    ADD CONSTRAINT f572_otrosemplingaporte_pkey PRIMARY KEY (id);


--
-- Name: f572_presentacion f572_presentacion_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_presentacion
    ADD CONSTRAINT f572_presentacion_pkey PRIMARY KEY (id);


--
-- Name: f572_presentacionb f572_presentacionb_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_presentacionb
    ADD CONSTRAINT f572_presentacionb_pkey PRIMARY KEY (id);


--
-- Name: f572_relacionatributos f572_relacionatributos_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_relacionatributos
    ADD CONSTRAINT f572_relacionatributos_pkey PRIMARY KEY (grupo, codigoafip);


--
-- Name: f572_relacionatributosgrp f572_relacionatributosgrp_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_relacionatributosgrp
    ADD CONSTRAINT f572_relacionatributosgrp_pkey PRIMARY KEY (obj);


--
-- Name: f572_retperpagos f572_retperpagos_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagos
    ADD CONSTRAINT f572_retperpagos_pkey PRIMARY KEY (id);


--
-- Name: f572_retperpagosdetalle f572_retperpagosdetalle_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagosdetalle
    ADD CONSTRAINT f572_retperpagosdetalle_pkey PRIMARY KEY (id);


--
-- Name: f572_retperpagosperiodo f572_retperpagosperiodo_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagosperiodo
    ADD CONSTRAINT f572_retperpagosperiodo_pkey PRIMARY KEY (id);


--
-- Name: f572_sajustes f572_sajustes_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_sajustes
    ADD CONSTRAINT f572_sajustes_pkey PRIMARY KEY (id);


--
-- Name: f572_sajustesdetalle f572_sajustesdetalle_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_sajustesdetalle
    ADD CONSTRAINT f572_sajustesdetalle_pkey PRIMARY KEY (id);


--
-- Name: f572_siradigconceptos f572_siradigconceptos_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_siradigconceptos
    ADD CONSTRAINT f572_siradigconceptos_pkey PRIMARY KEY (id);


--
-- Name: f572_siradiglogs f572_siradiglogs_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_siradiglogs
    ADD CONSTRAINT f572_siradiglogs_pkey PRIMARY KEY (id);


--
-- Name: f572_cargasfamilia fk_siradig_f572_cargasfamilia_f572_presentacion1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_cargasfamilia
    ADD CONSTRAINT fk_siradig_f572_cargasfamilia_f572_presentacion1 FOREIGN KEY (presentacion_id) REFERENCES siradig.f572_presentacion(id);


--
-- Name: f572_datadicional fk_siradig_f572_datadicional_f572_presentacion1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_datadicional
    ADD CONSTRAINT fk_siradig_f572_datadicional_f572_presentacion1 FOREIGN KEY (presentacion_id) REFERENCES siradig.f572_presentacion(id);


--
-- Name: f572_deducciones fk_siradig_f572_deducciones_f572_presentacion1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deducciones
    ADD CONSTRAINT fk_siradig_f572_deducciones_f572_presentacion1 FOREIGN KEY (presentacion_id) REFERENCES siradig.f572_presentacion(id);


--
-- Name: f572_deduccionesdetalle fk_siradig_f572_deduccionesdetalle_f572_deducciones1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deduccionesdetalle
    ADD CONSTRAINT fk_siradig_f572_deduccionesdetalle_f572_deducciones1 FOREIGN KEY (deduccion_id) REFERENCES siradig.f572_deducciones(id);


--
-- Name: f572_deduccionesperiodo fk_siradig_f572_deduccionesperiodo_f572_deducciones1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deduccionesperiodo
    ADD CONSTRAINT fk_siradig_f572_deduccionesperiodo_f572_deducciones1 FOREIGN KEY (deduccion_id) REFERENCES siradig.f572_deducciones(id);


--
-- Name: f572_otrosempl fk_siradig_f572_otrosempl_f572_presentacion1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_otrosempl
    ADD CONSTRAINT fk_siradig_f572_otrosempl_f572_presentacion1 FOREIGN KEY (presentacion_id) REFERENCES siradig.f572_presentacion(id);


--
-- Name: f572_otrosemplingaporte fk_siradig_f572_otrosemplingaporte_f572_otrosempl1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_otrosemplingaporte
    ADD CONSTRAINT fk_siradig_f572_otrosemplingaporte_f572_otrosempl1 FOREIGN KEY (otrosemp_id) REFERENCES siradig.f572_otrosempl(id);


--
-- Name: f572_retperpagos fk_siradig_f572_retperpagos_f572_presentacion1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagos
    ADD CONSTRAINT fk_siradig_f572_retperpagos_f572_presentacion1 FOREIGN KEY (presentacion_id) REFERENCES siradig.f572_presentacion(id);


--
-- Name: f572_retperpagosdetalle fk_siradig_f572_retperpagosdetalle_f572_retperpagos1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagosdetalle
    ADD CONSTRAINT fk_siradig_f572_retperpagosdetalle_f572_retperpagos1 FOREIGN KEY (retperpago_id) REFERENCES siradig.f572_retperpagos(id);


--
-- Name: f572_retperpagosperiodo fk_siradig_f572_retperpagosperiodo_f572_retperpagos1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagosperiodo
    ADD CONSTRAINT fk_siradig_f572_retperpagosperiodo_f572_retperpagos1 FOREIGN KEY (retperpago_id) REFERENCES siradig.f572_retperpagos(id);


--
-- Name: f572_sajustes fk_siradig_f572_sajustes_f572_presentacion1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_sajustes
    ADD CONSTRAINT fk_siradig_f572_sajustes_f572_presentacion1 FOREIGN KEY (presentacion_id) REFERENCES siradig.f572_presentacion(id);


--
-- Name: f572_sajustesdetalle fk_siradig_f572_sajustesdetalle_f572_sajustes1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_sajustesdetalle
    ADD CONSTRAINT fk_siradig_f572_sajustesdetalle_f572_sajustes1 FOREIGN KEY (ajuste_id) REFERENCES siradig.f572_sajustes(id);


--
-- PostgreSQL database dump complete
--

