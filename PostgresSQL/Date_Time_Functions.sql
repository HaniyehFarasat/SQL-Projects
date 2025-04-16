--- Practice 1
-- Extract day of week from rental_date
SELECT
  EXTRACT(dow FROM rental_date) AS dayofweek,
  -- Count the number of rentals
  COUNT(rental_id) as rentals FROM rental
GROUP BY 1;