
create or replace trigger t_dml_sucursal
instead of insert or update or delete on sucursal
 	declare
 	v_exists	number(1);
 	begin
 	 	case
 	 		when inserting then

 	 		if substr(:new.clave,3,2) not in ('NO','EA','WS','SO') then
 	 			raise_application_error(-20002, 'Clave de sucursal invalida: ' ||:new.clave
 	 				|| ' , se esperaba NO, EA, WS, SO');
 	 		end if;
	
	 	 	if :new.es_taller not in (0,1) or :new.es_venta not in (0,1) then
	 	 		raise_application_error(-20003, 'valor invalido para es_taller o es_venta '||:new.es_venta ||' <=> '
	 	 			||:new.es_taller||' se esperaba: 0,1');
	 	 	end if;
	 	 	
	 	 	if substr(:new.clave,3,2) = 'NO' or (:new.es_taller = 1 and :new.es_venta = 1) then

 		 		insert into sucursal_f1 (sucursal_id,clave,nombre,latitud,longitud,url,es_venta,es_taller)
 	 			values(:new.sucursal_id,:new.clave,:new.nombre,:new.latitud,:new.longitud,:new.url,:new.es_venta,
 	 				:new.es_taller);

 	 		elsif substr(:new.clave,3,2)= 'EA' and (:new.es_taller = 0 or :new.es_venta = 0) then
	
	 			insert into sucursal_f2 (sucursal_id,clave,nombre,latitud,longitud,url,es_venta,es_taller)
 	 				values(:new.sucursal_id,:new.clave,:new.nombre,:new.latitud,:new.longitud,:new.url,:new.es_venta,
 	 					:new.es_taller);
	
	 		elsif substr(:new.clave,3,2)='WS' and (:new.es_taller = 0 or :new.es_venta = 0) then
	
	 			insert into sucursal_f3 (sucursal_id,clave,nombre,latitud,longitud,url,es_venta,es_taller)
	 				values(:new.sucursal_id,:new.clave,:new.nombre,:new.latitud,:new.longitud,:new.url,:new.es_venta,
	 	 					:new.es_taller);
	
	 		elsif substr(:new.clave,3,2)='SO' and (:new.es_taller = 0 or :new.es_venta = 0) then
	
	 			insert into sucursal_f4 (sucursal_id,clave,nombre,latitud,longitud,url,es_venta,es_taller)
	 	 			values(:new.sucursal_id,:new.clave,:new.nombre,:new.latitud,:new.longitud,:new.url,:new.es_venta,
	 		 				:new.es_taller);

	 	 	else 
	 			raise_application_error(-20004, 'Error de integridad para SUCURSAL '
	 	 				||'Valores invalidos para CLAVE, ES_TALLER, ES_VENTA: '
	 	 				||:new.clave||','||:new.es_venta||' , '||:new.es_taller);
 	 		end if;

 	 		when updating then
 	 		raise_application_error(-20005, 'Ahorita sale');

 	 		when deleting then
 	 		raise_application_error(-20006, 'Ahorita sale v2');
 	 	end case;
 	end;
/
show errors