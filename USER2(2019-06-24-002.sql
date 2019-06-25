--여기는 USER2로 접속한 화면입니다.

-- 데이터를 저장하기 위해서 저장공간을 설정
-- java에서 vo개념과 같다.

-- CHAR : 고정길이 문자열
--      저장하는 문자열이 지정된 크기보다 작으면 나머지 부분을
--     빈 공간으로 남겨둔다.
-- VARCHR2 : 가변길이 문자열
--      저장하는 문자열이 지정된 크기보다 작으면
--      나머지 부분을 압축하여 공간을 절약한다.
--      nCHAR, nVARCHAR2 : 다국어(한글, 한자 등)를 저장할때 사용하며
--      지정된 크기는 문자열의 갯수로 나뉜다.

-- NUMBER : 모든 숫자를 통틀어서 사용하는 자료형
-- 크기를 지정하지 않으면 NUMBER(38,22)와 같은 개념이고
-- 정수부 38자리, 유효숫자(소수점이하 ) 22자리까지 저장하는 형태
-- 특별히 값을 지정하지 않으면 가변형으로 저장되어 실제 저장되는 값 만큼만
-- 공간을 차지한다.

CREATE TABLE tbl_student(
    
    st_num CHAR(5),
    st_NAME NVARCHAR2(50),
    st_age NUMBER,
    st_grade NUMBER,
    st_tel VARCHAR2(15)
    
);

--데이터 추가(Create : 명령어 CREATE와는 다른개념
INSERT INTO tbl_student(st_num, st_name, st_age, st_grade, st_tel)
VALUES('00001', '홍길동', 33, 3, '001-001');

--TABLE의 칼럼순서와 데이터의 순서가 같고
--모든 칼럼에 데이터를 추가할 경우는 TABLE이름 뒤의 칼럼 리스트를 생략할 수 있다.
INSERT INTO tbl_student(st_num, st_name, st_age, st_grade, st_tel)
VALUES('00002', '성춘향', 16, 2, '002-002');

--db에서는 가끔 테이블에 초기에는 없던 칼럼을 추가하는 경우가있다.
-- 이때 추가되는 칼럼은 보통 끝에 위치하기는 하지만
-- 정해진 바가 없다.
-- 그래서 insert를 수행할 때
-- 가급적 원하는 순서대로 칼럼리스트를 명시해주는 것이 좋다.
INSERT INTO tbl_student(st_num, st_name, st_age,st_grade,st_tel)
VALUES('00003', '이몽룡', 22, 1, '001-001');

--데이터 확인(Read)
SELECT st_num, st_name, st_age, st_grade, st_tel
from tbl_student;

--칼럼 전체를 모두 포함한 리스트를 보고자 할때는
SELECT * FROM tbl_student;

--만약 학생의 학번, 이름, 전화번호만 리스트로 보고자 할때
SELECT st_num, st_name, st_tel FROM tbl_student;

--칼럼의 순서를 바꾸어서 리스트를 보고자 할때
SELECT st_num, st_tel, st_name FROM tbl_student;

--칼럼 이름을 보고자하는대로 설정할 때 사용하는 명령
-- 오라클에서는 as키워드를 생략해도 된다.
SELECT st_name AS 이름, st_tel AS 전화번호, st_num AS 학번
FROM tbl_student;

