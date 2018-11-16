/* Listando base de datos del servidor */
show databases;

/* Creamos la base de datos dbAlquiler */
create database if not exists dbAlquiler default character set utf8;

/* Verificamos que se haya creado la base de datos */
show databases;

/* Ponemos en uso la base de datos dbAlquiler */
use dbAlquiler;

/* Verificamos que la base de datos esté en uso */
select database();

/* Crear tabla Persona */
create table PERSONA
(
    CODPER int,
    NOMPER varchar(100),
    APEPATPER varchar(150),
    APEMATPER varchar(150),
    DNIPER char(8),
    DIRPER varchar(150),
    UBIGEO_CODUBI char(6),
    TELEF1PER char(9),
    TELEF2PER char(9),
    EMAILPER varchar(80),
    ESTPER char(1),
    SEXOPER char(1),
    TIPOPER char(1),
    USUPER varchar(50),
    PASSPER varchar(50),
    CONSTRAINT CODPER_PK PRIMARY KEY (CODPER)
);

/* Verificamos que la tabla haya sido creada en nuestra base de datos */
show tables;

/* Verificamos la estructura de la tabla que hemos creado */
show columns in PERSONA;

/* Creamos ahora la tabla UBIGEO */
create table UBIGEO
(
    CODUBI char(6),
    DISTUBI varchar(100),
    PROVUBI varchar(100),
    DPTOUBI varchar(100),
    CONSTRAINT CODUBI_PK PRIMARY KEY (CODUBI)
);

/* Verificamos que la tabla haya sido creada en nuestra base de datos */
show tables;

/* Verificamos la estructura de la tabla que hemos creado */
show columns in UBIGEO;

/* Creamos la tabla ALQUILER */
create table ALQUILER
(
    CODALQ int,
    FECINALQ date,
    PERSONA_PROP int,
    PERSONA_INQ int,
    CONSTRAINT CODALQ_PK PRIMARY KEY (CODALQ)
);

/* Verificamos que la tabla haya sido creada en nuestra base de datos */
show tables;

/* Verificamos la estructura de la tabla que hemos creado */
show columns in ALQUILER;

/* Creamos la tabla VIVIENDA */
create table VIVIENDA
(
    CODVIV int,
    DESCVIV varchar(150),
    DIRVIV varchar(150),
    UBIGEO_CODUBI char(6),
    ESTADOVIVIENDA_CODESTVIV int,
    TIPOVIVIENDA_CODTIPVIV int,
    CONSTRAINT CODVIV_PK PRIMARY KEY (CODVIV)
);

/* Verificamos que la tabla haya sido creada en nuestra base de datos */
show tables;

/* Verificamos la estructura de la tabla que hemos creado */
show columns in VIVIENDA;

/* Creamos la tabla ESTADO_VIVIENDA */
create table ESTADO_VIVIENDA
(
    CODESTVIV int,
    DESCESTVIV varchar(150),
    CONSTRAINT CODESTVIV_PK PRIMARY KEY (CODESTVIV)
);

/* Verificamos que la tabla haya sido creada en nuestra base de datos */
show tables;

/* Verificamos la estructura de la tabla que hemos creado */
show columns in ESTADO_VIVIENDA;

/* Creamos la tabla Tipo Vivienda */
create table TIPO_VIVIENDA
(
    CODTIPVIV int,
    DESCTIPVIV varchar(150),
    CONSTRAINT CODTIPVIV_PK PRIMARY KEY (CODTIPVIV)
);

/* Verificamos que la tabla haya sido creada en nuestra base de datos */
show tables;

/* Verificamos la estructura de la tabla que hemos creado */
show columns in TIPO_VIVIENDA;

/* Crear tabla detalle alquiler */
create table DETALLE_ALQUILER
(
    CODDETALQ int,
    VIVIENDA_CODVIV int,
    FECINDETALQ date,
    COSTDETALQ double(9,2),
    ALQUILER_CODALQ int,
    CONSTRAINT CODDETALQ_PK PRIMARY KEY (CODDETALQ)
);

/* Verificamos que la tabla haya sido creada en nuestra base de datos */
show tables;

/* Verificamos la estructura de la tabla que hemos creado */
show columns in TIPO_VIVIENDA;