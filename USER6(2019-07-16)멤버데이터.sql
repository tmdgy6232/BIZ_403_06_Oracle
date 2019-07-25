--user6화면입니다.

create table tbl_member(
m_userid	VARCHAR2(15)	primary key	NOT NULL,
m_password	VARCHAR2(64)		NOT NULL,
m_name	nVARCHAR2(30)		,
m_email	VARCHAR2(25)		NOT NULL,
m_tel	VARCHAR2(20)		,
m_role	VARCHAR2(5)		
);

SELECT
    *
FROM tbl_member;

delete from tbl_member;

commit;