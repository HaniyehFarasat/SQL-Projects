-- retrive city and country data
SELECT
	c1.name AS city,
    code,
    c2.name AS country,
    region,
    city_proper_pop
FROM cities AS c1
-- Join right table (with alias)
LEFT JOIN countries AS c2
ON c1.country_code = c2.code
ORDER BY code DESC;
