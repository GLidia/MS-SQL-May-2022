CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @SalaryLevel VARCHAR(10)
	IF(@salary < 30000)
		SET @SalaryLevel = 'Low'
	IF(@salary BETWEEN 30000 AND 50000)
		SET @SalaryLevel = 'Average'
	IF(@salary > 50000)
		SET @SalaryLevel = 'High'
	RETURN @SalaryLevel
END