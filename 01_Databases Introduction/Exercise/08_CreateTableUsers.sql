CREATE TABLE Users (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Username VARCHAR(30) NOT NULL,
	Password VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(900),
	LastLoginTime DATETIME,
	IsDeleted VARCHAR(5) CHECK(IsDeleted = 'true' OR IsDeleted = 'false') NOT NULL
)

INSERT INTO Users
VALUES
	('Pesho', '123456', NULL, '2020-09-28 09:39:28', 'false'),
	('Mimi', 'password', NULL, '2021-03-27 22:08:17', 'true'),
	('Tosho', '987766', NULL, '1989-04-15 07:38:08','true'),
	('Lily', '55555', NULL, '2010-11-18 12:03:10', 'false'),
	('Gosho', 'myPass', NULL, '2019-07-29 04:20:38', 'true')
