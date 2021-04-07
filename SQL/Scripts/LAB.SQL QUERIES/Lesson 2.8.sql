-- Lab | SQL Queries 8
-- In this lab, you will be using the Sakila database of movie rentals.
use sakila;
-- Instructions

-- Use the RANK() and the table of your choice rank films by length (filter out the rows that have nulls or 0s in length column).
-- In your output, only select the columns title, length, and the rank.
SELECT title, length, rank() over (order by length DESC) as longest
FROM film
WHERE length IS NOT NULL AND length > 0;


-- Build on top of the previous query and rank films by length within the rating category (filter out the rows that have nulls or 0s in length column).
-- In your output, only select the columns title, length, rating and the rank.
SELECT title, length, rating, rank() over (partition by rating order by length DESC) as longest
FROM film
WHERE length IS NOT NULL AND length > 0;

-- How many films are there for each of the categories? Inspect the database structure and use appropriate join to write this query.
SELECT c.name, count(fc.film_id) as nooffilm
FROM film_category fc
JOIN category c
ON c.category_id=fc.category_id
GROUP BY c.name;
-- Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, count(fa.film_id) as nooffilm
FROM actor a
JOIN film_actor fa
ON a.actor_id=fa.actor_id
GROUP BY a.actor_id
ORDER BY count(fa.film_id) DESC;

-- Most active customer (the customer that has rented the most number of films)
SELECT c.first_name, c.last_name, rank() over (order by (count(r.rental_id)) DESC) as noofrentals
FROM customer c
JOIN rental r
ON c.customer_id=c.customer_id
GROUP BY c.last_name
;

-- Bonus: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. 
-- Give it a try. We will talk about queries with multiple join statements later in the lessons.