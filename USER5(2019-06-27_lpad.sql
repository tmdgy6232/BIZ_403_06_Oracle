SELECT
    *
FROM tbl_student;

commit;

select max(st_no) from tbl_student;

--칼럼의 type이 char이고
--칼럼의 데이터들이 숫자일때만 사용가능한 문법

select max(st_no) + 1 from tbl_student;

--현재 tbl_sudent에서 st_no에 가장 마지막 학번 +1의 값으로
--새로운 학번을 생성
select lpad(max(st_no) +1,3,'0') from tbl_student;


--rpad(값, 크기, 문자열)
-- 전체 문자열의 크기를 지정하고, 값을 오른쪽에 위치시키고,
-- 남는부분에 문자열 채우기
select rpad(3,5,'0') from dual;
select lpad(3,5,'a')from dual;


select * from tbl_score;
