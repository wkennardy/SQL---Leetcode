-- Write your PostgreSQL query statement below
WITH confirmation_rates AS(
    SELECT 
        s.user_id,
        CASE 
            WHEN action = 'confirmed' THEN 1
            ELSE 0
        END AS confirmation
    FROM Signups AS s
    LEFT JOIN Confirmations AS c
    ON c.user_id = s.user_id
)
SELECT
    user_id,
    ROUND(AVG(confirmation),2) AS confirmation_rate
FROM confirmation_rates
GROUP BY 1
