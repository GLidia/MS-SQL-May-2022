CREATE TABLE Countries (
	Id INT IDENTITY NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(50) UNIQUE
)

CREATE TABLE Customers (
	Id INT IDENTITY NOT NULL PRIMARY KEY,
	FirstName NVARCHAR(25),
	LastName NVARCHAR(25),
	Gender CHAR(1) CHECK(Gender IN ('M', 'F')),
	Age INT,
	PhoneNumber NCHAR(10) CHECK(LEN(PhoneNumber) = 10),
	CountryId INT FOREIGN KEY REFERENCES Countries(Id)
)

CREATE TABLE Products (
	Id INT IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(25) UNIQUE,
	[Description] NVARCHAR(250),
	Recipe NVARCHAR(MAX),
	Price DECIMAL(18,2) CHECK(Price > 0)
)	

CREATE TABLE Feedbacks (
	Id INT IDENTITY NOT NULL PRIMARY KEY,
	[Description] NVARCHAR(255),
	Rate DECIMAL(5,2) CHECK(Rate BETWEEN 0 AND 10),
	ProductId INT FOREIGN KEY REFERENCES Products(Id),
	CustomerId INT FOREIGN KEY REFERENCES Customers(Id)
)

CREATE TABLE Distributors (
	Id INT IDENTITY NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(25) UNIQUE,
	AddressText NVARCHAR(30),
	Summary NVARCHAR(200),
	CountryId INT FOREIGN KEY REFERENCES Countries(Id)
)

CREATE TABLE Ingredients (
	Id INT IDENTITY NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(30),
	[Description] NVARCHAR(200),
	OriginCountryId INT FOREIGN KEY REFERENCES Countries(Id),
	DistributorId INT FOREIGN KEY REFERENCES Distributors(Id)
)

CREATE TABLE ProductsIngredients (
	ProductId INT NOT NULL FOREIGN KEY REFERENCES Products(Id),
	IngredientId INT NOT NULL FOREIGN KEY REFERENCES Ingredients(Id),
	CONSTRAINT PK_ProductsIngredients PRIMARY KEY(ProductId, IngredientId)
)