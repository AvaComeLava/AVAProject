CREATE SCHEMA IF NOT EXISTS AVA;
SET search_path TO AVA;

CREATE TABLE studente (
  studente_key SERIAL PRIMARY KEY NOT NULL,
  codice_fiscale VARCHAR(38),
  /*matricola INT,*/
  /*nome_studente VARCHAR(80),*/
  /*cognome_studente VARCHAR(80),*/
  data_nascita DATE,
  coorte SMALLINT,
  titolo_di_studio VARCHAR(79),
  sesso VARCHAR(15),
  regione_residenza VARCHAR(31),
  provincia_residenza VARCHAR(35),
  comune_residenza VARCHAR(72),
  stato_residenza VARCHAR(54),
  cittadinanza VARCHAR(54),
  voto_scuola_media_superiore VARCHAR(34),
  nazione_diploma VARCHAR(54),
  tipo_scuola_media_superiore VARCHAR(89),
  istituto_scuola_media_superiore VARCHAR(89),
  anno_diploma SMALLINT
);
INSERT INTO studente (codice_fiscale)
    VALUES ('sconosciuto');

CREATE TABLE tipo_immatricolazione (
  immatricolazione_key SERIAL PRIMARY KEY NOT NULL,
  immatricolazione_key_surrogata VARCHAR(3),
  tipo_immatricolazione VARCHAR(70)
);
INSERT INTO tipo_immatricolazione (immatricolazione_key_surrogata, tipo_immatricolazione)
    VALUES ('---', '---');

CREATE TABLE anno_accademico (
  aa_key SERIAL PRIMARY KEY NOT NULL,
  codice_anno INT,
  nome_anno_x VARCHAR(20),
  nome_anno_x_1 VARCHAR(20),
  nome_anno_x_1_x VARCHAR(20)
);
INSERT INTO anno_accademico (codice_anno, nome_anno_x, nome_anno_x_1, nome_anno_x_1_x)
    VALUES (0, '0', '0', '0/0');

CREATE TABLE corso_di_studi (
  cds_key SERIAL PRIMARY KEY NOT NULL,
  codice_cds INT,
  inizio_validita DATE,
  fine_validita DATE,
  tipo_cds VARCHAR(80),
  nome_cds VARCHAR(100),
  durata_legale SMALLINT,
  codice_dipartimento INT,
  nome_dipartimento VARCHAR(70),
  /*, ha_numero_programmato BOOLEAN,*/
  /*numero_programmato SMALLINT,*/
  codice_ateneo VARCHAR(5)
);
INSERT INTO corso_di_studi (codice_cds, nome_cds)
    VALUES (0, '---');

CREATE TABLE tipo_iscrizione (
    iscrizione_key SERIAL PRIMARY KEY NOT NULL,
    fuori_corso SMALLINT,
    anno_corso SMALLINT,
    numero_anni_fc SMALLINT
);

CREATE TABLE corso (
  corso_key SERIAL PRIMARY KEY NOT NULL,
  codice_corso VARCHAR(15),
  nome_corso VARCHAR(250),
  cfu_corso SMALLINT,
  ssd VARCHAR(100)
);
INSERT INTO corso (codice_corso, nome_corso)
    VALUES ('---', '---');

CREATE TABLE docente (
  docente_key SERIAL PRIMARY KEY NOT NULL,
  codice_docente VARCHAR(20),
  nome_docente VARCHAR(40),
  cognome_docente VARCHAR(40),
  dipartimento_docente VARCHAR(50),
  ssd_docente VARCHAR(15),
  ruolo BOOLEAN
);

CREATE TABLE didattica (
  didattica_key SERIAL PRIMARY KEY NOT NULL,
  codice_att_didattica VARCHAR(20),
  nome_att_didattica VARCHAR(40),
  codice_unita_didattica VARCHAR(20),
  nome_unita_didattica VARCHAR(40),
  cfu_unita_didattica SMALLINT
);

CREATE TABLE canale (
  canale_key SERIAL PRIMARY KEY NOT NULL,
  canale VARCHAR(20)
);

CREATE TABLE tipo_copertura (
  tipo_copertura_key SERIAL PRIMARY KEY NOT NULL,
  tipo_copertura VARCHAR(20)
);

CREATE TABLE tipo_uscita (
  tipo_uscita_key SERIAL PRIMARY KEY NOT NULL,
  tipo_uscita_key_surrogata VARCHAR(2),
  tipo_uscita VARCHAR(70)
);

/*
CREATE TABLE tempo AS SELECT
	datum AS DATE,
	EXTRACT(YEAR FROM datum) AS YEAR,
	EXTRACT(MONTH FROM datum) AS MONTH,
	-- Localized month name
	to_char(datum, 'TMMonth') AS MonthName,
	EXTRACT(DAY FROM datum) AS DAY,
	EXTRACT(doy FROM datum) AS DayOfYear,
	-- Localized weekday
	to_char(datum, 'TMDay') AS WeekdayName,
	-- ISO calendar week
	EXTRACT(week FROM datum) AS CalendarWeek,
	to_char(datum, 'ddmmyyyy') AS PentahoDate,
	to_char(datum, 'dd-mm-yyyy') AS FormattedDate,
	to_char(datum, 'dd-mm-yyyy') AS DateTypeDate,
	'Q' || to_char(datum, 'Q') AS Quartal,
	to_char(datum, 'yyyy/"Q"Q') AS YearQuartal,
	to_char(datum, 'yyyy/mm') AS YearMonth,
	to_char(datum, 'yyyy') AS YearOnly,
    to_char(datum, 'yyyy') AS anno,
	to_char(datum, 'mm') AS mese,
	to_char(datum, 'dd') AS giorno,
	-- ISO calendar year and week
	to_char(datum, 'iyyy/IW') AS YearCalendarWeek,
	-- Weekend
	CASE WHEN EXTRACT(isodow FROM datum) IN (6, 7) THEN 'Weekend' ELSE 'Weekday' END AS Weekend,
	-- Fixed holidays
        -- for America
        CASE WHEN to_char(datum, 'MMDD') IN ('0101', '0704', '1225', '1226')
		THEN 'Holiday' ELSE 'No holiday' END
		AS AmericanHoliday,
        -- for Austria
	CASE WHEN to_char(datum, 'MMDD') IN
		('0101', '0106', '0501', '0815', '1101', '1208', '1225', '1226')
		THEN 'Holiday' ELSE 'No holiday' END
		AS AustrianHoliday,
        -- for Canada
        CASE WHEN to_char(datum, 'MMDD') IN ('0101', '0701', '1225', '1226')
		THEN 'Holiday' ELSE 'No holiday' END
		AS CanadianHoliday,
	-- Some periods of the year, adjust for your organisation and country
	CASE WHEN to_char(datum, 'MMDD') BETWEEN '0701' AND '0831' THEN 'Summer break'
	     WHEN to_char(datum, 'MMDD') BETWEEN '1115' AND '1225' THEN 'Christmas season'
	     WHEN to_char(datum, 'MMDD') > '1225' OR to_char(datum, 'MMDD') <= '0106' THEN 'Winter break'
		ELSE 'Normal' END
		AS Period,
	-- ISO start and end of the week of this date
	datum + (1 - EXTRACT(isodow FROM datum))::INTEGER AS CWStart,
	datum + (7 - EXTRACT(isodow FROM datum))::INTEGER AS CWEnd,
	-- Start and end of the month of this date
	datum + (1 - EXTRACT(DAY FROM datum))::INTEGER AS MonthStart,
	(datum + (1 - EXTRACT(DAY FROM datum))::INTEGER + '1 month'::INTERVAL)::DATE - '1 day'::INTERVAL AS MonthEnd
FROM (
	-- There are 3 leap years in this range, so calculate 365 * 10 + 3 records for 10 years output
	SELECT '2006-01-01'::DATE + SEQUENCE.DAY AS datum
	FROM generate_series(0,4500) AS SEQUENCE(DAY)
	GROUP BY SEQUENCE.DAY
     ) DQ
ORDER BY 1;
ALTER TABLE tempo ADD COLUMN tempo_key SERIAL NOT NULL;
UPDATE tempo SET tempo_key = nextval(pg_get_serial_sequence('tempo','tempo_key'));
ALTER TABLE tempo ADD PRIMARY KEY (tempo_key);
INSERT INTO tempo (pentahodate)
    VALUES ('00000000');
ALTER TABLE tempo ALTER COLUMN DateTypeDate TYPE DATE USING to_date(DateTypeDate, 'dd-mm-yyyy');
ALTER TABLE tempo ALTER COLUMN anno TYPE DATE USING to_date(anno, 'yyyy');
ALTER TABLE tempo ALTER COLUMN mese TYPE DATE USING to_date(mese, 'mm');
ALTER TABLE tempo ALTER COLUMN giorno TYPE DATE USING to_date(giorno, 'dd');
*/

CREATE TABLE tempo (
    tempo_key SERIAL PRIMARY KEY NOT NULL,
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
    monthend timestamp without time zone
);

CREATE TABLE ingressi (
  studente SERIAL REFERENCES studente (studente_key),
  anno_accademico SERIAL REFERENCES anno_accademico (aa_key),
  corso_di_studi SERIAL REFERENCES corso_di_studi (cds_key),
  tipo_immatricolazione SERIAL REFERENCES tipo_immatricolazione (immatricolazione_key),
  tempo SERIAL REFERENCES tempo (tempo_key),
  punteggio_test SMALLINT,
  immatricolato SMALLINT,
  PRIMARY KEY (studente, anno_accademico, corso_di_studi, tipo_immatricolazione, tempo)
);

CREATE TABLE esami (
  studente SERIAL REFERENCES studente (studente_key),
  anno_accademico SERIAL REFERENCES anno_accademico (aa_key),
  corso_di_studi SERIAL REFERENCES corso_di_studi (cds_key),
  corso SERIAL REFERENCES corso (corso_key),
  tempo SERIAL REFERENCES tempo (tempo_key),
  voto SMALLINT,
  cfu_acquisiti SMALLINT,
  PRIMARY KEY (studente, anno_accademico, corso_di_studi, corso, tempo)
);

CREATE TABLE lauree (
  studente SERIAL REFERENCES studente (studente_key),
  anno_accademico SERIAL REFERENCES anno_accademico (aa_key),
  corso_di_studi SERIAL REFERENCES corso_di_studi (cds_key),
  tempo SERIAL REFERENCES tempo (tempo_key),
  voto_laurea SMALLINT,
  voto_laurea_formatted VARCHAR(30),
  PRIMARY KEY (studente, anno_accademico, corso_di_studi, tempo)
);