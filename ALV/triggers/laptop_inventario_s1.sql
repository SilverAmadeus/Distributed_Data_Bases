--@Autor: Moreno Tagle Ivan Raphael
--		  Rodriguez Garcia Alan Julian

--@Fecha creación: 13/04/2017
--@Descripción: Creación de trigger para implementar transparencia de insercion

create or replace trigger t_dml_laptop_inventario
	instead of insert or update or delete on laptop_inventario
declare
	v_in_laptop number(1);
	
begin
	case
		when inserting then

			select count(*) into v_in_laptop
			from laptop_f1 
			where laptop_id = :NEW.laptop_id;

			if v_in_laptop = 1 then 
				--Se inserta primero el local, SITIO 1 AJRGBD_S1
				insert into lap_inv_f2(laptop_id, fecha_status, sucursal_id, status_laptop_id)
					values (:NEW.laptop_id, :NEW.fecha_status, :NEW.sucursal_id, :NEW.status_laptop_id);
				insert into lap_inv_f1(laptop_id, rfc_cliente, num_tarjeta)
					values(:NEW.laptop_id, :NEW.rfc_cliente, :NEW.num_tarjeta);
			else 
				--Se checa correspondencia en el SITIO 3 RIMTBD_S1
				select count(*) into v_in_laptop
				from laptop_f3
				where laptop_id = :NEW.laptop_id;		

				if v_in_laptop = 1 then
					--Remotos: existe correspondencia con el fragmento en sitio 3
					insert into lap_inv_f2(laptop_id, fecha_status, sucursal_id, status_laptop_id)
						values(:NEW.laptop_id, :NEW.fecha_status, :NEW.sucursal_id, :NEW.status_laptop_id);
					insert into lap_inv_f1(laptop_id, rfc_cliente, num_tarjeta)
						values(:NEW.laptop_id, :NEW.rfc_cliente, :NEW.num_tarjeta);
				else
					--Se checa correspondencia en el SITIO 2 AJRGBD_S2
					select count(*) into v_in_laptop
					from laptop_f2
					where laptop_id = :NEW.laptop_id;
						
					if v_in_laptop = 1 then
						--Remotos:Existe correspondencia con el fragmento en sitio 2
						insert into lap_inv_f2(laptop_id, fecha_status, sucursal_id, status_laptop_id)
							values(:NEW.laptop_id, :NEW.fecha_status, :NEW.sucursal_id, :NEW.status_laptop_id);
						insert into lap_inv_f1(laptop_id, rfc_cliente, num_tarjeta)
							values(:NEW.laptop_id, :NEW.rfc_cliente, :NEW.num_tarjeta);
					else
						--Se checa correspondencia en el SITIO 4 RIMTBD_S2
						select count(*) into v_in_laptop
						from laptop_f4
						where laptop_id = :NEW.laptop_id;

						if v_in_laptop = 1  then		
							insert into lap_inv_f2(laptop_id, fecha_status, sucursal_id, status_laptop_id)
								values(:NEW.laptop_id, :NEW.fecha_status, :NEW.sucursal_id, :NEW.status_laptop_id);
							insert into lap_inv_f1(laptop_id, rfc_cliente, num_tarjeta)
								values(:NEW.laptop_id, :NEW.rfc_cliente, :NEW.num_tarjeta);
						
						else
							raise_application_error(20001, 'Valor incorrecto LAPTOP_ID : '
        					|| :NEW.laptop_id
                		   	|| ' No existente ');
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