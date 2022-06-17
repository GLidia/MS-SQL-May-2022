DELETE FROM ClientsCigars
WHERE ClientId IN (SELECT Id FROM Clients WHERE AddressId IN (SELECT Id FROM Addresses WHERE Country Like 'C%'))

DELETE FROM Clients
WHERE AddressId IN (SELECT Id FROM Addresses WHERE Country Like 'C%')

DELETE FROM Addresses
WHERE Country LIKE 'C%'