CREATE FUNCTION udf_FlightDestinationsByEmail(@email VARCHAR(50))
RETURNS INT
AS
BEGIN
	DECLARE @NumberOfFlightDestinations INT
	SET @NumberOfFlightDestinations = (SELECT COUNT(fd.Id) FROM FlightDestinations AS fd
		JOIN Passengers AS p ON p.Id = fd.PassengerId
		WHERE p.Email = @email)
	RETURN @NumberOfFlightDestinations
END