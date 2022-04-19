SELECT e.EmployeeID, e.FirstName, e.ManagerID, e2.FirstName
	FROM Employees e, Employees e2
	WHERE e2.FirstName = (SELECT FirstName FROM Employees WHERE e.ManagerID = EmployeeID)
AND e.ManagerID IN (3, 7)
ORDER BY EmployeeID