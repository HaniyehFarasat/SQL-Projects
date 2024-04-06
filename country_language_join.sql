-- Select country and language names, aliased
SELECT c.name AS country, l.name AS language
FROM countries AS c
-- Join to languages (aliased)
INNER JOIN languages AS l
-- Use code as the joining field with the USING keyword
USING (code);