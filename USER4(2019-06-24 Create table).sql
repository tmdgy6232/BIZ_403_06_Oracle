--user4 화면입니다.

CREATE TABLE tbl_student(
    st_no char(5) primary key,
    st_name nvarchar2(30) not null,
    st_addr  nvarchar2(50),
    st_grade number(1) not null,
    st_height number(3),
    st_weight number(3),
    st_nick nvarchar2(20),
    st_nick_rem nvarchar2(50),
    st_dep_no char(3) not null
);

DROP TABLE tbl_student;

select st_no as 학번, st_name as 이름, st_addr as 주소, st_grade as 학년,
        st_height as 키, st_weight as 몸무게, st_nick as 별명, st_nick_rem as 별명이유, st_dep_no as 학과
        from tbl_student;
        
DROP TABLE tbl_dept;
create table tbl_dept(
    detp_no	CHAR(3)	primary key,
    dep_name	nVARCHAR2(30)		NOT NULL,
    dep_pro	nVARCHAR2(50),
    dep_te	nVARCHAR2(50)
);

select * from tbl_dept;

-- 두 테이블을 left join해서 리스트를 확인
select * from tbl_student;

--DDL 생성 : CREATE
--DDL 삭제 : DROP
--DDL 변경 : ALTER

--칼럼명 변경
ALTER TABLE tbl_student RENAME COLUMN st_dep_no to st_dept_no;

--칼럼의 타입
--원래 존재하는 st_weight 칼럼의 데이터 타입을 변경
--칼럼의 크기를 잘못 변경하면 데이터를 잃게 되기도 한다.
-- char < -- > varchar2까지 변경을 하면
-- where에서 값을 못찾는 경우도 있다.
alter table tbl_student modify(st_weight number(5));

alter table tbl_dept rename COLUMN dep_te to dept_ta; 
alter table tbl_dept rename COLUMN dep_name to dept_name; 
alter table tbl_dept rename COLUMN dep_pro to dept_pro; 


--tbl.student와 tbl_dept를 조인

select * from tbl_student,tbl_dept
where st_dept_no = detp_no;


-- 실제 데이터가 아니고
-- 복잡한 구조의 select 문을 마치 하나의 table 인것처럼 취급하기 위한
-- 데이터 객체
create view view_student
as(
select st.st_no, st.st_name, st.st_addr, st.st_dept_no, dt.dept_name
from tbl_student ST
    left join tbl_dept DT
on ST.st_dept_no = dt.detp_no

);
drop view view_student;
--뷰는 한번 생성을 하면
-- 물리적은 테이블처럼 자유롭게 사용할 수 있다.
select * from view_student;
select * from view_student
where st_name = '조용필';

-- view는 생성한 후 변경(alter)기능이 없다
-- view를 수정하려면 삭제(drop)하고 재생성을 해야한다.

--기존에 존재하는 테이블로부터 데이터 복제
-- 원본테이블에 웨어 조건을 포함하여
-- 조건에 맞는 부분만 복제도 가능하다
-- 데이터를 복제하게 되면 원본데이터에 있는 여러 제약조건이 해제되기도 한다
create table tbl_score
as(
select * from user3.tbl_score
where sc_subject = '국어'
);

--복제된 데이터의 pk가 해제되었기때문에
-- 복제한 데이터에 PK를 재설정하겠다.

ALTER TABLE tbl_score
-- tbl_score 테이블에 sc_seq 칼럼을 primary키로 설정을 하라
-- 이때 이름을 pk로 설정한다.
ADD CONSTRAINT pk PRIMARY KEY(sc_seq);

--pk삭제
alter table tbl_score
drop primary key;

drop table tbl_score;

select * from tbl_score;
