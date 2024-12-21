-- Write your PostgreSQL query statement below
WITH sum_amount AS (
    SELECT 
        visited_on,
        SUM(amount) AS total_spend
    FROM Customer
    GROUP BY visited_on
)
SELECT 
    visited_on,
    SUM(total_spend) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
    ROUND(AVG(total_spend) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
FROM sum_amount
ORDER BY visited_on ASC
OFFSET 6;
