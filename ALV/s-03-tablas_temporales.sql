-- Company :      UNAM
-- Project :      icar-global.DM1
-- Author :       Moreno Tagle Ivan Raphael
--                Rodriguez Garcia Alan Julian
-- Date Created : Monday, June 05, 2017 11:31:52
-- Target DBMS : Oracle 12c
-- @Description: Creacion de tablas temporales
prompt Creando tablas temporales

connect ilap/ilap@AJRGBD_s1

create global temporary table t_laptop_insert(
	laptop_id number(10,0) constraint t_laptop_insert_pk primary key,
	foto blob not null
) on commit preserve rows;

/

create global temporary table t_laptop_select(
	laptop_id number(10,0) constraint t_laptop_select_pk primary key,
	foto blob not null
) on commit preserve rows;
/