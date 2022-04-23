CREATE PROC usp_CalculateFutureValueForAccount(@accountID INT, @interestRate DECIMAL(4,2))
AS
	SELECT a.Id AS [Account Id], ah.FirstName AS [First Name], ah.LastName AS [Last Name], a.Balance AS [Current Balance], 
		dbo.ufn_CalculateFutureValue(a.Balance, @interestRate, 5) AS [Balance in 5 years]
		FROM AccountHolders AS ah
		JOIN Accounts AS a ON ah.Id = a.AccountHolderId
		WHERE a.Id = @accountID
GO

EXEC usp_CalculateFutureValueForAccount 1, 0.1