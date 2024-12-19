-- Write your PostgreSQL query statement below
WITH second_num AS(
    SELECT
        num,
        id,
        LEAD(num) OVER (ORDER BY id) AS second_num
    FROM Logs
),
third_num AS(
    SELECT
        num,
        second_num,
        id,
        LEAD(second_num) OVER (ORDER BY id) AS third_num
    FROM second_num
)
SELECT 
    DISTINCT num AS ConsecutiveNums
FROM third_num 
WHERE num = second_num AND 
    num = third_num