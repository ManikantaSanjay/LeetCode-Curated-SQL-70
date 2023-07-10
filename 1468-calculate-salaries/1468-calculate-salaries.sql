-- Create a common table expression named 'tax_rates'
-- This table will hold each company_id and the corresponding tax rate to be applied to the employees of that company
WITH tax_rates AS (
    SELECT 
        company_id, 
        -- Determine the tax rate based on the max salary in each company
        CASE 
            WHEN MAX(salary) < 1000 THEN 0 -- Tax rate is 0% if max salary is less than 1000
            WHEN MAX(salary) BETWEEN 1000 AND 10000 THEN 0.24 -- Tax rate is 24% if max salary is between 1000 and 10000
            ELSE 0.49 -- Tax rate is 49% if max salary is more than 10000
        END AS tax_rate
    FROM Salaries
    GROUP BY company_id -- Group by company_id to calculate max salary for each company
)

-- Now calculate the salary after tax for each employee
SELECT 
    S.company_id, 
    S.employee_id, 
    S.employee_name, 
    -- Salary after tax is calculated by multiplying the original salary with (1 - tax_rate)
    -- Round function is used to round the result to the nearest integer
    ROUND((1 - T.tax_rate) * S.salary) AS salary
FROM 
    Salaries S -- Original salaries table
JOIN 
    tax_rates T ON S.company_id = T.company_id; -- Join with tax_rates table based on company_id
