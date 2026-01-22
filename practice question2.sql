

create database company_db;
use company_db;
create table departments (
  dept_id int primary key,
  department varchar(20)
);
insert into departments values
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing');

create table employees (
  emp_id int primary key,
  name varchar(20),
  dept_id int,
  salary int,
  hire_date date,
  foreign key (dept_id) references departments(dept_id)
);

insert into employees values
(1,'Arun',101,45000,'2022-01-10'),
(2,'Divya',102,35000,'2021-03-15'),
(3,'Karthik',101,60000,'2020-06-20'),
(4,'Meena',103,40000,'2023-02-05'),
(5,'Ravi',102,30000,'2022-08-12'),
(6,'Priya',101,55000,'2021-11-30'),
(7,'Sathya',103,30000,'2021-10-03'),
(8,'Anitha',101,48000,'2022-05-18'),
(9,'Kumar',102,42000,'2020-12-25'),
(10,'Suresh',103,52000,'2019-09-14'),
(11,'Ramesh',101,65000,'2018-07-21'),
(12,'Lakshmi',102,38000,'2023-01-11'),
(13,'Deepa',103,47000,'2021-06-09'),
(14,'Vignesh',101,51000,'2022-11-01'),
(15,'Pooja',104,46000,'2020-04-30');

select * from employees;
select * from departments;

select e.name, d.department, e.salary
from employees e
join departments d
on e.dept_id=d.dept_id
where e.salary >45000
order by e.salary desc;

select d.department, sum(e.salary) as total_salary
from employees e
join departments d
on e.dept_id=d.dept_id
group by d.department
having sum(e.salary)>150000;

select name,department,salary
from
(
select e.name,d.department,e.salary,
rank() over( partition by d.department order by e.salary desc) as rnk
from employees e
join departments d
on e.dept_id=d.dept_id) t
where rnk=2;
select*from employees;
select avg(salary) from employees;

select name, department, salary
from(
select e.name, d.department, e.salary,
avg(e.salary) over(partition by d.department) as average_per_department
from employees e
left join departments d
on e.dept_id=d.dept_id) t
where salary>average_per_department;

select name, department, salary
from(
select e.name, d.department,e.salary,
row_number() over(partition by d.department order by e.salary desc) as rnk
from employees e
join departments d
on e.dept_id=d.dept_id)t
where rnk <=2; 












