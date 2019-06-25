-- 관리자 화면입니다.
-- C:\bizwork\Mydb 폴더에 user4TS 이름으로 테이블 스페이스를 생성하고
-- 이름 : user4TS, 데이터파일 user$TS.dbf
-- 크기 : 500mb, 자동증가 100kb


CREATE TABLESPACE user4TS
DATAFILE 'C:/bizwork/Mydb/user4TS.dbf'
SIZE 500M AUTOEXTEND ON NEXT 100K;

create USER user4
IDENTIFIED by 1234
default tablespace user4TS;

grant dba to user4;