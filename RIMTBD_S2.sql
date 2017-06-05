--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      UNAM
-- Project :      icar-global.DM1
-- Author :       Jorge
--
-- Date Created : Monday, June 05, 2017 13:46:25
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: TIPO_ALMAC_F4 
--

CREATE TABLE TIPO_ALMAC_F4(
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                     VARCHAR2(40)     NOT NULL,
    DESCRIPCION               VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_ALMACENAMIENTO_PK PRIMARY KEY (TIPO_ALMACENAMIENTO_ID)
)
;



-- 
-- TABLE: TIPO_MONITOR_F4 
--

CREATE TABLE TIPO_MONITOR_F4(
    TIPO_MONITOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE              VARCHAR2(40)     NOT NULL,
    DESCRIPCION        VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_MONITOR_PK PRIMARY KEY (TIPO_MONITOR_ID)
)
;



-- 
-- TABLE: TIPO_PROCESADOR_F4 
--

CREATE TABLE TIPO_PROCESADOR_F4(
    TIPO_PROCESADOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION           VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_PROCESADOR_PK PRIMARY KEY (TIPO_PROCESADOR_ID)
)
;



-- 
-- TABLE: TIPO_TARJETA_VIDEO_F4 
--

CREATE TABLE TIPO_TARJETA_VIDEO_F4(
    TIPO_TARJETA_VIDEO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                    VARCHAR2(40)     NOT NULL,
    DESCRIPCION              VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_TARJETA_VIDEO_PK PRIMARY KEY (TIPO_TARJETA_VIDEO_ID)
)
;



-- 
-- TABLE: LAPTOP_F2 
--

CREATE TABLE LAPTOP_F2(
    LAPTOP_ID                 NUMBER(10, 0)     NOT NULL,
    NUM_SERIE                 VARCHAR2(18)      NOT NULL,
    CANTIDAD_RAM              NUMBER(6, 0)      NOT NULL,
    CARACTERISTICAS_EXTRAS    VARCHAR2(2000)    NOT NULL,
    TIPO_TARJETA_VIDEO_ID     NUMBER(5, 0)      NOT NULL,
    TIPO_PROCESADOR_ID        NUMBER(5, 0)      NOT NULL,
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)      NOT NULL,
    TIPO_MONITOR_ID           NUMBER(5, 0)      NOT NULL,
    LAPTOP_REEMPLAZO_ID       NUMBER(10, 0),
    CONSTRAINT LAPTOP_PK PRIMARY KEY (LAPTOP_ID), 
    CONSTRAINT LAPTOP_ALMACENAMIENTO_FK FOREIGN KEY (TIPO_ALMACENAMIENTO_ID)
    REFERENCES TIPO_ALMAC_F4(TIPO_ALMACENAMIENTO_ID),
    CONSTRAINT LAPTOP_MONITOR_FK FOREIGN KEY (TIPO_MONITOR_ID)
    REFERENCES TIPO_MONITOR_F4(TIPO_MONITOR_ID),
    CONSTRAINT LAPTOP_PROCESADOR_FK FOREIGN KEY (TIPO_PROCESADOR_ID)
    REFERENCES TIPO_PROCESADOR_F4(TIPO_PROCESADOR_ID),
    CONSTRAINT LAPTOP_VIDEO_FK FOREIGN KEY (TIPO_TARJETA_VIDEO_ID)
    REFERENCES TIPO_TARJETA_VIDEO_F4(TIPO_TARJETA_VIDEO_ID)
)
;



-- 
-- TABLE: LAPTOP_F5 
--

CREATE TABLE LAPTOP_F5(
    LAPTOP_ID    NUMBER(10, 0)    NOT NULL,
    FOTO         BLOB             NOT NULL,
    CONSTRAINT LAPTOP_PK_1 PRIMARY KEY (LAPTOP_ID)
)
;



-- 
-- TABLE: SERVCIO_LAPTOP_F2 
--

CREATE TABLE SERVCIO_LAPTOP_F2(
    SERVICIO_LAPTOP_ID    NUMBER(10, 0)     NOT NULL,
    IMPORTE               NUMBER(8, 2)      NOT NULL,
    DIAGNOSTICO           VARCHAR2(2000)    NOT NULL,
    SUCURSAL_ID           NUMBER(10, 0)     NOT NULL,
    LAPTOP_ID             NUMBER(10, 0)     NOT NULL,
    CONSTRAINT SERVICIO_LAPTOP_PK PRIMARY KEY (SERVICIO_LAPTOP_ID), 
    CONSTRAINT SERVICIO_LAP_ID_FK FOREIGN KEY (LAPTOP_ID)
    REFERENCES LAPTOP_F2(LAPTOP_ID)
)
;



-- 
-- TABLE: STATUS_LAPTOP_F4 
--

CREATE TABLE STATUS_LAPTOP_F4(
    STATUS_LAPTOP_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE               VARCHAR2(40)     NOT NULL,
    DESCRIPCION         VARCHAR2(400)    NOT NULL,
    CONSTRAINT STATUS_LAPTOP_PK PRIMARY KEY (STATUS_LAPTOP_ID)
)
;



-- 
-- TABLE: SUCURSAL_F4 
--

CREATE TABLE SUCURSAL_F4(
    SUCURSAL_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE          VARCHAR2(10)     NOT NULL,
    ES_TALLER      NUMBER(1, 0)     NOT NULL,
    ES_VENTA       NUMBER(1, 0)     NOT NULL,
    NOMBRE         VARCHAR2(40)     NOT NULL,
    LATITUD        NUMBER(10, 2)    NOT NULL,
    LONGITUD       NUMBER(10, 2)    NOT NULL,
    URL            VARCHAR2(200)    NOT NULL,
    CONSTRAINT SUCURSAL_PK PRIMARY KEY (SUCURSAL_ID)
)
;



-- 
-- TABLE: SUCRSAL_TALLER_F4 
--

CREATE TABLE SUCRSAL_TALLER_F4(
    SUCURSAL_ID          NUMBER(10, 0)    NOT NULL,
    DIA_DESCANSO         NUMBER(1, 0)     NOT NULL,
    TELEFONO_ATENCION    VARCHAR2(20)     NOT NULL,
    CONSTRAINT SUCURSAL_TALLER_PK PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT SVENTA_SUCURSAL_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F4(SUCURSAL_ID)
)
;



-- 
-- TABLE: SUCURSAL_VENTA_F4 
--

CREATE TABLE SUCURSAL_VENTA_F4(
    SUCURSAL_ID      NUMBER(10, 0)    NOT NULL,
    HORA_APERTURA    DATE             NOT NULL,
    HORA_CIERRE      DATE             NOT NULL,
    CONSTRAINT SUCURSAL_VENTA_PK PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT STALLER_SUCURSAL_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F4(SUCURSAL_ID)
)
;



