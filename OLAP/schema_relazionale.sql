--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.1
-- Dumped by pg_dump version 9.4.1
-- Started on 2016-04-02 16:51:18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 33746)
-- Name: ava; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ava;


ALTER SCHEMA ava OWNER TO postgres;

--
-- TOC entry 214 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2170 (class 0 OID 0)
-- Dependencies: 214
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = ava, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 178 (class 1259 OID 33768)
-- Name: anno_accademico; Type: TABLE; Schema: ava; Owner: postgres; Tablespace: 
--

CREATE TABLE anno_accademico (
    aa_key integer NOT NULL,
    codice_anno integer,
    nome_anno_x character varying(20),
    nome_anno_x_1 character varying(20),
    nome_anno_x_1_x character varying(20)
);


ALTER TABLE anno_accademico OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 33766)
-- Name: anno_accademico_aa_key_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE anno_accademico_aa_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anno_accademico_aa_key_seq OWNER TO postgres;

--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 177
-- Name: anno_accademico_aa_key_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE anno_accademico_aa_key_seq OWNED BY anno_accademico.aa_key;


--
-- TOC entry 190 (class 1259 OID 33816)
-- Name: canale; Type: TABLE; Schema: ava; Owner: postgres; Tablespace: 
--

CREATE TABLE canale (
    canale_key integer NOT NULL,
    canale character varying(20)
);


ALTER TABLE canale OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 33814)
-- Name: canale_canale_key_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE canale_canale_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE canale_canale_key_seq OWNER TO postgres;

--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 189
-- Name: canale_canale_key_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE canale_canale_key_seq OWNED BY canale.canale_key;


--
-- TOC entry 184 (class 1259 OID 33792)
-- Name: corso; Type: TABLE; Schema: ava; Owner: postgres; Tablespace: 
--

CREATE TABLE corso (
    corso_key integer NOT NULL,
    codice_corso character varying(15),
    nome_corso character varying(250),
    cfu_corso smallint,
    ssd character varying(100)
);


ALTER TABLE corso OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 33790)
-- Name: corso_corso_key_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE corso_corso_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corso_corso_key_seq OWNER TO postgres;

--
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 183
-- Name: corso_corso_key_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE corso_corso_key_seq OWNED BY corso.corso_key;


--
-- TOC entry 180 (class 1259 OID 33776)
-- Name: corso_di_studi; Type: TABLE; Schema: ava; Owner: postgres; Tablespace: 
--

CREATE TABLE corso_di_studi (
    cds_key integer NOT NULL,
    codice_cds integer,
    inizio_validita date,
    fine_validita date,
    tipo_cds character varying(80),
    nome_cds character varying(100),
    durata_legale smallint,
    codice_dipartimento integer,
    nome_dipartimento character varying(70),
    codice_ateneo character varying(5)
);


ALTER TABLE corso_di_studi OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 33774)
-- Name: corso_di_studi_cds_key_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE corso_di_studi_cds_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corso_di_studi_cds_key_seq OWNER TO postgres;

--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 179
-- Name: corso_di_studi_cds_key_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE corso_di_studi_cds_key_seq OWNED BY corso_di_studi.cds_key;


--
-- TOC entry 188 (class 1259 OID 33808)
-- Name: didattica; Type: TABLE; Schema: ava; Owner: postgres; Tablespace: 
--

CREATE TABLE didattica (
    didattica_key integer NOT NULL,
    codice_att_didattica character varying(20),
    nome_att_didattica character varying(40),
    codice_unita_didattica character varying(20),
    nome_unita_didattica character varying(40),
    cfu_unita_didattica smallint
);


ALTER TABLE didattica OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 33806)
-- Name: didattica_didattica_key_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE didattica_didattica_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE didattica_didattica_key_seq OWNER TO postgres;

--
-- TOC entry 2175 (class 0 OID 0)
-- Dependencies: 187
-- Name: didattica_didattica_key_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE didattica_didattica_key_seq OWNED BY didattica.didattica_key;


--
-- TOC entry 186 (class 1259 OID 33800)
-- Name: docente; Type: TABLE; Schema: ava; Owner: postgres; Tablespace: 
--

CREATE TABLE docente (
    docente_key integer NOT NULL,
    codice_docente character varying(20),
    nome_docente character varying(40),
    cognome_docente character varying(40),
    dipartimento_docente character varying(50),
    ssd_docente character varying(15),
    ruolo boolean
);


ALTER TABLE docente OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 33798)
-- Name: docente_docente_key_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE docente_docente_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE docente_docente_key_seq OWNER TO postgres;

--
-- TOC entry 2176 (class 0 OID 0)
-- Dependencies: 185
-- Name: docente_docente_key_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE docente_docente_key_seq OWNED BY docente.docente_key;


--
-- TOC entry 208 (class 1259 OID 33936)
-- Name: esami; Type: TABLE; Schema: ava; Owner: postgres; Tablespace: 
--

CREATE TABLE esami (
    studente integer NOT NULL,
    anno_accademico integer NOT NULL,
    corso_di_studi integer NOT NULL,
    corso integer NOT NULL,
    tempo integer NOT NULL,
    voto smallint,
    cfu_acquisiti smallint
);


ALTER TABLE esami OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 33928)
-- Name: esami_anno_accademico_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE esami_anno_accademico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esami_anno_accademico_seq OWNER TO postgres;

--
-- TOC entry 2177 (class 0 OID 0)
-- Dependencies: 204
-- Name: esami_anno_accademico_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE esami_anno_accademico_seq OWNED BY esami.anno_accademico;


--
-- TOC entry 205 (class 1259 OID 33930)
-- Name: esami_corso_di_studi_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE esami_corso_di_studi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esami_corso_di_studi_seq OWNER TO postgres;

--
-- TOC entry 2178 (class 0 OID 0)
-- Dependencies: 205
-- Name: esami_corso_di_studi_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE esami_corso_di_studi_seq OWNED BY esami.corso_di_studi;


--
-- TOC entry 206 (class 1259 OID 33932)
-- Name: esami_corso_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE esami_corso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esami_corso_seq OWNER TO postgres;

--
-- TOC entry 2179 (class 0 OID 0)
-- Dependencies: 206
-- Name: esami_corso_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE esami_corso_seq OWNED BY esami.corso;


--
-- TOC entry 203 (class 1259 OID 33926)
-- Name: esami_studente_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE esami_studente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esami_studente_seq OWNER TO postgres;

--
-- TOC entry 2180 (class 0 OID 0)
-- Dependencies: 203
-- Name: esami_studente_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE esami_studente_seq OWNED BY esami.studente;


--
-- TOC entry 207 (class 1259 OID 33934)
-- Name: esami_tempo_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE esami_tempo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esami_tempo_seq OWNER TO postgres;

--
-- TOC entry 2181 (class 0 OID 0)
-- Dependencies: 207
-- Name: esami_tempo_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE esami_tempo_seq OWNED BY esami.tempo;


--
-- TOC entry 202 (class 1259 OID 33893)
-- Name: ingressi; Type: TABLE; Schema: ava; Owner: postgres; Tablespace: 
--

CREATE TABLE ingressi (
    studente integer NOT NULL,
    anno_accademico integer NOT NULL,
    corso_di_studi integer NOT NULL,
    tipo_immatricolazione integer NOT NULL,
    tempo integer NOT NULL,
    punteggio_test smallint,
    immatricolato smallint
);


ALTER TABLE ingressi OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 33885)
-- Name: ingressi_anno_accademico_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE ingressi_anno_accademico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ingressi_anno_accademico_seq OWNER TO postgres;

--
-- TOC entry 2182 (class 0 OID 0)
-- Dependencies: 198
-- Name: ingressi_anno_accademico_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE ingressi_anno_accademico_seq OWNED BY ingressi.anno_accademico;


--
-- TOC entry 199 (class 1259 OID 33887)
-- Name: ingressi_corso_di_studi_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE ingressi_corso_di_studi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ingressi_corso_di_studi_seq OWNER TO postgres;

--
-- TOC entry 2183 (class 0 OID 0)
-- Dependencies: 199
-- Name: ingressi_corso_di_studi_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE ingressi_corso_di_studi_seq OWNED BY ingressi.corso_di_studi;


--
-- TOC entry 197 (class 1259 OID 33883)
-- Name: ingressi_studente_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE ingressi_studente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ingressi_studente_seq OWNER TO postgres;

--
-- TOC entry 2184 (class 0 OID 0)
-- Dependencies: 197
-- Name: ingressi_studente_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE ingressi_studente_seq OWNED BY ingressi.studente;


--
-- TOC entry 201 (class 1259 OID 33891)
-- Name: ingressi_tempo_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE ingressi_tempo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ingressi_tempo_seq OWNER TO postgres;

--
-- TOC entry 2185 (class 0 OID 0)
-- Dependencies: 201
-- Name: ingressi_tempo_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE ingressi_tempo_seq OWNED BY ingressi.tempo;


--
-- TOC entry 200 (class 1259 OID 33889)
-- Name: ingressi_tipo_immatricolazione_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE ingressi_tipo_immatricolazione_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ingressi_tipo_immatricolazione_seq OWNER TO postgres;

--
-- TOC entry 2186 (class 0 OID 0)
-- Dependencies: 200
-- Name: ingressi_tipo_immatricolazione_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE ingressi_tipo_immatricolazione_seq OWNED BY ingressi.tipo_immatricolazione;


--
-- TOC entry 213 (class 1259 OID 33977)
-- Name: lauree; Type: TABLE; Schema: ava; Owner: postgres; Tablespace: 
--

CREATE TABLE lauree (
    studente integer NOT NULL,
    anno_accademico integer NOT NULL,
    corso_di_studi integer NOT NULL,
    tempo integer NOT NULL,
    voto_laurea smallint,
    voto_laurea_formatted character varying(30)
);


ALTER TABLE lauree OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 33971)
-- Name: lauree_anno_accademico_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE lauree_anno_accademico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lauree_anno_accademico_seq OWNER TO postgres;

--
-- TOC entry 2187 (class 0 OID 0)
-- Dependencies: 210
-- Name: lauree_anno_accademico_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE lauree_anno_accademico_seq OWNED BY lauree.anno_accademico;


--
-- TOC entry 211 (class 1259 OID 33973)
-- Name: lauree_corso_di_studi_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE lauree_corso_di_studi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lauree_corso_di_studi_seq OWNER TO postgres;

--
-- TOC entry 2188 (class 0 OID 0)
-- Dependencies: 211
-- Name: lauree_corso_di_studi_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE lauree_corso_di_studi_seq OWNED BY lauree.corso_di_studi;


--
-- TOC entry 209 (class 1259 OID 33969)
-- Name: lauree_studente_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE lauree_studente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lauree_studente_seq OWNER TO postgres;

--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 209
-- Name: lauree_studente_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE lauree_studente_seq OWNED BY lauree.studente;


--
-- TOC entry 212 (class 1259 OID 33975)
-- Name: lauree_tempo_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE lauree_tempo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lauree_tempo_seq OWNER TO postgres;

--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 212
-- Name: lauree_tempo_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE lauree_tempo_seq OWNED BY lauree.tempo;


--
-- TOC entry 174 (class 1259 OID 33749)
-- Name: studente; Type: TABLE; Schema: ava; Owner: postgres; Tablespace: 
--

CREATE TABLE studente (
    studente_key integer NOT NULL,
    codice_fiscale character varying(38),
    data_nascita date,
    coorte smallint,
    titolo_di_studio character varying(79),
    sesso character varying(15),
    regione_residenza character varying(31),
    provincia_residenza character varying(35),
    comune_residenza character varying(72),
    stato_residenza character varying(54),
    cittadinanza character varying(54),
    voto_scuola_media_superiore character varying(34),
    nazione_diploma character varying(54),
    tipo_scuola_media_superiore character varying(89),
    istituto_scuola_media_superiore character varying(89),
    anno_diploma smallint
);


ALTER TABLE studente OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 33747)
-- Name: studente_studente_key_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE studente_studente_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE studente_studente_key_seq OWNER TO postgres;

--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 173
-- Name: studente_studente_key_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE studente_studente_key_seq OWNED BY studente.studente_key;


--
-- TOC entry 195 (class 1259 OID 33838)
-- Name: tempo; Type: TABLE; Schema: ava; Owner: postgres; Tablespace: 
--

CREATE TABLE tempo (
    date date,
    year double precision,
    month double precision,
    monthname text,
    day double precision,
    dayofyear double precision,
    weekdayname text,
    calendarweek double precision,
    pentahodate text,
    formatteddate text,
    datetypedate date,
    quartal text,
    yearquartal text,
    yearmonth text,
    yearonly text,
    anno date,
    mese date,
    giorno date,
    yearcalendarweek text,
    weekend text,
    americanholiday text,
    austrianholiday text,
    canadianholiday text,
    period text,
    cwstart date,
    cwend date,
    monthstart date,
    monthend timestamp without time zone,
    tempo_key integer NOT NULL
);


ALTER TABLE tempo OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 33844)
-- Name: tempo_tempo_key_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE tempo_tempo_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tempo_tempo_key_seq OWNER TO postgres;

--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 196
-- Name: tempo_tempo_key_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE tempo_tempo_key_seq OWNED BY tempo.tempo_key;


--
-- TOC entry 192 (class 1259 OID 33824)
-- Name: tipo_copertura; Type: TABLE; Schema: ava; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_copertura (
    tipo_copertura_key integer NOT NULL,
    tipo_copertura character varying(20)
);


ALTER TABLE tipo_copertura OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 33822)
-- Name: tipo_copertura_tipo_copertura_key_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE tipo_copertura_tipo_copertura_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_copertura_tipo_copertura_key_seq OWNER TO postgres;

--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 191
-- Name: tipo_copertura_tipo_copertura_key_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE tipo_copertura_tipo_copertura_key_seq OWNED BY tipo_copertura.tipo_copertura_key;


--
-- TOC entry 176 (class 1259 OID 33760)
-- Name: tipo_immatricolazione; Type: TABLE; Schema: ava; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_immatricolazione (
    immatricolazione_key integer NOT NULL,
    immatricolazione_key_surrogata character varying(3),
    tipo_immatricolazione character varying(70)
);


ALTER TABLE tipo_immatricolazione OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 33758)
-- Name: tipo_immatricolazione_immatricolazione_key_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE tipo_immatricolazione_immatricolazione_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_immatricolazione_immatricolazione_key_seq OWNER TO postgres;

--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 175
-- Name: tipo_immatricolazione_immatricolazione_key_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE tipo_immatricolazione_immatricolazione_key_seq OWNED BY tipo_immatricolazione.immatricolazione_key;


--
-- TOC entry 182 (class 1259 OID 33784)
-- Name: tipo_iscrizione; Type: TABLE; Schema: ava; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_iscrizione (
    iscrizione_key integer NOT NULL,
    tipo_iscrizione character varying(50),
    in_corso boolean,
    anno_corso smallint,
    numero_anni_fc smallint
);


ALTER TABLE tipo_iscrizione OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 33782)
-- Name: tipo_iscrizione_iscrizione_key_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE tipo_iscrizione_iscrizione_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_iscrizione_iscrizione_key_seq OWNER TO postgres;

--
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 181
-- Name: tipo_iscrizione_iscrizione_key_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE tipo_iscrizione_iscrizione_key_seq OWNED BY tipo_iscrizione.iscrizione_key;


--
-- TOC entry 194 (class 1259 OID 33832)
-- Name: tipo_uscita; Type: TABLE; Schema: ava; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_uscita (
    tipo_uscita_key integer NOT NULL,
    tipo_uscita character varying(70)
);


ALTER TABLE tipo_uscita OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 33830)
-- Name: tipo_uscita_tipo_uscita_key_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE tipo_uscita_tipo_uscita_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_uscita_tipo_uscita_key_seq OWNER TO postgres;

--
-- TOC entry 2196 (class 0 OID 0)
-- Dependencies: 193
-- Name: tipo_uscita_tipo_uscita_key_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE tipo_uscita_tipo_uscita_key_seq OWNED BY tipo_uscita.tipo_uscita_key;


--
-- TOC entry 1992 (class 2604 OID 33771)
-- Name: aa_key; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY anno_accademico ALTER COLUMN aa_key SET DEFAULT nextval('anno_accademico_aa_key_seq'::regclass);


--
-- TOC entry 1998 (class 2604 OID 33819)
-- Name: canale_key; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY canale ALTER COLUMN canale_key SET DEFAULT nextval('canale_canale_key_seq'::regclass);


--
-- TOC entry 1995 (class 2604 OID 33795)
-- Name: corso_key; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY corso ALTER COLUMN corso_key SET DEFAULT nextval('corso_corso_key_seq'::regclass);


--
-- TOC entry 1993 (class 2604 OID 33779)
-- Name: cds_key; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY corso_di_studi ALTER COLUMN cds_key SET DEFAULT nextval('corso_di_studi_cds_key_seq'::regclass);


--
-- TOC entry 1997 (class 2604 OID 33811)
-- Name: didattica_key; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY didattica ALTER COLUMN didattica_key SET DEFAULT nextval('didattica_didattica_key_seq'::regclass);


--
-- TOC entry 1996 (class 2604 OID 33803)
-- Name: docente_key; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY docente ALTER COLUMN docente_key SET DEFAULT nextval('docente_docente_key_seq'::regclass);


--
-- TOC entry 2007 (class 2604 OID 33939)
-- Name: studente; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami ALTER COLUMN studente SET DEFAULT nextval('esami_studente_seq'::regclass);


--
-- TOC entry 2008 (class 2604 OID 33940)
-- Name: anno_accademico; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami ALTER COLUMN anno_accademico SET DEFAULT nextval('esami_anno_accademico_seq'::regclass);


--
-- TOC entry 2009 (class 2604 OID 33941)
-- Name: corso_di_studi; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami ALTER COLUMN corso_di_studi SET DEFAULT nextval('esami_corso_di_studi_seq'::regclass);


--
-- TOC entry 2010 (class 2604 OID 33942)
-- Name: corso; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami ALTER COLUMN corso SET DEFAULT nextval('esami_corso_seq'::regclass);


--
-- TOC entry 2011 (class 2604 OID 33943)
-- Name: tempo; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami ALTER COLUMN tempo SET DEFAULT nextval('esami_tempo_seq'::regclass);


--
-- TOC entry 2002 (class 2604 OID 33896)
-- Name: studente; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi ALTER COLUMN studente SET DEFAULT nextval('ingressi_studente_seq'::regclass);


--
-- TOC entry 2003 (class 2604 OID 33897)
-- Name: anno_accademico; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi ALTER COLUMN anno_accademico SET DEFAULT nextval('ingressi_anno_accademico_seq'::regclass);


--
-- TOC entry 2004 (class 2604 OID 33898)
-- Name: corso_di_studi; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi ALTER COLUMN corso_di_studi SET DEFAULT nextval('ingressi_corso_di_studi_seq'::regclass);


--
-- TOC entry 2005 (class 2604 OID 33899)
-- Name: tipo_immatricolazione; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi ALTER COLUMN tipo_immatricolazione SET DEFAULT nextval('ingressi_tipo_immatricolazione_seq'::regclass);


--
-- TOC entry 2006 (class 2604 OID 33900)
-- Name: tempo; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi ALTER COLUMN tempo SET DEFAULT nextval('ingressi_tempo_seq'::regclass);


--
-- TOC entry 2012 (class 2604 OID 33980)
-- Name: studente; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree ALTER COLUMN studente SET DEFAULT nextval('lauree_studente_seq'::regclass);


--
-- TOC entry 2013 (class 2604 OID 33981)
-- Name: anno_accademico; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree ALTER COLUMN anno_accademico SET DEFAULT nextval('lauree_anno_accademico_seq'::regclass);


--
-- TOC entry 2014 (class 2604 OID 33982)
-- Name: corso_di_studi; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree ALTER COLUMN corso_di_studi SET DEFAULT nextval('lauree_corso_di_studi_seq'::regclass);


--
-- TOC entry 2015 (class 2604 OID 33983)
-- Name: tempo; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree ALTER COLUMN tempo SET DEFAULT nextval('lauree_tempo_seq'::regclass);


--
-- TOC entry 1990 (class 2604 OID 33752)
-- Name: studente_key; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY studente ALTER COLUMN studente_key SET DEFAULT nextval('studente_studente_key_seq'::regclass);


--
-- TOC entry 2001 (class 2604 OID 33846)
-- Name: tempo_key; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY tempo ALTER COLUMN tempo_key SET DEFAULT nextval('tempo_tempo_key_seq'::regclass);


--
-- TOC entry 1999 (class 2604 OID 33827)
-- Name: tipo_copertura_key; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY tipo_copertura ALTER COLUMN tipo_copertura_key SET DEFAULT nextval('tipo_copertura_tipo_copertura_key_seq'::regclass);


--
-- TOC entry 1991 (class 2604 OID 33763)
-- Name: immatricolazione_key; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY tipo_immatricolazione ALTER COLUMN immatricolazione_key SET DEFAULT nextval('tipo_immatricolazione_immatricolazione_key_seq'::regclass);


--
-- TOC entry 1994 (class 2604 OID 33787)
-- Name: iscrizione_key; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY tipo_iscrizione ALTER COLUMN iscrizione_key SET DEFAULT nextval('tipo_iscrizione_iscrizione_key_seq'::regclass);


--
-- TOC entry 2000 (class 2604 OID 33835)
-- Name: tipo_uscita_key; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY tipo_uscita ALTER COLUMN tipo_uscita_key SET DEFAULT nextval('tipo_uscita_tipo_uscita_key_seq'::regclass);


--
-- TOC entry 2021 (class 2606 OID 33773)
-- Name: anno_accademico_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY anno_accademico
    ADD CONSTRAINT anno_accademico_pkey PRIMARY KEY (aa_key);


--
-- TOC entry 2033 (class 2606 OID 33821)
-- Name: canale_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY canale
    ADD CONSTRAINT canale_pkey PRIMARY KEY (canale_key);


--
-- TOC entry 2023 (class 2606 OID 33781)
-- Name: corso_di_studi_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY corso_di_studi
    ADD CONSTRAINT corso_di_studi_pkey PRIMARY KEY (cds_key);


--
-- TOC entry 2027 (class 2606 OID 33797)
-- Name: corso_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY corso
    ADD CONSTRAINT corso_pkey PRIMARY KEY (corso_key);


--
-- TOC entry 2031 (class 2606 OID 33813)
-- Name: didattica_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY didattica
    ADD CONSTRAINT didattica_pkey PRIMARY KEY (didattica_key);


--
-- TOC entry 2029 (class 2606 OID 33805)
-- Name: docente_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY docente
    ADD CONSTRAINT docente_pkey PRIMARY KEY (docente_key);


--
-- TOC entry 2017 (class 2606 OID 33757)
-- Name: studente_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY studente
    ADD CONSTRAINT studente_pkey PRIMARY KEY (studente_key);


--
-- TOC entry 2039 (class 2606 OID 33854)
-- Name: tempo_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tempo
    ADD CONSTRAINT tempo_pkey PRIMARY KEY (tempo_key);


--
-- TOC entry 2035 (class 2606 OID 33829)
-- Name: tipo_copertura_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_copertura
    ADD CONSTRAINT tipo_copertura_pkey PRIMARY KEY (tipo_copertura_key);


--
-- TOC entry 2019 (class 2606 OID 33765)
-- Name: tipo_immatricolazione_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_immatricolazione
    ADD CONSTRAINT tipo_immatricolazione_pkey PRIMARY KEY (immatricolazione_key);


--
-- TOC entry 2025 (class 2606 OID 33789)
-- Name: tipo_iscrizione_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_iscrizione
    ADD CONSTRAINT tipo_iscrizione_pkey PRIMARY KEY (iscrizione_key);


--
-- TOC entry 2037 (class 2606 OID 33837)
-- Name: tipo_uscita_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_uscita
    ADD CONSTRAINT tipo_uscita_pkey PRIMARY KEY (tipo_uscita_key);


--
-- TOC entry 2046 (class 2606 OID 33949)
-- Name: esami_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_anno_accademico_fkey FOREIGN KEY (anno_accademico) REFERENCES anno_accademico(aa_key);


--
-- TOC entry 2047 (class 2606 OID 33954)
-- Name: esami_corso_di_studi_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_corso_di_studi_fkey FOREIGN KEY (corso_di_studi) REFERENCES corso_di_studi(cds_key);


--
-- TOC entry 2048 (class 2606 OID 33959)
-- Name: esami_corso_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_corso_fkey FOREIGN KEY (corso) REFERENCES corso(corso_key);


--
-- TOC entry 2045 (class 2606 OID 33944)
-- Name: esami_studente_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_studente_fkey FOREIGN KEY (studente) REFERENCES studente(studente_key);


--
-- TOC entry 2049 (class 2606 OID 33964)
-- Name: esami_tempo_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_tempo_fkey FOREIGN KEY (tempo) REFERENCES tempo(tempo_key);


--
-- TOC entry 2041 (class 2606 OID 33906)
-- Name: ingressi_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_anno_accademico_fkey FOREIGN KEY (anno_accademico) REFERENCES anno_accademico(aa_key);


--
-- TOC entry 2042 (class 2606 OID 33911)
-- Name: ingressi_corso_di_studi_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_corso_di_studi_fkey FOREIGN KEY (corso_di_studi) REFERENCES corso_di_studi(cds_key);


--
-- TOC entry 2040 (class 2606 OID 33901)
-- Name: ingressi_studente_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_studente_fkey FOREIGN KEY (studente) REFERENCES studente(studente_key);


--
-- TOC entry 2044 (class 2606 OID 33921)
-- Name: ingressi_tempo_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_tempo_fkey FOREIGN KEY (tempo) REFERENCES tempo(tempo_key);


--
-- TOC entry 2043 (class 2606 OID 33916)
-- Name: ingressi_tipo_immatricolazione_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_tipo_immatricolazione_fkey FOREIGN KEY (tipo_immatricolazione) REFERENCES tipo_immatricolazione(immatricolazione_key);


--
-- TOC entry 2051 (class 2606 OID 33989)
-- Name: lauree_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_anno_accademico_fkey FOREIGN KEY (anno_accademico) REFERENCES anno_accademico(aa_key);


--
-- TOC entry 2052 (class 2606 OID 33994)
-- Name: lauree_corso_di_studi_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_corso_di_studi_fkey FOREIGN KEY (corso_di_studi) REFERENCES corso_di_studi(cds_key);


--
-- TOC entry 2050 (class 2606 OID 33984)
-- Name: lauree_studente_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_studente_fkey FOREIGN KEY (studente) REFERENCES studente(studente_key);


--
-- TOC entry 2053 (class 2606 OID 33999)
-- Name: lauree_tempo_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_tempo_fkey FOREIGN KEY (tempo) REFERENCES tempo(tempo_key);


--
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-04-02 16:51:18

--
-- PostgreSQL database dump complete
--

