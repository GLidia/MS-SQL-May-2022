CREATE PROC usp_WithdrawMoney(@AccountId INT, @MoneyAmount MONEY)
AS
BEGIN TRANSACTION
	IF (@MoneyAmount > 0)
		UPDATE Accounts
			SET Balance -= @MoneyAmount
			WHERE Id = @AccountId
		DECLARE @RemainingFunds MONEY = (SELECT Balance FROM Accounts WHERE Id = @AccountId)
			IF(@RemainingFunds < 0)
				BEGIN
				ROLLBACK;
				THROW 50001, 'Insufficient funds!', 1;
				RETURN
				END
COMMIT
		