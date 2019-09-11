
-- 회원 테이블

DROP TABLE tbl_member;
CREATE TABLE tbl_member(
    userid varchar2(200),
    passwd varchar2(100) not null,
    name varchar2(100) unique not null,
    join_date date default sysdate
);

alter table tbl_member
add constraint pk_member primary key(userid);

INSERT INTO tbl_member(userid, passwd, name)
values('tmdgy6232@nvaer.com', '1234', '사파리제왕');


INSERT INTO tbl_member(userid, passwd, name)
values('gidarimtt@nvaer.com', '1234', 'dioxinn44');


INSERT INTO tbl_member(userid, passwd, name)
values('dbsrud444', '1234', '윤개미');

commit;
drop table tbl_cinema;
create table tbl_cinema(
    bno number ,
    title varchar2(200) not null,
    content varchar2(500) not null,
    starpoint number not null,
    writer varchar2(100) not null,
    regdate varchar2(30) not null
);

create SEQUENCE cinema_seq
start WITH 1
increment by 1;

DESC tbl_cinema;

select * from tbl_cinema;
