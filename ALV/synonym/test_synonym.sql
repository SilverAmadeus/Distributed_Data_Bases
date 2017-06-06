-- Company :      UNAM
-- Project :      icar-global.DM1
-- Author :       Moreno Tagle Ivan Raphael
--                Rodriguez Garcia Alan Julian
-- Date Created : Monday, June 05, 2017 11:31:52
-- Target DBMS : Oracle 12c

--VALIDACION DE SYNONYMS

Prompt historico_status

select count (*) from hist_stat_lap_f1
union
select count (*) from hist_stat_lap_f2;

Prompt laptop_inventario

select count(*) from lap_inv_f1
union
select count(*) from lap_inv_f2;


Prompt laptop

select count(*) from laptop_f1
union
select count(*) from laptop_f2
union 
select count(*) from laptop_f3
union 
select count(*) from laptop_f4
union 
select count(*) from laptop_f5;

Prompt servicio_laptop
select count(*) from serv_lap_f1
union
select count(*) from serv_lap_f2
union
select count(*) from serv_lap_f3
union 
select count(*) from serv_lap_f4;

Prompt sucursal
select count(*) from sucursal_f1
union
select count(*) from sucursal_f2
union
select  count(*) from sucursal_f3
union
select count(*) from sucursal_f4;

Prompt sucursal_taller
select count(*) from suc_taller_f1
union
select count(*) from suc_taller_f2
union
select count(*) from suc_taller_f3
union
select count(*) from suc_taller_f4;

Prompt sucursal_venta
select count(*) from suc_venta_f1
union
select count(*) from suc_venta_f2
union
select count(*) from suc_venta_f3
union
select count(*) from suc_venta_f4;

Prompt Mission Complete!!
