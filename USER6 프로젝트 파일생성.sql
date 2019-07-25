--user6화면입니다.

create table tbl_notice(
n_seq	NUMBER	PRIMARY KEY	NOT NULL,
n_subject	nVARCHAR2(100)		,
n_date	VARCHAR2(10)		NOT NULL,
n_writer	nVARCHAR2(50)		,
n_substance	nVARCHAR2(1000)		
);
create SEQUENCE SEQ_N
start with 1
increment by 1;

drop table tbl_acomment;
create table tbl_acomment(
a_seq	NUMBER	PRIMARY KEY	NOT NULL,
a_subject	nVARCHAR2(100)		,
a_date	VARCHAR2(10)		NOT NULL,
a_writer	nVARCHAR2(50)		,
a_substance	nVARCHAR2(1000)		);
create SEQUENCE SEQ_A
start with 1
increment by 1;

drop table tbl_tip;
create table tbl_tip(
t_seq	NUMBER	PRIMARY KEY	NOT NULL,
t_subject	nVARCHAR2(100)		,
t_date	VARCHAR2(10)		NOT NULL,
t_writer	nVARCHAR2(50)		,
t_substance	nVARCHAR2(1000)		);
create SEQUENCE SEQ_T
start with 1
increment by 1;

create table tbl_user(
u_gender	VARCHAR2(10)		NOT NULL,
u_age	VARCHAR2(3)		NOT NULL,
u_height	VARCHAR2(2)		NOT NULL,
u_weight	VARCHAR2(3)		NOT NULL,
u_kcal	NUMBER		NOT NULL);

create table tbl_yester(
m_morning	nVARCHAR2(100),
m_afternoon	nVARCHAR2(100),
m_evening	nVARCHAR2(100)
);

drop table tbl_food;
create table tbl_food(
f_seq	NUMBER	PRIMARY KEY	NOT NULL,
f_foodname	nVARCHAR2(100)		NOT NULL,
f_nutrient	nVARCHAR2(300)		NOT NULL,
f_kcal	NUMBER		NOT NULL
);
create SEQUENCE SEQ_F
start with 1
increment by 1;







