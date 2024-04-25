SELECT countries.name AS country,
-- Subquery that provides the count of cities
  (SELECT COUNT(*)
   FROM cities
   WHERE cities.country_code = countries.code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country ASC
LIMIT 9;