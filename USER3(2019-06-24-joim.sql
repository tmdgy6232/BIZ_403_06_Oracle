--user3 화면입니다.

select SC.sc_num, ST.st_name, SC.sc_subject, SC.sc_score
from tbl_score SC
    left join tbl_student ST
        on Sc.sc_num = ST.st_num;
        
-- round : 반올림, trunc : 버림
select SC.sc_num, ST.st_name, sum(sc.sc_score) as 총점
            ,trunc(avg(SC.sc_score)) as 평균1
            , round(avg(sc.sc_score)) as 평균2
from tbl_score SC
    left join tbl_student ST
        on Sc.sc_num = ST.st_num
        group by sc.sc_num, st.st_name
        having round(avg(sc.sc_score)) >= 85
        order BY sc.sc_num;