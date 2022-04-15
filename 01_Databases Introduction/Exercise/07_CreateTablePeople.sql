CREATE TABLE People (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(200) NOT NULL,
	Picture VARBINARY(2000),
	Height DECIMAL(3,2),
	Weight DECIMAL(5,2),
	Gender CHAR CHECK(Gender = 'm' OR Gender = 'f') NOT NULL,
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(MAX)
)

INSERT INTO People
VALUES
	('Pesho Peshev', NULL, 1.90, NULL, 'm', '1989-01-12', 'my biography'),
	('Gosho Goshev', NULL, 1.68, 64.00, 'm', '1967-02-23', NULL),
	('Mimi Petrova', NULL, 1.70, 60.30, 'f', '1999-11-09', 'was born, is now a student'),
	('Lily Tomova', NULL, 1.57, 51.20, 'f', '1974-04-30', 'works as a librarian'),
	('Tosho Toshev', NULL, NULL, NULL, 'm', '1982-08-28', NULL)


