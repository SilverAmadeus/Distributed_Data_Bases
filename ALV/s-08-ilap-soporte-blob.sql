--@Autor: Moreno Tagle Ivan Raphael
--		Rodriguez Garcia Alan Julia
--@Fecha creación: 06/06/2017
--@Descripción: Creación de trigger para implementar transparencia de insercion

Prompt Creando objetos y privilegios para soporte de BLObs

--crear como usuario sys

--Prompt creando directorio

--create or replace directory tmp_dir as '/tmp';

--Prompt El usuario debe tener privilegios para leer del directorio

--grant read on directory tmp_dir to ilap_bdd;

--grant create procedure to ilap_bdd;

--Toda la BS anterior la tiene en s-01-ilap-grant.sql

Prompt creando funcion para cargar BLOB en AJRGBD_S1

connect sys/sytem@AJRGBD_S1 as sysdba
@fx-carga-blob-archivo.sql

Prompt creando funcion para cargar BLOB en AJRGBD_S2

connect sys/sytem@AJRGBD_S2 as sysdba
@fx-carga-blob-archivo.sql

Prompt creando funcion para cargar BLOB en RIMTBD_S1

connect sys/sytem@RIMTBD_S1 as sysdba
@fx-carga-blob-archivo.sql

Prompt creando funcion para cargar BLOB en RIMTBD_S2

connect sys/sytem@RIMTBD_S1 as sysdba
@fx-carga-blob-archivo.sql

Prompt	Mission Complete!!!
