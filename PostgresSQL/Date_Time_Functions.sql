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