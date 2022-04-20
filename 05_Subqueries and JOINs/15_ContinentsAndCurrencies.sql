WITH CTE
	(ContinentCode, CurrencyCode, CurrencyUsage, dr)
AS 
(
SELECT ct.ContinentCode, c.CurrencyCode, COUNT(c.CurrencyCode) AS CurrencyUsage, 
DENSE_RANK() OVER(PARTITION BY ct.ContinentCode ORDER BY COUNT(c.CurrencyCode) DESC) as dr
	FROM Continents AS ct
	JOIN Countries AS c ON ct.ContinentCode = c.ContinentCode
GROUP BY ct.ContinentCode, CurrencyCode 
	HAVING COUNT(c.CurrencyCode) > 1
)
SELECT ContinentCode, CurrencyCode, CurrencyUsage
FROM CTE
WHERE dr = 1
ORDER BY ContinentCode 

