#Lab | SQL Queries - Lesson 2.6
#Using sakila
#1. Get the unique release years.
SELECT distinct(f.release_year) as uniqueRyear
FROM sakila.film f;
#2. Get all films with ARMAGEDDON in the title.
SELECT *
FROM sakila.film
WHERE title LIKE 'ARMAGEDDON'; # Conclusion = none do.
#3. Get all films which title ends with APOLLO.
SELECT *
FROM sakila.film
WHERE title LIKE '%APOLLO';

#4. Get 10 the longest films.
select *, length
from sakila.film
order by length DESC
limit 10;

#5. How many films include Behind the Scenes content?
SELECT *
FROM sakila.film
WHERE special_features = 'Behind the Scenes';
#5. Drop column picture from staff.
ALTER TABLE sakila.staff
DROP COLUMN picture;
#A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
#Add a rental for movie "Academy Dinosaur" by the customer "Charlotte Hunter" from employee Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information in other tables. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
#SKIPPED ZHIS QUESTION
#6. select customer_id from sakila.customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER'
SELECT *, customer_id
FROM sakila.customer
WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER';
