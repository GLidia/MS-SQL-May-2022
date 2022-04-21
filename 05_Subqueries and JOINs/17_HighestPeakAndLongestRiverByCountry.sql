WITH CTE
	(CountryName, HighestPeakElevation, rn)
	AS
	(
	SELECT c.CountryName, p.Elevation, ROW_NUMBER() OVER (Partition BY c.CountryName ORDER BY Elevation DESC) AS rn
		FROM Countries AS c
		LEFT JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
		LEFT JOIN Peaks AS p ON mc.MountainId = p.MountainId
	),
	CTE2
	(Country, LongestRiverLength, rn2)
	AS
	(
	SELECT c.CountryName, r.Length, ROW_NUMBER() OVER (Partition BY c.CountryName ORDER BY Length DESC) AS rn2
		FROM Countries AS c
		LEFT JOIN CountriesRivers AS cr ON c.CountryCode = cr.CountryCode
		LEFT JOIN Rivers AS r ON cr.RiverId = r.Id
	)


SELECT TOP (5) CountryName, HighestPeakElevation, LongestRiverLength
	FROM CTE AS c
	INNER JOIN CTE2 AS ct ON c.CountryName = ct.Country
	WHERE rn = 1
	AND rn2 = 1
ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, CountryName