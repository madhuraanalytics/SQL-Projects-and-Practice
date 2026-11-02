Some Important Commands:
--EXEC sp_databases(used to check whether database is cretaed or not)

--Selecting DB(Used to know on which database we are working)

--EXEC sp_help 'TableName'(used to check existing table)

CREATE DATABASE Student_Management;

USE SQL_Practice;
GO

CREATE TABLE student_1(
Student_id INT IDENTITY(1,1)PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
Contact VARCHAR(12),
DOB DATE,
Gender CHAR(1),
Status BIT DEFAULT 1,
Age INT
);

CREATE TABLE Course(
Course_id INT IDENTITY(1,1)PRIMARY KEY,
Student_id INT,
Title VARCHAR(100) NOT NULL,
Description VARCHAR(200),
Fees Decimal(10,2),
Duration INT,
Status BIT DEFAULT 1,

FOREIGN KEY (Student_id)
REFERENCES student_1(Student_id)
);

SELECT * FROM student_1;
SELECT * FROM Course;

INSERT INTO student_1(Name,Contact,DOB,Gender,Status,Age)
VALUES('Amit Gupta','9786540072','2001-05-10','M',1,22),
('Rahul Sharma','9723124360','2000-03-17','M',0,20),
('Komal Soni','9565624360','2001-11-30','F',1,21),
('Riya Malhotra','8787860960','2002-08-08','F',1,21);

INSERT INTO Course(Student_id,Title,Description,Fees,Duration,Status)
VALUES(4,'SQL', 'SQL Server fundamentals', 12000.00, 3, 1),
(5,'Python', 'Python for data analysis', 15000.00, 4, 0),
(6,'Power BI', 'Dashboard and reporting course', 10000.00, 2, 1),
(7,'Advanced SQL', 'Joins, subqueries and window functions', 18000.00, 3, 1);


EXEC sp_help 'Course';
/*
ALTER TABLE Course
DROP CONSTRAINT FK__Course__Student___0B91BA14;

ALTER TABLE Course
ADD CONSTRAINT FK_Course_Student
FOREIGN KEY (student_id)
REFERENCES student_1(student_id)
ON UPDATE CASCADE;

UPDATE student_1
SET Student_id = 1
WHERE Student_id = 4;

ALTER TABLE Course
DROP CONSTRAINT FK_Course_Student

ALTER TABLE Course
ADD CONSTRAINT FK_Course_Student1
FOREIGN KEY (Student_id)
REFERENCES student_1(Student_id)
ON UPDATE CASCADE;

UPDATE student_1
SET Student_id = 1
WHERE Student_id= 4;
*/

/*ALTER TABLE Course
DROP CONSTRAINT FK_Course_Student1;

ALTER TABLE Course
ADD CONSTRAINT FK_Course_Student2
FOREIGN KEY (Student_id)
REFERENCES student_1(Student_id)
ON UPDATE CASCADE;

UPDATE student_1
SET Student_id=1
WHERE Student_id=4;*/

DELETE FROM Course
WHERE Course_id IN (5,6,7,8);

UPDATE Course
SET Status=0
WHERE Student_id=5

SELECT * FROM student_1;
SELECT * FROM Course;



