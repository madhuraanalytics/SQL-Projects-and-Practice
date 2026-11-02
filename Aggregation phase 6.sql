--PHASE-6
--UNIT-19
--(AGGREGATION):

USE Data_Analyst_Practice;
GO

CREATE TABLE Retail_Sales
(
    Sale_ID INT IDENTITY(1001,1) PRIMARY KEY,

    Order_Date DATE NOT NULL,

    Customer_Name VARCHAR(100) NOT NULL,
    Customer_Type VARCHAR(20),

    City VARCHAR(50),
    Region VARCHAR(20),

    Product_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Brand VARCHAR(50),

    Quantity INT,
    Unit_Price DECIMAL(12,2),
    Cost_Price DECIMAL(12,2),
    Discount_Percent DECIMAL(5,2),

    Salesperson VARCHAR(100),
    Payment_Method VARCHAR(30),
    Order_Status VARCHAR(20),

    Rating DECIMAL(3,1)
);

INSERT INTO Retail_Sales
(
    Order_Date,
    Customer_Name,
    Customer_Type,
    City,
    Region,
    Product_Name,
    Category,
    Brand,
    Quantity,
    Unit_Price,
    Cost_Price,
    Discount_Percent,
    Salesperson,
    Payment_Method,
    Order_Status,
    Rating
)
VALUES

('2026-01-05', 'Amit Sharma', 'Regular', 'Pune', 'West',
 'Laptop', 'Electronics', 'Dell',
 1, 55000, 47000, 5,
 'Riya', 'Credit Card', 'Delivered', 4.5),

('2026-01-07', 'Priya Verma', 'Premium', 'Mumbai', 'West',
 'Mobile Phone', 'Electronics', 'Samsung',
 2, 25000, 21000, 10,
 'Rahul', 'UPI', 'Delivered', 4.8),

('2026-01-10', 'Rahul Singh', 'Regular', 'Delhi', 'North',
 'Office Chair', 'Furniture', 'Godrej',
 2, 8000, 6200, 0,
 'Neha', 'Cash', 'Cancelled', 3.5),

('2026-01-12', 'Neha Patel', 'Premium', 'Pune', 'West',
 'Headphones', 'Electronics', 'Sony',
 3, 3000, 2100, 5,
 'Riya', 'UPI', 'Delivered', 4.3),

('2026-01-15', 'Karan Mehta', 'Regular', 'Mumbai', 'West',
 'Dining Table', 'Furniture', 'Nilkamal',
 1, 30000, 24000, 15,
 'Rahul', 'Debit Card', 'Pending', 3.9),

('2026-01-18', 'Riya Gupta', 'Regular', 'Indore', 'Central',
 'Notebook', 'Stationery', 'Classmate',
 10, 120, 75, 0,
 'Neha', 'Cash', 'Delivered', 4.7),

('2026-02-02', 'Mohit Jain', 'Premium', 'Jaipur', 'North',
 'Refrigerator', 'Appliances', 'LG',
 1, 42000, 35000, 8,
 'Amit', 'Credit Card', 'Delivered', 4.4),

('2026-02-05', 'Sneha Kapoor', 'Regular', 'Delhi', 'North',
 'Washing Machine', 'Appliances', 'Samsung',
 1, 36000, 30000, 10,
 'Amit', 'UPI', 'Returned', 3.2),

('2026-02-08', 'Vikas Yadav', 'Regular', 'Pune', 'West',
 'Keyboard', 'Electronics', 'Logitech',
 2, 1800, 1200, 5,
 'Riya', 'UPI', 'Delivered', 4.6),

('2026-02-11', 'Anjali Soni', 'Premium', 'Bhopal', 'Central',
 'Pen Set', 'Stationery', 'Parker',
 5, 600, 350, 0,
 'Neha', 'Cash', 'Delivered', 4.1),

('2026-02-15', 'Arjun Malhotra', 'Premium', 'Mumbai', 'West',
 'Television', 'Electronics', 'Sony',
 1, 60000, 50000, 12,
 'Rahul', 'Credit Card', 'Delivered', 4.9),

('2026-02-18', 'Komal Joshi', 'Regular', 'Indore', 'Central',
 'Study Table', 'Furniture', 'Nilkamal',
 1, 12500, 9500, 5,
 'Neha', 'Debit Card', 'Pending', 3.8),

('2026-03-02', 'Suresh Kumar', 'Premium', 'Delhi', 'North',
 'Air Conditioner', 'Appliances', 'Voltas',
 2, 41000, 34000, 10,
 'Amit', 'Credit Card', 'Delivered', 4.4),

('2026-03-05', 'Pooja Shah', 'Regular', 'Pune', 'West',
 'Mouse', 'Electronics', 'Logitech',
 4, 850, 500, 0,
 'Riya', 'UPI', 'Cancelled', 3.0),

('2026-03-08', 'Nitin Agarwal', 'Regular', 'Jaipur', 'North',
 'Bookshelf', 'Furniture', 'Godrej',
 2, 9000, 7000, 7,
 'Rahul', 'Cash', 'Delivered', 4.2),

('2026-03-11', 'Meena Roy', 'Regular', 'Bhopal', 'Central',
 'Mixer Grinder', 'Appliances', 'Bajaj',
 1, 6500, 5000, 5,
 'Amit', 'UPI', 'Pending', NULL),

('2026-03-15', 'Deepak Mishra', 'Regular', 'Lucknow', 'North',
 'USB Cable', 'Electronics', 'Boat',
 5, 300, 150, 0,
 'Riya', 'Cash', 'Delivered', 3.7),

('2026-03-19', 'Kavita Rao', 'Premium', 'Hyderabad', 'South',
 'Office Desk', 'Furniture', 'Godrej',
 2, 16000, 12500, 20,
 'Neha', 'Net Banking', 'Delivered', 4.6),

('2026-04-02', 'Rohan Desai', 'Premium', 'Ahmedabad', 'West',
 'Gaming Monitor', 'Electronics', 'Dell',
 2, 28500, 23000, 9.5,
 'Rahul', 'Credit Card', 'Delivered', 4.8),

('2026-04-05', 'Simran Kaur', 'Regular', 'Chandigarh', 'North',
 'Drawing Book', 'Stationery', 'Classmate',
 10, 200, 120, 2,
 'Neha', 'UPI', 'Delivered', 4.2),

('2026-04-09', 'Manoj Tiwari', 'Regular', 'Nagpur', 'Central',
 'Microwave Oven', 'Appliances', 'LG',
 1, 14000, 11000, 6,
 'Amit', 'Debit Card', 'Delivered', 4.0),

('2026-04-12', 'Asha Nair', 'Premium', 'Kochi', 'South',
 'Bluetooth Speaker', 'Electronics', 'Boat',
 3, 3300, 2400, 5,
 'Riya', 'UPI', 'Delivered', 4.5),

('2026-04-16', 'Farhan Ali', 'Regular', 'Bengaluru', 'South',
 'Computer Table', 'Furniture', 'Nilkamal',
 1, 18500, 14000, 10,
 'Rahul', 'Net Banking', 'Returned', 3.3),

('2026-04-20', 'Tanya Bose', 'Premium', 'Kolkata', 'East',
 'Water Purifier', 'Appliances', 'Kent',
 2, 11500, 9000, 5,
 'Amit', 'Credit Card', 'Delivered', 4.7),

('2026-05-02', 'Akash Patel', 'Regular', 'Surat', 'West',
 'Tablet', 'Electronics', 'Samsung',
 2, 22000, 18000, 8,
 'Riya', 'UPI', 'Delivered', 4.3),

('2026-05-06', 'Divya Nair', 'Premium', 'Chennai', 'South',
 'Sofa Set', 'Furniture', 'Godrej',
 1, 45000, 37000, 12,
 'Neha', 'Credit Card', 'Delivered', 4.8),

('2026-05-10', 'Rakesh Das', 'Regular', 'Kolkata', 'East',
 'Printer', 'Electronics', 'HP',
 2, 15000, 12000, 5,
 'Rahul', 'Debit Card', 'Pending', 4.0),

('2026-05-14', 'Sonia Gupta', 'Premium', 'Delhi', 'North',
 'Ceiling Fan', 'Appliances', 'Bajaj',
 4, 3000, 2200, 10,
 'Amit', 'UPI', 'Delivered', 4.5),

('2026-05-18', 'Harish Kumar', 'Regular', 'Hyderabad', 'South',
 'Office Chair', 'Furniture', 'Godrej',
 3, 8500, 6500, 5,
 'Neha', 'Cash', 'Delivered', 4.1),

('2026-05-22', 'Reena Shah', 'Premium', 'Mumbai', 'West',
 'Smart Watch', 'Electronics', 'Samsung',
 2, 18000, 14500, 7,
 'Riya', 'Credit Card', 'Delivered', 4.7);

 SELECT * FROM Retail_Sales;

 --1. COUNT()
 SELECT
 COUNT(*)AS Total_Orders
 FROM Retail_Sales;

 SELECT
 COUNT(DISTINCT Customer_Type) AS Type_of_Customer
 from Retail_Sales;

 SELECT
 COUNT(Rating)AS Available_Ratings
 from Retail_Sales;

 SELECT
 COUNT(DISTINCT City) AS city
 from Retail_Sales;

 --2. SUM()
 SELECT
 SUM(Quantity)as Total_Quantity
 FROM Retail_Sales;

 SELECT
 ROUND(SUM(Quantity * Unit_Price),2)
 AS Total_Gross_Sale
 FROM Retail_Sales

 SELECT
 ROUND(SUM(Quantity * Unit_Price*Discount_Percent/100.0),2)
 AS Total_Discount
 FROM Retail_Sales;

 SELECT
 ROUND(SUM(Quantity * Unit_Price-Quantity * Unit_Price*Discount_Percent/100.0),2)
 AS Final_Sales
 FROM Retail_Sales;

 --3. AVG()
 SELECT * FROM Retail_Sales;

 SELECT
 ROUND(AVG(Cost_Price),3)AS Average_Cost
 FROM Retail_Sales;

 SELECT
 ROUND(AVG(Unit_Price),2)AS Average_Unit_Price
 FROM Retail_Sales;

 --4. MIN() AND MAX():
 SELECT * FROM Retail_Sales;

 SELECT
 MIN(Quantity)AS Min_Qty
 FROM Retail_Sales;

 SELECT
 MAX(Quantity)AS MAX_Qty
 FROM Retail_Sales;

 SELECT
 MIN(Unit_Price)AS Min_Unit_Price
 FROM Retail_Sales;

 SELECT
 MAX(Unit_Price)AS Max_Unit_Price
 FROM Retail_Sales;

 SELECT
 MIN(Order_Date) AS First_Order_Date
 FROM Retail_Sales;

 SELECT
 MAX(Order_Date) AS Latest_Order_Date
 FROM Retail_Sales;

-------------------------------------------------------------------------------------------------

/*UNIT : 20 
GROUP BY*/

SELECT * FROM Retail_Sales;

--SINGLE COLUMN:
select
Category 
FROM Retail_Sales
GROUP BY Category;

select
Product_Name
FROM Retail_Sales
GROUP BY Product_Name;

select
Payment_Method
FROM Retail_Sales
GROUP BY Payment_Method;

SELECT
Payment_Method,
COUNT(*) AS Payment_Costomers
FROM Retail_Sales
GROUP BY Payment_Method;

SELECT
Payment_Method,
SUM(Unit_Price) AS Total_Price
FROM Retail_Sales
GROUP BY Payment_Method;


SELECT
CATEGORY,
COUNT(*)AS Total_Orders
from Retail_Sales
GROUP BY Category;

SELECT
Category,
SUM(Quantity) AS Total_Quantity
FROM Retail_Sales
Group by Category
Order by Total_Quantity DESC;

SELECT * FROM Retail_Sales;

SELECT
City,
Count(Customer_Name)
FROM Retail_Sales
Group by City;

--Multiple Column:

SELECT
Product_Name,
City
FROM Retail_Sales
Group BY Product_Name,City;

SELECT
Customer_Name,
City,
COUNT(Customer_Name)
FROM Retail_Sales
Group BY Customer_Name,City;

SELECT
City,
COUNT(Customer_Name) AS Total_Customers
FROM Retail_Sales
Group BY City;

--Ques.1 Group by Category and region

SELECT
Region,
Category,
Count(*)AS Total_Orders,
SUM(Quantity) AS Total_Quantity
FROM Retail_Sales
GROUP BY Region, Category
ORDER BY Region, Category;

--Ques.2 Salesperson and order status

SELECT
Salesperson,
Order_Status,
Count(*) AS Total_Orders
FROM Retail_Sales
GROUP BY Salesperson,Order_Status
Order by salesperson,order_status;

-----------------------------------------------------------------------------------------------------

--# WHERE WITH AGGREGATION:

SELECT * FROM Retail_Sales;

SELECT
Region,
COUNT(*)AS Total_Orders
FROM RETAIL_SALES
WHERE Order_Date >= '2026-03-01'
GROUP BY Region;

SELECT
City,
Sum(Unit_Price) AS Total_Unit_Price
FROM Retail_Sales
WHERE Unit_Price >= 40000
GROUP BY City
ORDER BY Total_Unit_Price DESC;

--# HAVING WITH AGGREGATION WITH GROUP BY:

 --Ques.1 Categories with more than five orders
 SELECT
 Category,
 COUNT(*)AS Total_Orders
 FROM Retail_Sales
 GROUP BY Category
 HAVING COUNT(*)>5;

 SELECT
 Category,
 Quantity,
 COUNT(*)AS Total_Orders
 FROM Retail_Sales
 GROUP BY Category,Quantity
 HAVING COUNT(*)>=5

 SELECT
 Category,
 Quantity,
 COUNT(*)AS Total_Orders
 FROM Retail_Sales
 GROUP BY Category,Quantity
 HAVING COUNT(*)>=2

--Ques 2. Salespersons with average rating above 4.3
SELECT
Salesperson,
ROUND(AVG(Rating),1)AS Average_Rating
FROM Retail_Sales
GROUP BY Salesperson
HAVING AVG(Rating)>4.0;

SELECT
Salesperson,
CAST(ROUND(AVG(Rating),1)AS DECIMAL(3,1))AS Average_Rating
FROM Retail_Sales
GROUP BY Salesperson
HAVING AVG(Rating)>4.0;

SELECT
Category,
COUNT(*) AS Delivered_Orders
FROM Retail_Sales

WHERE Order_Status = 'Delivered'

GROUP BY Category

HAVING COUNT(*) >= 3;

--QUES.3 Find cities with more than one order.

SELECT * FROM Retail_Sales;

SELECT
City,
COUNT(*)AS Total_Order
FROM Retail_Sales
GROUP BY City
Having COUNT(*) >1;

--QUES 4. Find categories having more than five orders.
SELECT
Category,
COUNT(*) AS Orders
FROM Retail_Sales
GROUP BY Category
HAVING COUNT(*) > 5;

--QUES 5. Find salespersons who handled at least five orders.

SELECT
Salesperson,
COUNT(*)AS Salesperson_Order_Count
FROM Retail_Sales
GROUP BY Salesperson
HAVING COUNT(*)>=5;

--QUES 6. Find the salesperson with the highest total sales.
SELECT * FROM Retail_Sales;

SELECT
Salesperson,
SUM(Quantity*Unit_Price)AS Total_Sales
FROM Retail_Sales
GROUP BY Salesperson
ORDER BY Total_Sales DESC;

--Ques 7. Find the category with the highest sales.
SELECT
Category,
SUM(Quantity*Unit_Price)AS Highest_Sale
FROM Retail_Sales
GROUP BY Category
Order by Highest_Sale DESC;

--QUES 8. Find brands whose average unit price is above ₹20,000.

SELECT
Brand,
CAST(AVG(Unit_Price) AS DECIMAL(10,2)) AS Average_Unit_Price
FROM Retail_Sales
GROUP BY Brand
HAVING AVG(Unit_Price) > 20000;

--QUES 9. Find regions where total sales exceed ₹100,000.

SELECT
Region,
SUM(Quantity*Unit_Price)AS Total_Sales
FROM Retail_Sales
GROUP BY Region
HAVING SUM(Quantity*Unit_Price)>100000;

--QUES 10.Calculate category-wise delivered sales.
SELECT
Category,
SUM(Quantity*Unit_Price) AS sales
FROM retail_sales
WHERE Order_Status = 'Delivered'
GROUP BY Category
;

--Ques 11. Calculate monthly sales.
SELECT
MONTH(Order_Date) AS Month_Number,
SUM(Quantity*Unit_Price)AS Monthly_Sales
FROM Retail_Sales
GROUP BY Month(Order_Date)
ORDER BY Month_Number;

--Ques 12. Calculate orders handled by each salesperson.
SELECT * FROM Retail_Sales;

SELECT
Salesperson,
SUM(Quantity)AS Total_Orders
FROM Retail_Sales
GROUP BY Salesperson
Order by Total_Orders DESC;

--QUES 13. Calculate profit by category.

SELECT
Category,
SUM((Unit_Price - Cost_Price) * Quantity)AS Profit
FROM Retail_Sales
GROUP BY Category
Order by Profit DESC;

--QUES 14. Find average customer rating.

SELECT
CAST(AVG(Rating)AS DECIMAL(3,1))AS Avg_Rating
FROM Retail_Sales;

--QUES 15. Count unique customers.
SELECT
COUNT(DISTINCT Customer_Name) as Unique_Customers
FROM Retail_Sales;

















    











