--@Autor: Moreno Tagle Ivan Raphael
--		  Rodriguez Garcia Alan Julian

--@Fecha creación: 13/04/2017
--@Descripción: Creación de trigger para implementar transparencia de insercion

create or replace trigger t_dml_servicio_laptop
	instead of insert or update or delete on servicio_laptop
declare
	v_count number(10);
	
begin
	case
		when inserting then
			select count(*) into v_count 
			from laptop_f4
			where laptop_id = :NEW.laptop_id;

			if v_count > 0 then
				--El registro pertenece al fragmento en sitio 4 RIMTBD_S4
				insert into serv_lap_f4(servicio_laptop_id, importe, diagnostico, sucursal_id, laptop_id)
					values (:NEW.servicio_laptop_id, :NEW.importe, :NEW.diagnostico, :NEW.sucursal_id, :NEW.laptop_id); 
			else
				--Checando en el sitio 1 AJRGBD_S1
				select count(*) into v_count
				from laptop_f1
				where laptop_id = :NEW.laptop_id;

				if v_count > 0 then
					--El registro pertenece al fragmento en sitio AJRGBD_S1
					insert into serv_lap_f1(servicio_laptop_id, importe, diagnostico, sucursal_id, laptop_id)
						values (:NEW.servicio_laptop_id, :NEW.importe, :NEW.diagnostico, :NEW.sucursal_id, :NEW.laptop_id);
				else
					--Checando en el sitio 2 AJRGBD_S2
					select count(*) into v_count
					from laptop_f2
					where laptop_id = :NEW.laptop_id;

					if v_count > 0 then
					--El registro pertenece al fragmento en sitio AJRGBD_S2
						insert into serv_lap_f2(servicio_laptop_id, importe, diagnostico, sucursal_id, laptop_id)
							values (:NEW.servicio_laptop_id, :NEW.importe, :NEW.diagnostico, :NEW.sucursal_id, :NEW.laptop_id);
					else 
						--Checando en el sitio 3 RIMTBD_S1
						select count(*) into v_count
						from laptop_f3
						where laptop_id = :NEW.laptop_id;

						if v_count > 0 then
						--El registro pertenece al fragmento en sitio RIMTBD_S1
							insert into serv_lap_f3(servicio_laptop_id, importe, diagnostico, sucursal_id, laptop_id)
								values (:NEW.servicio_laptop_id, :NEW.importe, :NEW.diagnostico, :NEW.sucursal_id, :NEW.laptop_id);
						
						else

							raise_application_error(20001, 'Valor incorrecto LAPTOP_ID : '
        					|| :NEW.laptop_id
                		   	|| ' :No existente ');
                		end if;
                	end if;
                end if;
            end if;


		when updating then

			raise_application_error(-20005,' update Se implementara el siguiente semestre :p');

		when deleting then

			raise_application_error(-20006,' delete Se implementara el siguiente semestre :p');

	end case;

end;

/

show errors;