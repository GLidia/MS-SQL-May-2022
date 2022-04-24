CREATE TABLE NotificationEmails (
	Id INT IDENTITY PRIMARY KEY,
	Recipient INT,
	Subject VARCHAR(100),
	Body VARCHAR(MAX)
)

CREATE TRIGGER tr_CreateEmailWhenRecordInsertedInLogs 
ON Logs FOR INSERT
AS
	INSERT INTO NotificationEmails(Recipient, Subject, Body)
	SELECT AccountId, CONCAT('Balance change for account: ', AccountId),
		CONCAT('On ', GETDATE(), ' your balance was changed from ', OldSum, ' to ', NewSum, '.')
		FROM inserted
GO