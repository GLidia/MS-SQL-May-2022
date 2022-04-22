WITH CTE
(DepartmentID, Salary, r)
AS
(
SELECT DepartmentID, Salary, 
	RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS r
	FROM Employees
	GROUP BY DepartmentID, Salary
)

SELECT DepartmentID, Salary AS ThirdHighestSalary
	FROM CTE
	WHERE r = 3
