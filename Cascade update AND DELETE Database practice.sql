

USE Database Name
SELECT DB_NAME()

--1.COMPANY AND BRANCH

USE SQL_Practice;
GO
--PARENT TABLE:
CREATE TABLE Company(
Company_ID INT PRIMARY KEY,
Company_Name VARCHAR(100)
);

INSERT INTO Company(Company_ID,Company_Name)
VALUES(101,'Infograins'),
(102,'TCS'),
(103,'Oracle'),
(104,'Infosys');

SELECT * FROM Company;
/*
--Child Table
CREATE TABLE Branch(
Branch_Id INT PRIMARY KEY,
Branch_Name VARCHAR(100),
Company_ID INT,

FOREIGN KEY(Company_ID)
REFERENCES Company(Company_ID)
ON DELETE CASCADE
ON DELETE CASCADE
);

SELECT * FROM Company;
SELECT * FROM Branch;

INSERT INTO Branch(Branch_Id,Branch_Name,Company_ID)
VALUES(1,'Pune Branch',101),
(2,'Indore Branch',102),
(3,'Bangalore Branch',103),
(4,'Indore Branch',104);

DELETE FROM Branch
WHERE Company_ID = 101;

*/

DROP TABLE Branch;

CREATE TABLE Branch(
Branch_Id INT PRIMARY KEY,
Branch_Name VARCHAR(100),
Company_ID INT,

FOREIGN KEY(Company_ID)
REFERENCES Company(Company_ID)
ON DELETE CASCADE
);

INSERT INTO Branch(Branch_Id,Branch_Name,Company_ID)
VALUES(1,'Pune Branch',101),
(2,'Indore Branch',102),
(3,'Bangalore Branch',103),
(4,'Indore Branch',104);

SELECT * FROM Company;
SELECT * FROM Branch;

DELETE FROM Branch
WHERE Company_ID = 101;

DELETE FROM Company
WHERE Company_ID = 102;

DELETE FROM Company
WHERE Company_ID = 103;

INSERT INTO Branch(Branch_Id,Branch_Name,Company_ID)
VALUES(1,'Pune Branch',101);


--2.HOSPITAL AND PATIENTS

USE SQL_Practice;
GO
--Parent Table
CREATE TABLE Doctors(
Doctor_ID INT PRIMARY KEY,
Doctor_Name VARCHAR(100) NOT NULL,
);

--Child Table
CREATE TABLE Patient(
Patient_ID INT PRIMARY KEY,
Patient_Name VARCHAR(100) NOT NULL,
Gender CHAR(1),
Doctor_ID INT),
);

INSERT INTO Doctors(Doctor_ID,Doctor_Name)
VALUES(121,'Tarun Mehra'),(122,'Sahil Nagar'),
(123,'Garima Sharma'),(124,'Parul Gupta');

INSERT INTO Patient(Patient_ID,Patient_Name,Gender)
VALUES(101,'Jayesh Jaiswal','M'),
(102,'Sonal Jain','F'),(103,'Swati Patel','F'),
(104,'Deepak Pardesi','M');

SELECT * FROM Doctors;
SELECT * FROM Patient;

INSERT INTO Patient(Doctor_ID)
VALUES(121),(122),(123),(124);

UPDATE Patient
SET Doctor_ID = 121
WHERE Patient_ID = 101;

UPDATE Patient
SET Doctor_ID = 122
WHERE Patient_ID = 102;

UPDATE Patient
SET Doctor_ID = 123
WHERE Patient_ID = 103;

UPDATE Patient
SET Doctor_ID = 124
WHERE Patient_ID = 104;

SELECT * FROM Doctors;
SELECT * FROM Patient;

UPDATE Doctors
SET Doctor_ID

--If we forget to add cascade delete and update command in table 
EXEC sp_help 'Patient';

--If we forget to add Foreign key in table 
ALTER TABLE Patient
ADD CONSTRAINT FK_Doctor_ID
FOREIGN KEY(Doctor_ID)
REFERENCES Doctors(Doctor_ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

--CASCADE UPDATE:
UPDATE Doctors
SET Doctor_ID = 225
WHERE Doctor_ID = 124;

--CASCADE DELETE:
DELETE FROM Doctors
WHERE Doctor_ID = 121;

