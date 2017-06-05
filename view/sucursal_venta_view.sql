-- Company :      UNAM
-- Project :      icar-global.DM1
-- Author :       Moreno Tagle Ivan Raphael
--                Rodriguez Garcia Alan Julian
-- Date Created : Monday, June 05, 2017 11:31:52
-- Target DBMS : Oracle 12c
-- @Description: Vista para tabla SUCURSAL_VENTA

create or replace view SUCURSAL_VENTA as (
	select sucursal_id, hora_apertura, hora_cierre from suc_venta_f1
	union
	select sucursal_id, hora_apertura, hora_cierre from suc_venta_f2
	union
	select sucursal_id, hora_apertura, hora_cierre from suc_venta_f3
	union
	select sucursal_id, hora_apertura, hora_cierre from suc_venta_f4
);