prompt Conectando a AJRGBD_S1
connect sys/system@AJRGBD_S1 as sysdba

@s-01-ilap-grants.sql

prompt Conectando a AJRG_S2
connect sys/system@AJRGBD_S2 as sysdba

@s-01-ilap-grants.sql

prompt Conectando a RIMTBD_S1
connect sys/system@RIMTBD_S1 as sysdba

@s-01-ilap-grants.sql

prompt Conectando a RIMTBD_S2
connect sys/system@RIMTBD_S2 as sysdba

@s-01-ilap-grants.sql

prompt Listo
exit