# Write your MySQL query statement below
SELECT 
    B.book_id,
    B.name
FROM
    Books B
LEFT JOIN
    (SELECT 
         O.book_id,
         SUM(O.quantity) AS total_sales
     FROM 
         Orders O
     WHERE 
         O.dispatch_date BETWEEN DATE('2018-06-23') AND DATE('2019-06-23')
     GROUP BY 
         O.book_id
    ) AS Sales
ON 
    B.book_id = Sales.book_id
WHERE 
    (Sales.total_sales < 10 OR Sales.total_sales IS NULL)
AND 
    B.available_from <= DATE('2019-05-23')