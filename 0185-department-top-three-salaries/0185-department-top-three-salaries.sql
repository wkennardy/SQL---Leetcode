-- Write your PostgreSQL query statement below
WITH salary_rank AS(
SELECT
    salary,
    d.name AS Department,
    e.name AS Employee,
    DENSE_RANK() OVER(PARTITION BY d.name ORDER BY salary DESC) AS rank
FROM Department AS d
INNER JOIN Employee AS e
ON e.departmentId = d.id
)
SELECT 
    Department,
    Employee,
    salary
FROM salary_rank 
WHERE rank BETWEEN 1 AND 3
