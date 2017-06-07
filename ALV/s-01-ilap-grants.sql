create user ilap identified by ilap quota unlimited on users;
grant create session to ilap;
grant create table to ilap;
grant create synonym to ilap;
grant create sequence to ilap;
grant create procedure to ilap;
grant create trigger to ilap;
grant create view to ilap; 
grant create database link to ilap;
grant create type to ilap;
create or replace directory tmp_dir as '/tmp';
grant read on directory tmp_dir to ilap;
	
prompt Grants listos.
