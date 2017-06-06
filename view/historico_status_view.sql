-- Company :      UNAM
-- Project :      icar-global.DM1
-- Author :       Moreno Tagle Ivan Raphael
--                Rodriguez Garcia Alan Julian
-- Date Created : Monday, June 05, 2017 11:31:52
-- Target DBMS : Oracle 12c

--@Description: Vista tabla HISTORICO_STATUS_LAPTOP


create or replace view HISTORICO_STATUS_LAPTOP as (
	select historico_status_laptop_id, fecha_status, status_laptop_id, laptop_id 
	from (
		select historico_status_laptop_id, fecha_status, status_laptop_id, laptop_id
		from hist_stat_lap_f1
		union
		select historico_status_laptop_id, fecha_status, status_laptop_id, laptop_id
		from hist_stat_lap_f2
		)
);
