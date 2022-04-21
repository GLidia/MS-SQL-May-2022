WITH CTE
	(CountryName, HighestPeakName, HighestPeakElevation, dr, Mountain)
	AS
	(
	SELECT c.CountryName, p.PeakName, p.Elevation, DENSE_RANK() OVER (Partition BY c.CountryName ORDER BY Elevation DESC) AS dr, m.MountainRange 
		FROM Countries AS c
		LEFT JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
		LEFT JOIN Peaks AS p ON mc.MountainId = p.MountainId
		LEFT JOIN Mountains m ON p.MountainId = m.Id
	)

SELECT TOP (5) CountryName AS Country, ISNULL(HighestPeakName, '(no highest peak)') AS [Highest Peak Name], 
	ISNULL(HighestPeakElevation, 0) AS [Highest Peak Elevation], ISNULL(Mountain, '(no mountain)') AS Mountain
FROM CTE
WHERE dr = 1
ORDER BY CountryName, HighestPeakName