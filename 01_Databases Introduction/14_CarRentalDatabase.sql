CREATE TABLE Categories (
	Id INT IDENTITY PRIMARY KEY,
	CategoryName VARCHAR(50) NOT NULL,
	DailyRate DECIMAL(5,2),
	WeeklyRate DECIMAL(5,2),
	MonthlyRate DECIMAL(5,2),
	WeekendRate DECIMAL(5,2)
)

INSERT INTO Categories
VALUES
	('Category1', 3.29, 4.23, 2.34, NULL),
	('Category2', 19.23, 37.23, 1.83, 8.32),
	('Category3', 58.12, 3.82, 93.21, 48.2)

CREATE TABLE Cars (
	Id INT IDENTITY PRIMARY KEY,
	PlateNumber VARCHAR(20) NOT NULL,
	Manufacturer VARCHAR(50),
	Model VARCHAR(50),
	CarYear DATE,
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
	Doors INT,
	Picture IMAGE,
	Condition VARCHAR(200),
	Available VARCHAR(5) CHECK (Available = 'true' OR Available = 'false')
)

INSERT INTO Cars
VALUES
	('SB1234BE', NULL, 'Model', '2010-02-07', 3, 4, NULL, 'Good', 'true'),
	('SB9876EW', 'Manufacturer', 'Another Model', NULL, 2, 2, NULL, 'New', 'true'),
	('MN6754ME', 'Manufacturer', 'Model', '1998-10-23', 1, 3, NULL, 'Bad', 'false')

CREATE TABLE Employees (
	Id INT IDENTITY PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Title VARCHAR(50),
	Notes VARCHAR(MAX)
)

INSERT INTO Employees
VALUES
	('Pesho', 'Peshev', 'Engineer', 'Great employee'),
	('Lily', 'Petrova', 'Mechanic', NULL),
	('Tosho', 'Toshev', NULL, 'Good worker')

CREATE TABLE Customers (
	Id INT IDENTITY PRIMARY KEY,
	DriverLicenceNumber INT NOT NULL,
	FullName VARCHAR(100) NOT NULL,
	Address VARCHAR(250),
	City VARCHAR(50),
	ZIPCode INT,
	Notes VARCHAR(MAX)
)

INSERT INTO Customers
VALUES
	(1234567, 'Petar Petrov', NULL, 'Sofia', 1000, 'Great customer'),
	(9876654, 'Maria Ilieva', NULL, 'Plovdiv', 4000, NULL),
	(3672819, 'Vassil Vassilev', 'First Street N.4', 'Sofia', 1010, NULL)

CREATE TABLE RentalOrders (
	Id INT IDENTITY PRIMARY KEY,
	CustomerId INT FOREIGN KEY REFERENCES Customers(Id),
	CarId INT FOREIGN KEY REFERENCES Cars(Id),
	TankLevel INT,
	KilometrageStart DECIMAL(10,2),
	KilometrageEnd DECIMAL(10,2),
	TotalKilometrage DECIMAL(10,2),
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	TotalDays INT,
	RateApplied INT,
	TaxRate DECIMAL(5,2),
	OrderStatus VARCHAR(50),
	Notes VARCHAR(MAX)
)

INSERT INTO RentalOrders
VALUES
	(2, 1, 8, 10000.00, 15000.00, NULL, '2020-09-12', '2020-09-15', 3, NULL, 8.30, 'Completed', NULL),
	(1, 3, 5, 0.00, 2000.00, 2000.00, '2010-10-01', '2010-10-30' , 29, 20, 8.30, NULL, 'Great rental'),
	(1, 2, 10, NULL, NULL, 120000.00, '2021-10-13', '2021-10-14', 1, 49, 10.00, 'Completed', NULL)