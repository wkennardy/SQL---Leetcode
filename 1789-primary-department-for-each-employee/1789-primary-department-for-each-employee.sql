-- Write your PostgreSQL query statement below
SELECT
    employee_id,
    department_id
FROM Employee
WHERE primary_flag = 'Y' OR 
    employee_id in (SELECT employee_id FROM Employee GROUP BY employee_id HAVING COUNT(department_id) = 1)
