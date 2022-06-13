SELECT t.CountryName, t.DistributorName FROM 
	(SELECT c.[Name] AS CountryName, d.[Name] AS DistributorName, 
		DENSE_RANK() OVER (PARTITION BY c.[Name] ORDER BY COUNT(i.Id) DESC) AS rk
		FROM Countries AS c
		JOIN Distributors AS d ON c.Id = d.CountryId
		LEFT JOIN Ingredients AS i ON i.DistributorId = d.Id
		GROUP BY c.[Name], d.[Name]
		) AS t
WHERE rk = 1
ORDER BY t.CountryName, t.DistributorName
	