-- Select all columns
SELECT * 
FROM Users  -- From the Users table
WHERE 
    mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\.com$'  -- Where the email adheres to the regular expression. The regex enforces that the email must start with a letter and can then have any alphanumeric characters or special characters ('.', '_', '-'). It must end with '@leetcode.com'.
AND 
    mail NOT LIKE '%?%';  -- In addition, the email should not contain any '?' character.
