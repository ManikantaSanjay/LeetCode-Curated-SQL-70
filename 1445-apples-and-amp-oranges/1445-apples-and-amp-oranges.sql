-- Calculate the daily difference in 'sold_num' based on whether the fruit is apples or not
SELECT 
    sale_date,   -- Grouping by sale date
    SUM(
        CASE 
            WHEN fruit = 'apples' THEN sold_num  -- If fruit is 'apples', add the sold_num
            ELSE -sold_num                       -- If fruit is not 'apples', subtract the sold_num
        END
    ) AS diff    -- diff column shows the calculated daily difference
FROM 
    Sales        -- Using the Sales table
GROUP BY 
    sale_date    -- Grouping the results by sale date
ORDER BY 
    sale_date;   -- Ordering the results by sale date

