CREATE TABLE Employees (
	Id INT IDENTITY PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Title VARCHAR(50),
	Notes VARCHAR(MAX)
)

INSERT INTO Employees
VALUES
	('Peter', 'Petrov', 'Accountant', 'Great employee'),
	('Lily', 'Ilieva', 'Maid', NULL),
	('Tosho', 'Toshev', NULL, NULL)

CREATE TABLE Customers (
	AccountNumber INT PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	PhoneNumber INT,
	EmergencyName VARCHAR(100),
	EmergencyNumber Int,
	Notes VARCHAR(MAX)
)

INSERT INTO Customers
VALUES
	(123456789, 'Pesho', 'Peshev', 1235678, 'Tosho Peshev', 9876654, NULL),
	(987654321, 'Gosho', 'Goshev', 5556778, NULL, NULL, 'Great customer'),
	(667889876, 'Iliana', 'Ilieva', 1239876, 'Alex Alexandrov', 8768543, NULL)

CREATE TABLE RoomStatus (
	RoomStatus VARCHAR(20) PRIMARY KEY NOT NULL,
	Notes VARCHAR(MAX)
)

INSERT INTO RoomStatus
VALUES
	('Available', 'Has been cleaned'),
	('Not Available', 'Needs to be cleaned'),
	('Occupied', NULL)

CREATE TABLE RoomTypes (
	RoomType VARCHAR(20) PRIMARY KEY NOT NULL,
	Notes VARCHAR(MAX)
)

INSERT INTO RoomTypes
VALUES
	('Double', 'With TV'),
	('Single', NULL),
	('Apartment', 'Large')

CREATE TABLE BedTypes (
	BedType VARCHAR(20) PRIMARY KEY NOT NULL,
	Notes VARCHAR(MAX)
)

INSERT INTO BedTypes
VALUES
	('Queen', NULL),
	('King', NULL),
	('Double', NULL)

CREATE TABLE Rooms (
	RoomNumber INT IDENTITY PRIMARY KEY,
	RoomType VARCHAR(20) FOREIGN KEY REFERENCES RoomTypes(RoomType),
	BedType VARCHAR(20) FOREIGN KEY REFERENCES BedTypes(BedType),
	Rate INT NOT NULL,
	RoomStatus VARCHAR(20) FOREIGN KEY REFERENCES RoomStatus(RoomStatus),
	Notes VARCHAR(MAX)
)

INSERT INTO Rooms 
VALUES
	('Single', 'Queen', 40, 'Available', 'Great room'),
	('Double', 'King', 60, 'Occupied', NULL),
	('Apartment', 'King', 80, 'Not Available', 'The best apartment')

CREATE TABLE Payments (
	Id INT IDENTITY PRIMARY KEY,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
	PaymentDate Date,
	AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber),
	FirstDateOccupied DATE,
	LastDateOccupied DATE,
	TotalDays INT NOT NULL,
	AmountCharged DECIMAL(7,2) NOT NULL,
	TaxRate DECIMAL(4,2),
	TaxAmount DECIMAL(7,2),
	PaymentTotal DECIMAL(7,2),
	Notes VARCHAR(MAX)
)

INSERT INTO Payments
VAlUES
	(1, '2020-09-30', 667889876, '2020-09-28', '2020-09-30', 2, 20, 10.00, 2.00, 22.00, 'Everything paid on time'),
	(3, '2021-03-10', 123456789, '2021-03-01', '2021-03-07', 6, 120, 10.00, 12.00, 132.00, 'Some delay'),
	(2, NULL, 987654321, NULL, NULL, 5, 100, 10.00, 10.00, 110.00, NULL)

CREATE TABLE Occupancies (
	Id INT IDENTITY PRIMARY KEY,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
	DateOccupied DATE NOT NULL,
	AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber),
	RoomNumber INT FOREIGN KEY REFERENCES Rooms(RoomNumber),
	RateApplied INT,
	PhoneCharge DECIMAL(7,2),
	Notes VARCHAR(MAX)
)

INSERT INTO Occupancies
VALUES
	(1, '2021-09-08', 123456789, 2, 60, 0.0, NULL),
	(3, '2022-01-02', 987654321, 1, 40, 17.50, 'Great occupants'),
	(2, '2020-10-29', 667889876, 3, 80, 0.0, NULL)