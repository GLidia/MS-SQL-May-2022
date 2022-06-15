CREATE PROCEDURE usp_AssignEmployeeToReport(@EmployeeId INT, @ReportId INT) 
AS
BEGIN
	DECLARE @EmployeeDepartmentId INT
	DECLARE @ReportCategoryDepartmentId INT
	SET @EmployeeDepartmentId = (SELECT DepartmentId FROM Employees WHERE Id = @EmployeeId)
	SET @ReportCategoryDepartmentId = (SELECT c.DepartmentId FROM Categories AS c
		JOIN Reports AS r ON r.CategoryId = c.Id 
		WHERE r.Id = @ReportId)
	IF (@EmployeeDepartmentId != @ReportCategoryDepartmentId)
		THROW 50001, 'Employee doesn''t belong to the appropriate department!', 1
	ELSE IF (@EmployeeDepartmentId = @ReportCategoryDepartmentId)
		BEGIN
		UPDATE Reports SET EmployeeId = @EmployeeId	WHERE @ReportId = Id
		END
END
