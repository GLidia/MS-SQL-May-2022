SELECT FirstName 
	FROM Employees
	WHERE DepartmentID in (3, 10)
	AND DATEPART(YEAR, HireDATE) BETWEEN 1995 AND 2005