CREATE PROCEDURE usp_ChangeJourneyPurpose(@JourneyId INT, @NewPurpose VARCHAR(11))
AS
	BEGIN
		IF @JourneyId NOT IN (SELECT Id FROM Journeys)
			THROW 50001, 'The journey does not exist!', 1;
	END
	BEGIN
		DECLARE @journeyPurpose VARCHAR(11)
		SET @journeyPurpose = (SELECT Purpose FROM Journeys WHERE Id = @JourneyId)
		IF @journeyPurpose = @NewPurpose
			THROW 50001, 'You cannot change the purpose!', 1;
	END
	BEGIN
		UPDATE Journeys
		SET Purpose = @NewPurpose
		WHERE Id = @JourneyId
	END
GO