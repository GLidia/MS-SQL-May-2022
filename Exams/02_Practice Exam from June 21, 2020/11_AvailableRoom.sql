CREATE FUNCTION udf_GetAvailableRoom(@HotelId INT, @Date DATE, @People INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @Message VARCHAR(100)
	DECLARE @RoomId INT
	DECLARE @RoomType NVARCHAR(20)
	DECLARE @NumberOfBeds INT
	DECLARE @TotalPrice DECIMAL(18, 2)
	DECLARE @HotelBaseRate DECIMAL(18, 2)
	DECLARE @RoomPrice DECIMAL(18,2)
	SET @RoomId = (SELECT TOP(1) Id FROM Rooms AS r
		WHERE Beds >= @People
		AND HotelId = @HotelId
		AND NOT EXISTS(SELECT * FROM Trips AS t WHERE t.RoomId = r.Id
			AND t.CancelDate IS NULL AND
			@Date BETWEEN t.ArrivalDate AND t.ReturnDate)
		ORDER BY Price DESC)
	IF @RoomId IS NULL
		RETURN 'No rooms available';
	ELSE
		SET @RoomType = (SELECT [Type] FROM Rooms WHERE Id = @RoomId)
		SET @NumberOfBeds = (SELECT Beds FROM Rooms WHERE Id = @RoomId)
		SET @HotelBaseRate = (SELECT BaseRate FROM Hotels WHERE Id = @HotelId)
		SET @RoomPrice = (Select Price FROM Rooms WHERE Id = @RoomId)
		SET @TotalPrice = (@HotelBaseRate + @RoomPrice) * @People
		SET @Message = CONCAT('Room ', @RoomId, ': ', @RoomType, ' (', @NumberOfBeds, ' beds) - $', @TotalPrice)
		RETURN @Message;
END