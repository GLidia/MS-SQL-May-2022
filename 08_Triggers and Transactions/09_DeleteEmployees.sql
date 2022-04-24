CREATE TABLE Deleted_Employees (
	EmployeeId INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	MiddleName VARCHAR(50),
	JobTitle VARCHAR(50) NOT NULL,
	DepartmentID INT NOT NULL,
	Salary MONEY NOT NULL
)

CREATE TRIGGER tr_AddFiredEmployeesToDeletedEmployeesTable
ON Employees FOR DELETE
AS
	INSERT INTO Deleted_Employees(FirstName, LastName, MiddleName, JobTitle, DepartmentID, Salary)
		SELECT FirstName, LastName, MiddleName, JobTitle, DepartmentId, Salary
		FROM deleted 
GO