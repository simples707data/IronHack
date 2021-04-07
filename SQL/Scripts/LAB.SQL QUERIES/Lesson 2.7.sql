#Lab | SQL Queries 7
#GROUP BY & HAVING

use sakila;
#In the actor table, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

SELECT *, COUNT(last_name) 
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) < 2;

#Which last names appear more than once? We would use the same logic as in the previous question but this time we want 
#to include the last names of the actors where the last name was present more than once.
SELECT *, COUNT(last_name) 
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1
order by last_name;


#Using the rental table, find out how many rentals were processed by each employee.
SELECT count(distinct(rental_id)), staff_id
from rental
GROUP BY staff_id;
#8040 for 1, 8004 for 2

#Using the film table, find out how many films were released each year
SELECT release_year, count(release_year)
From film
GROUP BY release_year;
#A: 2006: 1000;

#Using the film table, find out for each rating how many films were there.
SELECT rating, count(film_id)
FROM film
GROUP BY rating
ORDER BY rating DESC;

#What is the average length of films for each rating? Round off the average lengths to two decimal places.
SELECT rating, round(avg(length),2)
FROM film
GROUP BY rating
ORDER BY rating DESC;

#Which kind of movies (based on rating) have an average duration of two hours or more?
SELECT rating, round(avg(length),2) as AVGL
FROM film
GROUP BY rating
HAVING AVGL > 119
ORDER BY rating DESC
;