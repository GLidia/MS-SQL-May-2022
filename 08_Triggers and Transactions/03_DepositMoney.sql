CREATE PROC usp_DepositMoney(@AccountId INT, @MoneyAmount MONEY)
AS
BEGIN TRANSACTION
	IF(@MoneyAmount > 0)
		UPDATE Accounts
			SET Balance = Balance + @MoneyAmount
			WHERE Id = @AccountId
COMMIT
