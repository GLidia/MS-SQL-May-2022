CREATE FUNCTION udf_ClientWithCigars(@name VARCHAR(30))
RETURNS INT
AS
BEGIN
	DECLARE @TotalNumberOfCigars INT
	SET @TotalNumberOfCigars = (SELECT Count(c.Id) 
		FROM Cigars AS c
		JOIN ClientsCigars AS cc ON c.Id = cc.CigarId
		JOIN Clients AS cl ON cl.Id = cc.ClientId
		WHERE cl.FirstName = @name)
	RETURN @TotalNumberOfCigars
END