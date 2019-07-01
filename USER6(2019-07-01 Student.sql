--USER6 화면입니다.

create table tbl_student(
    st_num varchar2(5) PRIMARY key,
    st_name nvarchar2(50) not null,
    st_tel varchar2(20),
    st_grade number
    );
    

insert into tbl_student(st_num, st_name, st_tel, st_grade)
values('00001','홍길동','001',3);

insert into tbl_student(st_num, st_name, st_tel, st_grade)
values('00002','성춘향','011',2);

insert into tbl_student(st_num, st_name, st_tel, st_grade)
values('00003','이몽룡','111',4);

insert into tbl_student(st_num, st_name, st_tel, st_grade)
values('00004','임꺽정','002',1);

insert into tbl_student(st_num, st_name, st_tel, st_grade)
values('00005','장녹수','022',3);
commit;

create table tbl_score(
    sc_seq number primary key,
    sc_st_num varchar2(5) not null,
    sc_subject nvarchar2(20) not null,
    sc_score number
    );
    
    create sequence seq_score
    start with 1
    increment by 1;
    
    insert into tbl_score(sc_seq, sc_st_num, sc_subject, sc_score)
    values(seq_score.nextval, '00001', '국어',90);
    
    select * from tbl_student;
    
    commit;
    
    select * from tbl_student;
