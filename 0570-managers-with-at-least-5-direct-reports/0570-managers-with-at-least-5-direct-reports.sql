-- Write your PostgreSQL query statement below
WITH manager_report AS (
    SELECT 
        a.name,
        a.id,
        SUM(CASE 
                WHEN a.id = b.managerId THEN 1 
                ELSE 0 
            END) AS direct_report
    FROM Employee AS a
    CROSS JOIN Employee AS b
    GROUP BY 1,2
)
SELECT
    name
FROM manager_report
WHERE direct_report >= 5;
