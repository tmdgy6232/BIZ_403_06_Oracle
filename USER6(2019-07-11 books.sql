-- user6번 화면입니다.

--도서정보를 저장할 테이블을 생성하겠습니다.

create table tbl_books(
    b_seq number primary key,
    b_title nvarchar2(50),
    b_comp nvarchar2(100),
    b_aute nvarchar2(50),
    b_price number
    );
    
--seq생성

create SEQUENCE seq_book
START with 1
INCREMENT by 1;

select * from tbl_books;

insert into tbl_books(b_seq, b_title, b_comp, b_aute, b_price)
values(seq_book.NEXTVAL, '모바일 웹','생능출판사','박성진',33000);


insert into tbl_books(b_seq, b_title, b_comp, b_aute, b_price)
values(seq_book.NEXTVAL, '오라클sql','길벗','홍형경',23000);


insert into tbl_books(b_seq, b_title, b_comp, b_aute, b_price)
values(seq_book.NEXTVAL, '열혈자바','몰라','몰라',13000);

commit;