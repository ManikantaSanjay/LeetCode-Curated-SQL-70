# Write your MySQL query statement below
SELECT MIN(distance) AS shortest 
FROM (
  SELECT x, ABS(x - LEAD(x) OVER (ORDER BY x ASC)) AS distance 
  FROM point
) AS subquery;