--user3 화면입니다.

SELECT * FROM tbl_score;
SELECT
    *
FROM tbl_student;

INSERT INTO tbl_student(st_num, st_name, st_age, st_tel, st_grade)
values('00003', '임꺽정', 22, '001-001');

-- 다른 스키마에 있는 테이블 조회
select * from user3.tbl_score;