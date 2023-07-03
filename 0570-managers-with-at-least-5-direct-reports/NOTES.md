* The table "Employee" is referenced twice in the query, with aliases "E1" and "E2".
* The condition E1.managerId = E2.id is used to match each employee (E2) with their corresponding manager (E1).
* The GROUP BY E1.managerId groups the results by the manager's ID.
* The HAVING COUNT(E1.managerId) >= 5 filters the grouped results to only include managers who have at least 5 employees reporting to them.