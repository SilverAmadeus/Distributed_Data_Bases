--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      UNAM
-- Project :      icar-global.DM1
-- Author :       Moreno Tagle Ivan Raphael
--                Rodriguez Garcia Alan Julian
-- Date Created : Monday, June 05, 2017 11:30:32
-- Target DBMS : Oracle 12c
--

-- 
-- TABLE: TIPO_ALMAC_F1_AJRG_S1 
--

CREATE TABLE TIPO_ALMACENAMIENTO(
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                     VARCHAR2(40)     NOT NULL,
    DESCRIPCION               VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_ALMACENAMIENTO_PK PRIMARY KEY (TIPO_ALMACENAMIENTO_ID)
);

-- 
-- TABLE: TIPO_MON_F1_AJRG_S1 
--

CREATE TABLE TIPO_MONITOR(
    TIPO_MONITOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE              VARCHAR2(40)     NOT NULL,
    DESCRIPCION        VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_MONITOR_PK PRIMARY KEY (TIPO_MONITOR_ID)
);

-- 
-- TABLE: TIPO_PROC_F1_AJRG_S1 
--

CREATE TABLE TIPO_PROCESADOR(
    TIPO_PROCESADOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION           VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_PROCESADOR_PK PRIMARY KEY (TIPO_PROCESADOR_ID)
);

-- 
-- TABLE: TIPO_TARJ_VID_F1_AJRG_S1 
--

CREATE TABLE TIPO_TARJETA_VIDEO(
    TIPO_TARJETA_VIDEO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                    VARCHAR2(40)     NOT NULL,
    DESCRIPCION              VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_TARJETA_VIDEO_PK PRIMARY KEY (TIPO_TARJETA_VIDEO_ID)
);

-- 
-- TABLE: STAT_LAP_F1_AJRG_S1 
--

CREATE TABLE STATUS_LAPTOP(
    STATUS_LAPTOP_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE               VARCHAR2(40)     NOT NULL,
    DESCRIPCION         VARCHAR2(400)    NOT NULL,
    CONSTRAINT STATUS_LAPTOP_PK PRIMARY KEY (STATUS_LAPTOP_ID)
);

-- 
-- TABLE: LAPTOP_F1_AJRG_S1 
--

CREATE TABLE LAPTOP_F1_AJRG_S1(
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
    REFERENCES TIPO_ALMACENAMIENTO(TIPO_ALMACENAMIENTO_ID),
    CONSTRAINT LAPTOP_MONITOR_FK FOREIGN KEY (TIPO_MONITOR_ID)
    REFERENCES TIPO_MONITOR(TIPO_MONITOR_ID),
    CONSTRAINT LAPTOP_PROCESADOR_FK FOREIGN KEY (TIPO_PROCESADOR_ID)
    REFERENCES TIPO_PROCESADOR(TIPO_PROCESADOR_ID),
    CONSTRAINT LAPTOP_VIDEO_FK FOREIGN KEY (TIPO_TARJETA_VIDEO_ID)
    REFERENCES TIPO_TARJETA_VIDEO(TIPO_TARJETA_VIDEO_ID),
    CONSTRAINT NUM_SERIE_CHK CHECK(SUBSTR(NUM_SERIE,1,1) IN ('0','1'))
);


-- 
-- TABLE: HIST_STAT_LAP_F2_AJRG_S1 
--

CREATE TABLE HIST_STAT_LAP_F2_AJRG_S1(
    HISTORICO_STATUS_LAPTOP_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS                  DATE             NOT NULL,
    STATUS_LAPTOP_ID              NUMBER(5, 0)     NOT NULL,
    LAPTOP_ID                     NUMBER(10, 0)    NOT NULL,
    CONSTRAINT HIST_LAPTOP_AUTO_PK PRIMARY KEY (HISTORICO_STATUS_LAPTOP_ID), 
    CONSTRAINT HIST_LAPTOP_STATUS_FK FOREIGN KEY (STATUS_LAPTOP_ID)
    REFERENCES STATUS_LAPTOP(STATUS_LAPTOP_ID),
    CONSTRAINT FECHA_MAYOR_2009 
    CHECK(TO_NUMBER(TO_CHAR(FECHA_STATUS,'YYYY'))>2009)
);

-- 
-- TABLE: LAP_INV_F2_AJRG_S1 
--

CREATE TABLE LAP_INV_F2_AJRG_S1(
    LAPTOP_ID           NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS        DATE     NOT NULL,
    SUCURSAL_ID         NUMBER(10, 0),
    STATUS_LAPTOP_ID    NUMBER(5, 0)     NOT NULL,
    CONSTRAINT LAPTOP_INVENTARIO_PK PRIMARY KEY (LAPTOP_ID)
);

-- 
-- TABLE: SERV_LAP__F1_AJRG_S1 
--

CREATE TABLE SERV_LAP_F1_AJRG_S1(
    SERVICIO_LAPTOP_ID    NUMBER(10, 0)     NOT NULL,
    IMPORTE               NUMBER(8, 2)      NOT NULL,
    DIAGNOSTICO           VARCHAR2(2000)    NOT NULL,
    SUCURSAL_ID           NUMBER(10, 0)     NOT NULL,
    LAPTOP_ID             NUMBER(10, 0)     NOT NULL,
    CONSTRAINT SERVICIO_LAPTOP_PK PRIMARY KEY (SERVICIO_LAPTOP_ID), 
    CONSTRAINT SERVICIO_LAP_ID_FK FOREIGN KEY (LAPTOP_ID)
    REFERENCES LAPTOP_F1_AJRG_S1(LAPTOP_ID)
);

-- 
-- TABLE: SUCURSAL_F1_AJRG_S1 
--

CREATE TABLE SUCURSAL_F1_AJRG_S1(
    SUCURSAL_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE          VARCHAR2(10)     NOT NULL,
    NOMBRE         VARCHAR2(40)     NOT NULL,
    LATITUD        VARCHAR2(15)     NOT NULL, 
    LONGITUD       VARCHAR2(15)     NOT NULL, 
    URL            VARCHAR2(200)    NOT NULL,
    ES_TALLER      NUMBER(1, 0)     NOT NULL,
    ES_VENTA       NUMBER(1, 0)     NOT NULL,
    CONSTRAINT SUCURSAL_PK PRIMARY KEY (SUCURSAL_ID),
    CONSTRAINT ES_AMBAS_NO_CHK 
    CHECK((ES_TALLER = 1 AND ES_VENTA = 1) OR (SUBSTR(CLAVE,3,2)='NO'))
);

-- 
-- TABLE: SUC_TALLER_F1_AJRG_S1 
--

CREATE TABLE SUC_TALLER_F1_AJRG_S1(
    SUCURSAL_ID          NUMBER(10, 0)    NOT NULL,
    DIA_DESCANSO         NUMBER(1, 0)     NOT NULL,
    TELEFONO_ATENCION    VARCHAR2(20)     NOT NULL,
    CONSTRAINT SUCURSAL_TALLER_PK PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT SVENTA_SUCURSAL_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F1_AJRG_S1(SUCURSAL_ID)
);

-- 
-- TABLE: SUC_VENTA_F1_AJRG_S1 
--

CREATE TABLE SUC_VENTA_F1_AJRG_S1(
    SUCURSAL_ID      NUMBER(10, 0)    NOT NULL,
    HORA_APERTURA    DATE             NOT NULL,
    HORA_CIERRE      DATE             NOT NULL,
    CONSTRAINT SUCURSAL_VENTA_PK PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT STALLER_SUCURSAL_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F1_AJRG_S1(SUCURSAL_ID)
); 