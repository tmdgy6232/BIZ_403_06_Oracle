-- 댓글 테이블 생성

DROP SEQUENCE seq_reply;
CREATE SEQUENCE seq_reply
START WITH 1
INCREMENT BY 1;

DROP TABLE tbl_reply;
CREATE TABLE tbl_reply(
    rno NUMBER,
    content VARCHAR2(2000) NOT NULL,
    writer VARCHAR2(30) NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    bno NUMBER NOT NULL
    );
    
ALTER TABLE tbl_reply
ADD CONSTRAINT pk_reply PRIMARY KEY(rno);

ALTER TABLE tbl_reply
ADD CONSTRAINT fk_reply_bno
FOREIGN KEY(bno) REFERENCES tbl_board(bno)
ON DELETE CASCADE;

TRUNCATE TABLE tbl_reply;
INSERT INTO tbl_reply(rno, content, writer, bno)
values(seq_reply.NEXTVAL, '가즈아아아', '사파리제왕',366);
INSERT INTO tbl_reply(rno, content, writer, bno)
values(seq_reply.NEXTVAL, '이거왜봄', '사자',366);
INSERT INTO tbl_reply(rno, content, writer, bno)
values(seq_reply.NEXTVAL, '인생재밌따', '호랭이',366);
INSERT INTO tbl_reply(rno, content, writer, bno)
values(seq_reply.NEXTVAL, '댓글도배', '사파리제왕',365);
INSERT INTO tbl_reply(rno, content, writer, bno)
values(seq_reply.NEXTVAL, '알바냐', '사자',365);
INSERT INTO tbl_reply(rno, content, writer, bno)
values(seq_reply.NEXTVAL, '알바ㅇ요요요요', '호랭이',365);
INSERT INTO tbl_reply(rno, content, writer, bno)
values(seq_reply.NEXTVAL, '배고파', '호랭이',364);
INSERT INTO tbl_reply(rno, content, writer, bno)
values(seq_reply.NEXTVAL, '밥시간', '사자',364);
INSERT INTO tbl_reply(rno, content, writer, bno)
values(seq_reply.NEXTVAL, '언제와', '사파리제왕',364);

INSERT INTO tbl_reply(rno, content, writer, bno)
values(seq_reply.NEXTVAL, '얼른가즈아아아', '사파리제왕',364);


INSERT INTO tbl_reply(rno, content, writer, bno)
values(seq_reply.NEXTVAL, '화이트캬라멜', '사파리제왕',364);


commit;
DESC tbl_reply;
select * from tbl_reply
order by rno DESC;