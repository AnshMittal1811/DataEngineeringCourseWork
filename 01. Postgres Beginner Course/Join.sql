SELECT *
FROM customer
NATURAL JOIN payment;

SELECT * 
FROM customer
INNER JOIN payment USING (customer_id);

SELECT *
FROM city
NATURAL JOIN country;