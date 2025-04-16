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