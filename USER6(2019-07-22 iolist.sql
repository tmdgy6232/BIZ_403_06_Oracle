--user6

SELECT
    *
FROM tbl_iolist;

delete from tbl_product;


commit;

create table tbl_comp(
c_code	VARCHAR(5)	PRIMARY KEY	,
c_name	nVARCHAR2(50)		NOT NULL,
c_ceo	nVARCHAR2(50)		NOT NULL,
c_tel	VARCHAR(20)		,
c_addr	NVARCHAR2(255)		
);

select * from tbl_comp;
select * from tbl_member;

delete from tbl_member;
update tbl_product set p_iprice =0, p_oprice=0;
commit;

