#04-04 inner join 

select students.id as 학번, name as 학생이름, dname as 학과명
from students
inner join departments on department_id=departments.id;

select s.id as 학번, name as 학생이름, dname as 학과명
from students s 
inner join departments d on department_id=d.id;

select e.student_id, e.enroll_date, s.name as 과목명
from enrollments e
inner join subjects  s on e.subject_id=s.id
where date_format(e.enroll_date, 'Y%-%m-%d') >='2024-03-14';

desc enrollments;
select e.enroll_date AS 수강신청일, s.name AS 학생이름, sb.name AS 과목이름
from enrollments e
inner join students s on e.student_id=s.id
inner join subjects sb on e.subject_id=sb.id
where date_format(e.enroll_date, '%Y-%m-%d') >='2024-03-15';

select s.name AS 과목명, p.name AS 담당교수
from enrollments e
inner join subjects s on e.subject_id=s.id
inner join professors p on s.professor_id=p.id
where date_format(e.enroll_date, '%Y-%m-%d') ='2024-01-12';

#04-04 연습문제 

#01)

select s.name AS 학생이름, p.name AS 지도교수
from students s
inner join professors p on s.professor_id=p.id;


#02)**********join 

desc subjects;
desc students;
desc enrollments;
select s.name AS 학생이름, sub.name AS 과목명
from enrollments e
inner join students s ON e.student_id=s.id
inner join subjects sub ON e.subject_id=sub.id;

#03) *********join 
desc departments;
desc subjects;

select  s.name AS 학생이름, sub.name AS 과목명, d.dname AS 개설학과
from enrollments e
inner join students s on e.student_id=s.id
inner join subjects sub on e.subject_id=sub.id
inner join departments d on sub.department_id=d.id;

#04) **********where
desc departments;

select p.name AS 교수이름, d.dname AS 학과명
from professors p
inner join departments d ON p.department_id = d.id 
where p.hiredate >= '2024-01-01';


#05)

#학생별로 ~ group by 
#order by 에서 별칭 사용가능 

desc students;
desc enrollments;
select * from enrollments limit 5;
select s.name , count(*) AS 수강과목수, avg(e.score) AS 평균점수
from enrollments e
inner join students s ON e.student_id=s.id
group by s.id
having count(e.subject_id)>=4
order by 평균점수 desc;




5. OUTER JOIN

select s.name as 학생이름, p.name AS 담당교수
from students s
left outer join professors p on s.professor_id=p.id;


select s.name AS 학생이름, p.name AS 담당교수
from students s
inner join professors p on s.professor_id =p.id ;
 

select s.name AS 교과목명, p.name AS 담당교수
from subjects s
right outer join professors p on s.professor_id=p.id;


select s.id as 학생id, s.name as 학생이름, e.subject_id AS 과목번호
from students s
left join enrollments e on s.id =e.student_id

UNION

select e.student_id AS 학생id, s.name as 학생이름, e.subject_id as 과목번호
from students s
right join enrollments e on s.id =e.student_id;


#04-05 연습문제 

#01) 
#professors와 subjects를 조인하여 
#과목을 담당하지 않는 교수의 이름만 출력 
desc subjects;
desc professors;
select p.name AS 교수이름
from professors p
left join subjects sub on p.id=sub.professor_id
where sub.id is null;


#02) 
#학과명과 과목수를 출력 
#모든 학과가 포함되어야 하며, 과목이 없는 학과도 출력 

desc departments;
desc subjects;

select d.dname AS 학과명, count(sub.id) AS 과목수
from departments d
left join subjects sub on d.id =sub.department_id
group by d.id;


#03)

#담당 과목이 없는 교수도 포함 left join 
#교수 이름과 담당 과목명 p.name, d.dname
#모든 교수를 출력하되, 
#과목을 맡지 않은 교수의 과목명은 null, is null 

desc subjects;
desc professors;


select p.name as 교수이름, sub.name as 담당과목
from professors
left join subjects sub on p.id = sub.professor_id;


#04)

s.name AS 학생이름,  