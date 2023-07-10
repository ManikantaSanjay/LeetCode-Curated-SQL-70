# Write your MySQL query statement below
SELECT 
    Q.id,
    Q.year,
    COALESCE(N.npv, 0) AS npv
FROM 
    Queries Q
LEFT JOIN
    NPV N ON Q.id = N.id AND Q.year = N.year;
