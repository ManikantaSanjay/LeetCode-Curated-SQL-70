# Write your MySQL query statement below
WITH MonthlySalaries AS (
    SELECT 
        DATE_FORMAT(s.pay_date, '%Y-%m') AS pay_month,
        e.department_id,
        AVG(s.amount) OVER(PARTITION BY DATE_FORMAT(s.pay_date, '%Y-%m')) AS company_avg_salary,
        AVG(s.amount) OVER(PARTITION BY e.department_id, DATE_FORMAT(s.pay_date, '%Y-%m')) AS dept_avg_salary
    FROM Salary s
    JOIN Employee e ON s.employee_id = e.employee_id
)
SELECT 
    DISTINCT pay_month,department_id,
    CASE 
        WHEN dept_avg_salary > company_avg_salary THEN 'higher'
        WHEN dept_avg_salary < company_avg_salary THEN 'lower'
        ELSE 'same'
    END AS comparison
FROM 
    MonthlySalaries
ORDER BY 
    pay_month desc,department_id;