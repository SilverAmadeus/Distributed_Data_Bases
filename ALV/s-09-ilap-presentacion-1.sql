--@Autor: Moreno Tagle Ivan Raphael
--@Fecha creación: 06/06/2017
--@Descripción: Archivo principal de creación de objetos.

whenever sqlerror exit rollback;
Prompt Iniciando con la creacion de la BDD.

@s-00-ilap-usuario.sql

@s-02-ilap-ligas.sql

@s-04-ilap-ddl.sql

@s-05-ilap-synonym.sql

@s-06-ilap-view.sql
--Falta poner todos los triggers chidoris
@s-07-ilap-trigger.sql

@s-08-ilap-soporte-blob.sql

Prompt Mission TURBO Complete!!
