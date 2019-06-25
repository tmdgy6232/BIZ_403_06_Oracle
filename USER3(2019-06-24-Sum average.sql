--user3입니다.

--tbl score에 저장된 레코드의 개수가 몇개?
select count(*) from tbl_score;

-- 조건에 맞는 레코드가 몇개?
select count(*) from tbl_score
where sc_num = '00001';

--합계를 계산하는 집계함수
-- 일반적으로 number로 되어있는 칼럼에서만 유효

select sum(sc_score)
from tbl_score;

--각 학생별로 3과목의 합계가 얼마인지 알고싶다

select sc_num, sum(sc_score) -- 2. 그룹으로 묶인 레코드들만의 점수 합계가 얼마냐 ?
from tbl_score
GROUP by sc_num;
--1. 학번으로 전체 데이터를 그룹지어라


--round : 반올림 함수
--round() : 소숫점 이하 1자리 반올림 후 정수로 표시
--round(값, 자릿수) : 자릿수 +1의 자리에서 반올림하고 자릿수까지 표시
select sc_num, round(avg(sc_score),2)
from tbl_score
GROUP by sc_num;

--최대값
select max(sc_score)
from tbl_score;

--최소값
select min(sc_score)
from tbl_score;

--중복값 배제하고 보여주기
select distinct sc_num
from tbl_score;

select sc_num, sum(sc_score)
from tbl_score
group by sc_num;

--과목(sc_subject)칼럼을 기준으로 오름차순 정렬하라
select sc_num, sc_subject, sc_score
from tbl_score
order by sc_subject;

--학번으로 정렬을 수행하고
-- 같은 학번이 있으면 그 내부에서 과목으로 다시 정렬하라.
select * from tbl_score
order by sc_num, sc_subject;

-- asc : 어센딩, 오름차순 정렬
select * from tbl_score
order by sc_num asc, sc_subject asc;

--desc : 디센딩, 내림차순 정렬
select * from tbl_score
order by sc_num desc, sc_subject desc;

--학번으로 내림차순 정렬하고, 그 내부에서ㅕ 과목으로 오름차순 정렬하라.
select * from tbl_score
order by sc_num desc, sc_subject asc;

--group by를 실행한 후  sum을 계산하고
-- 그 결과가 240보다 큰 리스트만 보여라
select sc_num, sum(sc_score)
from tbl_score
GROUP by sc_num
having sum(sc_score) > 240;

--과목이 국어인 리스트를 추출하여
--group by를 실행하고
--점수를 합산하고
-- 합산한 점수가 230보다 큰 리스트만 보여라
select sc_num, sum(sc_score) --3
from tbl_score 
where sc_subject = '국어' --1
GROUP by sc_num --2
having sum(sc_score) > 240; --4
