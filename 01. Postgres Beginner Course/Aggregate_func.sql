SELECT * 
FROM film;

SELECT
ROUND(AVG(replacement_cost), 2) avg_replacement_cost
FROM film;

SELECT customer.customer_id, first_name, last_name,
to_Char(
AVG(amount), 
'99999999999999999D99')
AS average_amount
FROM payment INNER JOIN customer
ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
HAVING AVG(amount) > 5
ORDER BY customer_id;



SELECT COUNT(*)
FROM film;


SELECT COUNT(*) drama_films
FROM film 
INNER JOIN film_category USING(film_id)
INNER JOIN category USING(category_id)
WHERE category_id = 7

SELECT * FROM payment;


SELECT COUNT (DISTINCT amount)
FROM payment;


SELECT customer_id, COUNT(customer_id)
FROM payment
GROUP BY customer_id
ORDER BY customer_id;

SELECT customer_id, COUNT(customer_id)
FROM payment
GROUP BY customer_id
HAVING COUNT(customer_id) > 40;




SELECT MAX(replacement_cost)
FROM film;

SELECT film_id, title
FROM film
WHERE replacement_cost = (
SELECT MAX(replacement_cost)
FROM film)
ORDER BY title;

SELECT * 
FROM payment
WHERE amount = (
SELECT MAX(amount)
FROM payment);

SELECT customer_id, MAX(amount)
FROM payment
GROUP BY customer_id
HAVING MAX(amount) > (
	SELECT AVG(amount)
	FROM payment 
)
ORDER BY customer_id;

SELECT AVG(amount)
	FROM payment;
	





SELECT MIN (replacement_cost)
FROM film;


SELECT film_id, title, description
FROM film
WHERE replacement_cost = (
	SELECT MIN (replacement_cost)
	FROM film
)
ORDER BY title;



SELECT * 
FROM payment
WHERE amount = (
SELECT MIN(amount)
FROM payment);

SELECT customer_id, MIN(amount)
FROM payment
GROUP BY customer_id;

SELECT customer_id, MIN(amount)
FROM payment
GROUP BY customer_id
HAVING MIN(amount) < 8.99;



SELECT rating, SUM(rental_duration)
FROM film
GROUP BY rating
ORDER BY rating;

SELECT customer_id, SUM(amount) AS total
FROM payment
GROUP BY customer_id
ORDER BY total DESC
LIMIT 10;

SELECT customer_id, SUM(amount) AS total
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200
ORDER BY total DESC;

SELECT staff_id, COUNT(payment_id)
FROM payment
GROUP BY staff_id;

SELECT customer_id, SUM(amount) AS total
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT customer_id, SUM(amount) AS total
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 190;


/*COMPARISON OPERATORS*/
SELECT *
FROM payment
WHERE amount > 9.99;

SELECT * 
FROM city
WHERE city <>'York';

SELECT customer_id, payment_id, amount
FROM payment
WHERE amount BETWEEN 7 AND 8;

SELECT customer_id, payment_id, amount
FROM payment
WHERE amount NOT BETWEEN 0 AND 8;

/*Pattern Matching*/
SELECT first_name, last_name
FROM customer
WHERE first_name LIKE '_her%'


SELECT *
FROM inventory
WHERE NOT store_id = 1;

SELECT *
FROM city 
WHERE city = 'Abu Dhabi' OR city = 'London';

SELECT *
FROM city 
WHERE city_id > 20 AND city LIKE 'Ba%';

SELECT *
FROM city 
WHERE (country_id = 69 AND city = 'Zaria')
OR city_id = 589;

SELECT customer_id, rental_id, return_date
FROM rental
WHERE customer_id IN(1,2)
ORDER BY return_date ASC;

SELECT customer_id, rental_id, return_date
FROM rental
WHERE rental_id IN (
	SELECT rental_id 
	FROM rental
	WHERE return_date 
	BETWEEN '2005-05-01 00:00:00' AND '2005-08-01 11:59:59'
	AND customer_id > 500
)
ORDER BY return_date DESC;

SELECT customer_id
FROM customer
UNION
SELECT customer_id
FROM payment;

SELECT customer_id
FROM customer
UNION ALL
SELECT customer_id
FROM payment;

SELECT store_id
FROM customer
INTERSECT
SELECT store_id
FROM staff;

SELECT film_id, title
FROM film
EXCEPT
SELECT DISTINCT inventory.film_id, title
FROM inventory
INNER JOIN film 
ON film.film_id = inventory.film_id
ORDER by title;


/*Complex Queries*/