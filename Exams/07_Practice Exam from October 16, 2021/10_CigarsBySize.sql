SELECT c.LastName, AVG(s.[Length]) AS CiagrLength, CEILING(AVG(s.RingRange)) AS CiagrRingRange
	FROM Clients AS c
	JOIN ClientsCigars AS cc ON cc.ClientId = c.Id
	JOIN Cigars AS ci ON cc.CigarId = ci.Id
	JOIN Sizes AS s ON ci.SizeId = s.Id
GROUP BY c.LastName
ORDER BY AVG(s.[Length]) DESC