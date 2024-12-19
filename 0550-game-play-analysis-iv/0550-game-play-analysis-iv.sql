-- Write your PostgreSQL query statement below
WITH number_logins AS(
SELECT 
    player_id,
    event_date,
    DENSE_RANK() OVER (PARTITION BY player_id ORDER BY event_date) AS first_login,
    lead(event_date) OVER(PARTITION BY player_id ORDER BY event_date) AS next_login
FROM Activity 
) 
SELECT
    ROUND(SUM(CASE
        WHEN (next_login - event_date)::INT = 1 THEN 1 
        ELSE 0
        END)*1.0 / COUNT(DISTINCT player_id),2) AS fraction
FROM number_logins 
WHERE first_login = 1
    


