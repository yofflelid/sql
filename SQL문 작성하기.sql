#2024년 이후 입사한 교수의 이름과 소속 학과명을 출력하시오. 
SELECT p.name AS 교수이름, d.dname AS 학과명
FROM professors p 
inner join departments d
ON p.department_id = d.id
where p.hiredate >= '2024-01-01'; 

#2과목 이상 수강신청한 학생별로 학생의 이름과 수강신청한 과목 수, 평균 점수를 평균점수가 높은 순으로 조회하시오.
select s.name as 학생이름, count(*) as 수강과목수, avg(e.score) as 평균점수
from enrollments e
inner join students s on e.student_id =s.id
group by s.id
HAVING count(e.subject_id) >=4
order by 평균점수 desc;

#2024년 이후 입사한 교수의 이름과 소속 학과명을 출력하시오. 

desc professors
#professors
#name 
#dpartments_id

desc departments
#departments
#id 
#dname 

select p.name , d.dname
from professors p
INNER JOIN departments d ON department_id =d.id
WHERE date_format(p.hiredate, '%Y') >= 2024 ;

#내부적으로는 이런 비교입니다:
#'2023' >= '2024' ❌
#'2024' >= '2024' ⭕
#'2025' >= '2024' ⭕

#연도 기준 필터링 #2024년 1월 1일 00:00:00 ~ 12월 31일 23:59:59 전부 포함
#하지만 hiredate에 함수를 적용함
#⚠️ 단점 (중요)
#인덱스 사용 불가
#DATE_FORMAT(hiredate, ...) → 가공된 값
#DB는 인덱스를 못 쓰고 전체 스캔(Full Scan) 가능성 ↑
#문자열 비교 → 불필요한 연산
#📌 실무/시험에서 비추천 패턴

select p.name , d.dname
from professors p
INNER JOIN departments d ON department_id =d.id
WHERE p.hiredate >= '2024-01-01'; 
# 날짜는 반드시 문자열로 쓰는 게 정석입니다

#특징
#날짜 범위 비교 
#2024년 이후 입사자 정확히 필터링

#컬럼에 함수 없음

#✅ 장점

#인덱스 사용 가능

#연산 단순

#실무·시험에서 표준적인 방식

#📌 무조건 이 방식이 더 좋다고 생각해도 됩니다.