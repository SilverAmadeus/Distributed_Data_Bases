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

Prompt creando funcion para cargar BLOB

@fx-carga-blob-archivo.sql

