-- 여기는 USER5화면입니다.
drop table tbl_student;
CREATE TABLE tbl_student(
st_no	CHAR(3)	primary key,
st_name	nVARCHAR2(30)		NOT NULL,
st_addr	nVARCHAR2(50)		,
st_grade	NUMBER(1)		NOT NULL,
st_height	NUMBER(3)		,
st_weight	NUMBER(3)		,
st_nick	nVARCHAR2(20)		,
st_nick_rem	nVARCHAR2(50)	,	
st_dept_name	nVARCHAR2(20)		NOT NULL

);

select * from tbl_student;

create table tbl_score(
sc_seq	NUMBER	primary key,
sc_date	VARCHAR2(10)	,
sc_st_num	CHAR(3)	,
sc_subject	nVARCHAR2(50)	,
sc_score	NUMBER	
);

select * from tbl_score;

select sc_date, sc_st_num,
sum(decode(sc_subject, '국어',sc_score,0)) as 국어,
sum(decode(sc_subject, '영어',sc_score,0)) as 영어,
sum(decode(sc_subject, '수학',sc_score,0)) as 수학
from tbl_score
group by sc_date, sc_st_num;