create or replace trigger t_dml_sucursal_venta_n2
instead of insert or update or delete on sucursal_venta
declare
	v_count 	number;
	v_count_2	number;
begin
	case 
		when inserting then
			-- Checando por valores en el nodo local
			select count(*) into v_count from sucursal_f2
			where sucursal_id = :new.sucursal_id;
			if v_count > 0 then
			-- Si hay registros se realiza la insercion
				insert into suc_venta_f2(sucursal_id,hora_apertura,hora_cierre)
				values(:new.sucursal_id, :new.hora_apertura,:new.hora_cierre);

			else
			-- Si no hay registros se checa en el sitio 1
				select count(*) into v_count from sucursal_f1
				where sucursal_id = :new.sucursal_id;
				if v_count > 0 then
					insert into suc_venta_f1(sucursal_id,hora_apertura,hora_cierre)
					values(:new.sucursal_id, :new.hora_apertura,:new.hora_cierre);

				else
					--Si no hay registros se checa en el sitio 3
					select count(*) into v_count from sucursal_f3
					where sucursal_id = :new.sucursal_id;

					if v_count > 0 then
						insert into suc_venta_f3(sucursal_id,hora_apertura,hora_cierre)
						values(:new.sucursal_id, :new.hora_apertura,:new.hora_cierre);

					else
						--Finalmente se checa el sitio 4
						select count(*) into v_count from sucursal_f4
						where sucursal_id = :new.sucursal_id;

						if v_count > 0 then
							insert into suc_venta_f4(sucursal_id,hora_apertura,hora_cierre)
							values(:new.sucursal_id, :new.hora_apertura,:new.hora_cierre);


						else
							raise_application_error(20001, 
							'Valor incorrecto SUCURSAL_ID : '
        					|| :new.sucursal_id
                		   	|| ' No existente ');
                		end if;
					end if;
				end if;
			end if;
	when updating then

		raise_application_error(-20005,' update Se implementara al rato');

	when deleting then

		raise_application_error(-20006,' delete Se implementara al rato');

	end case;

end;

/

show errors