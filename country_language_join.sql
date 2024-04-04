-- Select country and language names, aliased
SELECT c.name AS country, l.name AS language
-- From countries (aliased)
FROM countries AS c
INNER JOIN languages AS l
-- Use code as the joining field with the USING keyword
USING (code);