CREATE PROC usp_TransferMoney(@SenderId INT, @ReceiverId INT, @Amount MONEY)
AS
BEGIN TRANSACTION
	IF(@Amount > 0)
		BEGIN TRY
			EXEC usp_DepositMoney @ReceiverId, @Amount
			EXEC usp_WithdrawMoney @SenderId, @Amount
		END TRY
		BEGIN CATCH
			ROLLBACK
			RETURN
		END CATCH
COMMIT