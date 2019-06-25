--user4 화면입니다

-- 월별로 매입, 매출, 마진을 확인하는 쿼리

select substr(io_date,0,7), -- 년 - 월로 추출
    sum(decode(io_inout, '매입', io_total,0))as 매입합계,
    sum(decode(io_inout, '매출', io_total,0)) as 매출합계,
    
    sum(decode(io_inout, '매출', io_total,0)) -
    sum(decode(io_inout, '매입', io_total,0)) as 마진
    
    from tbl_iolist
    group by subStr(io_date,0,7)
    
    union
    
    select '=====', 00000, 00000, 00000 from dual
    
    union
    
    select 
    '총계',-- 년 - 월로 추출
    sum(decode(io_inout, '매입', io_total,0))as 매입합계,
    sum(decode(io_inout, '매출', io_total,0)) as 매출합계,
    
    sum(decode(io_inout, '매출', io_total,0)) -
    sum(decode(io_inout, '매입', io_total,0)) as 마진
    
    from tbl_iolist;