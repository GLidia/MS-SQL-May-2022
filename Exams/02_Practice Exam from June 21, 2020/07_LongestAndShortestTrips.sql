SELECT a.Id AS AccountId, 
		CONCAT(a.FirstName, ' ', a.LastName) AS FullName,
		MAX(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate)) AS LongestTrip,
		MIN(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate)) AS ShortestTrip
		FROM AccountsTrips AS act
		JOIN Accounts AS a ON a.Id = act.AccountId
		JOIN Trips AS t ON t.Id = act.TripId
		WHERE a.MiddleName IS NULL AND t.CancelDate IS NULL
		GROUP BY a.Id, a.FirstName, a.LastName
ORDER BY LongestTrip DESC, ShortestTrip