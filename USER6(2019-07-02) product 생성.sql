--USER6화면입니다.

CREATE TABLE TBL_PRODUCT(
p_code	VARCHAR2(7)	PRIMARY KEY,	
p_name	Nvarchar2(50)	NOT NULL,
p_iprice	NUMBER		,
p_oprice	NUMBER		
);

insert into tbl_product(p_code, p_name, p_iprice, p_oprice)
values ('P000001', '초코초코땅땅', 50000, 5000);

commit;