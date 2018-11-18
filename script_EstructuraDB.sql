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

/* Mostrar listado de las tablas de la base de datos seleccionada */
show tables;

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

/* Relación de tablas PERSONA - UBIGEO */
alter table PERSONA
    add CONSTRAINT UBIGEO_FK FOREIGN KEY (UBIGEO_CODUBI)
    REFERENCES UBIGEO (CODUBI);

/* Relación VIVIENDA - UBIGEO */
alter table VIVIENDA
    add CONSTRAINT UBIGEO_VIV_FK FOREIGN KEY (UBIGEO_CODUBI)
    REFERENCES UBIGEO (CODUBI);

/* Relación VIVIENDA - ESTADO_VIVIENDA */ 
alter table VIVIENDA
    add CONSTRAINT ESTADO_VIVIENDA_FK FOREIGN KEY (ESTADOVIVIENDA_CODESTVIV)
    REFERENCES ESTADO_VIVIENDA (CODESTVIV);

/* Relación VIVIENDA - TIPO_VIVIENDA */
alter table VIVIENDA
    add CONSTRAINT TIPOVIVIENDA_CODTIPVIV_FK FOREIGN KEY (TIPOVIVIENDA_CODTIPVIV)
    REFERENCES TIPO_VIVIENDA (CODTIPVIV);

/* Relación DETALLE_ALQUILER - VIVIENDA */
alter table DETALLE_ALQUILER
    add CONSTRAINT VIVIENDA_CODVIV_FK FOREIGN KEY (VIVIENDA_CODVIV)
    REFERENCES VIVIENDA (CODVIV);

/* Relación DETALLE_ALQUILER - ALQUILER */
alter table DETALLE_ALQUILER 
    add CONSTRAINT ALQUILER_CODALQ_FK FOREIGN KEY (ALQUILER_CODALQ)
    REFERENCES ALQUILER (CODALQ);

/* Relación ALQUILER - PERSONA (PROPIETARIO) */
alter table ALQUILER
    add CONSTRAINT PERSONA_PROP_FK FOREIGN KEY (PERSONA_PROP)
    REFERENCES PERSONA(CODPER);

/* Relación ALQUILER - PERSONA (INQUILINO) */
alter table ALQUILER
    add CONSTRAINT PERSONA_INQ_FK FOREIGN KEY (PERSONA_INQ)
    REFERENCES PERSONA(CODPER);

/* Ver estructura de la tabla VIVIENDA */
show columns in VIVIENDA;

/* Agregar un campo con el costo mensual de la vivienda */
alter table VIVIENDA
    add COSTMENSVIV decimal(8,2);

/* Verificamos que se haya agregado la columna */
show columns in VIVIENDA;

/* Listar registros de la tabla VIVIENDA */
select * from VIVIENDA;

/* Ver estructura de la tabla DETALLE_ALQUILER */
show columns in DETALLE_ALQUILER;

/* Eliminar campos fecha de inicio y costo en la tabla detalle alquiler */
alter table DETALLE_ALQUILER
    drop column FECINDETALQ, 
    drop column COSTDETALQ;

/* Verificamos la estructura de la tabla DETALLE_ALQUILER */
show columns in DETALLE_ALQUILER;

/* Agregar la columna CANTMESDETALQ */
alter table DETALLE_ALQUILER
    add column CANTMESDETALQ int;

/* Verificamos la estructura de la tabla */
show columns in DETALLE_ALQUILER;

/* Listar registros de la tabla DETALLE_ALQUILER */
select * from DETALLE_ALQUILER;