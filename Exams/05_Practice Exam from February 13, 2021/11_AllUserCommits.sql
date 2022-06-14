CREATE FUNCTION udf_AllUserCommits(@username VARCHAR(50))
RETURNS INT
AS
BEGIN
	DECLARE @CountOfCommits INT
	SET @CountOfCommits = (SELECT COUNT(Id) FROM Commits WHERE ContributorId = 
		(SELECT Id FROM Users WHERE Username = @username))
	RETURN @CountOfCommits
END