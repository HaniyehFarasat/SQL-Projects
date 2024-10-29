-- Practice 1:
SELECT
	date,
	CASE WHEN hometeam_id = 8634 THEN 'FC Barcelona'
         ELSE 'Real Madrid CF' END as home,
	CASE WHEN awayteam_id = 8634 THEN 'FC Barcelona'
         ELSE 'Real Madrid CF' END as away,
	-- Identify all possible match outcomes
	CASE WHEN home_goal > away_goal AND hometeam_id = 8634 THEN 'Barcelona win!'
             WHEN home_goal > away_goal AND hometeam_id = 8633 THEN 'Real Madrid win!'
             WHEN home_goal < away_goal AND awayteam_id = 8634 THEN 'Barcelona win!'
             WHEN home_goal < away_goal AND awayteam_id = 8633 THEN 'Real Madrid win!'
        ELSE 'Tie!'
        END AS outcome
FROM matches_spain
WHERE (awayteam_id = 8634 OR hometeam_id = 8634)
      AND (awayteam_id = 8633 OR hometeam_id = 8633);

-- Practice 2:
      -- Select the season and date columns
SELECT
     season,
     date,
    -- Identify when Bologna won a match
	CASE when hometeam_id = 9857
         and home_goal > away_goal
         THEN 'Bologna Win'
		when awayteam_id = 9857
        and away_goal > home_goal
        THEN 'Bologna Win'
		ELSE NULL END AS outcome
FROM matches_italy;

-- Practice 3:
-- Select the season, date, home_goal, and away_goal columns
SELECT
    season,
    date,
    home_goal,
    away_goal
FROM matches_italy
WHERE
    (hometeam_id = 9857 AND home_goal > away_goal) OR
    (awayteam_id = 9857 AND away_goal > home_goal);