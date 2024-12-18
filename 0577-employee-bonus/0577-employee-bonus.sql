-- Write your PostgreSQL query statement below
SELECT 
    e.name,
    b.bonus
FROM Bonus b
RIGHT JOIN Employee e
ON e.empId = b.empId
WHERE b.bonus <1000
    OR bonus IS NULL
