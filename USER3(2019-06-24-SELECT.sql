-- user3화면입니다.


SELECT * FROM tbl_score;
select * from tbl_student;

--다수의 테이블을 연동해서 셀렉트
select * from tbl_score, tbl_student
WHERE sc_num = st_num;

-- 다수의 테이블을 연동해서 셀렉트
-- 스코어 테이블을 조회하면서
-- 학번에 해당하는 학생 정보를 같이 보여주기
--완전 join은 두 테이블에 where 조건으로 연결하는 칼럼의
--값이 모두 존재할 때 사용할 수 있는 조인
-- 두 테이블이 완전하게 relation 되었을 때만 정상적으로 리스트를 볼 수 있다.


select * from tbl_score
left join tbl student
on tbl_score.sc_num = tbl_student.st_num;

select * from tbl_score SC
left join tbl_student ST
on SC.sc_num = ST.st_num;

-- left join = outter join
-- 왼쪽에 있는 테이블의 데이터는 모두 보여주고
-- 오른쪽에 있는 데이터는 온의 조건에 맞는 데이터면 보여라
-- 만약 없으면 널표시를 하라
select SC.sc_num, SC.sc_subject, SC.sc_score, ST.st_name
from tbl_score sc left join tbl_student ST
on SC.sc_num = ST.st_num;
