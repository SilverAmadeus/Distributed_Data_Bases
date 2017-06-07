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
SHOW ERRORS