-- Create a common table expression (CTE) 'main' that includes each student's ranks in each exam based on their scores
WITH main AS (
    SELECT 
        student_id,
        -- Rank students within each exam based on their scores in ascending order
        RANK() OVER (PARTITION BY exam_id ORDER BY score ASC) AS rank_asc,
        -- Rank students within each exam based on their scores in descending order
        RANK() OVER (PARTITION BY exam_id ORDER BY score DESC) AS rank_desc
    FROM 
        exam
) 

-- From the 'student' table, select students who never had the best or worst score in any exam
SELECT * 
FROM student
WHERE student_id IN (
    -- In the subquery, we are grouping by student_id and making sure that the minimum rank in either ascending or descending order is greater than 1
    -- This ensures that the student did not get the highest or lowest score in any of the exams
    SELECT student_id 
    FROM main 
    GROUP BY student_id 
    HAVING MIN(rank_asc) > 1 AND MIN(rank_desc) > 1
)
ORDER BY 
    student_id;
