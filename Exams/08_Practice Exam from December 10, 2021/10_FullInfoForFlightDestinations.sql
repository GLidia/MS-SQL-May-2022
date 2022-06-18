SELECT a.AirportName, fd.[Start], fd.TicketPrice, p.FullName, air.Manufacturer, air.Model
	FROM FlightDestinations AS fd
	JOIN Airports AS a ON fd.AirportId = a.Id
	JOIN Passengers AS p ON fd.PassengerId = p.Id
	JOIN Aircraft AS air ON air.Id = fd.AircraftId
WHERE DATEPART(HOUR, fd.[Start]) BETWEEN 6 AND 19
	AND fd.TicketPrice > 2500
ORDER BY air.Model
	