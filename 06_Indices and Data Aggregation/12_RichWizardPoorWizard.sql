WITH CTE
(Diff)
AS
(
SELECT (DepositAmount -
		LEAD(DepositAmount) OVER(ORDER BY Id)) AS Diff
		FROM WizzardDeposits
)

SELECT SUM(Diff)
	FROM CTE