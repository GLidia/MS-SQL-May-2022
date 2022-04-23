CREATE PROC usp_DeleteEmployeesFromDepartment(@departmentID INT)
AS

	DELETE FROM EmployeesProjects
		WHERE EmployeeID IN (SELECT EmployeeID FROM Employees WHERE DepartmentID = @departmentID)

	UPDATE Employees
		SET ManagerID = NULL WHERE ManagerID IN (SELECT EmployeeID FROM Employees WHERE DepartmentID = @departmentID)

	ALTER TABLE Departments
		ALTER COLUMN ManagerID INT	

	UPDATE Departments
		SET ManagerID = NULL WHERE ManagerID IN (SELECT EmployeeID FROM Employees WHERE DepartmentID = @departmentID)

	DELETE FROM Employees
		WHERE DepartmentID = @departmentID
	DELETE FROM Departments
		WHERE DepartmentID = @departmentID
	SELECT COUNT(*) FROM Employees
		WHERE DepartmentID = @departmentID
	