--user6화면입니다.

create table tbl_menu(
menu_id	VARCHAR2(5) primary key,
main_id	VARCHAR2(5),
menu_title	nVARCHAR2(50) not null,
menu_href	nVARCHAR2(50)
);

select * from tbl_menu;

select * from tbl_menu where main_id is null;

select M.menu_id, M.menu_title, S.main_id, S.menu_title
 from tbl_menu M
    left join tbl_menu S
        on M.menu_id = S.main_id
        where main_id is null;

create table tbl_bbs(
bbs_seq	NUMBER	PRIMARY KEY,
bbs_main_seq	NUMBER	,
bbs_layer	NUMBER	,
bbs_date	VARCHAR2(10),	
bbs_time	VARCHAR2(20),	
bbs_auth	nVARCHAR2(50),	
bbs_title	nVARCHAR2(255),	
bbs_content	nVARCHAR2(1000));

create SEQUENCE seq_bbs
start with 1
increment by 1;


commit;
select * from tbl_bbs;

create table tbl_bbs_file(
file_seq	NUMBER	PRIMARY KEY,
file_bbs_seq	NUMBER	,
file_origin_name	nVARCHAR2(1000)	,
file_name	nVARCHAR2(1000)	);

create SEQUENCE seq_bbs_file
start with 1
increment by 1;
delete from tbl_bbs;
commit;
