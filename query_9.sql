-- Difference between Having vs Where caluse

-- where
use mydb;
select*from emp;

select empid,ename,dept,salary
from emp
where salary>20000;

select empid,ename,dept,salary
from emp
where salary<40000;

select empid,ename,dept,salary
from emp 
where salary between 10000 and 40000;

select empid,ename,dept,salary
from emp
where salary = 10000;

-- Having clause

select dept, sum(salary) as total_salary
from emp
group by dept
having sum(salary)>10000;





