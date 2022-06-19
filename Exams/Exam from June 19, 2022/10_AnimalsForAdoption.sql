SELECT a.[Name], YEAR(a.BirthDate) AS BirthYear, ant.AnimalType
	FROM Animals AS a
	JOIN AnimalTypes AS ant ON ant.Id = a.AnimalTypeId
WHERE ant.AnimalType != 'Birds'
	AND DATEDIFF(YEAR, a.BirthDate, '01/01/2022') < 5
	AND a.OwnerId IS NULL
ORDER BY a.[Name]