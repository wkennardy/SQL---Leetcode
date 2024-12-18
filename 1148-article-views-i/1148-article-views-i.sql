-- Write your PostgreSQL query statement below
SELECT 
    author_id AS id
FROM Views
WHERE author_id = viewer_id 
GROUP BY 1
ORDER BY 1 ASC;