CREATE TABLE Subjects (
	SubjectID INT PRIMARY KEY,
	SubjectName VARCHAR(50) NOT NULL
)

CREATE TABLE Majors (
	MajorID INT PRIMARY KEY,
	Name VARCHAR(50) NOT NULL
)

CREATE TABLE Students (
	StudentID INT PRIMARY KEY,
	StudentNumber INT NOT NULL,
	StudentName VARCHAR(50) NOT NULL,
	MajorID INT FOREIGN KEY REFERENCES Majors(MajorID)
)

CREATE TABLE Payments (
	PaymentID INT PRIMARY KEY,
	PaymentDate DATE,
	PaymentAmount DECIMAL(9,2),
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID)
)

CREATE TABLE Agenda (
	StudentID INT,
	SubjectID INT,
	CONSTRAINT PK_Agenda PRIMARY KEY(StudentID, SubjectID),
	CONSTRAINT FK_Agenda_Students FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
	CONSTRAINT FK_Agenda_Subjects FOREIGN KEY(SubjectID) REFERENCES Subjects(SubjectID)
)