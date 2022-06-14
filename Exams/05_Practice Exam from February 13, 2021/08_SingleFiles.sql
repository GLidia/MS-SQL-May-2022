WITH CTE_Ids (Id)
AS
(
		SELECT f.Id
		FROM Files AS f
		EXCEPT (SELECT ParentId FROM Files)
)

SELECT CTE_Ids.Id, f.[Name], CONCAT(f.Size, 'KB') AS Size
	FROM CTE_Ids
	JOIN Files AS f ON CTE_Ids.Id = f.Id
ORDER BY CTE_Ids.Id, f.[Name], Size DESC
