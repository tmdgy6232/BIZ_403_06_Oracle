--여기는 유저6화면입니다.

SELECT
    *
FROM tbl_student;

select * from tbl_score;

create table tbl_score(
    SC_SEQ	NUMBER,
    SC_ST_NUM	VARCHAR2(5) not null,
    SC_SUBJECT	NVARCHAR2(3) not null,
    SC_SCORE	NUMBER,
    primary key(sc_seq)
);
drop table tbl_score;

--tbl_stuent와 tbl_score의 참조관계를 설정

--relation ship
alter table tbl_score
add CONSTRAINT f_st_num FOREIGN key (sc_st_num)
REFERENCES tbl_student(st_num)
on delete cascade;

--다중칼럼 유니크설정
-- 학번이 같고 과목번호가 같은값이 2개이상 없도록해라 하는 제[약사항
-- 학번: 00001, 과목 1의 레코드가 있으면 00001, 1의 값은 저장하지 말라
alter table tbl_score
add CONSTRAINT u_st_num_subject UNIQUE (sc_st_num, sc_subject);

INSERT INTO tbl_score(sc_seq, sc_st_num, sc_subject, sc_score)
values( seq_score.nextval, '00001', '1', 90);

select * from tbl_score;
commit;