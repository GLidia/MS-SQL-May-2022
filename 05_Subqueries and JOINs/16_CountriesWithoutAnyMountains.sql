WITH CTE
	(CountryCode, MountainID)
AS
(
	SELECT c.CountryCode, mc.MountainID
	FROM Countries AS c 
	LEFT JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
	WHERE mc.MountainId IS NULL
)

SELECT COUNT(CountryCode) AS Count
	FROM CTE