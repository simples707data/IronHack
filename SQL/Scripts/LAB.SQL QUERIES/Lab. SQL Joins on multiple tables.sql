Use sakila;

-- Inspect the database structure and find the best-fitting table to analyse for the next task.
-- Using multiple JOIN() clauses display the store ID, city, and country of each store.
SELECT s.store_id, c.city, co.country
from store s
Join address a
on a.address_id = s.address_id
Join city c
on c.city_id = a.city_id
Join country co
on co.country_id = c.country_id;

-- Display the total payment amount for each store.
SELECT s.store_id as Store, sum(p.amount) as Takings
FROM staff s
Join payment p
on s.staff_id = p.staff_id
Group By s.store_id;

-- What is the average film length per each category? Which category of films are the longest?
SELECT cat.name, avg(fc.length) as length
FROM film fc
Right JOIN film_category c
ON c.film_id=fc.film_id
Right Join category cat
on cat.category_id = c.category_id
GROUP BY c.category_id
Order by length DESC;

#Answer = Sports

-- Display the 2 most frequently rented movies in descending order.
SELECT f.title, count(r.rental_id) as NoOFrentals
from film f
Left Join inventory i
on f.film_id = i.film_id
Left Join rental r
on i.inventory_id = r.inventory_id
Group by f.title
Order by count(rental_id) DESC
Limit 2;

-- Display the top 5 categories with highest revenue (payment amount) in descending order.
# I quit! - surely no organisation would set up such complex systems witout common identifiers! 
-- Is the Academy Dinosaur movie available for rent from Store 1? If yes, display the title, store_id and inventory_id of the available copies of that movie. 
SELECT f.title, i.store_id, i.inventory_id, 'yes'
from film f
Left Join inventory i
on f.film_id = i.film_id
Left Join rental r
on i.inventory_id = r.inventory_id
Where r.rental_date < r.return_date AND f.title = 'ACADEMY DINOSAUR'

