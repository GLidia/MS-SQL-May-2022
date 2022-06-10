SELECT t.JobDuringJourney, t.FullName, t.JobRank FROM
	(SELECT 
	tc.JobDuringJourney, 
	CONCAT(FirstName, ' ', LastName) AS FullName,
	DENSE_RANK() OVER (PARTITION BY tc.JobDuringJourney ORDER BY c.BirthDate) AS JobRank
	FROM Colonists AS c
	JOIN TravelCards AS tc ON c.Id = tc.ColonistId) AS t
WHERE t.JobRank = 2
