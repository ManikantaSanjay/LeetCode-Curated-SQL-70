# Write your MySQL query statement below
SELECT      E2.name
FROM        Employee E1, Employee E2
WHERE       E1.managerId  = E2.id  
GROUP BY    E1.managerId
HAVING      COUNT(E1.managerId) >= 5 
