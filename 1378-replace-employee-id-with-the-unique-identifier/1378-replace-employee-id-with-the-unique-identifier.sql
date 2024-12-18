-- Write your PostgreSQL query statement below
SELECT
    unique_id,
    name
FROM EmployeeUNI AS u
RIGHT JOIN Employees AS e
ON u.id = e.id