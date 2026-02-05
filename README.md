# sql

select name, sal from professors where department_id =101; 

start transaction;
update professors set sal =sal+50 where department_id =101;
select name, sal from professors where department_id =101;
rollback; 

select name, sal from professors where department_id =101; 




select name, sal from professors where department_id =101; 

start transaction;
update professors set sal =sal+50 where department_id =101;
select name, sal from professors where department_id =101;
COMMIT; 

select name, sal from professors where department_id =101; 







#상황 제시 예제에 트랜잭션 적용 
start transaction;
insert into professors (
    name, user_id, position, sal, hiredate, comm,
    email, phone, photo_url, status, department_id
) values ( 
    '주영아', 'ssam', '조교수', 550, '2025-10-07', null,
    'ssam@myschool.ac.kr', '010-1234-5678',null,'재직',101
);

set @new_professor_id =LAST_INSERT_ID();

update subjects set professor_id =@new_professor_id 
where dapartment_id =101;

update students set professor_id =@new_professor_id
where department_id=101;

commit;









#savepoint의 효과 확인

select id, grade from students
where id in (10101, 10102);

start transaction;

update students set grade=grade+1
where id=10101;
select id, grade from students where id in (10101, 10102);
savepoint A;


rollback to A;
commit;


select id, grade from students where id in (10101, 10102);



# 연습문제 

#1번 

#오류가 발생하면 이전 상태로 되돌릴 수 있도록 트랜젝션을 적용하시오.
#재직 상태가 '휴직'인 교수의 급여를 10% 인상하되,
#컴퓨터공학과 101 소속 교수 중 


desc professors


select * from professors limit 10;


start transaction;

update professors set sal=sal+1000 where  

select
from professors
where enum ='휴직'

select enum
from professors
where department_id =101


ROLLBACK 
COMMIT



#2

#변경 결과가 이상하면 되돌릴 수 있도록 트랜잭션
#학생 10106이 수강 중인 모든 과목 점수를 80점으로 일괄 변경

start transaction;


select * from students limit 5;

update students set score = 80 where id =10106 



SELECT score 
from students
where id=10106

savepoint A;

rollback to A;



#3

#10102 , 10103 의 학년을 각각 1씩 올리고 
#10103의 변경만 취소하시오 

start transaction;

SAVEPOINT




#4

#트랜잭션을 이용해 
#교수 9904가 담당중인 모든 과목의 학점을 1점 증가시키되, 


desc professors;
select * from professors limit 5;

select score
from professors
score +1 



from professors
department_id =9904


#5

#학생 10110이 새 과목 1007에 수강신청을 추가하려고 한다. 
#~ 과목을 추가하라는건가?
#insert와 동시에 학생의 학년을 3으로 수정하는 작업을 하나의 트랜잭션으로 처리하시오


select * from students limit 5;
select * from departments limit 5;


#students
#id 
#department_id = 1007 

#departments 
#id 















