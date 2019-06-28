--user5 화면입니다.

--매우 위험한 명령
--DDL 명령인데
-- DROP AND CREATE
--tbl_sudent의 테이블을 새 테이블로 다시 만들겠다.


TRUNCATE TABLE tbl_student;
TRUNCATE TABLE tbl_score;

--DDL 명령 FOREIG KEY(외례키)
-- 두 테이블에 연관 제약사항을 만드는 방법

--참조 무결성 조건
--학생과 성적을 입력하는데
--학생에 없는 학번은 절대 성적에 입력할 수 없도록 방지하여 (오류메세지 발생)
--학생에 없는 학번을 성적에 입력하는 실수를 방지하는 방법


alter table tbl_score -- child
add constraint f_no FOREIGN key (sc_st_num)
REFERENCES tbl_student(st_no); --parents

--001학생의 국어점수를 추가하려고 시도.
--f_no 제약사항에 위배된다.
INSERT into tbl_score(sc_seq, sc_date, sc_st_num, sc_subject, sc_score)
VALUES(1, '2019-06-28', '001', '국어', 90);

--그래서 먼저 학생 데이터를 추가한다.
insert into tbl_student(st_no, st_name, st_grade, st_dept_name)
values('001', '홍길동',3,'컴공과');

INSERT into tbl_score(sc_seq, sc_date, sc_st_num, sc_subject, sc_score)
VALUES(2, '2019-06-28', '002', '국어', 90);

--참조 무결성
-- 두개의 테이블이 아래와 같을때
--tbl_student : parents     tbl_score : child

alter table tbl_score -- child
add constraint f_no FOREIGN key (sc_st_num)
REFERENCES tbl_student(st_no); --parents
--tbl_student : parents     tbl_score : child
--값이 있으면        >>        있을수도있다.
-- 값이 없으면       >>     절대 없다, 절대 있을 수 없다.
-- 반드시 존재       <<          있으면
-- child값이 존재하면 parents는 삭제할 수 없다. " 일반규칙


--두 개의 테이블을 FOREIGN KEY로 연결하려면
--1. 연결하고자 하는 칼럼의 타입과 크기가 같아야한다.
-- 2. PARENTS에ㅐ 있는 칼럼은 PK이거나 UNIQUE이어야 한다.

select * from tbl_student;
delete from tbl_student
where st_no='001';

--tbl_score의 foreign key 삭제

alter table tbl_score
drop CONSTRAINT f_no;

alter table tbl_score
add CONSTRAINT f_no FOREIGN key (sc_st_num)
REFERENCES tbl_student(st_no)
--부모 데이터를 삭제하려고 시도하면
--자식 데이터에 해당하는 키값이 존재하면
--같이지워라
on delete cascade ; 


--EQ join
--참조 무결성이 보장될 때는 완벽한 리스트를 보장
-- 완벽한 리스트 : 두 테이블간에 연결값이 반드시 존재하는 형태
SELECT
    *
FROM tbl_score, tbl_student
where sc_st_num = st_no;

select * from tbl_score;
delete from tbl_student
where st_no='001';

select * from tbl_student;


delete from tbl_student
where st_NO ='1';

INSERT INTO tbl_student(ST_NO, st_name, st_grade, st_dept_name)
values('001','임승효',3,'컴퓨터공학과');

delete from tbl_student;

alter table tbl_score
drop CONSTRAINT f_no;

alter table tbl_student modify st_no VARCHAR2(3);
alter table tbl_score modify sc_st_num varchar2(3);

DESC tbl_student;
desc tbl_score;

alter table tbl_score -- child
add constraint f_no foreign key (sc_st_num) -- child 테이블 칼럼 fk
references tbl_student(st_no) -- parant table
on delete cascade;


select * from tbl_score;

insert into tbl_score(sc_seq, sc_date, sc_subject, sc_score,sc_st_num)
values(1,'2019-06-28','사회과학',99,'001');
commit;

delete from tbl_score;
commit;

SELECT sc_seq.NEXTVAL FROM DUAL;

