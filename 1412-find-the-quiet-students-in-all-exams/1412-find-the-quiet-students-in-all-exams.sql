# Write your MySQL query statement below
SELECT
    S.student_id,
    S.student_name
FROM
    Student S
WHERE
    S.student_id NOT IN (
        SELECT
            E.student_id
        FROM
            Exam E
        WHERE
            E.score IN (
                SELECT
                    MAX(score)
                FROM
                    Exam
                WHERE
                    exam_id = E.exam_id
                
                UNION
                
                SELECT
                    MIN(score)
                FROM
                    Exam
                WHERE
                    exam_id = E.exam_id
            )
    )
    AND S.student_id IN (
        SELECT DISTINCT
            student_id
        FROM
            Exam
    )
ORDER BY
    S.student_id;
