SELECT
    Employee_ID,
    Employee_Name,
    Salary
INTO #EmployeeTemp
FROM Employees;

USE Data_Analyst_Practice;
GO

CREATE TABLE Customers_Temp
(
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    City VARCHAR(50),
    Customer_Type VARCHAR(20)
);

INSERT INTO Customers_Temp
VALUES
(1, 'Amit', 'Mumbai', 'Regular'),
(2, 'Rahul', 'Pune', 'Premium'),
(3, 'Riya', 'Delhi', 'Premium'),
(4, 'Neha', 'Mumbai', 'Regular'),
(5, 'Komal', 'Indore', 'Regular'),
(6, 'Arjun', 'Pune', 'Premium'),
(7, 'Priya', 'Delhi', 'Regular'),
(8, 'Sneha', 'Bangalore', 'Premium');


CREATE TABLE Products_Temp
(
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products_Temp
VALUES
(101, 'Laptop', 'Electronics', 60000),
(102, 'Mobile', 'Electronics', 30000),
(103, 'Headphones', 'Accessories', 3000),
(104, 'Keyboard', 'Accessories', 2000),
(105, 'Mouse', 'Accessories', 1000),
(106, 'Monitor', 'Electronics', 15000);

CREATE TABLE Orders_Temp
(
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Quantity INT,
    Order_Date DATE,
    Order_Status VARCHAR(20)
);

INSERT INTO Orders_Temp
VALUES
(1001, 1, 101, 1, '2026-01-05', 'Delivered'),
(1002, 2, 102, 2, '2026-01-07', 'Delivered'),
(1003, 3, 103, 3, '2026-01-10', 'Delivered'),
(1004, 1, 104, 2, '2026-01-15', 'Delivered'),
(1005, 4, 106, 1, '2026-01-20', 'Cancelled'),
(1006, 5, 105, 5, '2026-02-02', 'Delivered'),
(1007, 2, 101, 1, '2026-02-05', 'Delivered'),
(1008, 6, 102, 1, '2026-02-10', 'Delivered'),
(1009, 7, 103, 2, '2026-02-12', 'Pending'),
(1010, 3, 106, 2, '2026-02-15', 'Delivered'),
(1011, 8, 101, 1, '2026-02-20', 'Delivered'),
(1012, 4, 102, 1, '2026-02-25', 'Cancelled'),
(1013, 5, 104, 3, '2026-03-01', 'Delivered'),
(1014, 6, 103, 4, '2026-03-05', 'Delivered'),
(1015, 2, 106, 1, '2026-03-10', 'Delivered');

SELECT *
FROM Customers_Temp;

SELECT *
FROM Products_Temp;

SELECT *
FROM Orders_Temp;

--Question 1: Create a temporary table containing all delivered orders.
SELECT *
INTO #Deliveredorders
FROM Orders_Temp
Where Order_Status = 'Delivered';

SELECT * FROM #Deliveredorders

--Question 2. Count the number of delivered orders.
SELECT
COUNT(*)AS Deliveredcounts
FROM #Deliveredorders;

--Question 3. Find the total quantity of products sold in delivered orders.
SELECT
SUM(Quantity) AS Total_Deliveredorders
FROM #Deliveredorders;

--Question 4. Find the earliest delivered order.
SELECT
MIN(Order_Date) AS Earliest_Delivery
FROM #Deliveredorders;

SELECT
MAX(Order_Date) AS Latest_Delivery
FROM #Deliveredorders;



/*Question 6. Create a temporary table containing:
Order ID
Customer Name
Product Name
Quantity
Order Date
Order Status*/


SELECT
Order_ID,
Customer_Name,
Product_Name,
Quantity,
Order_Date,
Order_Status
INTO #Order_Details
FROM Orders_Temp
INNER JOIN Customers_Temp
ON Customers_Temp.Customer_ID =Orders_Temp.Customer_ID
INNER JOIN Products_Temp
ON Products_Temp.Product_ID =Orders_Temp.Product_ID;

SELECT * FROM #Order_Details;


--Question 7. Find all delivered orders from #OrderDetails.
SELECT * 
FROM #Order_Details
Where Order_Status = 'Delivered';

--Question 8. Find all orders made by customers from Mumbai.
SELECT * 
FROM #Order_Details
Where Customer_Name IN
(Select Customer_Name
FROM Customers_Temp
Where City = 'Mumbai');

/*Question 9
Create a temporary table containing:
Order ID
Customer Name
Product Name
Quantity
Price
Revenue*/

SELECT
Order_ID,
Customer_Name,
Product_Name,
Quantity,
Price,
Quantity * Price AS Revenue
INTO #RevenueData
FROM Orders_Temp
INNER JOIN Customers_Temp
ON Customers_Temp.Customer_ID = Orders_Temp.Customer_ID
INNER JOIN Products_Temp
ON Products_Temp.Product_ID = Orders_Temp.Product_ID;

SELECT * FROM #RevenueData; 

--Question 12. Find the highest-value order.
SELECT
MAX(Revenue)AS High_value_order
FROM #RevenueData;

SELECT TOP 1
    *
FROM #RevenueData
ORDER BY Revenue DESC;

--Question 13. Find total revenue by customer.

SELECT
Customer_Name,
SUM(Revenue) AS Total_Revenue
FROM #RevenueData
Group by Customer_Name
Order by Total_Revenue DESC;

--Session Scope Practice
SELECT *
INTO #SessionTest
FROM Customers_Temp;

SELECT * FROM #SessionTest;


