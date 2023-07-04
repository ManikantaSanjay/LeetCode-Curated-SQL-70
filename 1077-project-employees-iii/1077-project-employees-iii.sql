WITH CTE AS (
    SELECT project_id,
           p.employee_id,
           RANK() OVER(PARTITION BY project_id ORDER BY experience_years DESC) AS exp_rank
    FROM Project p 
    JOIN Employee e ON p.employee_id = e.employee_id
)


SELECT project_id, employee_id
FROM CTE
WHERE exp_rank = 1;
