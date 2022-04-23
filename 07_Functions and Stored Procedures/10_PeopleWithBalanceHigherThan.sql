CREATE PROC usp_GetHoldersWithBalanceHigherThan(@number DECIMAL(18,4))
AS
	SELECT ah.FirstName AS [First Name], ah.LastName AS [Last Name]
	FROM AccountHolders AS ah
	JOIN Accounts AS a ON ah.Id = a.AccountHolderId 
	GROUP BY ah.FirstName, ah.LastName HAVING SUM(a.Balance) > @number
	
	ORDER BY ah.FirstName, ah.LastName
GO

EXEC usp_GetHoldersWithBalanceHigherThan 22000.1