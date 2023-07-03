# Write your MySQL query statement below
#Step 1:- Calculate Cumlative sum of frequency and store it to a new columns
#Step 2:- Now for median there are two possibilites 
#1. where cumsum = cumsum/2 (for ex:- cumsum = 12 then where cumsum is =6 that will be median incase  more than one row is satisfying this condition that's why we will take min(number)
#2. where cumsum >cumsum/2 (for this case there can be multiple rows so we. will choose min(num)
 
WITH t1 AS (
    SELECT *,
           SUM(frequency) OVER (ORDER BY num) AS cumulative_sum
    FROM Numbers
)

SELECT ROUND(AVG(num), 1) AS median
FROM t1
WHERE num = (
        SELECT MIN(num)
        FROM t1
        WHERE cumulative_sum = (
                SELECT SUM(frequency) / 2
                FROM t1
            )
    )
    OR num = (
        SELECT MIN(num)
        FROM t1
        WHERE cumulative_sum > (
                SELECT SUM(frequency) / 2
                FROM t1
            )
    )
