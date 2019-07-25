--user6화면입니다.
DROP TABLE TBL_IOLIST;
create table tbl_iolist(
io_seq	NUMBER	PRIMARY KEY,
	io_date	VARCHAR(10)		NOT NULL,
	io_pcode	nVARCHAR2(5)		NOT NULL,
	io_ccode	nVARCHAR2(5)		NOT NULL,
	io_inout	VARCHAR2(1)		NOT NULL,
	io_qty	NUMBER		,
	io_price	NUMBER		,
	io_total	NUMBER		
	);

create SEQUENCE seq_iolist
start with 1
INCREMENT by 1;

drop SEQUENCE seq_iolist;
select * from tbl_iolist;

commit;