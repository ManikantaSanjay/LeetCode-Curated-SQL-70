# Write your MySQL query statement below
WITH CTE AS (
  SELECT *,
         RANK() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id) AS rnk
  FROM Enrollments
)

SELECT student_id, course_id, grade
FROM CTE
WHERE rnk = 1;
