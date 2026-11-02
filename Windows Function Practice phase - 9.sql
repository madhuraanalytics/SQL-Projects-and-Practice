
USE Data_Analyst_Practice;
GO

--TABLE 1

CREATE TABLE WF_Employees
(
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Department VARCHAR(50),
    City VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO WF_Employees
VALUES
(1, 'Amit',  'IT',        'Mumbai',    60000),
(2, 'Rahul', 'IT',        'Pune',      70000),
(3, 'Riya',  'IT',        'Delhi',     70000),
(4, 'Neha',  'HR',        'Mumbai',    55000),
(5, 'Komal', 'HR',        'Pune',      50000),
(6, 'Arjun', 'Finance',   'Delhi',     65000),
(7, 'Priya', 'Finance',   'Mumbai',    75000),
(8, 'Sneha', 'Finance',   'Pune',      65000),
(9, 'Karan', 'Sales',     'Delhi',     45000),
(10,'Pooja', 'Sales',     'Mumbai',    55000),
(11,'Vikas', 'Sales',     'Pune',      55000),
(12,'Anita', 'Marketing', 'Delhi',     60000);


--TABLE -2 
CREATE TABLE WF_MonthlySales
(
    Sale_ID INT PRIMARY KEY,
    Employee_ID INT,
    Sale_Month DATE,
    Sales_Amount DECIMAL(10,2)
);

INSERT INTO WF_MonthlySales
VALUES
(1,  1, '2026-01-01', 40000),
(2,  1, '2026-02-01', 45000),
(3,  1, '2026-03-01', 50000),
(4,  1, '2026-04-01', 55000),

(5,  2, '2026-01-01', 60000),
(6,  2, '2026-02-01', 65000),
(7,  2, '2026-03-01', 62000),
(8,  2, '2026-04-01', 70000),

(9,  3, '2026-01-01', 55000),
(10,3, '2026-02-01', 58000),
(11,3, '2026-03-01', 60000),
(12,3, '2026-04-01', 65000),

(13,4, '2026-01-01', 30000),
(14,4, '2026-02-01', 35000),
(15,4, '2026-03-01', 32000),
(16,4, '2026-04-01', 40000),

(17,5, '2026-01-01', 25000),
(18,5, '2026-02-01', 30000),
(19,5, '2026-03-01', 28000),
(20,5, '2026-04-01', 35000);


SELECT *
FROM WF_Employees;

SELECT *
FROM WF_MonthlySales;

--LEVEL 1 — ROW_NUMBER()

--Question 1. Give every employee a unique row number based on salary from highest to lowest.
SELECT
Employee_Name,
Department,
Salary,
ROW_NUMBER() OVER
(Order by Salary DESC
) AS Row_Number
FROM WF_Employees;


--Question.2 Give each employee a row number inside their department.
SELECT
Employee_Name,
Department,
Salary,
ROW_NUMBER() OVER
(PARTITION BY Department
ORDER BY Salary DESC)
as ROW_Number
FROM WF_Employees;

--Question 3 — Find the highest-paid employee in each department

SELECT
Employee_ID,
Employee_Name,
Department,
Salary,
RANK() OVER
(PARTITION BY Department
ORDER BY Salary DESC)
AS Salary_Number
FROM WF_Employees;


WITH RankedEmployees AS
(
SELECT
Employee_ID,
Employee_Name,
Department,
Salary,
ROW_NUMBER() OVER
(PARTITION BY Department
ORDER BY Salary DESC) AS Row_Number
FROM WF_Employees)

SELECT
Employee_ID,
Employee_Name,
Department,
Salary
FROM RankedEmployees
Where Row_Number = 1;

--LEVEL 2 — RANK()

--Question 4. Rank employees by salary.
SELECT
Employee_ID,
Employee_Name,
Department,
Salary,
RANK() OVER
(ORDER BY Salary DESC) AS Rank_Employees
FROM WF_Employees;

/*SELECT
Employee_ID,
Employee_Name,
Department,
Salary,
DENSE_RANK() OVER
(ORDER BY Salary DESC) AS Rank_Employees
FROM WF_Employees;*/

--Question 5 — Rank employees inside each department

SELECT
Employee_ID,
Employee_Name,
Department,
Salary,
RANK()OVER
(PARTITION BY Department
ORDER BY Salary DESC
)
FROM WF_Employees;

--Question 7 — Find the second-highest salary

WITH SalaryRank AS
(
SELECT
Employee_Name,
Department,
Salary,
DENSE_RANK() OVER
(ORDER BY Salary DESC) AS Ranked_Salary
FROM WF_Employees
)
SELECT * FROM SalaryRank
WHERE Ranked_Salary = 2;


--LEVEL 4 — NTILE()
--NTILE() divides rows into groups.

--Question 8. Divide employees into 4 salary groups.

SELECT
Employee_Name,
Salary,
NTILE(4) OVER
(Order by Salary DESC) AS Salary_Rank
from WF_Employees;

--LEVEL 5 — Aggregate Window Functions

--Question 9 — Department Average Salary
SELECT
Department,
Salary,
AVG(Salary)OVER
(Partition by Department) AS Avg_Salary
FROM WF_Employees;

--Question 10 — Department Total Salary
SELECT
Department,
Salary,
SUM(Salary)OVER
(Partition by Department) AS Total_Salary
FROM WF_Employees;

--Question 11 — Minimum and Maximum Salary
SELECT
Employee_ID,
Employee_Name,
Department,
Salary,
MIN(Salary)OVER
(PARTITION BY Department) AS minimum_salary,
MAX(Salary)OVER
(Partition by Department) AS Maximum_Salary
FROM WF_Employees;

SELECT
Employee_ID,
Employee_Name,
Department,
Salary,
MIN(Salary) OVER() AS Min_Salary,
MAX(Salary) OVER() as Max_Salary
FROM WF_Employees;

--Question 12 — Number of Employees in Each Department
SELECT
Employee_Name,
Department,
Count(*) OVER(
Partition by Department)
FROM WF_Employees;

--Question 13 — Find employees earning above their department average

WITH Dept_Avg AS
(
SELECT
Employee_ID,
Employee_Name,
Department,
Salary,
AVG(Salary) OVER
(Partition by Department) AS Avg_Salary
FROM WF_Employees
)
SELECT * FROM Dept_Avg
Where Salary > Avg_Salary;


--Question 14. Compare Employee Salary with Department Average
WITH Dept_Avg AS
(
SELECT
Employee_ID,
Employee_Name,
Department,
Salary,
AVG(Salary) OVER
(Partition by Department) AS Avg_Salary
FROM WF_Employees
)

SELECT
Employee_Name,
Department,
Salary,
Avg_Salary,
Salary - Avg_Salary AS Difference
FROM Dept_Avg;

--LEVEL 7 — LAG() means:Look at a previous row.

--Question 15. Show each employee's monthly sales and their previous month's sales.
SELECT * FROM WF_MonthlySales;

SELECT
Employee_ID,
Sale_Month,
Sales_Amount,
LAG(Sales_Amount)OVER
(Partition by Employee_ID 
ORDER BY Sale_Month) AS Previous_Sales
FROM WF_MonthlySales;

--Question 16. Month-over-month sales change.
SELECT
Employee_ID,
Sale_Month,
Sales_Amount,
LAG(Sales_Amount)OVER
(Partition by Employee_ID 
ORDER BY Sale_Month) AS Previous_Sales,

Sales_Amount -
    LAG(Sales_Amount) OVER(
        PARTITION BY Employee_ID
        ORDER BY Sale_Month
    ) AS Sales_Change

FROM WF_MonthlySales;

--LEVEL 8 — LEAD() Shows the next row value 

--Question 18. Show the next month's sales.
SELECT
Employee_ID,
Sale_Month,
Sales_Amount,
LEAD(Sales_Amount)OVER
(Partition by Employee_ID
Order by Sale_Month)
AS Next_Month_Sales
FROM WF_MonthlySales;

--Question 19. Compare current sales with next month's sales.

WITH SalesAnalysis AS 
(
SELECT
Employee_ID,
Sale_Month,
Sales_Amount,
LEAD(Sales_Amount) OVER
(Partition by Employee_ID 
Order by Sale_Month) AS Next_Sales
FROM WF_MonthlySales
)
SELECT
Employee_ID,
Sale_Month,
Sales_Amount,
Next_Sales,
Next_Sales - Sales_Amount AS Difference
FROM SalesAnalysis;


--LEVEL 9 — FIRST_VALUE() Shows the next row value 
SELECT
Employee_Name,
Salary,
FIRST_VALUE(Salary) OVER
(
ORDER BY Salary DESC
) AS Highest_Salary
FROM WF_Employees;

--FIRST_VALUE() with PARTITION BY

--Highest salary in each department.
SELECT
Employee_Name,
Department,
Salary,
FIRST_VALUE(Salary) OVER(
Partition by Department
Order by Salary DESC)
FROM WF_Employees;

--LAST VALUE()
SELECT
Employee_Name,
Department,
Salary,
LAST_VALUE(Salary) OVER(
Partition by Department
Order by Salary DESC)
FROM WF_Employees;

SELECT
    Employee_Name,
    Department,
    Salary,

    LAST_VALUE(Salary) OVER
    (
        PARTITION BY Department
        ORDER BY Salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS Lowest_Dept_Salary

FROM WF_Employees;

--NTH_VALUE()
SELECT
Employee_Name,
Department,
Salary,
NTH_Value(Salary,2) OVER
(ORDER BY Salary DESC
 ROWS BETWEEN UNBOUNDED PRECEDING
 AND UNBOUNDED FOLLOWING
 ) AS Second_Salary
FROM WF_Employees;