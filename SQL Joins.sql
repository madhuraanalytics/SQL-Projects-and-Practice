USE Data_Analyst_Practice;
GO

--TABLE 1

CREATE TABLE Departments
(
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50),
    Location VARCHAR(50)
);

INSERT INTO Departments
VALUES
(101,'HR','Mumbai'),
(102,'IT','Pune'),
(103,'Finance','Delhi'),
(104,'Sales','Indore'),
(105,'Marketing','Bangalore'),
(106,'Operations','Hyderabad');


--TABLE 2

CREATE TABLE Employees
(
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Salary DECIMAL(10,2),
    Department_ID INT
);

INSERT INTO Employees
VALUES
(1,'Amit',50000,101),
(2,'Rahul',65000,102),
(3,'Riya',70000,102),
(4,'Neha',55000,103),
(5,'Komal',45000,104),
(6,'Arjun',60000,107),
(7,'Priya',52000,NULL);

SELECT * FROM Departments;

SELECT * FROM Employees;


--JOINS:
--1. INNER JOIN:It returns only matching records from both tables.
/*SYNTAX:
SELECT
    column_names
FROM Table1
INNER JOIN Table2
ON Table1.common_column = Table2.common_column;
*/

--1. Show Employee Name and Department Name
SELECT
Employee_Name,
Department_Name
FROM Employees
INNER JOIN Departments
ON Employees.Department_ID = Departments.Department_ID; 

--2. Show all employee information with department.
SELECT
Employee_ID,
Employee_Name,
Salary,
Department_Name,
Location
FROM Employees
INNER JOIN Departments
ON Employees.Department_ID = Departments.Department_ID;

--3. Show employees working in Pune.
SELECT
Employee_Name,
Department_Name,
Location
FROM Employees
INNER JOIN Departments
ON Employees.Department_ID = Departments.Department_ID
WHERE Location='Pune';

--4. Show employees having salary greater than 55000.
SELECT
Employee_Name,
Department_Name,
Salary
FROM Departments
INNER JOIN Employees
ON Employees.Department_ID = Departments.Department_ID
Where Salary > 55000;

--5. Sort by Salary:
SELECT
Employee_Name,
Department_Name,
Salary
From Departments
INNER JOIN Employees
ON Employees.Department_ID = Departments.Department_ID
Order by Salary DESC;


SELECT
    Employee_Name,
    Salary,
    Department_Name
FROM Employees
INNER JOIN Departments
ON Employees.Department_ID=Departments.Department_ID
ORDER BY Salary DESC;

--6. Department-wise employee count.

SELECT
Department_Name,
COUNT(Employee_Name) AS Employee_Count
From Departments
INNER JOIN Employees
ON Employees.Department_ID = Departments.Department_ID
GROUP BY Department_Name
ORDER BY Employee_Count ASC;

SELECT
Department_Name,
COUNT(Employee_Name) AS Employee_Count
From Employees
INNER JOIN Departments
ON Employees.Department_ID = Departments.Department_ID
GROUP BY Department_Name
ORDER BY Employee_Count ASC;

--7. Average salary department-wise.

SELECT
Department_Name,
CAST(AVG(Salary) AS DECIMAL(10,2)) AS Avg_Salary
From Employees
INNER JOIN Departments
ON Employees.Department_ID = Departments.Department_ID
GROUP BY Department_Name
ORDER BY Avg_Salary DESC;

--8. Maximum salary in each department.
SELECT
Department_Name,
MAX(Salary)as Max_Salary
From Employees
INNER JOIN Departments
ON Employees.Department_ID = Departments.Department_ID
Group by Department_Name
ORDER BY Max_Salary DESC;

SELECT
Department_Name,
MIN(Salary) AS Min_Salary
FROM Employees
INNER JOIN Departments
ON Employees.Department_ID = Departments.Department_ID
Group by Department_Name
Order by Min_Salary ASC;

--10. Total salary department-wise.
SELECT
Department_Name,
SUM(Salary) AS Total_Salary
FROM Employees
INNER JOIN Departments
ON Employees.Department_ID = Departments.Department_ID
Group by Department_Name
Order by Total_Salary ASC;

--11. Departments having more than one employee.

SELECT
Department_Name,
COUNT(*)AS Employee_Count
FROM Employees
INNER JOIN Departments
ON Employees.Department_ID = Departments.Department_ID
Group by Department_Name
HAVING Count(*) >1;

--12. Departments where average salary is above 55,000.

SELECT
Department_Name,
CAST(AVG(Salary)AS DECIMAL(10,2))AS AVG_S
FROM Employees
INNER JOIN Departments
ON Employees.Department_ID = Departments.Department_ID
Group by Department_Name
HAVING AVG(Salary) > 55000;

--13. Employee names with department location.

SELECT * FROM Employees;
SELECT * FROM Departments;

SELECT
Employee_Name,
Department_Name,
Location
FROM Employees
INNER JOIN Departments
ON Employees.Department_ID = Departments.Department_ID;

--(Using Alias)

SELECT
E.Employee_Name,
D.Department_Name,
D.Location
FROM Employees E
INNER JOIN Departments D
ON E.Department_ID=D.Department_ID;

-------------------------------------------------------------------------------------------------

--2. LEFT JOIN 
--LEFT JOIN returns:All rows from the left table,Matching rows from the right table
--If no match exists, SQL returns NULL for the right table columns. 

--SYNTAX :
SELECT
    columns
FROM Left_Table
LEFT JOIN Right_Table
ON Left_Table.column = Right_Table.column;


--1. Show all departments with employees

SELECT
Department_Name,
Employee_Name
FROM Departments 
LEFT JOIN Employees
ON Departments.Department_ID = Employees.Department_ID;

--2. Show department location also.

SELECT
D.Department_Name,
E.Employee_Name,
D.Location
FROM Departments D
LEFT JOIN Employees E
ON D.Department_ID = E.Department_ID;

SELECT
D.Department_Name,
E.Employee_Name,
Location
FROM Departments D
LEFT JOIN Employees E
ON D.Department_ID = E.Department_ID;

--3. Count employees in every department.
SELECT
    D.Department_Name,
    COUNT(E.Employee_ID) AS Total_Employees
FROM Departments D
INNER JOIN Employees E
ON D.Department_ID = E.Department_ID
GROUP BY D.Department_Name;

SELECT
    D.Department_Name,
    COUNT(E.Employee_ID) AS Total_Employees
FROM Departments D
LEFT JOIN Employees E
ON D.Department_ID = E.Department_ID
GROUP BY D.Department_Name;

--4. Average salary department-wise.

SELECT
Department_Name,
CAST(AVG(Salary) AS DECIMAL(10,2))AS Avg_Salary
FROM Departments
LEFT JOIN Employees
On Departments.Department_ID = Employees.Department_ID
GROUP BY Department_Name;

--5. Replace NULL with 0.
SELECT
Department_Name,
CAST(ISNULL(Avg(Salary),0 )AS DECIMAL(10,2)) AS Average_Salary
FROM Departments
LEFT JOIN Employees
On Departments.Department_ID = Employees.Department_ID
GROUP BY Department_Name;

--6. Departments without employees.
SELECT
Department_Name
FROM Departments
LEFT JOIN Employees
ON Departments.Department_ID = Employees.Department_ID
WHERE Employee_ID is null;

--7. Department-wise total salary.
SELECT
Department_Name,
SUM(Salary) AS Total_Salary
FROM Employees
LEFT JOIN Departments
ON Departments.Department_ID = Employees.Department_ID
GROUP BY Department_Name;

--8.Highest salary in every department.
SELECT
Department_Name,
MAX(Salary) as Hig_Dep_Salary
FROM Employees
LEFT JOIN Departments
ON Departments.Department_ID = Employees.Department_ID 
GROUP BY Department_Name
Order by Hig_Dep_Salary DESC;

SELECT
Department_Name,
MIN(Salary) as Min_Dep_Salary
FROM Departments
LEFT JOIN Employees
ON Departments.Department_ID = Employees.Department_ID 
GROUP BY Department_Name
Order by Min_Dep_Salary DESC;

--10. Sort by department.
SELECT
Department_Name,
Employee_Name
From Departments
LEFT JOIN Employees
ON Departments.Department_ID = Employees.Department_ID 
ORDER BY Department_Name;

--11. Departments located in Pune or Mumbai.
SELECT
D.Department_Name,
E.Employee_Name,
D.Location
FROM Departments D
LEFT JOIN Employees E
ON D.Department_ID = E.Department_ID
WHERE D.Location IN ('Mumbai','Pune');

--12. Departments having more than one employee.
SELECT
Department_Name,
Count(*) AS Employee_Count
FROM Employees
LEFT JOIN Departments
ON Employees.Department_ID = Departments.Department_ID
GROUP BY Department_Name
Having Count(*)>1;

SELECT
    D.Department_Name,
    COUNT(E.Employee_ID) AS Employees
FROM Departments D
LEFT JOIN Employees E
ON D.Department_ID=E.Department_ID
GROUP BY D.Department_Name
HAVING COUNT(E.Employee_ID)>1;

--------------------------------------------------------------------------------------------------

--3.RIGHT JOIN 
/*RIGHT JOIN returns:

✅ All rows from the right table
✅ Matching rows from the left table
❌ If no match exists in the left table, SQL returns NULL for the left table columns.

Syntax
SELECT
    columns
FROM Left_Table
RIGHT JOIN Right_Table
ON Left_Table.Common_Column = Right_Table.Common_Column;
*/

--1. Display every employee with department

SELECT * FROM Departments;
SELECT * FROM Employees;

SELECT
Employee_Name,
Department_Name
FROM Departments
RIGHT JOIN Employees
ON Departments.Department_ID = Employees.Department_ID;


--2. Show employee salary also.

SELECT
Employee_Name,
Salary,
Department_Name
FROM Departments
RIGHT JOIN Employees
ON Departments.Department_ID = Employees.Department_ID
ORDER BY Salary DESC;

--3. Employees earning more than ₹55,000.

SELECT
E.Employee_Name,
E.Salary,
D.Department_Name
FROM Departments D
RIGHT JOIN Employees E
ON D.Department_ID = E.Department_ID
WHERE Salary > 55000
Order by Salary DESC;

--4. Sort by salary.

SELECT
Employee_Name,
Department_Name,
Salary
FROM Departments
RIGHT JOIN Employees
ON Departments.Department_ID = Employees.Department_ID
ORDER BY Salary DESC;

--5. Employees without department.

SELECT
Employee_Name,
Department_Name
FROM Departments
RIGHT JOIN Employees
ON Departments.Department_ID = Employees.Department_ID 
WHERE Department_Name IS NULL;

SELECT
Employee_Name,
Department_Name
FROM Departments
RIGHT JOIN Employees
ON Departments.Department_ID = Employees.Department_ID 
WHERE Departments.Department_ID IS NULL;


SELECT
*
FROM Departments
RIGHT JOIN Employees
ON Departments.Department_ID = Employees.Department_ID;

--6. Count employees department-wise.

SELECT
D.Department_Name,
COUNT(*) AS Employee_Count
FROM Departments D
RIGHT JOIN Employees E
ON D.Department_ID = E.Department_ID
Group by Department_Name;

--7. Average salary.

SELECT
D.Department_Name,
CAST(AVG(E.Salary) AS DECIMAL(10,2))AS Avg_Salary
FROM DEPARTMENTS D
RIGHT JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.Department_Name
ORDER BY Avg_Salary DESC;

--8. Total salary.

SELECT
Department_Name,
SUM(Salary)AS Total_Salary
FROM Departments
RIGHT JOIN Employees
ON Departments.Department_ID = Employees.Department_ID
Group by Department_Name
Order by Total_Salary ASC;

 --4. FULL OUTER JOIN 
 /*It will show:

Matching departments and employees
Departments without employees
Employees without matching departments
*/

SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES;

SELECT
    D.Department_Name,
    E.Employee_Name
FROM Departments D
FULL OUTER JOIN Employees E
ON D.Department_ID = E.Department_ID;

SELECT 
D.Department_ID,
D.Department_Name,
D.Location,
E.Employee_ID,
E.Employee_Name,
E.Salary,
E.Department_ID AS Employee_Department_ID  
FROM Departments D
FULL OUTER JOIN Employees E
ON D.Department_ID = E.Department_ID;


--2. Show Only Unmatched Records

SELECT
D.Department_Name,
E.Employee_Name,
E.Department_ID
FROM Departments D
FULL OUTER JOIN Employees E
ON D.Department_ID = E.Department_ID 
Where D.Department_ID is null
or E.Employee_ID is null;

--3. Replace NULL Values

SELECT
ISNULL(D.Department_Name, 'No Department') AS Department_Name,
ISNULL(E.Employee_Name, 'No Employee') AS Employee_Name
FROM Departments D
FULL OUTER JOIN Employees E
ON D.Department_ID = E.Department_ID;

-----------------------------------------------------------------------------------------------------------------

--5. SELF JOIN - (A table is joined with itself)
USE Data_Analyst_Practice;
GO

CREATE TABLE Staff
(
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2),
    Manager_ID INT NULL
);

INSERT INTO Staff
(
    Employee_ID,
    Employee_Name,
    Salary,
    Manager_ID
)
VALUES
(1, 'Amit', 90000, NULL),
(2, 'Rahul', 70000, 1),
(3, 'Riya', 75000, 1),
(4, 'Neha', 55000, 2),
(5, 'Komal', 50000, 2),
(6, 'Arjun', 60000, 3),
(7, 'Priya', 52000, 3);

SELECT * FROM Staff;

SELECT
E.Employee_Name as Employeee,
M.Employee_Name as Manager
FROM Staff E
Inner Join Staff M
On E.Manager_ID = M.Employee_ID;

--2. To display every employee, including Amit:
SELECT
    E.Employee_Name AS Employee,
    M.Employee_Name AS Manager
FROM Staff E
LEFT JOIN Staff M
ON E.Manager_ID = M.Employee_ID;


--3. Replace NULL manager name
SELECT
E.Employee_Name AS Employee,
ISNULL(M.Employee_Name,'No Manager')AS Manager
FROM Staff E
Left Join Staff M
On E.Manager_ID = M.Employee_ID;

--4. Include salary information

SELECT
E.Employee_Name AS Employee,
E.Salary AS Employee_Salary,
M.Employee_Name AS Manager,
M.Salary AS Manager_Salary
FROM Staff E
LEFT JOIN Staff M
On E.Manager_ID = M.Employee_ID;

--5. Employees earning more than their managers

SELECT
E.Employee_Name AS Employee,
E.Salary AS Employee_Salary,
M.Employee_Name AS Manager,
M.Salary AS Manager_Salary
FROM Staff E
INNER JOIN Staff M
On E.Manager_ID = M.Employee_ID
WHERE E.Salary > M.Salary;

--6. Find all employees under Amit

SELECT
E.Employee_Name AS Employee,
M.Employee_Name as Manager
FROM Staff E
RIGHT JOIN Staff M
ON E.Manager_ID = M.Employee_ID
WHERE M.Employee_Name = 'Amit';

--7. Count employees under each manager
SELECT
M.Employee_Name as Manager,
COUNT(E.Employee_Name) AS Employee_Count
FROM Staff M
INNER JOIN Staff E
ON M.Employee_ID=E.Manager_ID
GROUP BY M.Employee_Name;

--8. Find employees who are managers

SELECT DISTINCT
M.Employee_ID,
M.Employee_Name AS Manager
FROM STAFF E
INNER JOIN STAFF M
ON E.Manager_ID = M.Employee_ID;

--9. Find employees who are not managers

SELECT
E.Employee_ID,
M.Employee_Name AS Manager
FROM STAFF M
LEFT JOIN STAFF E
ON M.Employee_ID = E.Manager_ID
WHERE E.EMployee_ID IS NULL;

-------------------------------------------------------------------------------------------------------------------

--5. CROSS JOIN (A CROSS JOIN combines every row of the first table with every row of the second table.)

CREATE TABLE Colors
(
Color_ID INT PRIMARY KEY,
Color_Name VARCHAR(20)
);

INSERT INTO Colors
VALUES
(1,'Red'),
(2,'Blue'),
(3,'Black');


CREATE TABLE Sizes
(
Size_ID INT PRIMARY KEY,
Size_Name VARCHAR(20)
);


INSERT INTO Sizes
VALUES
(1,'Small'),
(2,'Medium'),
(3,'Large');

SELECT * FROM COLORS;
SELECT * FROM Sizes;


SELECT
Color_Name,
Size_Name
FROM COLORS
CROSS JOIN Sizes;

-----------------------------------------------------------------------------------------------------------------

CREATE TABLE Colors_2
(
    Color_ID INT PRIMARY KEY,
    Color_Name VARCHAR(30)
);

INSERT INTO Colors_2
VALUES
(1,'Red'),
(2,'Blue'),
(3,'Black'),
(4,'White');


CREATE TABLE Products
(
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50)
);

INSERT INTO Products
VALUES
(1,'T-Shirt'),
(2,'Jeans'),
(3,'Shoes');

SELECT * FROM Colors_2
SELECT * FROM Products

--1. Show all possible product-color combinations.

SELECT
Product_Name,
Color_Name
FROM Products
CROSS JOIN Colors_2;

--2. Count total combinations.

Select
COUNT(*) AS Total_Combinatons
From Products
Cross join Colors_2;

--3. Show combinations in alphabetical order.

SELECT
Product_Name,
Color_Name
FROM Products
Cross join Colors_2
Order by Product_Name;

--4. Show combinations ordered by color.
SELECT
Product_Name,
Color_Name
FROM Products
Cross join Colors_2
Order by Color_Name;

--5. Show only Black products.
SELECT
Product_Name,
Color_Name
FROM Products
Cross join Colors_2
WHERE Color_Name = 'Black';

--6. Show only Shoes combinations.
SELECT
Product_Name,
Color_Name
FROM Products
Cross join Colors_2
where product_name = 'Shoes';


--7. Number each combination.

SELECT
    ROW_NUMBER() OVER(ORDER BY Product_Name) AS Sr_No,
    Product_Name,
    Color_Name
FROM Products
CROSS JOIN Colors_2;












