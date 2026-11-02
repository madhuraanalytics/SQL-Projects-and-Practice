--UNIT 15 : STRING FUNCTIONS

SELECT * FROM SALES;

--1. CONCAT()
SELECT
Customer_Name,
City,
CONCAT(Customer_Name, ' - ', City) AS Customer_Details
FROM SALES;

SELECT
Customer_Name,
City,
CONCAT(Product_Name, ' - ',Category) AS Product_Details
FROM SALES;

SELECT
Product_Name,
Unit_Price,
CONCAT(Product_Name,' - ',N' ₹', Unit_Price) AS Product_Price
FROM SALES;

SELECT
    Customer_Name + ' - ' + City AS Customer_Details
FROM Sales;

--2. LEN() WITH SPACES
SELECT
Customer_Name,
LEN(Customer_Name)AS Name_Length
FROM SALES;

select * from sales;

SELECT
Product_Name,
LEN(Product_Name)AS Product_Name_Len
FROM SALES
WHERE LEN(Product_Name) >10
ORDER BY Product_Name_Len DESC;

--3. UPPER() & LOWER()
SELECT
Customer_Name,
UPPER(Customer_Name)AS Customer
FROM SALES;

SELECT
Salesperson,
Lower(Salesperson)
From Sales;

------------------------------------------------------------------------------------------------\

CREATE TABLE Employee_Sales
(
    Sale_ID INT IDENTITY(1001,1) PRIMARY KEY,

    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone_Number VARCHAR(20),

    City VARCHAR(50),
    Department VARCHAR(50),
    Product_Name VARCHAR(100),

    Quantity INT,
    Unit_Price DECIMAL(12,2),
    Discount_Percent DECIMAL(5,2),
    Sales_Target DECIMAL(12,2),

    Order_Date DATE,
    Joining_Date DATE,
    Delivery_Date DATE,

    Payment_Method VARCHAR(30),
    Order_Status VARCHAR(30),

    Rating DECIMAL(3,1),
    Return_Quantity INT,
    Remarks VARCHAR(200)
);

INSERT INTO Employee_Sales
(
    First_Name,
    Last_Name,
    Email,
    Phone_Number,
    City,
    Department,
    Product_Name,
    Quantity,
    Unit_Price,
    Discount_Percent,
    Sales_Target,
    Order_Date,
    Joining_Date,
    Delivery_Date,
    Payment_Method,
    Order_Status,
    Rating,
    Return_Quantity,
    Remarks
)
VALUES

('Amit', 'Sharma', 'AMIT.SHARMA@GMAIL.COM', '9876543210',
 '  Pune  ', 'Electronics', 'Laptop Pro', 1, 55699.756, 5.50, 60000,
 '2026-01-05', '2022-04-10', '2026-01-10',
 'Credit Card', 'Delivered', 4.5, 0, 'Good customer'),

('Priya', 'Verma', 'priya.verma@gmail.com', '9823456789',
 'Mumbai', 'Electronics', 'Mobile Phone', 2, 24999.499, 10.00, 55000,
 '2026-01-08', '2023-06-15', '2026-01-12',
 'UPI', 'Delivered', 4.8, 0, 'Fast payment'),

('Rahul', 'Singh', 'RAHUL.SINGH@YAHOO.COM', '9765432108',
 'Delhi', 'Furniture', 'Office Chair', 3, 7999.999, 0.00, 30000,
 '2026-01-10', '2021-08-20', NULL,
 'Cash', 'Cancelled', 3.6, 0, 'Order cancelled by customer'),

('Neha', 'Patel', 'neha.patel@gmail.com', '9988776655',
 ' pune', 'Electronics', 'Wireless Headphones', 4, 2599.459, 7.50, 15000,
 '2026-01-15', '2024-01-05', '2026-01-18',
 'UPI', 'Delivered', 4.2, 1, 'One item returned'),

('Karan', 'Mehta', 'karan.mehta@outlook.com', '9898989898',
 'MUMBAI ', 'Furniture', 'Dining Table', 1, 32499.999, 15.00, 35000,
 '2026-01-20', '2020-11-11', NULL,
 'Debit Card', 'Pending', 3.9, 0, NULL),

('Riya', 'Gupta', 'riya.gupta@gmail.com', '9123456780',
 'Indore', 'Stationery', 'Premium Notebook', 12, 125.755, 0.00, 5000,
 '2026-02-01', '2025-02-10', '2026-02-03',
 'Cash', 'Delivered', 4.7, 0, 'Bulk stationery order'),

('Mohit', 'Jain', NULL, '9012345678',
 'Jaipur', 'Appliances', 'Double Door Refrigerator', 1, 42999.505, 8.00, 45000,
 '2026-02-04', '2019-07-12', '2026-02-11',
 'Credit Card', 'Delivered', 4.4, 0, NULL),

('Sneha', 'Kapoor', 'sneha.kapoor@gmail.com', NULL,
 'Delhi', 'Appliances', 'Washing Machine', 1, 35999.999, 10.00, 40000,
 '2026-02-06', '2022-09-23', '2026-02-15',
 'UPI', 'Returned', 3.1, 1, 'Product damaged'),

('Vikas', 'Yadav', 'vikas.yadav@gmail.com', '9000011111',
 '  Pune', 'Electronics', 'Mechanical Keyboard', 2, 1899.899, 5.00, 10000,
 '2026-02-08', '2024-05-17', '2026-02-13',
 'UPI', 'Delivered', 4.6, 0, 'Repeat customer'),

('Anjali', 'Soni', 'anjali.soni@gmail.com', '9111122222',
 'Bhopal', 'Stationery', 'Luxury Pen Set', 5, 599.599, 0.00, 5000,
 '2026-02-12', '2023-03-01', '2026-02-16',
 'Cash', 'Delivered', 4.0, 0, ''),

('Arjun', 'Malhotra', 'arjun.malhotra@gmail.com', '9222233333',
 'Mumbai', 'Electronics', 'Smart Television', 1, 61999.999, 12.00, 65000,
 '2026-03-01', '2018-12-10', '2026-03-08',
 'Credit Card', 'Delivered', 4.9, 0, 'Premium customer'),

('Komal', 'Joshi', 'komal.joshi@gmail.com', '9333344444',
 'Indore', 'Furniture', 'Study Table', 1, 12499.259, 5.00, 15000,
 '2026-03-03', '2025-01-20', NULL,
 'Debit Card', 'Pending', 3.8, 0, NULL),

('Suresh', 'Kumar', 'suresh.kumar@gmail.com', '9444455555',
 'Delhi', 'Appliances', 'Air Conditioner', 2, 40999.875, 10.00, 80000,
 '2026-03-06', '2017-06-18', '2026-03-14',
 'Credit Card', 'Delivered', 4.3, 0, 'Installation required'),

('Pooja', 'Shah', 'pooja.shah@gmail.com', '9555566666',
 'Pune', 'Electronics', 'Wireless Mouse', 5, 849.399, 0.00, 7000,
 '2026-03-10', '2024-08-11', NULL,
 'UPI', 'Cancelled', 2.9, 0, 'Payment failed'),

('Nitin', 'Agarwal', 'nitin.agarwal@gmail.com', '9666677777',
 'Jaipur', 'Furniture', 'Wooden Bookshelf', 2, 9299.999, 7.00, 20000,
 '2026-03-15', '2021-10-09', '2026-03-21',
 'Cash', 'Delivered', 4.1, 0, 'Handle carefully'),

('Meena', 'Roy', NULL, NULL,
 NULL, 'Appliances', 'Mixer Grinder', 1, 6499.499, 5.00, 8000,
 '2026-03-18', '2025-04-06', NULL,
 NULL, 'Pending', NULL, 0, NULL),

('Deepak', 'Mishra', 'deepak.mishra@gmail.com', '9777788888',
 'Lucknow', 'Electronics', 'USB Cable', 0, 299.999, 0.00, 2000,
 '2026-03-20', '2023-12-01', NULL,
 'Cash', 'Pending', 3.5, 0, 'Quantity is zero'),

('Kavita', 'Rao', 'kavita.rao@gmail.com', '9888899999',
 'Hyderabad', 'Furniture', 'Office Desk', 2, 15999.555, 20.00, 30000,
 '2026-04-02', '2020-02-14', '2026-04-09',
 'Net Banking', 'Delivered', 4.6, 0, 'Corporate order'),

('Rohan', 'Desai', 'rohan.desai@gmail.com', '9999900000',
 'Ahmedabad', 'Electronics', 'Gaming Monitor', 2, 28499.999, 9.50, 60000,
 '2026-04-05', '2019-09-19', '2026-04-12',
 'Credit Card', 'Delivered', 4.8, 0, 'High-value sale'),

('Simran', 'Kaur', 'simran.kaur@gmail.com', '9000099999',
 'Chandigarh', 'Stationery', 'Drawing Book', 10, 199.459, 2.00, 3000,
 '2026-04-08', '2026-01-05', '2026-04-11',
 'UPI', 'Delivered', 4.2, 2, 'Two items returned'),

('Manoj', 'Tiwari', 'manoj.tiwari@gmail.com', '9123498765',
 'Nagpur', 'Appliances', 'Microwave Oven', 1, 13999.999, 6.00, 15000,
 '2026-04-12', '2022-07-07', '2026-04-18',
 'Debit Card', 'Delivered', 4.0, -1, 'Incorrect negative return value'),

('Asha', 'Nair', 'asha.nair@gmail.com', '9234509876',
 'Kochi', 'Electronics', 'Bluetooth Speaker', 3, 3299.659, 5.00, 10000,
 '2026-04-15', '2021-05-25', '2026-04-20',
 'UPI', 'Delivered', 4.5, 0, '  Good service  '),

('Farhan', 'Ali', 'farhan.ali@gmail.com', '9345610987',
 'Bengaluru', 'Furniture', 'Computer Table', 1, 18499.499, 10.00, 20000,
 '2026-04-20', '2018-03-30', NULL,
 'Net Banking', 'Returned', 3.3, 1, 'Wrong size'),

('Tanya', 'Bose', 'tanya.bose@gmail.com', '9456721098',
 'Kolkata', 'Appliances', 'Water Purifier', 2, 11499.789, 5.00, 25000,
 '2026-04-25', '2024-10-10', '2026-05-01',
 'Credit Card', 'Delivered', 4.7, 0, NULL);

 SELECT * FROM Employee_Sales;

--1. CONCAT()
SELECT
First_Name,
Last_Name,
Concat(First_Name, ' ', Last_Name) AS Customer_Name
FROM Employee_Sales;

SELECT
First_Name,
Last_Name,
Remarks,
Concat(First_Name, ' ', Last_Name, ' - ' ,Remarks) AS Customer_Name_Remarks
FROM Employee_Sales;

SELECT
First_Name,
Last_Name,
Remarks,
Concat(First_Name, ' ', Last_Name, ' - ' ,Remarks, ' / ', Rating) 
AS Customer_Remarks_Ratings
FROM Employee_Sales;

SELECT
Concat(First_Name, ' ', Last_Name, ' Purchased ' ,Product_Name) 
AS Sale_Discription
FROM Employee_Sales;

Select * from Employee_Sales;

--3.UPPER() AND LOWER()
SELECT
Email,
Lower(Email)AS Email_ID
FROM Employee_Sales;

SELECT
City,
Lower(TRIM(City)) AS Standardized_City
FROM Employee_Sales;

SELECT
Payment_Method,
UPPER(Payment_Method)AS Payment_Upper
FROM Employee_Sales;

UPDATE Employee_Sales
SET Email = LOWER(Email);

--4.TRIM (Removes extra spaces from both the beginning and end)
SELECT
City,
TRIM(City) AS Clean_City
FROM Employee_Sales;

select * from Employee_Sales;

UPDATE Employee_Sales
SET City = TRIM(City)
FROM Employee_Sales;

--5. REPLACE
SELECT * from Employee_Sales;

SELECT
Product_Name,
REPLACE(Product_Name, ' ', '-') AS Product_Code
FROM Employee_Sales;

SELECT
Discount_Percent,
REPLACE(Discount_Percent,'Percent','%') AS Discount
FROM Employee_Sales;

--6. LEFT()Extracts characters from the beginning of text.

SELECT
Product_Name,
LEFT(Product_Name,3)AS Product_Prefix
FROM Employee_Sales;

SELECT
Department,
LEFT(Department,4) AS Dept
FROM Employee_Sales;

--7. RIGHT()Extracts characters from the end of text.

SELECT * FROM Employee_Sales;

SELECT
Phone_Number,
RIGHT(Phone_Number,4) AS Phn_Num
FROM Employee_Sales;

--8. SUBSTRING()Extracts text from a specified position.

SELECT
Email,
SUBSTRING(Email,1,10) AS Email_ID
FROM Employee_Sales;

--9. CHARINDEX()
SELECT
Email,
CHARINDEX('@', Email) AS At_Position
FROM Employee_Sales;

--Extract email username

SELECT
Email,
LEFT(Email, CHARINDEX('@', Email) - 1) AS Email_ID
FROM Employee_Sales;

--Extract email domain

SELECT
Email,
SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email)) AS Email_ID
FROM Employee_Sales;

--10. REPLICATE()
SELECT
Phone_Number,
CONCAT(REPLICATE('*',6),
RIGHT(Phone_Number,4)) AS Masked_Number
FROM Employee_Sales;


--11. STRING_AGG()
SELECT
    Department,
    STRING_AGG(Product_Name, ', ') AS Product_List
FROM Employee_Sales
GROUP BY Department;

-------------------------------------------------------------------------------------------------

--UNIT 16 : Numeric Functions

SELECT * FROM Employee_Sales;

--1. ROUND()

SELECT
Unit_Price,
ROUND(Unit_Price,0) AS Rounded_Whole_Number,
ROUND(Unit_Price, 1) AS Rounded_One_Decimal,
ROUND(Unit_Price, 2) AS Rounded_Two_Decimals
FROM Employee_Sales;

--2. FLOOR()Returns the nearest whole number below the value.

SELECT
Product_Name,
Unit_Price,
FLOOR(Unit_Price) AS Floor_Price
FROM Employee_Sales;

SELECT
Product_Name,
Sales_Target,
FLOOR(Sales_Target) AS Target
FROM Employee_Sales;


--3.CEILING() Returns the nearest whole number above the value.

SELECT * FROM Employee_Sales;

SELECT
Product_Name,
Unit_Price,
CEILING(Unit_Price) AS Ceiling_Price
From Employee_Sales;

--4.ABS()Returns the absolute value by removing the negative sign.
SELECT
Product_Name,
Return_Quantity,
ABS(Return_Quantity) AS R_Q
FROM Employee_Sales;

--5. Modulus %

SELECT * FROM Employee_Sales
Where Sale_ID % 2 = 0;

SELECT * FROM Employee_Sales
Where Sale_ID % 2 != 0;

--6. POWER 
SELECT
Product_Name,
Quantity,
POWER(Quantity,2) AS Quantity_Square
FROM Employee_Sales;

--7. SIGN()Checks whether a number is positive, negative, or zero.

SELECT
Return_Quantity,
SIGN(Return_Quantity) AS Number_Sign
FROM Employee_Sales;

SELECT
Product_Name,
Return_Quantity,
CASE SIGN(Return_Quantity)
WHEN 1 THEN 'Items Returned'
WHEN 0 THEN 'No Return'
WHEN -1 THEN 'Invalid Value'
END AS Return_Status
From Employee_Sales;

-------------------------------------------------------------------------------------------------

--Unit : 17 [Date Functions]

--1. GETDATE()

SELECT GETDATE() AS Current_Date_Time;

SELECT CAST(GETDATE() AS DATE) AS 'Current_Date';

SELECT CAST(GETDATE() AS TIME) AS 'Current_Time';

--2. YEAR()

SELECT * FROM Employee_Sales;

SELECT 
Order_Date,
YEAR(Order_Date) as Order_Year
FROM Employee_Sales
Order by Order_Date ASC;

SELECT 
Joining_Date,
YEAR(Joining_Date) as Joining_Year
FROM Employee_Sales
Order by Joining_Date ASC;

--3. Month()

SELECT
Order_Date,
MONTH(Order_Date) as Order_Month
From Employee_Sales;

--4. DATENAME()
select
Order_Date,
DATENAME(Month,Order_Date) AS month_name
From Employee_Sales;

--5. WEEKDAY()
SELECT
Joining_Date,
DATENAME(WEEKDAY,Joining_Date) as Weekday_Name
From Employee_Sales;

SELECT
    Order_Date,
    DATEPART(YEAR, Order_Date) AS Order_Year,
    DATEPART(MONTH, Order_Date) AS Order_Month,
    DATEPART(DAY, Order_Date) AS Order_Day,
    DATEPART(QUARTER, Order_Date) AS Order_Quarter
FROM Employee_Sales;

--6. DATEADD()

SELECT
Order_Date,
DATEADD(DAY,7,Order_Date) AS Expected_Date
FROM Employee_Sales;

SELECT
Order_Date,
DATEADD(MONTH,1,Order_Date) AS Next_month_date
FROM Employee_Sales;

SELECT
Order_Date,
DATEADD(Year,1,Order_Date) AS Next_year_date
FROM Employee_Sales;

--7. DATESUB()
SELECT
Order_Date,
DATEADD (DAY,-6,Order_Date) AS Previous_week_date
FROM Employee_Sales;

--8. DATEDIFF()
SELECT 
SALE_ID,
Product_Name,
Order_Date,
Delivery_Date,

DATEDIFF(
DAY,Order_Date,Delivery_Date) AS Delivery_Days
FROM Employee_Sales;

--------------------------------------------------------------------------------------------------

--Unit 18: Conditional and NULL Functions

--1. CASE

SELECT * FROM Employee_Sales;

SELECT
Product_Name,
Unit_Price,
CASE
WHEN Unit_Price >=40000 THEN 'High Price'
WHEN Unit_Price >=10000 THEN 'Medium Price'
ELSE 'Low Price'
END AS Price_Category
FROM Employee_Sales;

SELECT
Sale_ID,
Product_Name,
Rating,
CASE
WHEN Rating >= 4.5 THEN 'Good Product'
WHEN Rating >=3.5 THEN 'Average Product'
ELSE 'Worst Product'
END AS Product_Rating
FROM Employee_Sales;

--2. IFF

SELECT
Product_Name,
Order_Status,
IIF(Order_Status='Delivered',
'Successful',
'Not Successful') 
AS Delivery_Status
From Employee_Sales;

--3. ISNULL()
SELECT
First_Name,
City,
ISNULL(City, 'Unknown City') as Clean_City
From Employee_Sales;

SELECT
First_Name,
Email,
City,
ISNULL(Email, 'Invalid') As Email_Status,
ISNULL(City, 'Unknown') As City_Status
From Employee_Sales;

--4. Coalesce() Returns the first non-NULL value from a list.

SELECT
First_Name,
Email,
Phone_Number,
Coalesce(Email,Phone_Number,'No contact available') AS Available_Contact
FROM Employee_Sales;

SELECT * FROM Employee_Sales;

SELECT
First_Name,
COALESCE(CAST(Rating AS VARCHAR(10)), 'No_Rating') AS No_Rating,
COALESCE(Payment_Method,'Not Available') AS Payment_status,
COALESCE(Remarks,'No Remarks')AS Remarks_Status
FROM Employee_Sales;

--5. NULLIF
SELECT
Product_Name,
Quantity,
Unit_Price,
Unit_Price/NULLIF(Quantity,0)
AS Price_Per_Quantity
FROM Employee_Sales;
































