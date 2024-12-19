-- Write your PostgreSQL query statement below
SELECT 
    x,
    y,
    z,
    CASE 
        WHEN x+y > z AND x+z > Y and z+y > x THEN 'Yes'
        ELSE 'No'
        END AS triangle
FROM Triangle
