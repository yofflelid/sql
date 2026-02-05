#LAB 02 실습
select id, name, grade from students where grade=1;
select id, name, height, weight from students where height >180 ;
select id, name, position, sal from professors where sal <=300
order by sal desc;
select id, name, grade, gender from students
where grade =1 and gender ='여'; 

select name, grade, phone from students
where status ='졸업' or status = '휴학'
order by grade asc; 

select id, name, grade, gender, status from students
where (grade =1 or grade =2) and status ='재학'
order by grade asc; 


# 01-01 연습문제 
#01) 

select id, name, sal
from professors
where sal >=500 
order by sal desc;

#02)
select name, grade, gender, height
from students
where grade = 3 and gender ='여'

#03)
select id, name, sal
from professors
where sal >=300
order by sal aSC
limit 3;

#04)
desc departments;
desc subjects;
select id, name, credit
from subjects
where credit not in(2,3);


select id, name, credit
from subjects
where credit != 2 and credit !=3;

#05)
select name, grade, height, gender
from students
where grade !=1 and height >=180 and gender='남';


#01-02 데이터 검색하기 

select id, name, sal from professors where sal between 400 and 500
order by sal desc;

select id, dname, established 
from departments
where established not between 1985 and 1995
order by dname asc;

select id, dname, established 
from departments
where established <1985 or established >1995
order by dname asc;

select id, name, position from professors
where position in('교수', '부교수')
order by name asc;

select id, name, position from professors
where position='교수' or position='부교수'
order by name asc;

select id, dname, loc from departments
where loc not in ('공학관', '인문사회관')
order by dname asc;

select id, dname, established from departments
where dname like '%공학%'
order by established desc;

select id, dname, established from departments
where dname not like '%공학%'
order by established desc;

select id, dname, homepage from departments
where homepage is null;

select id, name, status, graduation_date from students
where graduation_date is not null;

#02-02 연습문제 

#01) ******************
desc departments;
select id, dname, established 
from departments
where established between 2000 and 2005
order by desc;

#02)

desc professors;
select id, name, department_id
from professors
where department_id in(101, 102);

#03) 

select id, name, sal, COMM
from professors
where comm is null ;

#04)
select name, height, grade
from students
where height between 170 and 180;

#05)
select name, grade, email
from students
where name like '김%' and email is not null;



#02-03 집합 연산자 

select department_id from students;

select department_id from students
UNION
select department_id from professors;

select name, department_id from students
UNION
select name, department_id from professors;

select department_id from students
UNION ALL
select department_id from professors;

select department_id from students
intersect
select department_id from professors;


#02-03 연습문제 
#01)

select name
from students
where status ='재학';

select name
from professors
where status ='재직';


select name
from students
where status ='재학'
UNION
select name
from professors
where status ='재직';

#02) *******************컬럼이름 틀림
select department_id
from students
EXCEPT
select department_id
from professors;

#03) ***************intersact
desc students;
desc departments;

select department_id
from students
where height >=180;


select id
from departments
where established > 2000;

select department_id
from students
where height >=180
INTERSECT
select id
from departments
where established > 2000;


#4)
desc professors;
select name
from students
where department_id =101
union
select name
from professors
where status ='교수';


#02-04 문자열 함수 

select upper(user_id)
from professors
where sal >=500
order by sal asc;

select lower(email) 
from departments
where email is not null;

select dname, char_length(dname)
from departments
where char_length(dname) >5
order by char_length(dname) desc;

