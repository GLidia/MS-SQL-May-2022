CREATE FUNCTION ufn_CashInUsersGames(@gameName VARCHAR(100))
RETURNS TABLE
AS
RETURN
(
	SELECT SUM(query.SumCash) AS SumCash
		FROM ( 
		SELECT ug.Cash AS SumCash, ROW_NUMBER() OVER(PARTITION BY g.Id ORDER BY ug.Cash DESC) AS rn
		FROM UsersGames AS ug 
		JOIN Games AS g ON g.Id = ug.GameId
		WHERE g.Name = @gameName) AS query
		WHERE query.rn % 2 = 1
)
