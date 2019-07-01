--여기는 관리자 화면입니다.

Create tablespace user6Ts
datafile 'C:/bizwork/Mydb/user6Ts.dbf'
size 100m AUTOEXTEND on next 100k;

create user user6
IDENTIFIED by 1234
default tablespace user6ts;

grant dba to user6;
