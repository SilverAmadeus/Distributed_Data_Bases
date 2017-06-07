INSERT INTO laptop (laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
					tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,tipo_monitor_id,
					laptop_reemplazo_id,foto)
VALUES (1, '00AAAAAAAAAAAAAAAA', 1600,'Esta chida la neta',1,2,3,4,NULL,load_blob_from_file('TMP_DIR','photo.jpg'));