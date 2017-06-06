-- Company :      UNAM
-- Project :      icar-global.DM1
-- Author :       Moreno Tagle Ivan Raphael
--                Rodriguez Garcia Alan Julian
-- Date Created : Monday, June 05, 2017 11:31:52
-- Target DBMS : Oracle 12c

--@Description: Vista tabla SERVICIO_LAPTOP


create or replace view SERVICIO_LAPTOP as(
	select servicio_laptop_id, importe, diagnostico, sucursal_id, laptop_id
	from(
		select servicio_laptop_id, importe, diagnostico, sucursal_id, laptop_id
		from serv_lap_f1
		union
		select servicio_laptop_id, importe, diagnostico, sucursal_id, laptop_id
		from serv_lap_f2
		union
		select servicio_laptop_id, importe, diagnostico, sucursal_id, laptop_id
		from serv_lap_f3
		union
		select servicio_laptop_id, importe, diagnostico, sucursal_id, laptop_id
		from serv_lap_f4
		)
);

