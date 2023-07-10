# Write your MySQL query statement below
SELECT 
    sell_date, -- Select 'sell_date' from the 'Activities' table.
    
    COUNT(DISTINCT product) as num_sold, -- Count the distinct number of 'product' sold on each 'sell_date'. The result is given the new column name 'num_sold'.
    
    GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') as products -- Concatenate distinct 'product' values sold on each 'sell_date', ordered in ascending order. The concatenated string is separated by commas. The result is given the new column name 'products'.
    
FROM Activities -- Specifies the 'Activities' table as the source of data.
    
GROUP BY sell_date -- Group the selected data by the 'sell_date'. This allows the COUNT and GROUP_CONCAT functions to operate on each set of 'product' that share the same 'sell_date'.
    
ORDER BY sell_date; -- Orders the final result set by 'sell_date'.

