--user6화면

create table tbl_ems(
ems_seq	NUMBER	PRIMARY KEY	,
ems_to_email	VARCHAR2(50)		not null,
ems_from_email	VARCHAR2(50)		not null,
ems_to_name	nVARCHAR2(50)		not null,
ems_from_name	nVARCHAR2(50)		,
ems_send_date	VARCHAR2(10)		not null,
ems_send_time	VARCHAR2(20)		not null,
ems_subject	nVARCHAR2(125)		not null,
ems_content	nVARCHAR2(1000)		not null,
ems_file1	VARCHAR2(64)		,
ems_file2	VARCHAR2(64)		
);

create SEQUENCE seq_ems
start with 1
INCREMENT by 1;