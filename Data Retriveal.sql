
--CREATE DATABASE:
CREATE DATABASE Data_Analyst_Practice;

--Use 
USE Data_Analyst_Practice;
GO

--CREATE TABLE(PARENT TABLE):
CREATE TABLE Sales
(
    Order_ID INT IDENTITY(1001,1) PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Gender CHAR(1),
    Age INT,
    City VARCHAR(50),
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Discount_Percent DECIMAL(5,2),
    Order_Date DATE,
    Payment_Method VARCHAR(30),
    Order_Status VARCHAR(20),
    Salesperson VARCHAR(100)
);

--DISPLAY ALL COLUMNS:
SELECT * FROM Sales;

--INSERT DATA IN TABLE:
INSERT INTO Sales
(
    Customer_Name,
    Gender,
    Age,
    City,
    Product_Name,
    Category,
    Quantity,
    Unit_Price,
    Discount_Percent,
    Order_Date,
    Payment_Method,
    Order_Status,
    Salesperson
)
VALUES
('Amit Sharma', 'M', 25, 'Pune', 'Laptop', 'Electronics', 1, 55000, 5, '2026-01-05', 'Credit Card', 'Delivered', 'Riya'),
('Priya Verma', 'F', 30, 'Mumbai', 'Mobile Phone', 'Electronics', 2, 25000, 10, '2026-01-08', 'UPI', 'Delivered', 'Rahul'),
('Rahul Singh', 'M', 22, 'Delhi', 'Office Chair', 'Furniture', 1, 8000, 0, '2026-01-10', 'Cash', 'Cancelled', 'Neha'),
('Neha Patel', 'F', 28, 'Pune', 'Headphones', 'Electronics', 3, 2500, 5, '2026-01-12', 'UPI', 'Delivered', 'Riya'),
('Karan Mehta', 'M', 35, 'Mumbai', 'Dining Table', 'Furniture', 1, 30000, 15, '2026-01-15', 'Debit Card', 'Pending', 'Rahul'),
('Riya Gupta', 'F', 24, 'Indore', 'Notebook', 'Stationery', 10, 100, 0, '2026-02-01', 'Cash', 'Delivered', 'Neha'),
('Mohit Jain', 'M', 40, 'Jaipur', 'Refrigerator', 'Appliances', 1, 42000, 8, '2026-02-04', 'Credit Card', 'Delivered', 'Amit'),
('Sneha Kapoor', 'F', 32, 'Delhi', 'Washing Machine', 'Appliances', 1, 35000, 10, '2026-02-06', 'UPI', 'Returned', 'Amit'),
('Vikas Yadav', 'M', 29, 'Pune', 'Keyboard', 'Electronics', 2, 1500, 5, '2026-02-08', 'UPI', 'Delivered', 'Riya'),
('Anjali Soni', 'F', 26, 'Bhopal', 'Pen Set', 'Stationery', 5, 500, 0, '2026-02-12', 'Cash', 'Delivered', 'Neha'),
('Arjun Malhotra', 'M', 45, 'Mumbai', 'Television', 'Electronics', 1, 60000, 12, '2026-03-01', 'Credit Card', 'Delivered', 'Rahul'),
('Komal Joshi', 'F', 21, 'Indore', 'Study Table', 'Furniture', 1, 12000, 5, '2026-03-03', 'Debit Card', 'Pending', 'Neha'),
('Suresh Kumar', 'M', 38, 'Delhi', 'Air Conditioner', 'Appliances', 2, 40000, 10, '2026-03-06', 'Credit Card', 'Delivered', 'Amit'),
('Pooja Shah', 'F', 27, 'Pune', 'Mouse', 'Electronics', 4, 800, 0, '2026-03-10', 'UPI', 'Cancelled', 'Riya'),
('Nitin Agarwal', 'M', 33, 'Jaipur', 'Bookshelf', 'Furniture', 2, 9000, 7, '2026-03-15', 'Cash', 'Delivered', 'Rahul'),
('Meena Roy', 'F', NULL, NULL, 'Mixer Grinder', 'Appliances', 1, 6000, 5, '2026-03-18', NULL, 'Pending', 'Amit');


--UNIT 11: SELECT Statement:

--DISPLAY SELECTED COLUMN:
SELECT Customer_Name,City,Product_Name FROM Sales;

--DISPLAY ONE COLUMN:
SELECT Customer_Name FROM Sales;

--Change output column names using aliases:
SELECT
Customer_Name AS [Customer],
Discount_Percent AS [Discount],
Unit_Price AS [Price]
FROM Sales;

--Find unique using DISTINCT
SELECT DISTINCT City FROM Sales;
SELECT DISTINCT Category,City,Quantity FROM Sales;

SELECT * FROM Sales;

--Calculated columns and Expressions:
--Calculate Gross Sale:
SELECT
Order_ID,
Customer_Name,
Product_Name,
Quantity,
Unit_Price,
Quantity * Unit_Price AS Gross_Sales
FROM Sales;

--Calculate discount amount
SELECT
Order_ID,
Customer_Name,
Product_Name,
Quantity,
Unit_Price,
Discount_Percent,
Quantity * Unit_Price AS Gross_Sales,
CAST(Quantity * Unit_Price * Discount_Percent / 100.0 AS DECIMAL(10,2)) Discount_Amount
FROM Sales;

-------------------------------------------------------------------------------------------------

--UNIT 12:Filering Data:

--FILTERING DATA:
SELECT * FROM SALES
WHERE City = 'Pune';

SELECT * FROM sales
WHERE Category = 'Furniture';

SELECT * FROM sales
WHERE Age >= 30;

SELECT * FROM SALES
WHERE Order_Status != 'Delivered';

SELECT Order_ID,Customer_Name,Age FROM SALES
WHERE age BETWEEN 18 AND 30;

SELECT * FROM SALES
WHERE City = 'Indore'
AND Category = 'Furniture';

SELECT * FROM SALES
WHERE City = 'Mumbai'
OR  City = 'Bangalore';

SELECT * FROM SALES
WHERE Order_Status = 'Delivered'
OR Order_Status = 'Pending';

SELECT * FROM SALES
WHERE Category = 'Stationery'
AND (City = 'Delhi' OR City = 'Indore');

SELECT Order_ID,Customer_Name,Product_Name,Order_Date FROM SALES
where Order_Date BETWEEN '2026-01-01' AND '2026-01-31';

SELECT * FROM SALES
WHERE City IN ('Indore','Bhopal');

SELECT * FROM SALES
WHERE Payment_Method NOT IN ('Cash');

SELECT Customer_Name FROM SALES
WHERE Customer_Name LIKE 'A%';

SELECT * FROM SALES
WHERE Customer_Name LIKE 'A%'; --Customer Name starting with A

SELECT * FROM SALES
WHERE Customer_Name LIKE '%a'; --Customer Name ending with a

SELECT * FROM SALES
WHERE Category LIKE '%Elec%'; --Category contains 

SELECT * FROM SALES
WHERE Customer_Name LIKE 'M%'; --Customer name starting with M

SELECT City FROM SALES
WHERE City LIKE '_a%'; --Second character is “i”

SELECT * FROM Sales
WHERE Customer_Name LIKE '__________';--exact four characters 

SELECT * FROM SALES
WHERE Customer_Name LIKE '[AKM]%'; --Names starting with AKM

SELECT *
FROM Sales
WHERE Customer_Name LIKE '[^AKM]%'; --Name not starting with AKM

SELECT * FROM SALES
WHERE City IS NULL; --Check null values

SELECT * FROM SALES
WHERE Customer_Name IS NULL;

SELECT * FROM SALES
WHERE Order_Status IS NULL;

SELECT * FROM SALES
WHERE Product_Name IS NULL;

SELECT * FROM SALES
WHERE Payment_Method IS NULL;

SELECT * FROM SALES
WHERE Payment_Method IS NOT NULL;

SELECT * FROM SALES
WHERE NOT City = 'Pune';

SELECT * FROM Sales
WHERE Customer_Name LIKE 'M%____';

-------------------------------------------------------------------------------------------------

--UNIT 13 SORTING DATA
--ASC: Ascending Order
SELECT Customer_Name, Age FROM SALES
ORDER BY AGE ASC;

SELECT * FROM SALES ORDER BY Discount_Percent;

Select Customer_Name , Unit_Price FROM Sales
ORDER BY Unit_Price ASC;

SELECT Customer_Name,Age,Order_Date FROM Sales
ORDER BY Order_Date ASC;

SELECT Customer_Name, Product_Name 
from Sales ORDER BY Product_Name;

SELECT Customer_Name, Category 
from Sales ORDER BY Category;

SELECT Customer_Name, Category 
from Sales ORDER BY Category, Customer_Name;

--DESC: Descending Order:
SELECT * FROM SALES
ORDER BY Unit_Price DESC;

SELECT * FROM SALES
ORDER BY Unit_Price DESC;

SELECT 
Customer_Name,
Product_Name,
Quantity,
Unit_Price,
Discount_Percent,
(Quantity * Unit_Price) AS Gross_Sale,
(Quantity * Unit_Price)-
CAST((Quantity * Unit_Price) * Discount_Percent/100.0 AS DECIMAL(10,2)) AS Final_Sales
FROM Sales
ORDER BY Final_Sales DESC;

--SORTING BY MULTIPLE COLUMNS:

SELECT Customer_Name,City
From Sales 
ORDER BY 
City ASC,
Customer_Name ASC;


SELECT
    Category,
    Product_Name,
    Unit_Price
FROM Sales
ORDER BY
    Category ASC,
    Unit_Price DESC;

------------------------------------------------------------------------------------------------

--Unit 14: LIMIT & OFFSET

--TOP
--Display first five rows

SELECT TOP 5 * FROM SALES;

SELECT TOP 5 * FROM SALES
ORDER BY Age ASC;

SELECT TOP 5 * FROM SALES
ORDER BY Unit_Price DESC;

SELECT TOP 5 Category,Unit_Price FROM SALES
ORDER BY Unit_Price DESC;

SELECT TOP 3
Customer_Name,
Product_Name,
Quantity,
Unit_Price,
Discount_Percent,
(Quantity * Unit_Price) AS Gross_Sale,
(Quantity * Unit_Price)-
CAST((Quantity * Unit_Price) * Discount_Percent/100.0 AS DECIMAL(10,2)) AS Final_Sales
FROM Sales
ORDER BY Final_Sales DESC;


SELECT TOP 3 WITH TIES
    Customer_Name,
    Unit_Price
FROM Sales
ORDER BY Unit_Price DESC;

SELECT * FROM SALES;

UPDATE SALES
SET Unit_Price = 30000
where Order_ID = 1001;

SELECT TOP 2 WITH TIES *
FROM SALES
ORDER BY Unit_Price ASC;

SELECT TOP 5 WITH TIES *
FROM SALES
ORDER BY Unit_Price DESC;


--OFFSET AND FETCH

SELECT * FROM SALES
ORDER BY Order_ID
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;

SELECT * FROM SALES
ORDER BY Age
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;

SELECT * FROM SALES
ORDER BY Customer_Name
OFFSET 11 ROWS
FETCH NEXT 5 ROWS ONLY;

SELECT * FROM SALES
ORDER BY Order_ID
OFFSET 11 ROWS
FETCH NEXT 5 ROWS ONLY;

SELECT * FROM SALES
ORDER BY Order_Date ASC
OFFSET 9 ROWS
FETCH NEXT 5 ROWS ONLY;


--Question1. Pune and Mumbai electronics customers
SELECT Customer_Name,City,Category,Unit_Price FROM SALES
where Category = 'Electronics' AND
City IN ('Mumbai','Pune')
ORDER BY Unit_Price DESC;

--Question2. Find unsuccessful orders
SELECT * FROM SALES;
SELECT Order_ID,
Customer_Name,
Order_Status
FROM SALES
WHERE Order_Status IN ('Cancelled','Pending')
ORDER BY Order_ID;

--Question3. Customers with missing information
SELECT * FROM SALES;
SELECT * FROM SALES
WHERE Age IS NULL
OR City IS NULL
OR Payment_Method IS NULL;

--Question4. Customers aged 25–35, excluding cancelled orders
SELECT 
Order_ID,
Customer_Name,
Age,
Order_Status
FROM SALES
Where Age Between 25 AND 35 
AND Order_Status != 'Cancelled'
ORDER BY Age ASC;

--Question5. First page of delivered orders
SELECT
Order_ID,
Customer_Name,
Product_Name,
Order_Status
FROM Sales
WHERE Order_Status = 'Delivered'
ORDER BY Order_ID
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;

--Question6. Second page of delivered orders
SELECT
Order_ID,
Customer_Name,
Product_Name,
Order_Status
FROM SALES
WHERE Order_Status = 'Delivered'
ORDER BY Order_ID
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;


