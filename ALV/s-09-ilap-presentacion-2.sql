--@Autor: Moreno Tagle Ivan Raphael
--		Rodriguez Garcia Alan Julian
--@Fecha creación: 06/06/2017
--@Descripción: Archivo de carga inicial.

whenever sqlerror exit rollback;

--catalogos

Prompt cargando catalogos

--En SITIO 1

connect ilap/ilap@AJRGBD_S1

@carga-inicial/tipo_monitor.sql
@carga-inicial/tipo_procesador.sql
@carga-inicial/tipo_tarjeta_video.sql
@carga-inicial/tipo_almacenamiento.sql
@carga-inicial/status_laptop.sql

--En SITIO 2

connect ilap/ilap@AJRGBD_S2

@carga-inicial/tipo_monitor.sql
@carga-inicial/tipo_procesador.sql
@carga-inicial/tipo_tarjeta_video.sql
@carga-inicial/tipo_almacenamiento.sql
@carga-inicial/status_laptop.sql

--En SITIO 3

connect ilap/ilap@RIMTBD_S1

@carga-inicial/tipo_monitor.sql
@carga-inicial/tipo_procesador.sql
@carga-inicial/tipo_tarjeta_video.sql
@carga-inicial/tipo_almacenamiento.sql
@carga-inicial/status_laptop.sql

--En SITIO 4

connect ilap/ilap@RIMTBD_S2

@carga-inicial/tipo_monitor.sql
@carga-inicial/tipo_procesador.sql
@carga-inicial/tipo_tarjeta_video.sql
@carga-inicial/tipo_almacenamiento.sql
@carga-inicial/status_laptop.sql

Prompt cargando sucursales

--es_venta = 0, es_taller = 1

@carga-inicial/sucursal-1.sql

--es_venta = 1, es_taller = 0

@carga-inicial/sucursal-2.sql

--es_venta= 1, es_taller = 1

@carga-inicial/sucursal-3.sql

Prompt creando sucursal_taller

-- id 1 al 1000

@carga-inicial/sucursal_taller-1.sql

-- id 2001 al 3000

@carga-inicial/sucursal_taller-2.sql

Prompt creando sucursal_venta

-- id 1001 al 2000

@carga-inicial/sucursal_venta-1.sql

-- id 2001 al 3000

@carga-inicial/sucursal_venta-2.sql

Prompt cargando laptops

--laptops sin reemplazo

@carga-inicial/laptop-1.sql

--Algunas de estas laptops tienen reemplazo

@carga-inicial/laptop-2.sql

Prompt cargando laptop_inventario

--sucursal_id 1001-2000 --vendidas

@carga-inicial/laptop_inventario-1.sql

--sucursal_id 2001-3000 --laptops en venta 4

@carga-inicial/laptop_inventario-2.sql

Prompt cargando historicos

@carga-inicial/historico_status_laptop-en-pedido-1.sql

@carga-inicial/historico_status_laptop-en-pedido-2.sql

@carga-inicial/historico_status_laptop-en-sucursal-1.sql

@carga-inicial/historico_status_laptop-en-sucursal-2.sql

Prompt cargando servicio_laptop

@carga-inicial/servicio_laptop-1.sql

Prompt insertando datos BLOB en laptop

!cp carga-inicial/lap.jpg /tmp

insert into laptop (laptop_id, num_serie, cantidad_ram, caracteristicas_extras, foto,

tipo_tarjeta_video_id, tipo_procesador_id, tipo_almacenamiento_id,

tipo_monitor_id, laptop_reemplazo_id)

values (2001, '1669242499', 26955, 'Laptop con BLOB',

load_blob_from_file('TMP_DIR','lap.jpg'), 9, 587, 2, 45, null);
