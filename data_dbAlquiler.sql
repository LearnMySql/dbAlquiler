/* Ponemos en uso la base de datos */
use dbAlquiler;

/* Verificamos que esté en uso */
select database();

/* Revisar la estructura de la tabla UBIGEO */
show columns in UBIGEO;

/* Ingresando registros a la tabla UBIGEO */
insert into UBIGEO
    (CODUBI, DISTUBI, PROVUBI, DPTOUBI)
values
    ('140307', 'San Vicente de Cañete', 'Cañete', 'Lima'),
    ('140402', 'Calango', 'Cañete', 'Lima'),
    ('140403', 'Cerro Azul', 'Cañete', 'Lima'),
    ('140404', 'Coayllo', 'Cañete', 'Lima'),
    ('140405', 'Chilca','Cañete', 'Lima'),
    ('140406', 'Imperial', 'Cañete', 'Lima'),
    ('140407', 'Lunhuaná', 'Cañete', 'Lima'),
    ('140408', 'Mala', 'Cañete', 'Lima'),
    ('140409', 'Nuevo Imperial', 'Cañete', 'Lima'),
    ('140410', 'Pacarán', 'Cañete', 'Lima');

/* Verificamos los registros ingresados */
select * from UBIGEO;

/* Revisar la estructura de la tabla PERSONA */
show columns in PERSONA;

/* Insertar registro en la tabla PERSONA que es el propietario */
insert into PERSONA
    (CODPER, NOMPER, APEPATPER, APEMATPER, DNIPER, DIRPER, UBIGEO_CODUBI, TELEF1PER, TELEF2PER, EMAILPER, ESTPER, SEXOPER, TIPOPER, USUPER, PASSPER)
values
    (1, 'Alberto', 'Campos', 'Barrios', '85236974', 'Av. Los Manzanales 123', '140405','9998563214', '998562145', 'acampos@gmail.com', 'A', 'M','P', 'acampos', '123456');
 
 /* Verificar que ingresaron los datos del propietario */
 select * from PERSONA;

/* Revisar la estructura de la tabla PERSONA */
show columns in PERSONA;

 /* Insertar registros de inquilinos en la tabla PERSONA */
insert into PERSONA
    (CODPER, NOMPER, APEPATPER, APEMATPER, DNIPER, DIRPER, UBIGEO_CODUBI, TELEF1PER, TELEF2PER, EMAILPER, ESTPER, SEXOPER, TIPOPER, USUPER, PASSPER)
values
    (2, 'María', 'Valle', 'Solano', '45789645', 'Calle Los Manzanos 333', '140407', '986532147', '978546123', 'mariavalle@outlook.com', 'A', 'F', 'I', 'mvalle', '789456' ),
    (3, 'Juana', 'Guerra', 'Paz', '74859622', 'Jr. Huallaga 789', '140405', '99856321', '998877415', 'jguerra@outlook.com', 'A', 'F', 'I', 'jguerra', '456321' ),
    (4, 'Gilberto', 'Paucar', 'Rodríguez', '42586311', 'Jr. Los Sauces 888', '140409', '998822145', '996633214', 'gilberto@gmail.com', 'A', 'M', 'I', 'gpaucar', '258369'),
    (5, 'Roxana', 'Torres', 'Yactayo', '77446985', 'Calle Los Suspiros 666', '140409', '993311248', '997755412', 'roxanatorres@yahoo.com','I', 'F', 'I', 'rtorres', '987654');

 /* Verificar que ingresaron los datos de los inquilinos */
 select * from PERSONA;

/* Revisar la estructura de la tabla ESTADO_VIVIENDA */
show columns in ESTADO_VIVIENDA;

/* Ingresar registros en la tabla ESTADO_VIVIENDA */
insert into ESTADO_VIVIENDA
    (CODESTVIV, DESCESTVIV)
values
    (1, 'Muy bueno'),
    (2, 'Excelente'),
    (3, 'Bueno'),
    (4, 'Remodelado'),
    (5, 'A remodelar');

/* Verificamos que se han registrado los estado de vivienda */
select * from ESTADO_VIVIENDA;

/* Revisar la estructura de la tabla TIPO_VIVIENDA */
show columns in TIPO_VIVIENDA;

/* Ingresar registros en la tabla TIPO_VIVIENDA */
insert into TIPO_VIVIENDA
    (CODTIPVIV, DESCTIPVIV)
values
    (1, 'Casa'),
    (2, 'Casa de playa'),
    (3, 'Casa de condominio'),
    (4, 'Casa de campo'),
    (5, 'Casa de playa en condominio');

/* Revisar los registros ingresados en la tabla TIPO_VIVIENDA */
select * from TIPO_VIVIENDA;

/* Ver estructura de la tabla VIVIENDA */
show columns in VIVIENDA;

/* Ingresar registros en la tabla VIVIENDA */
insert into VIVIENDA
    (CODVIV, DESCVIV, DIRVIV, UBIGEO_CODUBI, ESTADOVIVIENDA_CODESTVIV, TIPOVIVIENDA_CODTIPVIV)
values
    (1, 'Hermosa casa de color verde en una zona céntrica', 'Av. Los Gallinazos 444', '140405', 1, 1),
    (2, 'Vivienda para familias pequeñas, muy espaciosa', 'Calle Los Manglares 555', '140408', 2, 4),
    (3, 'Casa de campo con amplias zonas verdes', 'Jr. Las Acacias 777', '140402', 3, 4),
    (4, 'Casa con amplia vista al mar, muy espaciosa', 'Av. Las Gardenias 751', '140403', 2, 5);

/* Revisar los registros ingresados VIVIENDA */
select * from VIVIENDA;

/* Ver la estructura de la tabla ALQUILER */
show columns in ALQUILER;

/* Ingresando registros a la tabla ALQUILER */
insert into ALQUILER
    (CODALQ, FECINALQ, PERSONA_PROP, PERSONA_INQ)
values
    (1, '2018/02/03', 1, 3),
    (2, '2018/10/05', 1, 2),
    (3, '2017/06/04', 1, 4),
    (4, '2015/08/04', 1, 5);
 
 /* Revisar los registros de la tabla ALQUILER */
 select * from ALQUILER;

 /* Ver la estructura de la tabla DETALLE_ALQUILER */
show columns in DETALLE_ALQUILER;

/* Ingresar registros en la tabla DETALLE_ALQUILER */
insert into DETALLE_ALQUILER
    (CODDETALQ, VIVIENDA_CODVIV, FECINDETALQ, COSTDETALQ, ALQUILER_CODALQ)
values
    (1, 1, '2018/02/04', 650.00, 1),
    (2, 2, '2018/11/01', 850.50, 2),
    (3, 3, '2017/07/01', 900.00, 3),
    (4, 4, '2015/09/01', 1200.50, 4);

/* Revisar losregistros ingresados en la tabla DETALLE_ALQUILER */
select * from DETALLE_ALQUILER;
