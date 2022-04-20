SELECT TOP (5) c.CountryName, r.RiverName
	FROM Countries AS c
	LEFT JOIN CountriesRivers AS cr ON c.CountryCode = cr.CountryCode
	LEFT JOIN Rivers AS r on cr.RiverId = r.Id
WHERE c.ContinentCode = (SELECT ContinentCode FROM Continents WHERE ContinentName = 'Africa')
ORDER BY c.CountryName
	