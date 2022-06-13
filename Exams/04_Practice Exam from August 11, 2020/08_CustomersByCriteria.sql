SELECT FirstName, Age, PhoneNumber 
	FROM Customers
WHERE (Age >= 21 AND FirstName LIKE '%an%')
	OR (PhoneNumber LIKE '%38' AND CountryId != (Select Id FROM Countries WHERE [Name] = 'Greece'))
ORDER BY FirstName, Age DESC