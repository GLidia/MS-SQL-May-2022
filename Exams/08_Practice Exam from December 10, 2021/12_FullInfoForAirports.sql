CREATE PROCEDURE usp_SearchByAirportName(@airportName VARCHAR(70))
AS
	SELECT air.AirportName, p.FullName, 
		CASE	
			WHEN TicketPrice <= 400 THEN 'Low'
			WHEN TicketPrice BETWEEN 401 AND 1500 THEN 'Medium'
			ELSE 'High'
		END AS LevelOfTicketPrice,
		a.Manufacturer, a.Condition, ait.TypeName
		FROM FlightDestinations AS fd
		JOIN Airports AS air ON air.Id = fd.AirportId
		JOIN Passengers AS p ON p.Id = fd.PassengerId
		JOIN Aircraft AS a ON a.Id = fd.AircraftId
		JOIN AircraftTypes AS ait ON a.TypeId = ait.Id
WHERE air.AirportName = @airportName
ORDER BY a.Manufacturer, p.FullName

