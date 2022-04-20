SELECT c.CountryCode, COUNT(m.MountainRange) AS MountainRanges
	FROM Countries AS c 
	JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
	JOIN Mountains AS m ON m.Id = mc.MountainId
WHERE c.CountryCode IN (SELECT CountryCode FROM Countries WHERE CountryName IN ('United States', 'Russia', 'Bulgaria'))
GROUP BY c.CountryCode
