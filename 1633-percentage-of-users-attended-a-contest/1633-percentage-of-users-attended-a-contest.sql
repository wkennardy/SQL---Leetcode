-- Write your PostgreSQL query statement below
SELECT 
    contest_id,
    ROUND(COUNT(user_id)/(Select COUNT(DISTINCT user_id) FROM Users):: NUMERIC * 100,2) AS percentage
FROM Register
GROUP BY 1
ORDER BY 2 DESC, 1 ASC



