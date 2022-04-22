SELECT TOP (10) FirstName, LastName, DepartmentID
	FROM Employees AS e 
	WHERE e.Salary > (SELECT AVG(Salary) FROM Employees AS em WHERE e.DepartmentID = em.DepartmentID GROUP BY DepartmentID)
	ORDER BY DepartmentID

