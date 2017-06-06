-- Company :      UNAM
-- Project :      icar-global.DM1
-- Author :       Moreno Tagle Ivan Raphael
--                Rodriguez Garcia Alan Julian
-- Date Created : Monday, June 05, 2017 11:31:52
-- Target DBMS : Oracle 12c

--VALIDACION DE vVIEWS EXTREMA

--@Author: Moreno Tagle Ivan Raphael 
--Rodriguez Garcia Alan Julian
--@Description: main test views

Prompt Test vieWS en AJRGBD SITIO 1

connect ilap/ilap@AJRGBD_S1
@test_view.sql

Prompt Testing de views en AJRGBD SITIO 2

connect ilap/ilap@AJRGBD_S2
@test_view.sql

Prompt Testing de views en RIMTBD SITIO 1

connect ilap/ilap@RIMTBD_S1
@test_view.sql

Prompt Testing de views en RIMTBD SITIO 2

connect ilap/ilap@RIMTBD_S1
@test_view.sql

Prompt Mission Complete!