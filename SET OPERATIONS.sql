
--PHASE 10 — SET OPERATIONS PRACTICE
/*We'll create 4 tables:

1.Customers_2025
2.Customers_2026
3.Online_Customers
4.Store_Customers*/

USE Data_Analyst_Practice;
GO

--Table 1 — Customers_2025

CREATE TABLE Customers_2025
(
    Customer_ID INT,
    Customer_Name VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Customers_2025
VALUES
(101, 'Rahul', 'Delhi'),
(102, 'Priya', 'Mumbai'),
(103, 'Amit', 'Pune'),
(104, 'Sneha', 'Delhi'),
(105, 'Neha', 'Bhopal'),
(106, 'Rohan', 'Indore'),
(107, 'Anjali', 'Mumbai');

--Table 2 — Customers_2026
CREATE TABLE Customers_2026
(
    Customer_ID INT,
    Customer_Name VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Customers_2026
VALUES
(103, 'Amit', 'Pune'),
(104, 'Sneha', 'Delhi'),
(105, 'Neha', 'Bhopal'),
(108, 'Karan', 'Jaipur'),
(109, 'Pooja', 'Mumbai'),
(110, 'Vikas', 'Delhi'),
(111, 'Meena', 'Pune');

--Table 3 — Online Customers

CREATE TABLE Online_Customers
(
    Customer_ID INT,
    Customer_Name VARCHAR(50)
);

INSERT INTO Online_Customers
VALUES
(101, 'Rahul'),
(102, 'Priya'),
(103, 'Amit'),
(105, 'Neha'),
(108, 'Karan'),
(109, 'Pooja');

--Table 4 — Store Customers

CREATE TABLE Store_Customers
(
    Customer_ID INT,
    Customer_Name VARCHAR(50)
);

INSERT INTO Store_Customers
VALUES
(103, 'Amit'),
(104, 'Sneha'),
(105, 'Neha'),
(106, 'Rohan'),
(110, 'Vikas'),
(112, 'Arjun');

SELECT * FROM Customers_2025;
SELECT * FROM Customers_2026;
SELECT * FROM Online_Customers;
SELECT * FROM Store_Customers;

--Question 1. Find all unique customers who were active in either 2025 or 2026.

SELECT
Customer_ID,
Customer_Name
FROM Customers_2025

UNION 

SELECT
Customer_ID,
Customer_Name
FROM Customers_2026;

--Question 2. Find all unique cities where customers were present in either 2025 or 2026.

SELECT
City
FROM Customers_2025

UNION 

SELECT
City
FROM Customers_2026;

--Question 3. Combine the customers from 2025 and 2026, including duplicates.

SELECT
Customer_ID,
Customer_Name
FROM Customers_2025

UNION ALL

SELECT
Customer_ID,
Customer_Name
From Customers_2026;

--Question 4. Combine Online and Store customers while keeping duplicates.
SELECT
Customer_ID,
Customer_Name
FROM Online_Customers

UNION ALL

SELECT
Customer_ID,
Customer_Name
FROM Store_Customers;

--Question 5. Find customers who were active in BOTH 2025 and 2026.

SELECT
Customer_ID,
Customer_Name
FROM Customers_2025

INTERSECT

SELECT
Customer_ID,
Customer_Name
FROM Customers_2026;

--Question 6. Find customers who used BOTH Online and Store channels.

SELECT
Customer_ID,
Customer_Name
FROM Online_Customers

INTERSECT 

SELECT
Customer_ID,
Customer_Name
FROM Store_Customers;

--Question 7. Find customers who were in 2025 but NOT in 2026.

SELECT
Customer_ID,
Customer_Name
FROM Customers_2025

EXCEPT

SELECT
Customer_ID,
Customer_Name
FROM Customers_2026;

--Question 8. Find customers who are in 2026 but were NOT in 2025.

SELECT
Customer_ID,
Customer_Name
FROM Customers_2026

EXCEPT

SELECT
Customer_ID,
Customer_Name
FROM Customers_2025;

--Question 9. Find customers who purchased online but NOT in the physical store.

SELECT
Customer_ID,
Customer_Name
FROM Online_Customers

EXCEPT 

SELECT
Customer_ID,
Customer_Name
FROM Store_Customers;

--Question 11. Find all customers who are either Online or Store customers, without duplicates.
SELECT
Customer_ID,
Customer_Name
FROM Online_Customers

UNION 

SELECT
Customer_ID,
Customer_Name
FROM Store_Customers;

--Question 12. Find customers who are either Online or Store customers, keeping duplicates.

SELECT
Customer_ID,
Customer_Name
FROM Online_Customers

UNION ALL

SELECT
Customer_ID,
Customer_Name
FROM Store_Customers;

--Question 15. Find customers who Were new in 2026 compared to 2025.
SELECT
Customer_ID,
Customer_Name
FROM Customers_2026

EXCEPT 

SELECT
Customer_ID,
Customer_Name
FROM Customers_2025;

--Question 21. Find customers who were in 2025 AND Online, but NOT in Store.
SELECT
Customer_ID,
Customer_Name
FROM Customers_2025

INTERSECT

SELECT
Customer_ID,
Customer_Name
FROM Online_Customers

EXCEPT

SELECT
Customer_ID,
Customer_Name
FROM Store_Customers;

--Question 22. Find customers who are In either 2025 OR 2026, but NOT in both.

(SELECT
Customer_ID,
Customer_Name
FROM Customers_2025

EXCEPT 

SELECT
Customer_ID,
Customer_Name
FROM Customers_2026
)
UNION 

(SELECT
Customer_ID,
Customer_Name
FROM Customers_2026

EXCEPT 

SELECT
Customer_ID,
Customer_Name
FROM Customers_2025);






