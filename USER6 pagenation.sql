
-- 커뮤니티에서 사용할 테이블 생성

create table tbl_board(
    bno number ,
    title varchar2(200) not null,
    content varchar2(4000) not null,
    writer varchar2(30) not null,
    viewcnt number DEFAULT 0,
    replycnt number DEFAULT 0,
    regdate date DEFAULT sysdate
);

drop table tbl_board;

alter table tbl_board
add CONSTRAINT tbl_board_pk_bno primary key(bno);

--커뮤니티에서 사용할 시퀀스 생성
drop SEQUENCE seq_board;
create SEQUENCE seq_board
start with 1
INCREMENT by 1;

--커뮤니티에 더미데이터 입력
insert into tbl_board(bno, title, content, writer)
values(seq_board.NEXTVAL, '안녕하세요', '하이헬로우방가방가', '임승효');

insert into tbl_board(bno, title, content, writer)
values(seq_board.NEXTVAL, '안녕하세요2', '하이헬로우방가방가', '임승효');

insert into tbl_board(bno, title, content, writer)
values(seq_board.NEXTVAL, '안녕하세요3', '하이헬로우방가방가', '임승효');

insert into tbl_board(bno, title, content, writer)
values(seq_board.NEXTVAL, '안녕하세요4', '하이헬로우방가방가', '임승효');

insert into tbl_board(bno, title, content, writer)
values(seq_board.NEXTVAL, '안녕하세요5', '하이헬로우방가방가', '임승효');

insert into tbl_board(bno, title, content, writer)
values(seq_board.NEXTVAL, '안녕하세요6', '하이헬로우방가방가', '임승효');

insert into tbl_board(bno, title, content, writer)
values(seq_board.NEXTVAL, '안녕하세요7', '하이헬로우방가방가', '임승효');

insert into tbl_board(bno, title, content, writer)
values(seq_board.NEXTVAL, '안녕하세요8', '하이헬로우방가방가', '임승효');

insert into tbl_board(bno, title, content, writer)
values(seq_board.NEXTVAL, '안녕하세요9', '하이헬로우방가방가', '임승효');

insert into tbl_board(bno, title, content, writer)
values(seq_board.NEXTVAL, '안녕하세요10', '하이헬로우방가방가', '임승효');

SELECT * FROM tbl_board
	  WHERE bno = 1;

select * 
from tbl_board;

select * 
from tbl_board
order by bno DESC;

select count(*)
from tbl_board;

DESC tbl_board;
select * from(select rownum AS rnum, A.* from( SELECT * FROM tbl_board ORDER BY bno DESC )A 
)where rnum between 1 and 10 ;
commit;

insert into tbl_board(bno, title, content, writer)
values(seq_board.NEXTVAL, '안녕하세요10', '날짜포맷팅테스트', '홍길동');

select * 
from(select rownum AS rnum, A.* 
    from( SELECT * 
        FROM tbl_board
        WHERE writer LIKE '%%' 
        OR title LIKE '%%' 
        OR content LIKE '%%' ORDER BY bno DESC )A )
        where rnum between 1 and 10 