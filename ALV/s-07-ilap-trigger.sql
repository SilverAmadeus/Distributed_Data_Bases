--@Author: Moreno Tagle Ivan Raphael 
--Rodriguez Garcia Alan Julian
--@Description: main creacion de Triggers

Prompt Creacion de sinonimos en AJRGBD SITIO 1

connect ilap/ilap@AJRGBD_S1
@@./trigger/sucursal_trigger.sql

Prompt Creacion de sinonimos en AJRGBD SITIO 2

connect ilap/ilap@AJRGBD_S2
@@./trigger/sucursal_trigger.sql

Prompt Creacion de sinonimos en RIMTBD SITIO 1

connect ilap/ilap@RIMTBD_S1
@@./trigger/sucursal_trigger.sql

Prompt Creacion de sinonimos en RIMTBD SITIO 2

connect ilap/ilap@RIMTBD_S1
@@./trigger/sucursal_trigger.sql

Prompt Mission Complete!