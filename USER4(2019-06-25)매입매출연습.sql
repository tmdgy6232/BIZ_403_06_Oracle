--여기는 user4화면입니다.

-- 전체 리스트 확인
SELECT    *
FROM tbl_iolist;

-- 전체 리스트의 갯수를 확인

select count(*)from tbl_iolist;

--매입, 매출구분하여 갯수확인

select io_inout, count(*) from tbl_iolist
group by io_inout;

--매입합계 매출합계

select io_inout, 
sum(io_total) from tbl_iolist
group by io_inout;

--매입매출 리스트중에서
-- 2018년 10월1일부터 10월 31일까지 데이터만 보고싶다.
-- io_date 칼럼은 varchar2로 설정되어 문자열 데이터를 저장하고 있다.
-- 일반적인 프로그래밍 언어에서는 부등호를 통ㅎ ㅐ 관계연산을 하는것은 숫자형 데이터만 적용이 된다.
-- 하지만 sql에ㅐ서는 저장되는 문자열의 길이가 모두 같고
-- 저장되는 형식이 같으면 부등호 관계연산을 수행할 수 있다.

select * 
from tbl_iolist
where io_date >= '2018-10-01' and io_date <= '2018-10-31'
order by io_date;

select io_pcode
from tbl_iolist
where io_pcode >= 'P00011' and  io_pcode <= 'P00020'
order by io_pcode;


select io_pcode, p.p_name
from tbl_iolist io
    left join tbl_product p
    on p.p_code = io.io_pcode
where io_pcode >= 'P00011' and  io_pcode <= 'P00020'
order by io_pcode;

select io_date, io_pcode
from tbl_iolist
where io_pcode = 'P00011';


--goooooooooooooooooooooo급 sql
-- 매입과 매출을 구분하여 리스트를 출력해보려고 한다.

select io_date, io_inout, io_price, io_total
from tbl_iolist
order by io_date;

select io_date, io_inout, sum(io_total)
from tbl_iolist
group by io_date, io_inout
order by io_date;

select io_inout, DECODE(io_inout, '매입', io_total,0) as 매입금액,
        decode(io_inout, '매출',io_total,0) as 매출금액
        from tbl_iolist
        order by io_date;

-- 상품별로 매입, 매출의 총합을 리스트로 보여달라
-- 상품코드로 묶고, 구분으로 묶어서 집계를 낸 리스트

--상품별 매입매출 합계 리스트
select io_pcode, io_inout, 
sum(DECODE(io_inout, '매입', io_total,0)) as 매입금액,
        sum(decode(io_inout, '매출',io_total,0)) as 매출금액
        from tbl_iolist
        group by io_pcode, io_inout
        order by io_pcode, io_inout;
        
        --일별 매입매출 합계 리스트
select io_date, io_inout, 
sum(DECODE(io_inout, '매입', io_total,0)) as 매입금액,
        sum(decode(io_inout, '매출',io_total,0)) as 매출금액
        from tbl_iolist
        group by io_date, io_inout
        order by io_date, io_inout;
        
        
--문자열이라 가능한 코드
-- 날짜칼럼의 값을 앞에서부터 일곱게 잘라서 연 월만 남기고
-- 년 - 월 - 값으로 그룹을 설정한 후
--매입 매출 집계를 계산한한다.

        select substr(io_date,0,7), io_inout, 
        sum(DECODE(io_inout, '매입', io_total,0)) as 매입금액,
        sum(decode(io_inout, '매출',io_total,0)) as 매출금액,
        
        sum(DECODE(io_inout, '매출', io_total,0)) -
        sum(decode(io_inout, '매입',io_total,0)) as 마진
        from tbl_iolist
        group by substr(io_date,0,7), io_inout
        order by substr(io_date,0,7), io_inout;
        
--마진값
  select substr(io_date,0,7), 
        
        sum(DECODE(io_inout, '매출', io_total,0)) -
        sum(decode(io_inout, '매입',io_total,0)) as 마진
        from tbl_iolist
        group by substr(io_date,0,7)
        order by substr(io_date,0,7);

-- 1년 매입, 매출, 마진계산
  select
        sum(DECODE(io_inout, '매입', io_total,0)) as 매입금액,
        sum(decode(io_inout, '매출',io_total,0)) as 매출금액,
        sum(DECODE(io_inout, '매출', io_total,0)) -
        sum(decode(io_inout, '매입',io_total,0)) as 마진
        from tbl_iolist;

--    3월 한달동안 매입매출 계산
select
        sum(DECODE(io_inout, '매입', io_total,0)) as 매입금액,
        sum(decode(io_inout, '매출',io_total,0)) as 매출금액,
        sum(DECODE(io_inout, '매출', io_total,0)) -
        sum(decode(io_inout, '매입',io_total,0)) as 마진
        from tbl_iolist
        where io_date >= '2018-03-01' and io_date <= '2018-03-31';


select * from tbl_iolist
where io_date >= '2018-03-01' and io_date <= '2018-03-31';

--범위를 지정하여 검색을 할때 두 범위 값이 포함될 경우에는
-- between 키워드를 사용해서 범위검색을 할 수 있다.
select * from tbl_iolist
where io_date between '2018-03-01' and '2018-03-31';

select io_pcode, p.p_name, io_price, io_total
from tbl_iolist io
    left join tbl_product p
    on io.io_pcode = p.p_code;
    

--동일한 칼럼에 포함된 값들이 있는지 검사하는 방버
-- or 연산을 사용하지 않고 in키워드를 사용해서
-- where 조건 검색을 실행할 수 있다.
select io_pcode, p.p_name, io_price, io_total
from tbl_iolist io
    left join tbl_product p
    on io.io_pcode = p.p_code    
where io_pcode in('P00037', 'P00066','P00056');
        
        
select p_code, p_name
from tbl_product;

select p_code, p_name
from tbl_product
where p_name = '(신)알새우칠리새우맛';

--검색조건에서 like 키워드를 사용하고
--문자열 대신 %를 추가하여
--부분 문자열 검색을 실행한다.
-- (신)이 포함된 모든것들.
select p_code, p_name
from tbl_product
where p_name like '(신)%';

-- '(신)%' : 신으로 시작되는 모든 문자열
-- '%(신)' : 신으로 끝나는 모든 문자열
-- '%(신)%' : 신을 포함한 모든 문자열

select p_code, p_name
from tbl_product
where p_name like '%신%';    
    
    
    
    
    
    
    
    