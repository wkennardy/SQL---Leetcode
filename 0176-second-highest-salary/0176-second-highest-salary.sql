-- Write your PostgreSQL query statement below
WITH salary_rank AS (
    SELECT 
        id,
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
    FROM Employee
)
SELECT 
    MAX(CASE 
        WHEN rank = 2 THEN salary 
        ELSE NULL
    END) AS SecondHighestSalary
FROM salary_rank;
