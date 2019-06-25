--여기는 유저4화면입니다.
DROP TABLE tbl_iolist;
CREATE table tbl_iolist(
    io_seq	NUMBER	primary key,
    io_date	VARCHAR2(10) NOT NULL,
    io_product	NVARCHAR2(50)NOT NULL,
    io_dept	nVARCHAR2(50)NOT NULL,
    io_dept_ceo	nVARCHAR2(30),
    io_inout	nVARCHAR2(10) NOT NULL,
    io_amt	NUMBER,
    io_price	NUMBER,	
    io_total	NUMBER		
);

select * from tbl_iolist;
select count(*) from tbl_iolist;

select io_inout, count(*) from tbl_iolist
group by io_inout;

-- tbl_iolist 테이블의 제2 정규화 작업을 진행
-- 상품정보를 tbl_iolist로부터 분리해서 상품테이블로 생성하기
-- 상품 이름 중 1개씩만 골라서 리스트로 추출

select io_product 
from tbl_iolist
GROUP by io_product
order by io_product;

-- 상품테이블 생성
drop table tbl_product;
CREATE TABLE tbl_product(
p_code	VARCHAR2(7) primary key,
p_name	Nvarchar2(50)		NOT NULL,
p_iprice	NUMBER		,
p_oprice	NUMBER		
);

select * from tbl_product;

--거래처 정보 분리를 위해서
-- tbl_iolist에서 거래처 정보를 분리하는 작업
select io_dept, io_dept_ceo
from tbl_iolist
group by io_dept, io_dept_ceo
order by io_dept;

create table tbl_comp (
c_code	VARCHAR2(5)	primary key,
c_name	Nvarchar2(50)		NOT NULL,
c_ceo	Nvarchar2(50)		NOT NULL,
c_tel VARCHAR2(15),

c_addr	Nvarchar2(150)

);

select COUNT(*) FROM tbl_comp;

--상품코드와 거래처코드를 추가하기위한 칼럼 추가
alter table tbl_iolist add io_pcode varchar2(7);
alter table tbl_iolist add io_ccode varchar2(5);

-- 상품정보에서 상품코드를 가져와서 iolist 테이블에 업데이트해라
update tbl_iolist io
set io_pcode =
 (
 select P.p_code from tbl_product P
 where p.p_name = io.io_product
 );
 
 --거래처 정보에서 거래처 코드를 가져와서 io리스트 테이블에 업데이트
 update tbl_iolist io
set io_ccode =
 (
 select c.c_code from tbl_comp c
 where c.c_name = io.io_dept and
 c.c_code = io.io_dept_ceo
 );
 
 alter table tbl_iolist drop COLUMN io_product;
alter table tbl_iolist drop COLUMN io_dept;
alter table tbl_iolist drop COLUMN io_dept_ceo;

-- 제2정규화 완ㅇ료

SELECT
    *
FROM tbl_iolist;
 
