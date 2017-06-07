
create or replace trigger t_dml_laptop_s3
instead of insert or update or delete on laptop
declare
begin
	case 
		when inserting then
			-- LAPTOP_F5 es el que tiene el BLOB esta en RIMTBD_S2 (SITIO 4)

			-- Si el numero de serie es entre 4 y 5 (primer digito) then se va al S3;

			if substr(:new.num_serie,1,1) = '4' or substr(:new.num_serie,1,1) = '5' then
				insert into laptop_f3(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
					tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,tipo_monitor_id,
					laptop_reemplazo_id)
				values(:new.laptop_id, :new.num_serie, :new.cantidad_ram, :new.caracteristicas_extras,
					:new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,
					:new.tipo_monitor_id,:new.laptop_reemplazo_id);

			-- Si el numero de serie es entre 6, 7, 8 y 9 (primer digito) then se va al S4;
			
			elsif substr(:new.num_serie,1,1) = '6' or substr(:new.num_serie,1,1) = '7' or
			  	substr(:new.num_serie,1,1) = '8' or substr(:new.num_serie,1,1) = '9' then
				insert into laptop_f2(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
					tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,tipo_monitor_id,
					laptop_reemplazo_id)
				values(:new.laptop_id,:new.num_serie, :new.cantidad_ram, :new.caracteristicas_extras,
					:new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,
					:new.tipo_monitor_id,:new.laptop_reemplazo_id);

			-- Si el numero de serie es entre 0 y 1 (primer digito) then se va al S1;
			elsif substr(:new.num_serie,1,1) = '0' or substr(:new.num_serie,1,1) = '1' then
				insert into laptop_f1(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
					tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,tipo_monitor_id,
					laptop_reemplazo_id)
				values(:new.laptop_id, :new.num_serie, :new.cantidad_ram, :new.caracteristicas_extras,
					:new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,
					:new.tipo_monitor_id,:new.laptop_reemplazo_id);

			-- Si el numero de serie es entre 2 y 3 (primer digito) then se va al S2;

			elsif substr(:new.num_serie,1,1) = '2' or substr(:new.num_serie,1,1) = '3' then
				insert into laptop_f4(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
					tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,tipo_monitor_id,
					laptop_reemplazo_id)
				values(:new.laptop_id, :new.num_serie, :new.cantidad_ram, :new.caracteristicas_extras,
					:new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,
					:new.tipo_monitor_id,:new.laptop_reemplazo_id);


			else
					raise_application_error(20001, 'Valor incorrecto LAPTOP_ID : '
        			|| :new.laptop_id|| ' Debe iniciar se esperaba un numero del 1 al 9 al inicio ');
			end if;
			--inserta el binario, uso de tabla temporal
			insert into t_laptop_insert(laptop_id,foto)
			values(:new.laptop_id,:new.foto);

			--inserta en el sitio remoto a través de la tabla temporal
			insert into laptop_f5
				select * from t_laptop_insert
				where laptop_id = :new.laptop_id;

			delete from t_laptop_insert
			where laptop_id = :new.laptop_id;


		when updating then	
			raise_application_error(20002, 'Update Work in progress');		

		when deleting then 

			raise_application_error(20003, 'Delete Work in progress');
	end case;
end;
/
show errors