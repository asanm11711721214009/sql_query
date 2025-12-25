-- list all films that are in english

select*from film;
select*from language;

select f.film_id,f.title
from film f
join language l
on f.language_id=l.language_id
where l.name='english';




