connect sys/system@ajrgbd_s1 as sysdba
prompt Borrando datos en AJRGBD_S1
drop user ilap cascade;

connect sys/system@ajrgbd_s2 as sysdba
prompt Borrando datos en AJRGBD_S2
drop user ilap cascade;

connect sys/system@rimtbd_s1 as sysdba
prompt Borrando datos en RIMTBD_S1
drop user ilap cascade;

connect sys/system@rimtbd_s2 as sysdba
prompt Borrando datos en RIMTBD_S2
drop user ilap cascade;

exit