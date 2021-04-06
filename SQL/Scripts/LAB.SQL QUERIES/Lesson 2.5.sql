#Sakila Exercise 06.04.2021
#Lab | SQL Queries - Lesson 2.5
#1.	Select all the actors with the first name ‘Scarlett’.
use sakila;
SELECT *
FROM actor
WHERE first_name = 'Scarlett';
#2.	How many films (movies) are available for rent and how many films have been rented?
-SKIPPED
#3.	What are the shortest and longest movie duration? Return the results as columns with the names  max_duration and min_duration. Answer 15861
use sakila;
select *, MAX(length) as longest, MIN(length) as shortest from film;
#4.	What's the average movie duration expressed in format (hours, minutes) Return the result as columns with the names hours and minutes? Answer 46 – 185 mins
use sakila;
select *, floor(avg(length)/60), avg(length)-floor(avg(length/60)) as minutes
from film;
#5.	How many distinct (different) actors' last names are there? Answer 121. 
SELECT count(distinct last_name) as uniquestar from sakila.actor;
#6.	Since how many days has the company been operating (check the DATEDIFF() function)? Hint: rental table. Answer: 275
use sakila;
SELECT DATEDIFF(min(rental_date),max(last_update)) as 'days trading when last updated'
from rental;
#7.	Show all rental information with additional columns month and weekday. (hint: DATE_FORMAT() ). Get 20 results.
USE sakila;
SELECT *, DATE_FORMAT(rental_date, '%M') AS Rental_Month, DAYNAME(rental_date) AS Rental_Day
from rental
limit 20;
#8.	Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
USE sakila;
SELECT 
    *,
    CASE
        WHEN DATE_FORMAT(rental_date, '%w') IN (1 , 7) THEN 'Weekend'
        ELSE 'workday'
    END AS daytype
FROM
    rental;
#9.	How many rentals were made in the last month of renting activity?

use sakila;
SELECT *, DATE_FORMAT(rental_date, '%M') AS Rental_Month, DATE_FORMAT(MAX(last_update), '%M'), COUNT(rental_date) AS NoRENTSlastMONTH
FROM rental
WHERE rental_date LIKE '2006-02-_____:__:__';
