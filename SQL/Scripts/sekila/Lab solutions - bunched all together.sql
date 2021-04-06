use sakila;
select f.title as name
from film f
order by f.title ASC

use sakila;
select distinct l.name as lan
from language l

use sakila;
select count(s.store_id) as noofstores
from store s

use sakila;
select count(st.staff_id) as noofstaff
from staff st

use Sakila;
select first_name from staff

use sakila;
select count(distinct r.rental_date) as noofrentaldays
from rental r