-- Company :      UNAM
-- Project :      icar-global.DM1
-- Author :       Moreno Tagle Ivan Raphael
--                Rodriguez Garcia Alan Julian
-- Date Created : Monday, June 05, 2017 11:31:52
-- Target DBMS : Oracle 12c
-- @Description: Vista para tabla SUCURSAL


create or replace view SUCURSAL as (
	select sucursal_id, clave, nombre, latitud, longitud, url, es_venta, es_taller
	from sucursal_f1
	union
	select sucursal_id, clave, nombre, latitud, longitud, url, es_venta, es_taller
	from sucursal_f2
	union
	select sucursal_id, clave, nombre, latitud, longitud, url, es_venta, es_taller
	from sucursal_f3
	union 
	select sucursal_id, clave, nombre, latitud, longitud, url, es_venta, es_taller
	from sucursal_f4
);
