-- Write your PostgreSQL query statement below
SELECT 
    a.id
FROM Weather AS a
CROSS JOIN Weather AS b
WHERE b.temperature < a.temperature AND
    (a.recordDate - b.recordDate)::integer = 1