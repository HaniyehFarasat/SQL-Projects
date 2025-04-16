--- Practice 1
-- Extract day of week from rental_date
SELECT
  EXTRACT(dow FROM rental_date) AS dayofweek,
  -- Count the number of rentals
  COUNT(rental_id) as rentals FROM rental
GROUP BY 1;

--- Paractice 2
-- Truncate rental_date by year
SELECT DATE_TRUNC('year', rental_date) AS rental_year
FROM rental;

--- Practice 3
-- Truncate rental_date by month
SELECT DATE_TRUNC('month', rental_date) AS rental_month
FROM rental;

--- Practice 4
-- Truncate rental_date by day of the month
SELECT DATE_TRUNC('day', rental_date) AS rental_day
FROM rental;

--- Practice 5
SELECT
  -- Extract the day of week date part from the rental_date
  EXTRACT(dow FROM rental_date) AS dayofweek,
  AGE(return_date, rental_date) AS rental_days
FROM rental AS r
WHERE
  -- Use an INTERVAL for the upper bound of the rental_date
  rental_date BETWEEN CAST('2005-05-01' AS date)
   AND CAST('2005-05-01' AS date) + INTERVAL '90 day';

--- Practice 6
SELECT
  c.first_name || ' ' || c.last_name AS customer_name,
  f.title,
  r.rental_date,
  -- Extract the day of week date part from the rental_date
  EXTRACT(dow FROM r.rental_date) AS dayofweek,
  AGE(r.return_date, r.rental_date) AS rental_days,
  -- Use DATE_TRUNC to get days from the AGE function
  CASE WHEN DATE_TRUNC('day', AGE(r.return_date, r.rental_date)) >
  -- Calculate number of d
    f.rental_duration * INTERVAL '1' day
  THEN TRUE
  ELSE FALSE END AS past_due
FROM
  film AS f
  INNER JOIN inventory AS i
  	ON f.film_id = i.film_id
  INNER JOIN rental AS r
  	ON i.inventory_id = r.inventory_id
  INNER JOIN customer AS c
  	ON c.customer_id = r.customer_id
WHERE
  -- Use an INTERVAL for the upper bound of the rental_date
  r.rental_date BETWEEN CAST('2005-05-01' AS DATE)
  AND CAST('2005-05-01' AS DATE) + INTERVAL '90 day';