-- Write your PostgreSQL query statement below
SELECT 
    a.machine_id,
    ROUND(AVG(b.timestamp - a.timestamp)::NUMERIC, 3) AS processing_time
FROM Activity a
INNER JOIN Activity b
ON b.machine_id = a.machine_id 
   AND b.process_id = a.process_id
WHERE a.activity_type = 'start' 
  AND b.activity_type = 'end'
GROUP BY a.machine_id;
