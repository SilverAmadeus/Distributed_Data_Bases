-- Company :      UNAM
-- Project :      icar-global.DM1
-- Author :       Moreno Tagle Ivan Raphael
--                Rodriguez Garcia Alan Julian
-- Date Created : Monday, June 05, 2017 11:31:52
-- Target DBMS : Oracle 12c
-- @Description: Vista para tabla SUCURSAL_TALLER



create or replace SUCURSAL_TALLER as (
	select sucursal_id, telefono, dia_descanso from suc_taller_f1
	union
	select sucursal_id, telefono, dia_descanso from suc_taller_f2
	union 
	select sucursal_id, telefono, dia_descanso from suc_taller_f3
	union
	select sucursal_id, telefono, dia_descanso from suc_taller_f4
);