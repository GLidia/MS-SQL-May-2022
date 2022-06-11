SELECT c.[Name] AS City, COUNT(h.Id) AS Hotels
	FROM Cities AS c
	JOIN Hotels AS h ON c.Id = h.CityId
	GROUP BY c.[Name]
	HAVING COUNT(h.Id) > 0
	ORDER BY COUNT(h.Id) DESC, c.[Name]