SELECT [Name], PhoneNumber, 
	CASE
		WHEN [Address] LIKE '%Sofia , %' THEN REPLACE([Address], ' Sofia , ', '') 
		WHEN [Address] LIKE 'Sofia, %' THEN REPLACE([Address], 'Sofia, ', '')
		END AS [Address]
	FROM Volunteers AS v
	JOIN VolunteersDepartments AS vd ON v.DepartmentId = vd.Id
WHERE vd.DepartmentName = 'Education program assistant'
	AND [Address] LIKE '%Sofia%'
ORDER BY [Name]