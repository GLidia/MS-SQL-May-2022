SELECT CONCAT(o.[Name], '-', a.[Name]) AS OwnersAnimals, o.PhoneNumber, ac.CageId
	FROM Owners AS o
	JOIN Animals AS a ON o.Id = a.OwnerId
	JOIN AnimalTypes AS ant ON ant.Id = a.AnimalTypeId
	JOIN AnimalsCages AS ac ON ac.AnimalId = a.Id
WHERE ant.AnimalType = 'mammals'
ORDER BY o.[Name], a.[Name] DESC