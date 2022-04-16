CREATE TABLE Directors (
	Id INT IDENTITY PRIMARY KEY ,
	DirectorName VARCHAR(100) NOT NULL,
	Notes VARCHAR(MAX)
)

CREATE TABLE Genres (
	Id INT IDENTITY PRIMARY KEY,
	GenreName VARCHAR(100) NOT NULL,
	Notes VARCHAR(MAX)
)

CREATE TABLE Categories (
	Id INT IDENTITY PRIMARY KEY,
	CatogoryName VARCHAR(100) NOT NULL,
	Notes VARCHAR(MAX)
)

CREATE TABLE Movies (
	Id INT IDENTITY PRIMARY KEY,
	Title VARCHAR(50) NOT NULL,
	DirectorId INT FOREIGN KEY REFERENCES Directors(Id),
	CopyRightYear DATE,
	Length DECIMAL(5,2),
	GenreId INT FOREIGN KEY REFERENCES Genres(Id),
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
	Rating Decimal(3,1),
	Notes VARCHAR(MAX)
)

INSERT INTO Directors
VALUES
	('Steven Spielberg', NULL),
	('Martin Scorsese', 'Good director'),
	('Alfred Hitchcock', 'The best director'),
	('James Cameron', NULL),
	('Spike Lee', NULL)

INSERT INTO Genres
VALUES
	('Horror', 'Very scary'),
	('Drama', NULL),
	('Comedy', 'funny'),
	('Fantasy', NULL),
	('Romance', NULL)

INSERT INTO Categories
VALUES
	('Family', 'Can watch with kids'),
	('SciFi', NULL),
	('Action', NULL),
	('Mystery', NULL),
	('Thriller', NULL)

INSERT INTO Movies
VALUES
	('First movie', 1, '1999-03-18', 123.39, 2, 1, 8.2, 'great movie'),
	('Second movie', 2, '1976-11-29', 109.23, 1, 4, 5.6, 'average movie'),
	('Third movie', 5, '2010-08-23', 89.00, 4, 2, 10.0, 'best movie ever'),
	('Fourth movie', 3, '1987-03-26', 120.43, 2, 4, 7.6, NULL),
	('Fifth movie', 3, '1966-09-30', 113.20, 3, 5, 3.1, 'awful movie')
