SELECT a.Id, a.Email, c.[Name], COUNT(t.Id) AS Trips
	FROM Accounts AS a
	JOIN Cities AS c ON a.CityId = c.Id
	JOIN AccountsTrips AS act ON act.AccountId = a.Id
	JOIN Trips AS t ON t.Id = act.TripId
	JOIN Rooms AS r ON t.RoomId = r.Id
	JOIN Hotels AS h ON h.Id = r.HotelId
WHERE h.CityId = a.CityId
GROUP BY a.Id, a.Email, c.[Name] 
ORDER BY COUNT(t.Id) DESC, a.Id