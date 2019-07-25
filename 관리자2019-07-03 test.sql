--관리자 화면
--데이터를 저장할 때 물리적인 저장공간을 설정하는데
--TABLESPACE 

CREATE TABLESPACE testTS
DATAFILE 'test.TS'
size 100m AUTOEXTEND 100k;