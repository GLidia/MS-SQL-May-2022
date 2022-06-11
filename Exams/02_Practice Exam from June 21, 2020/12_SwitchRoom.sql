CREATE PROCEDURE usp_SwitchRoom(@TripId INT, @TargetRoomId INT)
AS
	DECLARE @HotelOfTripId INT
	DECLARE @HotelOfTargetRoomId INT
	DECLARE @TargetRoomBedCount INT
	DECLARE @TripAccountsCount INT
	SET @HotelOfTripId = (SELECT h.Id FROM Hotels AS h
		JOIN Rooms AS r ON h.Id = r.HotelId
		JOIN Trips AS t ON r.Id = t.RoomId
		WHERE t.Id = @TripId)
	SET @HotelOfTargetRoomId = (SELECT h.Id FROM Hotels AS h
		JOIN Rooms AS r On h.Id = r.HotelId
		WHERE r.Id = @TargetRoomId)
	BEGIN
		IF @HotelOfTripId != @HotelOfTargetRoomId
			THROW 50001, 'Target room is in another hotel!', 1;
	END
	SET @TargetRoomBedCount = (SELECT Beds FROM Rooms WHERE Id = @TargetRoomId)
	SET @TripAccountsCount = (SELECT COUNT(a.Id) FROM Accounts AS a
		JOIN AccountsTrips AS act ON a.Id = act.AccountId
		WHERE act.TripId = @TripId)
	BEGIN
		IF @TargetRoomBedCount < @TripAccountsCount
		THROW 50001, 'Not enough beds in target room!', 1;
	END
	UPDATE Trips
	SET RoomId = @TargetRoomId
	WHERE Id = @TripId
GO

