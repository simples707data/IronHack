use sakila;
select count(distinct r.rental_date) as noofrentaldays
from rental r