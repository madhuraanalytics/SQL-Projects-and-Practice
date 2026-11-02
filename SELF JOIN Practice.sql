USE Data_Analyst_Practice;
GO

--DATASET: 1

CREATE TABLE Employees_Join
(
Employee_ID INT PRIMARY KEY,
Employee_Name VARCHAR(50),
Department VARCHAR(50),
Manager_ID INT
);

INSERT INTO Employees_Join
VALUES
(1,'Amit','HR',NULL),
(2,'Rahul','IT',1),
(3,'Riya','IT',1),
(4,'Neha','Finance',2),
(5,'Komal','Finance',2),
(6,'Arjun','Sales',3),
(7,'Priya','Marketing',3);

SELECT * FROM Employees_Join;

--1. Show every employee with their manager.
SELECT
E.Employee_Name AS Employee,
M.Employee_Name AS Manager
FROM Employees_Join E
INNER JOIN Employees_Join M
ON E.Manager_ID = M.Employee_ID;

--2. Show manager name with department.
SELECT
M.Employee_Name as Manager,
E.Department AS Dept_Name
FROM Employees_Join E
INNER JOIN Employees_Join M
ON E.Manager_ID = M.Employee_ID;

--3. Show employees who do not have a manager.
SELECT
E.Employee_Name AS Employee,
M.Employee_Name AS Manager
FROM Employees_Join E
LEFT JOIN Employees_Join M
ON E.Manager_ID = M.Employee_ID
WHERE E.Manager_ID IS NULL;


--DATASET: 2 Student and Mentor
CREATE TABLE Students
(
Student_ID INT PRIMARY KEY,
Student_Name VARCHAR(50),
Mentor_ID INT
);

INSERT INTO Students
VALUES
(1,'Rahul',NULL),
(2,'Riya',1),
(3,'Neha',1),
(4,'Komal',2),
(5,'Arjun',2),
(6,'Priya',3);

SELECT * FROM Students;

--1. Show Student and Mentor.
SELECT
S.Student_Name AS Student,
M.Student_Name AS Mentor
FROM Students S
INNER JOIN Students M
ON S.Mentor_ID = M.Student_ID;

--DATASET: 3 FAMILY TREE

CREATE TABLE Family
(
Person_ID INT PRIMARY KEY,
Person_Name VARCHAR(50),
Father_ID INT
);

INSERT INTO Family
VALUES
(1,'Mohan',NULL),
(2,'Rohan',1),
(3,'Sohan',1),
(4,'Geeta',2),
(5,'Seema',2),
(6,'Anita',3);

SELECT * FROM FAMILY;

--1. Show Child and Father.

SELECT
C.Person_Name AS Child,
F.Person_Name AS Father
FROM Family C
INNER JOIN Family F
On C.Father_ID = F.Person_ID;

---------------------------------------------------------------------------------------------------------------

CREATE TABLE Family_2
(
    Person_ID INT PRIMARY KEY,
    Person_Name VARCHAR(50),
    Father_ID INT,
    Mother_ID INT
);

INSERT INTO Family_2
VALUES
(1,'Ramesh',NULL,NULL),
(2,'Sita',NULL,NULL),
(3,'Amit',1,2),
(4,'Neha',1,2),
(5,'Rahul',3,NULL),
(6,'Priya',3,NULL),
(7,'Anjali',4,NULL),
(8,'Rohan',5,NULL);

SELECT * FROM Family_2;

--1. Show every person's father name.

SELECT
C.Person_Name AS Child_Name,
F.Person_Name AS Father_Name
FROM Family_2 C
INNER JOIN Family_2 F
on C.Father_ID = F.Person_ID; 

--2. Show every person's mother name.
SELECT
C.Person_Name AS Child_Name,
F.Person_Name as Mother_Name
FROM Family_2 C
INNER JOIN Family_2 F
on C.Mother_ID = F.Person_ID;

--3. Show all people who don't have a father.
SELECT
C.Person_Name AS Child_Name,
F.Person_Name AS Father_Name
FROM Family_2 C
LEFT JOIN Family_2 F
ON C.Father_ID = F.Person_ID;

SELECT
C.Person_Name AS Child_Name,
F.Person_Name AS Father_Name
FROM Family_2 C
LEFT JOIN Family_2 F
ON C.Father_ID = F.Person_ID
WHERE C.Father_ID IS NULL;

--4. Show all people who don't have a mother.

SELECT
C.Person_Name AS Child_Name,
F.Person_Name AS Mother_Name
FROM Family_2 C
LEFT JOIN Family_2 F
On C.Mother_ID = F.Person_ID
WHERE C.Mother_ID IS NULL;

--5 Show every person with both father and mother names.
SELECT
C.Person_Name AS Child_Name,
F.Person_Name as Father_Name,
M.Person_Name as Mother_Name
FROM Family_2 C
LEFT JOIN Family_2 F
ON C.Father_ID = F.Person_ID
LEFT JOIN Family_2 M
ON C.Mother_ID = F.Person_ID;

--6. Find people whose father is Ramesh.
SELECT
C.Person_Name as Child_Name,
F.Person_Name AS Father_Name
FROM Family_2 C
LEFT JOIN Family_2 F
On C.Father_ID = F.Person_ID
WHERE F.Person_Name = 'Ramesh';

--7. Find people whose mother is Sita.
SELECT
C.Person_Name as Child_Name,
M.Person_Name AS Mother_Name
FROM Family_2 C
LEFT JOIN Family_2 M
ON C.Mother_ID = M.Person_ID
Where M.Person_Name = 'Sita';

--8. Find people who do not have a father recorded.
SELECT
C.Person_Name AS Child,
F.Person_Name AS Father
FROM Family_2 C
LEFT JOIN Family_2 F
on C.Father_ID = F.Person_ID
WHERE F.Person_Name IS NULL;

--9. Find all fathers in the table.

SELECT
F.Person_Name as Fathers_Name 
FROM Family_2 C
INNER JOIN Family_2 F
ON C.Father_ID = F.Person_ID 
;

--10. Count how many children each father has.
SELECT
F.Person_Name AS Father,
COUNT(C.Person_Name) AS Children_Count
FROM Family_2 C
Left join Family_2 F
ON C.Father_ID = F.Person_ID
GROUP BY F.Person_Name;

SELECT
F.Person_Name AS Father,
COUNT(C.Person_ID) AS Children_Count
FROM Family_2 F
INNER join Family_2 C 
ON F.Person_ID = C.Father_ID 
GROUP BY F.Person_Name;

--11. Find fathers who have more than one child.

SELECT
F.Person_Name AS Father,
COUNT(C.Person_ID) AS Children_Count
FROM Family_2 F
INNER join Family_2 C 
ON F.Person_ID = C.Father_ID    
GROUP BY F.Person_Name
HAVING COUNT(C.Person_ID) > 1 ;

--12. Find the grandfather of Rahul.

SELECT
C.Person_Name as Child,
F.Person_Name as Father,
G.Person_Name as Grandfather
FROM Family_2 C
INNER JOIN Family_2 F
ON C.Father_ID = F.Person_ID
INNER JOIN Family_2 G
ON F.Father_ID = G.Person_ID
WHERE C.Person_Name = 'Rahul';

--13. Show each person with father and grandfather.

SELECT
C.Person_Name as Child,
F.Person_Name as Father,
G.Person_Name as Grandfather
FROM Family_2 C
LEFT JOIN Family_2 F
ON C.Father_ID = F.Person_ID
LEFT JOIN Family_2 G
ON F.Father_ID = G.Person_ID;

--14. Find all grandchildren of Ramesh.

SELECT
C.Person_Name as Child,
F.Person_Name as Father,
G.Person_Name as Grandfather
FROM Family_2 C
LEFT JOIN Family_2 F
ON C.Father_ID = F.Person_ID
LEFT JOIN Family_2 G
ON F.Father_ID = G.Person_ID
WHERE G.Person_Name = 'Ramesh';



