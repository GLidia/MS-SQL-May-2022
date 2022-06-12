SELECT t.Mechanic, t.[Average Days] FROM
	(SELECT CONCAT(m.FirstName, ' ', m.LastName) AS Mechanic, m.MechanicId,
		AVG(DATEDIFF(DAY, j.IssueDate, j.FinishDate)) AS [Average Days]
		FROM Mechanics AS m
		JOIN Jobs AS j ON m.MechanicId = j.MechanicId
		GROUP BY m.FirstName, m.LastName, m.MechanicId
		) AS t
ORDER BY t.MechanicId