CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(MAX), @word VARCHAR(50))
RETURNS INT
AS
BEGIN
	DECLARE @count INT = 1;
	WHILE @count <= LEN(@word)
	BEGIN
		DECLARE @currentLetter CHAR(1) = SUBSTRING(@word, @count, 1)
		IF (CHARINDEX(@currentLetter, @setOfLetters) = 0)
			RETURN 0
		ELSE
			SET @count = @count + 1
	END
	RETURN 1
END
