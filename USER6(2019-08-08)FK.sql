--user6

alter table tbl_bbs_file -- n개의 레코드가 있는 테이블
add constraint fk_bbs_file -- 임의의 이름
foreign key (file_bbs_seq)  -- 서로 연관(fk)로 설정할 칼럼
references tbl_bbs(bbs_seq) -- 1개의 레코드가 있는 테이블
on delete cascade;
--ON DELETE CASCADE
--만약 TBL_BBS의 어떤 레코드를 삭제했을 때
-- 해당 값의 리스트를 TBL_BBS_FILE에 가지고 있으면
-- 몽땅 지워라

SELECT * FROM TBL_BBS;
select * from tbl_bbs_file;
