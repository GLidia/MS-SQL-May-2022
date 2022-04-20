SELECT c.CountryCode, m.MountainRange, p.PeakName, p.Elevation
	FROM Countries AS c
	JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
	JOIN Mountains AS m ON mc.MountainID = m.Id
	JOIN Peaks AS p ON m.Id = p.MountainId
WHERE c.CountryCode = (SELECT CountryCode FROM Countries WHERE CountryName = 'Bulgaria')
AND p.Elevation > 2835
ORDER BY p.Elevation DESC