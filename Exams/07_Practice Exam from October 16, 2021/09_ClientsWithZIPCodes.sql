SELECT CONCAT(c.FirstName, ' ', c.LastName) AS FullName, a.Country, a.ZIP, CONCAT('$', MAX(ci.PriceForSingleCigar)) AS CigarPrice
	FROM Clients AS c
	JOIN Addresses AS a ON c.AddressId = a.Id
	JOIN ClientsCigars AS cc ON c.Id = cc.ClientId
	JOIN Cigars AS ci ON ci.Id = cc.CigarId
WHERE a.ZIP NOT LIKE '%[^0-9]%'
GROUP BY c.FirstName, c.LastName, a.Country, a.ZIP
