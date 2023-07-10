# Write your MySQL query statement below
SELECT DISTINCT c.title  -- Select the distinct titles from the 'Content' table. 'DISTINCT' is used to eliminate duplicate entries.

FROM TVProgram tv  -- Specifies the 'TVProgram' table as the main source of data.

JOIN Content c  -- Joins the 'Content' table to the 'TVProgram' table. The alias 'c' is used for easier reference to the 'Content' table in the rest of the query.

ON tv.content_id = c.content_id  -- Specifies the condition for the join operation. The 'content_id' field is matched between 'TVProgram' and 'Content' tables.

WHERE MONTH(tv.program_date) = 6  -- Only include records where the month of 'program_date' is June (6).

AND YEAR(tv.program_date) = 2020  -- Additionally, only include records where the year of 'program_date' is 2020.

AND c.Kids_content = 'Y'  -- Further restricts the query to only include records where the 'Kids_content' field is 'Y' (Yes).

AND c.content_type = 'Movies';  -- Finally, only include records where the 'content_type' field is 'Movies'.

