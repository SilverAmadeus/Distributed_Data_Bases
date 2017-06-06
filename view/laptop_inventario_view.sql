-- Company :      UNAM
-- Project :      icar-global.DM1
-- Author :       Moreno Tagle Ivan Raphael
--                Rodriguez Garcia Alan Julian
-- Date Created : Monday, June 05, 2017 11:31:52
-- Target DBMS : Oracle 12c
-- @Description: Vista para tabla LAPTOP_INVENTARIO

create or replace view LAPTOP_INVENTARIO as(
	select q1.laptop_id, q2.fecha_status, q1.rfc_cliente, q1.num_tarjeta,
		q2.status_laptop_id, q2.sucursal_id
	from(
		(select laptop_id, rfc_cliente, num_tarjeta 
		from lap_inv_f1) q1
		join 
		(select laptop_id, fecha_status, sucursal_id, status_laptop_id 
		from lap_inv_f2) q2 
		on q1.laptop_id = q2.laptop_id
		)
);
