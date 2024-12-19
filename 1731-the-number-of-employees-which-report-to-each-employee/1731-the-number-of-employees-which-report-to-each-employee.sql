-- Write your PostgreSQL query statement below
SELECT 
    b.employee_id,
    b.name,
    COUNT(a.reports_to) AS reports_count,
    ROUND(AVG(a.age)::INT) AS average_age
FROM Employees a
CROSS JOIN Employees b
WHERE b.employee_id = a.reports_to
GROUP BY 1,2
HAVING COUNT(a.reports_to) >=1
ORDER BY 1

