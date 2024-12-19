-- Write your PostgreSQL query statement below
SELECT
    project_id,
    ROUND(AVG(experience_years),2) AS average_years
FROM Project AS p
INNER JOIN Employee AS e
ON e.employee_id = p.employee_id
GROUP BY 1