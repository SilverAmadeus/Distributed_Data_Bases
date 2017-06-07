-- Company :      UNAM
-- Project :      icar-global.DM1
-- Author :       Moreno Tagle Ivan Raphael
--                Rodriguez Garcia Alan Julian
-- Date Created : Monday, June 05, 2017 11:31:52
-- Target DBMS : Oracle 12c
-- @Description: Vista para tabla LAPTOP


--NO PARA RIMT_S2

--1. Objetos type

create type laptop_type as object (
	laptop_id number(10,0),
	foto blob
);

/

create type laptop_table as table of laptop_type;

/

--2. creacion de la tabla temporal para copiar BLOBS
--NOPE

--3. creacion de la funcion get_remote_contrato_by_id()
--@Description: Funcion para manejo de BLOBs remotos


create or replace function get_remote_contrato_by_id(v_laptop_id in number ) return blob is
	pragma autonomous_transaction;
	v_temp_foto blob;
	begin
    	--asegura que no haya registros
    	delete from t_laptop_select;
    	--inserta los datos obtenidos del fragmento remoto a la tabla temporal.
    	insert into t_laptop_select select laptop_id, foto 
    		from laptop_f5 where laptop_id = v_laptop_id;
    	--obtiene el registro de la tabla temporal y lo regresa como blob
    	select foto into v_temp_foto from t_laptop_select where laptop_id = v_laptop_id;
    	--elimina los registros de la tabla temporal una vez que han sido obtenidos.
    	delete from t_laptop_select;
    	commit;
   		return v_temp_foto;
   	exception
   		when others then
   			rollback;
   			raise;
 end;
/
SHOW ERRORS;
--

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
/