-- Company :      UNAM
-- Project :      icar-global.DM1
-- Author :       Moreno Tagle Ivan Raphael
--                Rodriguez Garcia Alan Julian
-- Date Created : Monday, June 05, 2017 11:31:52
-- Target DBMS : Oracle 12c
-- @Description: Vista para tabla LAPTOP


--NO PARA RIMT_S2

create or replace view LAPTOP as (
	select q1.laptop_id, q1.num_serie, q1.cantidad_ram, q1.caracteristicas_extras,
			q1.tipo_tarjeta_video_id, q1.tipo_procesador_id, q1.tipo_almacenamiento_id,
			q1.tipo_monitor_id, q1.laptop_reemplazo_id, get_remote_contrato_by_id(q1.laptop_id) as foto
    from (
		select laptop_id, num_serie, cantidad_ram, caracteristicas_extras,
				tipo_tarjeta_video_id, tipo_procesador_id, tipo_almacenamiento_id,
				tipo_monitor_id, laptop_reemplazo_id 
		from laptop_f1
		union
		select laptop_id, num_serie, cantidad_ram, caracteristicas_extras,
				tipo_tarjeta_video_id, tipo_procesador_id, tipo_almacenamiento_id,
				tipo_monitor_id, laptop_reemplazo_id
		from laptop_f2
		union
		select laptop_id, num_serie, cantidad_ram, caracteristicas_extras,
				tipo_tarjeta_video_id, tipo_procesador_id, tipo_almacenamiento_id,
				tipo_monitor_id, laptop_reemplazo_id
		from laptop_f3
		union
		select laptop_id, num_serie, cantidad_ram, caracteristicas_extras,
				tipo_tarjeta_video_id, tipo_procesador_id, tipo_almacenamiento_id,
				tipo_monitor_id, laptop_reemplazo_id
		from laptop_f4
		)q1
);
