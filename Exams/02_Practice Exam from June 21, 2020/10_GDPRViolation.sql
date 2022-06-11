SELECT t.Id, a.FirstName + ' ' + ISNULL(a.MiddleName + ' ', '') + a.LastName AS [Full Name],
	c.[Name] AS [From], cit.[Name] AS [To],
	CASE
		WHEN t.CancelDate IS NOT NULL THEN 'Canceled'
		ELSE CONCAT(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate), ' days')
	END AS Duration
	FROM Trips AS t
	JOIN AccountsTrips AS act ON act.TripId = t.Id
	JOIN Accounts AS a ON act.AccountId = a.Id
	JOIN Cities AS c ON a.CityId = c.Id
	JOIN Rooms AS r ON t.RoomId = r.Id
	JOIN Hotels AS h ON r.HotelId = h.Id
	JOIN Cities AS cit ON h.CityId = cit.Id
ORDER BY [Full Name], t.Id