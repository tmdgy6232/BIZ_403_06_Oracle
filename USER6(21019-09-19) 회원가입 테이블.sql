
select * from tbl_member;

-- 회원관련 테이블

DROP TABLE tbl_member;

CREATE TABLE tbl_member(
    userid VARCHAR2(60),
    passwd VARCHAR2(60) NOT NULL,
    name VARCHAR2(30) NOT NULL,
    mobile VARCHAR2(30) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    zipcode VARCHAR2(20) NOT NULL,
    addr1 VARCHAR2(200) NOT NULL,
    addr2 VARCHAR2(200) NOT NULL,
    regdate DATE DEFAULT SYSDATE
    );
INSERT INTO tbl_member(userid, passwd, name, mobile, email, zipcode, addr1, addr2)
values('tmdgy6232', '1234', '사파리제왕', '01075200858', 'tmdgy6232@naver.com', '537-852', '전라남도 완도군 보길면 정동리', '125번지');

select * from tbl_member;
commit;