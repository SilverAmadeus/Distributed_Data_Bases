--@Autor: Moreno Tagle Ivan Raphael
--		  Rodriguez Garcia Alan Julian

--@Fecha creación: 13/04/2017
--@Descripción: Creación de trigger para implementar transparencia de insercion

create or replace trigger t_dml_sucursal
	instead of insert or update or delete on sucursal
declare
	v_exists number(1);
begin
	case
		when inserting then

			if TO_NUMBER(TO_CHAR(FECHA_STATUS,'YYYY'))<=2009 then
				insert into hist_stat_lap_f1(historico_status_laptop_id, fecha_status,
							status_laptop_id, laptop_id)
				values(:NEW.historico_status_laptop_id, NEW.fecha_status,
						:NEW.status_laptop_id, :NEW.laptop_id);
			elsif TO_NUMBER(TO_CHAR(FECHA_STATUS,'YYYY'))>2009 then
				insert into hist_stat_lap_f2(historico_status_laptop_id, fecha_status,
							status_laptop_id, laptop_id)
				values(:NEW.historico_status_laptop_id, :NEW.fecha_status,
						:NEW.status_laptop_id, :NEW.laptop_id);
			else
				raise_application_error(-20001, 'NPI :v');
			end if;

		
	when updating then

		raise_application_error(-20005,' update Se implementara el siguiente semestre :p');

	when deleting then

		raise_application_error(-20006,' delete Se implementara el siguiente semestre :p');

	end case;

end;

/

show errors
