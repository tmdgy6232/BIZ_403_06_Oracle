-- 관리자 화면입니다.
--관리자 (DBA)가 사용하는 명령어
-- 물리적 객체를 사용하는 명령 : CREATE로 시작

-- 사용자를 생성
--보통 DDL 명령중에서 표준 SQL에서 가장 많이 사용하는 명령
--사용자란 : DBMS에 접속하여(Connection)하여 sql문을 실행할 수 있는 id
-- 오라클에서의 사용자 : DB Schema 개념으로 table들을 포함하는 저장소 개념

--오라클에서 사용자를 등록하는 명령문
CREATE USER biz  -- 사용자 아이디
IDENTIFIED BY 1234; -- 사용자 비밀번호

--DCL명령어인 GRANT 명령을 수행해서
--biz라는 사용자에게 CREATE SESSION이라는 권한을 부여했다.
--그러므로 해서 BIZ라는 사용자는
-- 오라클에 연결(접속)할 수 있게되고, 의미는 없지만 최소한 SELECT 명령을
-- 수행해 볼 수 있도록 되었다
-- 즉, DB에 간접적인 어떤 영향을 미치도록 하는 명령어들 이런 명령을 DCL이라 한다.


GRANT CREATE SESSION TO biz;

-- GRANT 명령은 사용자에게 DBSQL을 문을 사용할 수 있는 등급(권한)을 부여하는 명령
-- 아래 GRANT DBA TO BIZ는 BIZ사용자에게 관리자 권한에 살짝 못미치는
-- 막대한 권한을 부여한다.
-- GRANT DBA TO biz;
GRANT CREATE TABLE TO biz;

REVOKE CREATE SESSION FROM biz;