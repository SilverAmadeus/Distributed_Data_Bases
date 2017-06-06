-- Company :      UNAM
-- Descripcion:   Crea las entidades en cada una de las PDB's
-- Author :       Moreno Tagle Ivan Raphael
--                Rodriguez Garcia Alan Julian
-- Date Created : Monday, June 05, 2017 16:57:52
-- Target DBMS : Oracle 12c

prompt Creando entidades en AJRGBD_S1  
connect ilap/ilap@AJRGBD_S1

@@AJRGBD_S1.sql

prompt Crea entidades en AJRGBD_S2
connect ilap/ilap@AJRGBD_S2

@@AJRGBD_S2.sql

prompt Crea entidades en RIMTBD_S1
connect ilap/ilap@RIMTBD_S1

@@RIMTBD_S1.sql

prompt Crea entidades en RIMTBD_S2
connect ilap/ilap@RIMTBD_S2

@@RIMTBD_S2.sql

exit