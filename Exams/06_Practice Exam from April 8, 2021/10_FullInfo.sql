SELECT ISNULL(e.FirstName + ' ' + e.LastName, 'None') AS Employee,
	ISNULL(d.[Name], 'None') AS Department,
	ISNULL(c.[Name], 'None') AS Category,
	r.[Description],
	FORMAT(r.OpenDate, 'dd.MM.yyyy') AS OpenDate,
	s.[Label] AS [Status],
	ISNULL(u.[Name], 'None') AS [User]
FROM Reports AS r
	LEFT JOIN Employees AS e ON e.Id = r.EmployeeId
	LEFT JOIN Categories AS c ON c.Id = r.CategoryId
	LEFT JOIN Departments AS d ON e.DepartmentId = d.Id
	LEFT JOIN [Status] AS s ON s.Id = r.StatusId
	LEFT JOIN Users AS u ON u.Id = r.UserId
ORDER BY FirstName DESC, LastName DESC, d.[Name], c.[Name], r.[Description], r.OpenDate, s.[Label], u.[Name] 