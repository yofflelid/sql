# sql

select p.name AS 교수이름, d.dname AS 학과명
from professors p
inner join departments d
on p.department_id =d.id
where p.hiredate >= '2024-01-01';

