CREATE FUNCTION udf_HoursToComplete(@StartDate DATETIME, @EndDate DATETIME) 
RETURNS INT
AS
BEGIN
	DECLARE @TotalHours INT
	IF (@StartDate IS NULL OR @EndDate IS NULL)
	BEGIN
		RETURN 0
	END
	ELSE 
	BEGIN
		SET @TotalHours = DATEDIFF(HOUR, @StartDate, @EndDate)
	END	
	RETURN @TotalHours
END
