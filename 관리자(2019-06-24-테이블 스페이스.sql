--여기는 관리자 화면입니다.


--user3TS라는 이름으로 TABLESPACE(물리적 저장공간)을 만들어라
-- 파일 저장위치는 C:\bizwork\Mydb/USER3ts.DBF 이름으로 생성하라.
-- 초기 크기는 500MB로 설정하고
-- 공간이 가득차면 100KB 씩 증가시켜라
CREATE TABLESPACE user3TS
DATAFILE 'C:/bizwork/Mydb/user3TS.dbf'
SIZE 500M AUTOEXTEND ON NEXT 100K;

--새로운 사용자를 등록하면서 위에서 생성한 TABLESPACE에 연결
--사용자에게 TABLESPACE를 연결해 줌으로써
--SYS관리자의 물리적 저장공간과 분리하여 데이터를 저장할 수 있게 한다.
CREATE USER user3
IDENTIFIED BY 1234
DEFAULT TABLESPACE user3TS;

GRANT DBA TO user3;


-- 기존에 생성한 user2를 sys공간에서 user3ts공간으로 변경시킨다.
-- 가급적 데이터를 추가하지 않은 상태에서 수행하는것이 좋다.
-- ALTER 키워드는 기존에 생성된 물리적 요소를 변경하는 명령

ALTER USER user2 DEFAULT TABLESPACE user3TS;
