--@Author: Moreno Tagle Ivan Raphael 
--Rodriguez Garcia Alan Julian
--@Description: main creacion de Triggers

Prompt Creacion de triggers en AJRGBD SITIO 1

connect ilap/ilap@AJRGBD_S1
@triggers/laptop_s1.sql
@triggers/sucursal_trigger.sql
@triggers/sucursal_venta_s1.sql
@triggers/sucursal_taller_s1.sql
@triggers/servicio_laptop_s1.sql
@triggers/laptop_inventario_s1.sql
@triggers/historico_status_trigger_s1.sql

Prompt Creacion de triggers en AJRGBD SITIO 2

connect ilap/ilap@AJRGBD_S2
@triggers/laptop_s2.sql
@triggers/sucursal_trigger.sql
@triggers/sucursal_venta_s2.sql
@triggers/sucursal_taller_s2.sql
@triggers/servicio_laptop_s2.sql
@triggers/laptop_inventario_s1.sql
@triggers/historico_status_trigger_s2.sql

Prompt Creacion de triggers en RIMTBD SITIO 1

connect ilap/ilap@RIMTBD_S1
@triggers/laptop_s3.sql
@triggers/sucursal_trigger.sql
@triggers/sucursal_venta_s3.sql
@triggers/sucursal_taller_s3.sql
@triggers/servicio_laptop_s3.sql
@triggers/laptop_inventario_s3.sql
@triggers/historico_status_trigger_s1.sql

Prompt Creacion de triggers en RIMTBD SITIO 2

connect ilap/ilap@RIMTBD_S2
@triggers/laptop_s4_local.sql
@triggers/sucursal_trigger.sql
@triggers/sucursal_venta_s4.sql
@triggers/sucursal_taller_s4.sql
@triggers/servicio_laptop_s4.sql
@triggers/laptop_inventario_s3.sql
@triggers/historico_status_trigger_s2.sql

Prompt Mission Complete!
