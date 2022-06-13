CREATE VIEW v_UserWithCountries 
AS
	SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, c.Age, c.Gender, cou.[Name] AS CountryName
	FROM Customers AS c
	JOIN Countries AS cou ON c.CountryId = cou.Id
