--- practice 1
SELECT
	-- Select country ID, date, home, and away goals from match
	main.country_id,
    main.date,
    main.home_goal,
    main.away_goal
FROM match AS main
WHERE
	-- Filter the main query by the subquery
	(home_goal + away_goal) >
        (SELECT AVG((sub.home_goal + sub.away_goal) * 3)
         FROM match AS sub
         -- Join the main query to the subquery in WHERE
         WHERE main.country_id = sub.country_id);

--- PRACTICE 2
SELECT
	-- Select country ID, date, home, and away goals from match
	main.country_id,
    main.date,
    main.home_goal,
    main.away_goal
FROM match AS main
WHERE
	-- Filter for matches with the highest number of goals scored
	(home_goal + away_goal) =
        (SELECT MAX(sub.home_goal + sub.away_goal)
         FROM match AS sub
         WHERE main.country_id = sub.country_id
               AND main.season = sub.season);

--- PRACTICE 3
SELECT
    -- Select the season and the max goals scored in a match for each season
    season,
    MAX(home_goal + away_goal) AS max_goals,

    -- Subquery: Select the overall max goals scored in any match across all seasons
    (SELECT MAX(home_goal + away_goal) FROM match) AS overall_max_goals,

    -- Nested Subquery: Select the max goals scored in any match in July
    (SELECT MAX(total_goals)
     FROM (
         SELECT home_goal + away_goal AS total_goals
         FROM match
         WHERE EXTRACT(MONTH FROM date) = 7
     ) AS july_matches) AS july_max_goals
FROM match
GROUP BY season;

--- PRACTICE 4
SELECT
	c.name AS country,
    -- Calculate the average matches per season
	AVG(outer_s.matches) AS avg_seasonal_high_scores
FROM country AS c
-- Left join outer_s to country
LEFT JOIN (
  SELECT country_id, season,
         COUNT(id) AS matches
  FROM (
    SELECT country_id, season, id
	FROM match
	WHERE home_goal >= 5 OR away_goal >= 5) AS inner_s
  -- Close parentheses and alias the subquery
  GROUP BY country_id, season) AS outer_s
ON c.id = outer_s.country_id
GROUP BY country;