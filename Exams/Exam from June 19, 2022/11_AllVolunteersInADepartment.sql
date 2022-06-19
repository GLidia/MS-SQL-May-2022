CREATE FUNCTION udf_GetVolunteersCountFromADepartment (@VolunteersDepartment VARCHAR(30))
RETURNS INT
AS 
BEGIN
	DECLARE @NumberOfVolunteers INT
	SET @NumberOfVolunteers = (SELECT COUNT(v.Id) FROM Volunteers AS v
		JOIN VolunteersDepartments AS vd ON v.DepartmentId = vd.Id
		WHERE vd.DepartmentName = @VolunteersDepartment)
	RETURN @NumberOfVolunteers
END