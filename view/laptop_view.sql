-- Company :      UNAM
-- Project :      icar-global.DM1
-- Author :       Moreno Tagle Ivan Raphael
--                Rodriguez Garcia Alan Julian
-- Date Created : Monday, June 05, 2017 11:31:52
-- Target DBMS : Oracle 12c
-- @Description: Vista para tabla LAPTOP


--ACCE
create or replace view LAPTOP as (
	select q1.cuenta_id, q1.num_cuenta ,q1.tipo_cuenta, q2.saldo, q2.nip, get_remote_contrato_by_id(q1.cuenta_id) as contrato, q1.sucursal_id
    from (
		select cuenta_id, num_cuenta, tipo_cuenta, sucursal_id from cuenta_3
		union
	    select cuenta_id, num_cuenta, tipo_cuenta, sucursal_id from cuenta_4
	)q1
	join 
	( select cuenta_id, saldo, nip from cuenta_1) q2
	on q1.cuenta_id = q2.cuenta_id
);