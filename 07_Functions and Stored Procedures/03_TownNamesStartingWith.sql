CREATE PROC usp_GetTownsStartingWith(@str VARCHAR(MAX))
AS
	SELECT [Name] AS Town
	FROM Towns
	WHERE [Name] LIKE @str + '%'