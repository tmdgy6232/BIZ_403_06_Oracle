

select * from tbl_reply;


		delete from tbl_reply
		where bno = 364
		and rno = 21;
        commit;
        
        select * from tbl_member;
        
        DESC tbl_reply;
        
        select * from tbl_board
        order by bno DESC;
        
        update tbl_board
        set replycnt = replycnt+1
        where bno = 364;
        update tbl_board set replycnt = replycnt+1 where bno = 364 ;
        commit;
        
        truncate table tbl_reply;
        update tbl_board
        set replycnt =0;
        commit;
        select replycnt from tbl_board;
        
        update tbl_board
        set viewcnt = viewcnt +1
        where bno = 364;
        
        select * from tbl_board;
        
        INSERT INTO tbl_board(bno, content, writer, title)
	values(seq_board.nextval, '하하하', '하하', '하하');
        