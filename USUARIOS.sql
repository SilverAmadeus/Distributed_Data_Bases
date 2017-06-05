prompt Conectando a AJRGBD_S1
prompt Password:
connect sys/&&syspass@AJRGBD_S1

create user ilap identified by ilap quota unlimited on users;
grant create session, create table, create synonym, create sequence, create procedure,
	create trigger, create view, create database link, create type,
	create or replace directory tmp_dir as '/tmp', read on directory tmp_dir to ilap;

prompt Conectando a AJRG_S2
prompt Password:
connect sys/&&syspass@AJRGBD_S2

create user ilap identified by ilap quota unlimited on users;
grant create session, create table, create synonym, create sequence, create procedure,
	create trigger, create view, create database link, create type,
	create or replace directory tmp_dir as '/tmp', read on directory tmp_dir to ilap;

prompt Conectando a RIMTBD_S1
prompt Password:
connect sys/&&syspass@RIMTBD_S1

create user ilap identified by ilap quota unlimited on users;
grant create session, create table, create synonym, create sequence, create procedure,
	create trigger, create view, create database link, create type,
	create or replace directory tmp_dir as '/tmp', read on directory tmp_dir to ilap;

prompt Conectando a RIMTBD_S2
prompt Password:
connect sys/&&syspass@RIMTBD_S2

create user ilap identified by ilap quota unlimited on users;
grant create session, create table, create synonym, create sequence, create procedure,
	create trigger, create view, create database link, create type,
	create or replace directory tmp_dir as '/tmp', read on directory tmp_dir to ilap;