--여기는 USER3 화면입니다.

CREATE TABLE tbl_score(

    sc_seq NUMBER PRIMARY Key,  
    --auto increment : 다른 DBMS에서는 INSERT를 수행할 때 칼럼의 값을 자동으로  
    -- 넘버링 해주는 옵션, 오라클 11이하에서는 사용 불가
    -- 오라클 12이상에서는 사용가능
    sc_num CHAR(5) NOT NULL,
    sc_subject nVARCHAR2(10),
    sc_score NUMBER
    );
    

-- 오라클 11 이하에서는 자동증가 옵션이 없는 관계로
-- 별도의 넘버링용 요소(객체)를 사용해서 자동 증가 효과를 만든다.
INSERT INTO tbl_score(sc_seq, sc_num, sc_subject, sc_score)
VALUES(1,'00001', '국어', 90);

INSERT INTO tbl_score(sc_seq, sc_num, sc_subject, sc_score)
VALUES(2,'00001', '영어', 80);    

INSERT INTO tbl_score(sc_seq, sc_num, sc_subject, sc_score)
VALUES(3,'00001', '수학', 70);

select*from tbl_score;


--오라클에서 자동 증가되는 넘버링 값을 얻기위해서
-- 생성하는 객체
CREATE SEQUENCE seq_score
START WITH 1 --시작값
INCREMENT BY 1; -- 증가값

SELECT seq_score.NEXTVAL FROM DUAL;

INSERT INTO tbl_score(sc_seq, sc_num, sc_subject, sc_score)
values(SEQ_SCORE.NEXTVAL,'00002','국어', 88);

INSERT INTO tbl_score(sc_seq, sc_num, sc_subject, sc_score)
values(SEQ_SCORE.NEXTVAL,'00002','영어', 77);

INSERT INTO tbl_score(sc_seq, sc_num, sc_subject, sc_score)
values(SEQ_SCORE.NEXTVAL,'00002','수학', 98);

SELECT
    *
FROM TBL_SCORE;

UPDATE tbl_score
set sc_score = 100
where sc_seq = 12;

--만약 sc_seq 칼럼이 없다면
UPDAte TBL_SCORE
SET sc_score = 100
where sc_num = '00002' and sc_subject = '수학';

--여러 칼럼에 조건을 설정ㅎ아ㅕ
-- 업데이트나 델리트는 가급적 사용하지 않는것이 좋다.

UPDATE sc_score
set sc_subject = '미술'
where sc_subject - '수학';

-- 업데이트나 인서트, 델리트는 수행하여도
-- 실제로 물리적 테이블에 데이터가 저장되지 않는다.
-- 그래서 데이터를 강제로 물리적 테이블에 저장해줄 피룡가 있다.

COMMIT;
--ROLLBACK과 반대되는 개념

--user2와 user3에는 모두 dba 권한을 가지고있다.
-- 만약 user2가 dba가 아닌 제한된 권한을 가진 사용자라면
-- 다른 스키마에 있는 테이블은 조회가 불가능하다.
-- 내 스키마에 있는 테이블을 다른 사용자가 조회할 수 있도록 
-- 권한을 열어 주어야한다.

-- 내 스키마에 있는 tbl_score table을 user2가 조회할 수 있도록
-- 권한을 열어준다.

grant select on tbl_score to user2;
-- 내 tbl_score 테이블에 유저2가 데이터를 추가할 수 있다.

grant insert on tbl_score to user2;
grant delete on tbl_score to user2;
grant update on tbl_score to user2;

grant insert, delete, update, select on tbl_score;

--전체 부여한 권한 조회
select * from dba_sys_privs order by grantee;
-- 현재 사용자에게 부여된 권환 조회
select * from user_sys_privs;
--현재 사용자가 다른사용자에게 부여한 권한 조회
select * from user_tab_privs;

select * from  dba_tab_privs;

INSERT INTO tbl_score(sc_seq, sc_num, sc_subject, sc_score)
values(SEQ_SCORE.NEXTVAL,'00003','국어', 78);

INSERT INTO tbl_score(sc_seq, sc_num, sc_subject, sc_score)
values(SEQ_SCORE.NEXTVAL,'00003','영어', 97);

INSERT INTO tbl_score(sc_seq, sc_num, sc_subject, sc_score)
values(SEQ_SCORE.NEXTVAL,'00003','수학', 68);

SELECT * FROM tbl_score;

--insert, updatem, delete된 데이터를 되돌리는 기능
-- 취소와 비슷한 개념이며
-- 가장 최근에 commit 된 이후의 명령수행을 취소하는 역할을 함
--도는 가장 최근에  create 명령을 수행한 이후의 명령수행(cud)을 취소하는 역할
rollback;

select * from tbl_score;