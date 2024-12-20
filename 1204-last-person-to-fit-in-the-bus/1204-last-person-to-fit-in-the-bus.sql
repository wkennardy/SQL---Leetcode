-- Write your PostgreSQL query statement below
WITH weight_limit AS(
SELECT 
    person_name,
    weight,
    turn,
    SUM(weight) OVER(ORDER BY turn ASC, person_name) AS total_weight
FROM Queue
)
SELECT  
    person_name
FROM weight_limit
WHERE total_weight <=1000
ORDER BY turn DESC
LIMIT 1
