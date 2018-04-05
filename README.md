# Cobalt-CheckCODB
Used for checking consistency of th CODB database index. Corruption is common on Cobalt, BlueQuartz and early BlueOnyx.

[root@BQ ~]# perl cobalt-codbcheck.pl 
[root@BQ ~]# diff myoids /usr/sausalito/codb/codb.oids 

Should return nothing. If it returns something then myoids can be used in place of codb.oids to make the database consistent (but doesn't confirm any data is correct)
