CREATE FUNCTION dbo.udf_GetColonistsCount(@PlanetName VARCHAR (30)) 
RETURNS INT
AS
BEGIN
	DECLARE @CountOfColonistsSent INT;
	SET @CountOfColonistsSent = (SELECT Count(c.Id)
		FROM Colonists AS c
		JOIN TravelCards AS tc ON c.Id = tc.ColonistId
		JOIN Journeys AS j ON j.Id = tc.JourneyId
		JOIN Spaceports AS s ON s.Id = j.DestinationSpaceportId
		JOIN Planets AS p ON s.PlanetId = p.Id
		WHERE p.[Name] = @PlanetName)
	RETURN @CountOfColonistsSent
END


