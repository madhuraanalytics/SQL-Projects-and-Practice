

--Unit 29: Subqueries(A subquery is a query written inside another SQL query.)

USE Data_Analyst_Practice;
GO

CREATE TABLE Employee_Subquery
(
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    City VARCHAR(50)
);

INSERT INTO Employee_Subquery
VALUES
(1,'Amit','IT',70000,'Pune'),
(2,'Riya','IT',60000,'Mumbai'),
(3,'Rahul','HR',45000,'Delhi'),
(4,'Neha','HR',50000,'Delhi'),
(5,'Arjun','Sales',65000,'Pune'),
(6,'Komal','Sales',55000,'Indore'),
(7,'Priya','Finance',75000,'Mumbai'),
(8,'Karan','Finance',60000,'Pune');

SELECT * FROM Employee_Subquery;

--Part 1 — Single Row Subquery
--A Single Row Subquery returns only one row, usually one value.

--1. Employees earning above average

/*SELECT
Employee_Name,
Salary
FROM Employee_Subquery
Where Salary > AVG(Salary);*/

SELECT AVG(Salary) 
FROM Employee_Subquery;

SELECT
Employee_Name,
Salary
From Employee_Subquery
Where Salary > (SELECT AVG(Salary) 
FROM Employee_Subquery);

--2. Employee with highest salary

SELECT MAX(SALARY) FROM Employee_Subquery;

SELECT
Employee_Name,
Salary
FROM Employee_Subquery
WHERE Salary = 
(SELECT MAX(SALARY) FROM Employee_Subquery);

SELECT TOP 1
Employee_Name,
Salary,
MAX(Salary) AS max_salary
FROM Employee_Subquery
GROUP BY Employee_Name,
Salary
Order by max_salary DESC;

SELECT 
Employee_Name,
Salary,
MAX(Salary) AS max_salary
FROM Employee_Subquery
GROUP BY Employee_Name,
Salary
Order by max_salary DESC;

--3. Employee with lowest salary

SELECT
MIN(Salary) AS Lowest_Salary
FROM Employee_Subquery;

SELECT
Employee_Name,
Salary
FROM Employee_Subquery
Where Salary = (SELECT
MIN(Salary) AS Lowest_Salary
FROM Employee_Subquery);

--Part 2 — Multiple Row Subquery

--1. Employees from cities where IT employees work
SELECT
City,
Employee_Name,
Department
FROM Employee_Subquery
Where Department = 'IT';

SELECT 
Employee_Name,
City,
Department
From Employee_Subquery
WHERE City IN (SELECT
City
FROM Employee_Subquery
Where Department = 'IT');

---------------------------------------------------------------------------------------------------------------

--MY PRACTICE

CREATE TABLE Emp_Practice
(
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Department VARCHAR(50),
    City VARCHAR(50),
    Salary INT,
    Age INT,
    Experience INT,
    Manager_ID INT NULL
);


INSERT INTO Emp_Practice
(Employee_ID, Employee_Name, Department, City, Salary, Age, Experience, Manager_ID)
VALUES
(101, 'Amit',   'IT',        'Pune',    70000, 28, 5, NULL),
(102, 'Priya',  'HR',        'Mumbai',  50000, 30, 7, NULL),
(103, 'Rahul',  'IT',        'Mumbai',  90000, 32, 8, 101),
(104, 'Neha',   'Finance',  'Delhi',   65000, 29, 6, 102),
(105, 'Rohit',  'IT',        'Pune',    60000, 25, 3, 101),
(106, 'Sneha',  'HR',        'Pune',    55000, 27, 4, 102),
(107, 'Vikas',  'Finance',  'Mumbai',  80000, 35, 10, 104),
(108, 'Anjali', 'IT',        'Delhi',   75000, 31, 6, 103),
(109, 'Karan',  'Sales',     'Pune',    45000, 24, 2, 103),
(110, 'Meena',  'Sales',     'Mumbai',  70000, 28, 5, 109),
(111, 'Arjun',  'Finance',  'Delhi',   90000, 34, 9, 104),
(112, 'Pooja',  'HR',        'Delhi',   48000, 26, 3, 102);

SELECT * FROM Emp_Practice;

--Question 1. Find the employee(s) who have the highest salary.

SELECT
MAX(Salary) as highest_salary
from Emp_Practice;

SELECT 
Employee_Name,
Salary
FROM Emp_Practice
Where Salary = (SELECT
MAX(Salary) as highest_salary
from Emp_Practice);

--Question 2. Find employees whose salary is greater than the average salary.

SELECT
AVG(Salary) AS Avg_Salary
FROM Emp_Practice;

SELECT
Employee_Name,
Salary
FROM Emp_Practice
WHERE Salary > (SELECT
AVG(Salary) AS Avg_Salary
FROM Emp_Practice);

--Question 3. Find employees whose salary is less than the average salary.
SELECT
AVG(Salary) AS Avg_less_Salary
FROM Emp_Practice;

SELECT
Employee_Name,
Salary
FROM Emp_Practice
Where Salary < (SELECT
AVG(Salary) AS Avg_less_Salary
FROM Emp_Practice);

--Question 4. Find employees who earn the same salary as Amit.
SELECT
Employee_Name,
Salary
From Emp_Practice
Where Employee_Name = 'Amit';

SELECT
Employee_Name,
Salary
FROM Emp_Practice
Where Salary = (SELECT
Salary
From Emp_Practice
Where Employee_Name = 'Amit');

--Question 5. Find all employees who live in a city where at least one IT employee works.

SELECT
Employee_Name,
City,
Department
From Emp_Practice
Where Department = 'IT';

SELECT
Employee_Name,
City,
Department
From Emp_Practice
Where City IN (SELECT 
City
FROM Emp_Practice
Where Department='IT');

--Question 6. Find employees who work in the same city as Amit.
SELECT
Employee_Name,
City
FROM Emp_Practice
Where Employee_Name = 'Amit';

SELECT
Employee_Name,
City
FROM Emp_Practice
Where City = (SELECT
City
FROM Emp_Practice
Where Employee_Name = 'Amit');

--Question 7. Find employees who work in the same department as Amit.
Select
Employee_Name,
Department
FROM Emp_Practice
Where Employee_Name = 'Amit';

SELECT
Employee_name,
Department
FROM Emp_Practice
WHERE Department =(Select
Department
FROM Emp_Practice
Where Employee_Name = 'Amit');

--Question 8. Find employees who earn more than Amit.
SELECT
Employee_Name,
Salary
FROM Emp_Practice
Where Employee_Name = 'Amit';

SELECT
Employee_Name,
Salary
FROM Emp_Practice
WHERE Salary > (SELECT
Salary
FROM Emp_Practice
Where Employee_Name = 'Amit');

--Question 9. Find employees whose salary is greater than the average salary of the IT department.
SELECT
AVG(Salary)
FROM Emp_Practice
Where Department = 'IT';

SELECT
Employee_Name,
Salary,
Department
FROM Emp_Practice
Where Salary > (SELECT
AVG(Salary)
FROM Emp_Practice
Where Department = 'IT');


--Question 10. Find employees who earn more than the average salary of the HR department.
SELECT
AVG(Salary)
FROM Emp_Practice
Where Department = 'HR';

SELECT
Employee_Name,
Department,
Salary
FROM Emp_Practice
Where Salary > (SELECT
AVG(Salary)
FROM Emp_Practice
Where Department = 'HR');

--Question 11. Find the employee(s) who have the highest salary in the IT department.
SELECT
MAX(Salary)
FROM Emp_Practice
Where Department = 'IT';

SELECT
Employee_Name,
Salary,
Department
FROM Emp_Practice
Where Department='IT'
AND Salary = (SELECT
MAX(Salary)
FROM Emp_Practice
Where Department = 'IT');

--Question 12. Find employees who earn more than the highest salary in HR.
SELECT
MAX(Salary)
FROM Emp_Practice
Where Department='HR';

SELECT
Employee_Name,
Salary,
Department
FROM Emp_Practice
Where Salary > (SELECT
MAX(Salary)
FROM Emp_Practice
Where Department='HR');

SELECT
Employee_Name,
Salary,
Department
FROM Emp_Practice
Where Salary >55000;

--Question 13. Find employees whose department has at least one employee earning more than 80000.
SELECT
Employee_Name,
Salary,
Department
FROM Emp_Practice
Where Salary > 80000;

SELECT
    Employee_Name,
    Department,
    Salary
FROM Emp_Practice E
WHERE EXISTS
(
    SELECT 1
    FROM Emp_Practice E2
    WHERE E2.Department = E.Department
      AND E2.Salary > 80000
);

--Question 14. Find employees who work in a department where Rahul works.
SELECT
Employee_Name,
Department
FROM Emp_Practice
Where Employee_Name = 'Rahul';

SELECT
Employee_Name,
Department
FROM Emp_Practice
Where Department = (SELECT
Department
FROM Emp_Practice
Where Employee_Name = 'Rahul');

--LEVEL 5 — Multi-row Subqueries

--Question 15. Find employees who work in cities where Finance employees work.
SELECT
Employee_Name,
City,
Department
FROM Emp_Practice
Where Department = 'Finance';

SELECT
Employee_Name,
City,
Department
FROM Emp_Practice
Where City IN (SELECT
City
FROM Emp_Practice
Where Department = 'Finance');

--Question 16. Find employees whose salary is equal to any salary earned by an IT employee.

SELECT
Employee_Name,
Salary,
Department
FROM Emp_Practice
Where Department = 'IT';

SELECT
Employee_Name,
Salary,
Department
FROM Emp_Practice
Where Salary IN (SELECT
Salary
FROM Emp_Practice
Where Department = 'IT');

--CORRELATED SUBQUERY:
--Who earns above the average of their own department?

SELECT *
FROM Employee_Subquery E
WHERE Salary >
(
    SELECT AVG(E2.Salary)
    FROM Employee_Subquery E2
    WHERE E2.Department = E.Department
);
-----------------------------------------------------------------------------------------------------------------

--CTE :

--Find employees whose salary is greater than the average salary.

SELECT
AVG(Salary)
FROM Employee_Subquery;

--1. WITH CTE
WITH Average_Salary AS(SELECT
AVG(Salary) AS Avg_Salary
FROM Emp_Practice)
SELECT
Employee_Name,
Salary
FROM Emp_Practice
CROSS JOIN Average_Salary
WHERE Emp_Practice.Salary > Average_Salary.Avg_Salary;


CREATE TABLE Sales_CTE
(
    Sale_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Product_Name VARCHAR(50),
    Category VARCHAR(50),
    City VARCHAR(50),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Sales_Date DATE
);

INSERT INTO Sales_CTE
VALUES
(1, 'Amit',   'Laptop',    'Electronics', 'Pune',    1, 55000, '2026-01-05'),
(2, 'Riya',   'Mobile',    'Electronics', 'Mumbai',  2, 25000, '2026-01-08'),
(3, 'Rahul',  'Chair',     'Furniture',   'Delhi',   4, 5000,  '2026-01-10'),
(4, 'Neha',   'Table',     'Furniture',   'Delhi',   2, 8000,  '2026-01-15'),
(5, 'Arjun',  'Laptop',    'Electronics', 'Pune',    2, 55000, '2026-01-18'),
(6, 'Komal',  'Headphone', 'Electronics', 'Indore',  3, 3000,  '2026-01-20'),
(7, 'Priya',  'Chair',     'Furniture',   'Mumbai',  5, 5000,  '2026-02-02'),
(8, 'Karan',  'Mobile',    'Electronics', 'Pune',    3, 25000, '2026-02-05'),
(9, 'Sneha',  'Table',     'Furniture',   'Mumbai',  1, 8000,  '2026-02-10'),
(10,'Vikas',  'Laptop',    'Electronics', 'Delhi',   1, 55000, '2026-02-15'),
(11,'Pooja',  'Headphone', 'Electronics', 'Pune',    5, 3000,  '2026-02-18'),
(12,'Rohit',  'Chair',     'Furniture',   'Indore',  3, 5000,  '2026-02-20');

SELECT * FROM Sales_CTE;

--Question 1:Calculate total sales for each category using a CTE.
WITH Categorysales AS(

SELECT
Category,
SUM(Quantity * Unit_Price) AS Total_Sales
FROM Sales_CTE
Group by Category)

SELECT * FROM Categorysales;

--Question 2. Find categories whose total sales are greater than 100,000.

SELECT
Category,
SUM(Quantity * Unit_Price) AS Total_Sales
From Sales_CTE
GROUP BY Category
HAVING SUM(Quantity * Unit_Price) > 100000;

WITH Categorysales AS (
SELECT
Category,
SUM(Quantity * Unit_Price) AS Total_Sales
From Sales_CTE
GROUP BY Category)
SELECT * FROM Categorysales
Where Total_Sales > 100000;

--Question 3 — Average Sales by City

SELECT
SUM(Quantity * Unit_Price) AS Total_Sales
FROM Sales_CTE;

SELECT
AVG(Quantity * Unit_Price) AS Total_Sales
FROM Sales_CTE;

WITH AverageSales AS (
SELECT
City,
CAST(AVG(Quantity * Unit_Price)AS DECIMAL(10,2)) AS AVG_Sales
FROM Sales_CTE
GROUP BY City)
SELECT
City,
AVG_Sales
FROM Averagesales;

--Question 4 — Find the Best-Selling Product(Find the product with the highest total sales.)
WITH ProductSales AS (
SELECT
Product_Name,
SUM(Quantity * Unit_Price) AS Total_Sales
FROM Sales_CTE
GROUP BY Product_Name)
SELECT 
Product_Name,
Total_Sales
FROM ProductSales
ORDER BY Total_Sales DESC;

--Question 5 — Find Products Above Average Sales
--(Find products whose total sales are greater than the average product sales.)
WITH Productsales AS (
SELECT
Product_Name,
SUM(Quantity * Unit_Price) as Total_Sales
FROM Sales_CTE
GROUP BY Product_Name),
Averageproductsales AS 
(SELECT
AVG(Total_Sales) AS Average_Sales
FROM Productsales)
SELECT
Product_Name,
Total_Sales
FROM Productsales
Where Total_Sales > 
(SELECT Average_Sales
From Averageproductsales)
ORDER BY Total_Sales DESC;

--Question 6 — Multiple CTEs(Find the city with the highest total sales)

SELECT 
SUM(Quantity * Unit_Price) AS Total_Sales
FROM Sales_CTE;


With HighestSales AS 
(SELECT 
City,
SUM(Quantity * Unit_Price) AS Total_Sales
FROM Sales_CTE
Group by City)

SELECT
City,
Total_Sales
FROM HighestSales
Order by Total_Sales DESC;


--Question 7. Find each customer's total spending and show customers who spent more than ₹50,000.
SELECT * FROM Sales_CTE;

WITH TotalSpending AS(
SELECT
Customer_Name,
SUM(Quantity * Unit_Price) AS Total_Sales
FROM Sales_CTE
Group by Customer_Name)
SELECT
Customer_Name,
Total_Sales
FROM TotalSpending
WHERE Total_Sales > 50000
ORDER BY Total_Sales DESC;

--Question 8. CTE + Ranking (Rank products based on total sales):

WITH RankingProducts AS (
SELECT
Product_Name,
SUM(Quantity * Unit_Price) AS Total_Sales
FROM Sales_CTE
Group by Product_Name)

SELECT
Product_Name,
Total_Sales,
RANK() OVER(ORDER BY Total_Sales DESC) AS Sales_Rank
FROM RankingProducts;

Question 9 — CTE + ROW_NUMBER(Give each product a row number based on sales from highest to lowest)

WITH Sales_Number AS
(SELECT
Product_Name,
SUM(Quantity * Unit_Price) AS Total_Sales
FROM Sales_CTE
Group by Product_Name)
SELECT
Product_Name,
Total_Sales,
ROW_NUMBER() OVER
(ORDER BY Total_Sales DESC) AS Row_Number
FROM Sales_Number;

--Question 10 — Department/Category Comparison
--(Find the category whose total sales are greater than the average category sales.)
WITH CTE AS(
SELECT
Category,
SUM(Quantity * Unit_Price) AS Total_Sales 
FROM Sales_CTE
GROUP BY Category)
SELECT
Category,
Total_Sales
FROM CTE
WHERE Total_Sales > (SELECT AVG(Total_Sales) as Average_Sales 
FROM CTE);

--Question 11. Find product sales, then rank only products above ₹50,000.
WITH PRODUCTSALES AS
(SELECT
Product_Name,
SUM(Quantity * Unit_Price) AS Total_Sales
FROM Sales_CTE
GROUP BY Product_Name),
RANKEDPRODUCT AS 
(SELECT
Product_Name,
Total_Sales,
RANK() OVER (ORDER BY Total_Sales DESC) AS Sales_Rank
FROM PRODUCTSALES
Where Total_Sales > 50000)
SELECT
Product_Name,
Total_Sales,
Sales_Rank
FROM RANKEDPRODUCT
ORDER BY Sales_Rank;


----------------------------------------------------------------------------------------------------------------
--RECURSIVE CTE

CREATE TABLE Employee_Hierarchy
(
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Job_Title VARCHAR(50),
    Manager_ID INT
);

INSERT INTO Employee_Hierarchy
VALUES
(1, 'Amit',   'CEO',            NULL),
(2, 'Rahul',  'IT Manager',     1),
(3, 'Riya',   'HR Manager',     1),
(4, 'Neha',   'Developer',      2),
(5, 'Karan',  'Developer',      2),
(6, 'Pooja',  'Tester',         2),
(7, 'Arjun',  'HR Executive',   3),
(8, 'Sneha',  'Recruiter',      3);

SELECT *
FROM Employee_Hierarchy;

--Question:1. Find the employee who has no manager.

SELECT
Employee_Name,
Job_Title,
Manager_ID 
FROM Employee_Hierarchy
WHERE Manager_ID IS NULL;

--Question 2 — Find Amit's Direct Employees

SELECT
Employee_Name,
Job_Title,
Manager_ID 
FROM Employee_Hierarchy
Where Manager_ID = 1;

--Question 3 — Find Rahul's Employees

SELECT
Employee_name,
job_title,
manager_id
from employee_hierarchy
where manager_id = 2;

--Question 6. Show Hierarchy Starting from Rahul(Show Rahul and everyone working under Rahul.)
WITH EmployeeTree AS 

(SELECT
Employee_ID,
Employee_Name,
Job_Title,
Manager_ID,
0 AS LEVEL
FROM Employee_Hierarchy
WHERE Employee_Name = 'Rahul'

UNION ALL

SELECT
E.Employee_ID,
E.Employee_Name,
E.Job_title,
E.Manager_ID,
ET.Level+1
FROM Employee_Hierarchy E
INNER JOIN EmployeeTree ET
ON E.Manager_ID = ET.Employee_ID
)
SELECT * FROM EmployeeTree;

--Question 7 — Find Everyone Under Riya

SELECT * FROM Employee_Hierarchy;


WITH Emp_Tree AS 
(SELECT
Employee_ID,
Employee_Name,
Job_Title,
Manager_ID,
3 AS level
FROM Employee_Hierarchy
Where Employee_Name = 'Riya'

UNION ALL

SELECT
E.Employee_ID,
E.Employee_Name,
E.Job_Title,
E.Manager_ID,
ET.Level+1

FROM Employee_Hierarchy E
INNER JOIN Emp_Tree ET
ON E.Manager_ID = ET.Employee_ID 
)
SELECT * FROM Emp_Tree;

--Question 8 — Find Only Employees at Level 2


WITH EmployeeTree AS
(SELECT
Employee_ID,
Employee_Name,
Job_Title,
Manager_ID,
0 AS LEVEL
FROM Employee_Hierarchy
Where Manager_ID IS NULL

UNION ALL

SELECT
E.Employee_ID,
E.Employee_Name,
E.Job_Title,
E.Manager_ID,
ET.LEVEL+1
FROM Employee_Hierarchy E
INNER JOIN EmployeeTree ET
ON E.Manager_ID = ET.Employee_ID 
)
SELECT
Employee_Name,
Job_Title,
Level
FROM EmployeeTree
WHERE Level = 2;

--Question 9 — Count Employees at Each Level

WITH EmployeeTree AS
(SELECT
Employee_ID,
Employee_Name,
Job_Title,
Manager_ID,
0 AS LEVEL
FROM Employee_Hierarchy
Where Manager_ID IS NULL

UNION ALL

SELECT
E.Employee_ID,
E.Employee_Name,
E.Job_Title,
E.Manager_ID,
ET.LEVEL+1
FROM Employee_Hierarchy E
INNER JOIN EmployeeTree ET
ON E.Manager_ID = ET.Employee_ID 
)
SELECT
Level,
COUNT(*) AS Employee_Count
FROM EmployeeTree
GROUP BY LEVEL
ORDER BY LEVEL;

--Question 10 — Add Hierarchy Path
WITH EmployeeTree AS
(
    -- Anchor
    SELECT
        Employee_ID,
        Employee_Name,
        Manager_ID,
        0 AS Level,
        CAST(Employee_Name AS VARCHAR(500)) AS Hierarchy_Path
    FROM Employee_Hierarchy
    WHERE Manager_ID IS NULL

    UNION ALL

    -- Recursive part
    SELECT
        E.Employee_ID,
        E.Employee_Name,
        E.Manager_ID,
        ET.Level + 1,
        CAST(
            ET.Hierarchy_Path + ' > ' + E.Employee_Name
            AS VARCHAR(500)
        ) AS Hierarchy_Path
    FROM Employee_Hierarchy E
    INNER JOIN EmployeeTree ET
        ON E.Manager_ID = ET.Employee_ID
)
SELECT
    Employee_Name,
    Level,
    Hierarchy_Path
FROM EmployeeTree
ORDER BY Hierarchy_Path;

--Question 11 — Find All Employees Under Amit
WITH Employee_Tree AS 
(SELECT
Employee_ID,
Employee_Name,
Job_Title,
Manager_ID,
0 AS LEVEL
FROM Employee_Hierarchy
Where Employee_Name = 'Amit'

UNION ALL

SELECT
E.Employee_ID,
E.Employee_Name,
E.Job_Title,
E.Manager_ID,
ET.LEVEL+1
FROM Employee_Hierarchy E
INNER JOIN Employee_Tree ET
ON E.Manager_ID = ET.Employee_ID
)
SELECT
Employee_Name,
level
FROM Employee_Tree
Where Level > 0;

--------------------------------------------------------------------------------------------------------------------

--Unit 31: VIEWS:


CREATE TABLE Employee_View
(
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    City VARCHAR(50)
);

INSERT INTO Employee_View
VALUES
(1, 'Amit',   'IT',      70000, 'Pune'),
(2, 'Riya',   'HR',      50000, 'Mumbai'),
(3, 'Rahul',  'IT',      80000, 'Pune'),
(4, 'Neha',   'Sales',   60000, 'Delhi'),
(5, 'Arjun',  'IT',      75000, 'Mumbai'),
(6, 'Priya',  'HR',      55000, 'Pune'),
(7, 'Karan',  'Sales',   65000, 'Delhi'),
(8, 'Sneha',  'IT',      90000, 'Pune');

SELECT * FROM Employee_View;

--Question 1. Create a View that contains only IT employees.

CREATE VIEW IT_Employees 
AS 
SELECT
Employee_ID,
Employee_Name,
Department,
Salary,
City
FROM Employee_View
WHERE Department = 'IT';

SELECT * FROM IT_Employees;

SELECT * FROM IT_Employees
WHERE Salary > 70000;

SELECT * FROM IT_Employees
WHERE City = 'Pune';

SELECT
SUM(Salary) AS Total_IT_Salary
FROM IT_Employees;


--Question 2. Create a View showing employee name and annual salary.

CREATE VIEW Employee_Annual_Salary
AS
SELECT
Employee_ID,
Employee_Name,
Department,
Salary,
Salary * 12 AS Annual_Salary
FROM Employee_View;

SELECT * FROM Employee_Annual_Salary;

ALTER VIEW Employee_Annual_Salary
AS
SELECT
Employee_ID,
Employee_Name,
Department,
Salary,
City,
Salary * 12 AS Annual_Salary
FROM Employee_View;


--Question 3. Create a View showing average salary by department.
CREATE VIEW Average_Salary
AS
SELECT
Department,
AVG(Salary) AS Avg_salary
From Employee_View
Group by Department;

SELECT * FROM Average_Salary;

--Views Practice Project

CREATE TABLE Employee_View_Practice
(
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Department VARCHAR(50),
    Job_Title VARCHAR(50),
    Salary INT,
    City VARCHAR(50),
    Experience_Years INT,
    Joining_Year INT
);

INSERT INTO Employee_View_Practice
VALUES
(101, 'Amit',   'IT',      'Developer',       70000, 'Pune',      3, 2023),
(102, 'Riya',   'HR',      'HR Executive',    50000, 'Mumbai',    2, 2024),
(103, 'Rahul',  'IT',      'Senior Developer', 90000, 'Pune',      6, 2020),
(104, 'Neha',   'Sales',   'Sales Executive', 60000, 'Delhi',     4, 2022),
(105, 'Arjun',  'Finance', 'Accountant',      65000, 'Mumbai',    5, 2021),
(106, 'Priya',  'IT',      'Data Analyst',    75000, 'Bangalore', 4, 2022),
(107, 'Karan',  'Sales',   'Sales Manager',   85000, 'Delhi',     8, 2018),
(108, 'Sneha',  'HR',      'HR Manager',      80000, 'Pune',      7, 2019),
(109, 'Vikas',  'Finance', 'Financial Analyst',72000, 'Mumbai',    3, 2023),
(110, 'Pooja',  'IT',      'Data Engineer',   95000, 'Bangalore', 7, 2019),
(111, 'Raj',    'Sales',   'Sales Executive', 55000, 'Mumbai',    2, 2024),
(112, 'Anita',  'Finance', 'Senior Accountant',88000, 'Pune',      9, 2017);

SELECT * FROM Employee_View_Practice;

--Question 1 — IT Employees
CREATE VIEW IT_Employees1
AS
SELECT
Employee_ID,
Employee_name,
Department
FROM Employee_View_Practice
Where Department = 'IT';
SELECT * FROM IT_Employees1;

--Question 2 — High Salary Employees
CREATE VIEW Higher_Salary_Emp 
AS
SELECT
Employee_ID,
Employee_Name,
Department,
Salary
FROM Employee_View_Practice
WHERE Salary > 50000;
SELECT * FROM Higher_Salary_Emp;

--Question 3 — Mumbai Employees

CREATE VIEW Mumbai_Employees
AS
SELECT
Employee_ID,
Employee_Name,
City
FROM Employee_View_Practice
Where City = 'Mumbai';
SELECT * FROM Mumbai_Employees;

--Question 4 — Experienced Employees
CREATE VIEW Experienced_Employee
AS
SELECT 
Employee_ID,
Employee_Name,
Experience_Years
FROM Employee_View_Practice
WHERE Experience_Years > 5;
SELECT * FROM Experienced_Employee;

--Question 5 — Annual Salary View
CREATE VIEW Annual_Salary1
AS
SELECT
Employee_ID,
Employee_Name,
Salary,
Salary * 12 AS Annual_Income
FROM Employee_View_Practice;

SELECT * FROM Annual_Salary1;

--Question 6 — Salary Category
CREATE VIEW Salary_Category
AS
SELECT
Employee_ID,
Employee_Name,
Department,
Salary,
CASE
WHEN Salary >= 90000 THEN 'Highest Salary'
WHEN Salary >= 50000 THEN 'Medium Salary'
ELSE 'Lowest Salary'
END AS Salary_Category
FROM Employee_View_Practice;

SELECT * FROM Salary_Category;

--Question 7 — Department Salary Summary

CREATE VIEW Deptartment_Sal_Summary
AS
SELECT
Department,
COUNT(Employee_Name) AS Employee_Count,
AVG(Salary)AS Average_Salary,
MAX(Salary)AS Maximum_Salary,
MIN(Salary)AS Minimum_Salary
FROM Employee_View_Practice
GROUP BY Department;

SELECT * FROM Deptartment_Sal_Summary;

--Question 8 — City Employee Summary
CREATE VIEW City_E_Salary
AS
SELECT
CITY,
Count(*) AS Employee_Count,
AVG(Salary) AS Average_Salary
FROM Employee_View_Practice
Group by City;

SELECT * FROM City_E_Salary;

--Question 9 — Update Amit's Salary
UPDATE Employee_View_Practice
SET Salary = 75000
Where Employee_ID = 101;

SELECT * FROM Employee_View_Practice;

ALTER VIEW IT_Employees1
AS
SELECT
Employee_ID,
Employee_name,
Department,
City,
Salary
FROM Employee_View_Practice
Where Department = 'IT';
SELECT * FROM IT_Employees1;

--Question 10 — Update City Through View

Update IT_Employees1
SET City = 'Mumbai'
Where Employee_ID = 101;

--Question 12 — Change the Condition

ALTER VIEW IT_Employees1
AS
SELECT
Employee_ID,
Employee_name,
Department,
City,
Salary
FROM Employee_View_Practice
Where Salary >= 60000;
SELECT * FROM IT_Employees1;

----------------------------------------------------------------------------------------------------------------

--PART 6 — DROP VIEW

--Question 14 — Drop Mumbai View
DROP VIEW Mumbai_Employees;

SELECT * FROM Mumbai_Employees;

---------------------------------------------------------------------------------------------------------------

--Q16 — High Paid IT Employees
CREATE VIEW High_Paid_Employees
AS
SELECT
Employee_ID,
Employee_Name,
Department,
Salary
FROM Employee_View_Practice
Where Department = 'IT';

SELECT * FROM High_Paid_Employees;

ALTER VIEW High_Paid_Employees
AS
SELECT
Employee_ID,
Employee_Name,
Department,
Salary
FROM Employee_View_Practice
Where Department = 'IT'
AND Salary >= 80000;

--Q17 — Pune Employees with Experience:
CREATE VIEW Pune_Experienced_Employee
AS
SELECT
Employee_ID,
Employee_Name,
Experience_Years,
City
FROM Employee_View_Practice
Where City = 'Pune'
And Experience_Years > 5;

SELECT * FROM Pune_Experienced_Employee;

--Q18 — Department with Average Salary > 70000
CREATE VIEW Avg 
AS
SELECT
Department,
AVG(Salary) AS Average_Salary
FROM Employee_View_Practice
GROUP BY Department
Having AVG(Salary)> 70000;

SELECT * FROM Avg;













