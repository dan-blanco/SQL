-- How many customers do we have?
SELECT COUNT(*) FROM customer;

-- How much money have we received?
SELECT SUM(amount) FROM payment;

-- Which customers spent the most money?
SELECT p.customer_id, c.email, SUM(amount) FROM payment as p
INNER JOIN customer as c ON c.customer_id = p.customer_id
GROUP BY p.customer_id, c.email
ORDER BY SUM(amount) DESC;

-- How many rentals per store address?
-- HINT: To get a store name from the store id, we need to join the table that contains the store Address!!!!
SELECT s.address, COUNT(*) FROM rental as r
INNER JOIN store as s ON s.store_id = r.store_id
GROUP BY r.store_id, s.address
ORDER BY COUNT(*) DESC;



-- How many customers per store address
SELECT store.address,  COUNT(*) FROM customer 
INNER JOIN store
ON store.store_id = customer.store_id
GROUP BY store.address ORDER BY COUNT(*) DESC;


-- POTENTIAL QUESTIONS
-- How many copies of each film do we have?

SELECT i.film_id, f.title, COUNT(*) FROM inventory as i
INNER JOIN film as f ON f.film_id = i.film_id
GROUP BY i.film_id, f.title;

-- Whats happening with the Join?
-- Lets create a "view" to see it!!!!

DROP VIEW IF EXISTS full_inventory; -- preventing an error

CREATE VIEW full_inventory AS

SELECT i.film_id, f.title, f.description, f.release_year, i.last_update, f.rating, i.inventory_id
FROM inventory as i
INNER JOIN film as f on f.film_id = i.film_id;

SELECT * FROM full_inventory;
DROP VIEW IF EXISTS full_inventory; 

-- END VIEW



-- What state made the most revenue?

SELECT s.state, SUM(p.amount) FROM store as s
INNER JOIN rental as r on r.store_id = s.store_id
INNER JOIN payment as p on p.rental_id = r.rental_id
GROUP BY s.state
ORDER BY SUM(p.amount) DESC

-- Who are the most recent customers?

DROP VIEW IF EXISTS customer_view;
CREATE VIEW customer_view AS
SELECT CONCAT(c.first_name,' ',c.last_name) as "name", * FROM customer c;
SELECT * FROM customer_view;

SELECT  r.rental_date, c.name FROM rental as r
INNER JOIN customer_view as c ON c.customer_id = r.customer_id
WHERE r.rental_date >= DATE('1/3/21');

-- Which customers have more than one outstanding rental between a date range?
SELECT COUNT(*) as "Outstanding Rentals", r.customer_id, c.name FROM rental as r
LEFT OUTER JOIN payment as p ON p.rental_id = r.rental_id
INNER JOIN customer_view as c ON c.customer_id = r.customer_id
WHERE payment_id IS NULL
AND r.rental_date <= '1/3/21'
GROUP BY r.customer_id, c.name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

-- Which states have most outstanding rentals?

-- How many copies of the best book are in different locations?
SELECT s.state, COUNT(*) FROM inventory as i
INNER JOIN store as s ON s.store_id = i.store_id
INNER JOIN film as f ON f.film_id = i.film_id
WHERE  f.film_id = (
	SELECT f.film_id as "number of rentals" FROM rental as r 
	INNER JOIN inventory as i ON i.inventory_id = r.inventory_id
	INNER JOIN film as f ON f.film_id = i.film_id
	GROUP BY f.title, f.film_id
	ORDER BY COUNT(*) DESC
	LIMIT 1
)
GROUP BY s.state
ORDER BY COUNT(*) DESC;


-- What is the most popular rental
SELECT f.title, f.film_id, COUNT(*) as "number of rentals" FROM rental as r 
INNER JOIN inventory as i ON i.inventory_id = r.inventory_id
INNER JOIN film as f ON f.film_id = i.film_id
GROUP BY f.title, f.film_id
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Which movies are outstanding?
DROP VIEW IF EXISTS outstanding_view;
CREATE VIEW outstanding_view AS
	SELECT f.title, f.film_id, COUNT(*) as "outstanding" FROM rental as r
	LEFT OUTER JOIN payment as p ON p.rental_id = r.rental_id
	INNER JOIN inventory as i ON i.inventory_id = r.inventory_id 
	INNER JOIN film as f ON f.film_id = i.film_id
	WHERE p.payment_id IS NULL
	GROUP BY f.film_id;
SELECT * FROM outstanding_view;

-- How many copies of each outstanding film do we have in inventory?
SELECT i.film_id, o.title, COUNT(*) - o.outstanding as "Inventory in stock" FROM inventory as i
INNER JOIN outstanding_view as o ON i.film_id = o.film_id
GROUP BY i.film_id, o.title, o.outstanding;





