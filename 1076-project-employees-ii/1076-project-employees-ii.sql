WITH project_counts AS (
    SELECT project_id, COUNT(employee_id) AS num_employees
    FROM Project
    GROUP BY project_id
)

SELECT project_id
FROM project_counts
WHERE num_employees = (SELECT MAX(num_employees) FROM project_counts);
