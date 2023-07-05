* The query uses two common table expressions (CTEs) to simplify the logic and make the query more readable.
* The first CTE, first_logins, finds the first login date for each player.
* The second CTE, consec_login_info, determines whether each player logged in consecutively (i.e., logged in on the day right after their first login).
* The final query groups the data by install date and calculates the number of installs and day one retention for each install date.