-- 이곳은 관리자 화면입니다.

-- C:\bizwork\Mydb 폴더에 user5TS 이름으로 테이블스페이스를 생성하고
-- 초기 크기는 500MB, 자동증가 100KB

-- USER5 사용자를 생성
--DBA로 권한을 부여
-- 유저 5 접속정보를 설정하고
--유저 5 질의작성기 창을 열어서

--STUDENT  액셀 파일을 참조하여 학생 테이블을 생성하고
-- 액셀 데이터를 임포트 수행

CREATE TABLESPACE user5TS
DATAFILE 'C:/bizwork/Mydb/user5TS.dbf'
SIZE 500M AUTOEXTEND ON NEXT 100K;

CREATE USER USER5
IDENTIFIED BY 1234
DEFAULT TABLESPACE user5TS;

grant dba to user5;
