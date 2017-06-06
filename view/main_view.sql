-- Company :      UNAM
-- Project :      icar-global.DM1
-- Author :       Moreno Tagle Ivan Raphael
--                Rodriguez Garcia Alan Julian
-- Date Created : Monday, June 05, 2017 11:31:52
-- Target DBMS : Oracle 12c
-- @Description: Vista para tabla SUCURSAL

--@Author: Moreno Tagle Ivan Raphael 
--Rodriguez Garcia Alan Julian
--@Description: main creacion de vistas



Prompt Creacion de vistas en AJRGBD SITIO 1

connect ilap/ilap@AJRGBD_S1
@sucursal_view.sql
@sucursal_venta_view.sql
Prompt Creacion de vistas en AJRGBD SITIO 2

connect ilap/ilap@AJRGBD_S2
@sucursal_view.sql
@sucursal_venta_view.sql
Prompt Creacion de vistas  en RIMTBD SITIO 1

connect ilap/ilap@RIMTBD_S1
@sucursal_view.sql
@sucursal_venta_view.sql
Prompt Creacion de vistas en RIMTBD SITIO 2

connect ilap/ilap@RIMTBD_S1
@sucursal_view.sql
@sucursal_venta_view.sql

Prompt Mission Complete!
