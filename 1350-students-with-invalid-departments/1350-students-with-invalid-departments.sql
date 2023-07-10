# Write your MySQL query statement below
-- Select students who are not associated with any department
SELECT 
    id,             -- Selecting student id
    name            -- Selecting student name
FROM 
    Students        -- From the Students table
WHERE 
    department_id   -- Where the department_id
NOT IN (
    SELECT id       -- Is not in the list of department ids
    FROM Departments -- From the Departments table
);

