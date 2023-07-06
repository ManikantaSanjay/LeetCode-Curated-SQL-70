SELECT 
    e.employee_id, 
    COUNT(*) OVER(PARTITION BY e.team_id) AS team_size 
FROM 
    employee AS e
ORDER BY 
    team_size DESC;
