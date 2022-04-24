CREATE PROC usp_AssignProject(@employeeId INT, @projectID INT)
AS
BEGIN TRANSACTION
	
	INSERT INTO EmployeesProjects(EmployeeID, ProjectID)
		VALUES (@employeeId, @projectID)

	DECLARE @ProjectsCount INT = (SELECT COUNT(ProjectID) FROM EmployeesProjects WHERE EmployeeID = @employeeId)
	IF (@ProjectsCount > 3)
		BEGIN
			ROLLBACK;
			THROW 50001, 'The employee has too many projects!', 1;
			RETURN
		END
COMMIT
