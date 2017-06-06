--@Autor: Ivan Moreno/Alan Rodriguez
--@Fecha Creacion:	06/Junio/2017 7:02 AM
--@Descripcion:		Creacion de ligas para comunicacion bidireccional

prompt Creando ligas en AJRGBD_S1

connect ilap/ilap@AJRGBD_S1

-- PDB Local
create database link ajrgbd_s2.fi.unam using 'AJRGBD_S2';

-- PDBs Remotas
create database link rimtbd_s1.fi.unam using 'RIMTBD_S1';
create database link rimtbd_s2.fi.unam using 'RIMTBD_S2';

prompt Creando ligas en AJRGBD_S2

connect ilap/ilap@AJRGBD_S2

-- PDB Local
create database link ajrgbd_s1.fi.unam using 'AJRGBD_S1';

-- PDBs Remotas
create database link rimtbd_s1.fi.unam using 'RIMTBD_S1';
create database link rimtbd_s2.fi.unam using 'RIMTBD_S2';

prompt Creando ligas en RIMTBD_S1

connect ilap/ilap@RIMTBD_S1

-- PDB local
create database link rimtbd_s2.fi.unam using 'RIMTBD_S2';

-- PDBs Remotas
create database link ajrgbd_s1.fi.unam using 'AJRGBD_S1';
create database link ajrgbd_s2.fi.unam using 'AJRGBD_S2';

connect ilap/ilap@RIMTBD_S2

-- PDB local
create database link rimtbd_s1.fi.unam using 'RIMTBD_S1';

--PDBs remotas
create database link ajrgbd_s1.fi.unam using 'AJRGBD_S1';
create database link ajrgbd_s2.fi.unam using 'AJRGBD_S2';

prompt Listirrinin
exit