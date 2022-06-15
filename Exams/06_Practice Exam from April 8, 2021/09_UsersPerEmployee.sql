SELECT CONCAT(e.FirstName, ' ', e.LastName) AS FullName, COUNT(u.Id) AS UsersCount
	FROM Employees AS e
	FULL JOIN Reports AS r ON e.Id = r.EmployeeId
	FULL JOIN Users AS u On u.Id = r.UserId
WHERE FirstName IS NOT NULL
GROUP BY e.FirstName, e.LastName
ORDER BY UsersCount DESC, FullName 
