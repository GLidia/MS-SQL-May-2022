CREATE FUNCTION udf_GetCost(@JobId INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
	DECLARE @TotalCost DECIMAL(18,2)
	SET @TotalCost = (SELECT SUM(p.Price * op.Quantity)
		FROM Parts AS p 
		JOIN OrderParts AS op ON p.PartId = op.PartId
		JOIN Orders AS o ON o.OrderId = op.OrderId
		JOIN Jobs AS j ON j.JobId = o.JobId
		WHERE j.JobId = @JobId)
	RETURN ISNULL(@TotalCost, 0)
END
