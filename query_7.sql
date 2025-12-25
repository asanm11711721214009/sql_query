-- total payment collected by each staff member

select*from payment;
select*from staff;

select s.first_name,s.last_name,sum(p.amount) as total_revenue
from payment p
join staff s
on p.staff_id=s.staff_id
group by s.staff_id;
