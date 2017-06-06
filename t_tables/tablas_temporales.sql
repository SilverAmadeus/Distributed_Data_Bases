-- Company :      UNAM
-- Project :      icar-global.DM1
-- Author :       Moreno Tagle Ivan Raphael
--                Rodriguez Garcia Alan Julian
-- Date Created : Monday, June 05, 2017 11:31:52
-- Target DBMS : Oracle 12c

--@Description: Creacion de tablas temporales para
-- manejo remoto de BLOB's


--Tabla temporal para manejar blobs - transparencia para INSERT

create global temporary table t_insert_laptop_5(
  laptop_id number(10,0) constraint t_rimt_insert_laptop_5_pk  primary key,
  foto blob not null
) on commit preserve rows;

--tabla temporal para manejar blobs - transparencia para SELECT
create global temporary table t_select_laptop_5(
  laptop_id number(10,0) constraint t_rimt_select_laptop_5_pk  primary key,
  foto blob not null
) on commit preserve rows;
