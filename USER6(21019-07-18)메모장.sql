-- 여기는 유저6화면입니다.
drop table tbl_memo;
create table tbl_memo(
    mo_seq	NUMBER	PRIMARY KEY	NOT NULL,
mo_date	VARCHAR2(50)		NOT NULL,
mo_time varchar2(50) not null,
mo_auth	nVARCHAR2(50)		,
mo_subject	nVARCHAR2(125)	,	
mo_memo	nVARCHAR2(1000)		,
mo_file nvarchar2(1000));


select * from tbl_memo;

--옿라클랜덤값을 불러오는 코드 
select round(dbms_random.value(0,9999999999),0) from dual;
commit;