-- 여기는 user4 화면입니다.
drop table tbl_score;
    create table tbl_score(
    sc_seq	NUMBER	primary key,
    sc_date	VARCHAR2(10)		NOT NULL,
    sc_st_num	CHAR(3)		NOT NULL,
    sc_subject	nVARCHAR2(50)		NOT NULL,
    sc_score	NUMBER		
);

--score를 위한 sequence를 생성
-- 시작번호를 100으로 한 이유는
--현재 액셀에 데이터를 입력해서 임포트를 할려고 한다.
-- 액셀에 입력되어 있는 데이터가 일련번호를 21까지 차지하고 있어
-- 이후 인서트를 수행할 때 새로운 번호를 100부터 시작하기 위함이다.

create SEQUENCE seq_score
start with 100
increment by 1;

select * from tbl_score;

--만약 성적 데이터에 포함된 과목명이 변경되는 일이 발생하면
-- 예를들어 국어를 한국어로 바꾸려 한다.

--update tbl_score
--set sc_subject = '한국어'
--where sc_subject = '국어';

--성적테이블과 학생테이블이 분리된 상태
-- 성적 정보를 보면서 학번에 대한 학생이 누구인지
-- 알고 싶으면 join을 실행해서 확인하면 된다.


select sc.sc_date, sc.sc_st_num, st.st_name, st.st_addr, sc.sc_subject, sc.sc_score
from tbl_score SC
left join tbl_student ST
    on sc.sc_st_num = st.st_no;

create table tbl_test
as(
select sc.sc_date, sc.sc_st_num, st.st_name, st.st_addr, sc.sc_subject, sc.sc_score
from tbl_score SC
left join tbl_student ST
    on sc.sc_st_num = st.st_no
);

select * from tbl_test;
--이 테이블의 조용필 학생의 주소가 널인데 주소가 확인이 되어
-- 주소를 입력하려 한다.

update tbl_test
set st_addr = '서울특별시'
where st_name = '조용필';
-- 하지만 이러한 명령을 수행하는 과정에서
--만약 조용필 학생이 동명이인이 있다면
-- 실제 변경하지 말아야 할 데이터는 변경되는 사태가 발생을 한다.
-- 그래서 다수의 레코드를 변경하는 명령은 매우 신중하게 사용해야 한다.

--조용필 학생의 주소를 변경하자
select * from tbl_student;
update tbl_student
set st_addr = '서울특별시'
where st_no = '001';

--데이터 베이스 제2 정규화
-- 성적데이터로 부터 과목정보를 별도로 분리하여
-- 과목 테이블로 생성을 하고
-- 성적을 조회할 때 과목테이블과 조인하여 볼 수 있도록 설정할 예정

--1. 성적데이터로부터 과목정보를 추출

select sc_subject
from tbl_score
group by sc_subject
order by sc_subject;

create table tbl_subject(
    sb_no	CHAR(3)	PRIMARY KEY,
    sb_name	nVARCHAR2(20)		NOT NULL,
    sb_rem	nVARCHAR2(50)		
    );
    
INSERT INTO tbl_subject(sb_no, sb_name, sb_rem)
values('001', '국어', '한국어능력시험');


INSERT INTO tbl_subject(sb_no, sb_name, sb_rem)
values('002', '수학', '고등수학');


INSERT INTO tbl_subject(sb_no, sb_name, sb_rem)
values('003', '영어', '스피킹');

SELECt * from tbl_subject;

select *
from tbl_score SC
    left join tbl_subject SB
    on sc.sc_subject = SB.sb_name; 

-- 4. 점수 테이블에는 과목의 이름만 존재하고 있기 때문에
--      과목의 이름에 해당하는 과목코드를 
--      점수 테이블에 업데이트를 해주어야 한다.
--    가. 과목테이블에 과목코드 칼럼을 하나 추가할것이다.

alter table tbl_score add (sc_sb_no char(3));

--    나. 과목테이블로부터 점수테이블에 있는 과목이름을 참조하여
--      과목 코드를 점수 테이블에 업데이트를 실행


-- A. 먼저 TBL_SCORE 테이블을 펼쳐놓고
-- TBL_SCORE 테이블의 SC_SUBJECT 칼럼의 값을
-- SUB SQL인 SELECT 문에게 보낸다.
-- B. SUB SQL(Query)인 select문은
--      tbl_subject 테이블에서
--      sc_subject(과목명)을 검색하여
--      일치하는 값이 있으면
--      과목코드를 리턴한다.
--c. update 명령은 리턴받은 과목코드를 tbl_score sc_sb_no 칼럼에
-- 업데이트를 실행한다.

update tbl_score sc
set sc.sc_sb_no = 
(select sb_no from tbl_subject sb
where sb.sb_name = sc.sc_subject);

SELECT
    *
FROM tbl_score;

-- tbl_score의 sc_subject 칼럼을 삭제

alter table tbl_score drop COLUMN sc_subject;

--tbl_score 테이블을 제2 정규화를 완료했다.

select *
from tbl_score sc
    left join tbl_subject sb
    on sc.sc_sb_no = sb.sb_no;
    
select * from tbl_subject;


update tbl_subject
set sb_rem = '훈민정음'
where sb_no = '001';

--점수를 확인하면서
-- 과목코드에 대한 과목명도 보고
--학번에 대한 학생이름도 같이보고


select 
sc.sc_date, sc.sc_st_num, st.st_name, st.st_addr,
sc.sc_sb_no, sb.sb_name,
sc.sc_score
from tbl_score sc
    left join tbl_subject sb
    on sc.sc_sb_no = sb.sb_no
    left join tbl_student st
    on sc.sc_st_num = st.st_no;
    
create view viewscore
as(
select
sc.sc_date, sc.sc_st_num, st.st_name, st.st_addr,
sc.sc_sb_no, sb.sb_name,
sc.sc_score
from tbl_score sc
    left join tbl_subject sb
    on sc.sc_sb_no = sb.sb_no
    left join tbl_student st
    on sc.sc_st_num = st.st_no
);

select * from viewscore;
