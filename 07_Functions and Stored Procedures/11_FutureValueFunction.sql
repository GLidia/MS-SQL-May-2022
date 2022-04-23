CREATE FUNCTION ufn_CalculateFutureValue(@sum DECIMAL(18,4), @yearlyInterestRate FLOAT, @numberOfYears INT)
RETURNS DECIMAL(18,4)
AS
BEGIN
	DECLARE @futureValue DECIMAL(18,4)
	SELECT @futureValue = @sum * POWER((1 + @yearlyInterestRate), @numberOfYears)
	RETURN ROUND(@futureValue, 4)
END