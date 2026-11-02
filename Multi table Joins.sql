
USE Data_Analyst_Practice;
GO


--CUSTOMERS:
CREATE TABLE Customers_Ecom
(
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Customers_Ecom
VALUES
(1,'Amit','Mumbai'),
(2,'Riya','Pune'),
(3,'Rahul','Delhi'),
(4,'Neha','Indore');

--PRODUCTS:

CREATE TABLE Products_Ecom
(
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products_Ecom
VALUES
(201,'Laptop','Electronics',60000),
(202,'Mouse','Accessories',800),
(203,'Keyboard','Accessories',1500),
(204,'Monitor','Electronics',12000);

--ORDERS:

CREATE TABLE Orders_Ecom
(
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Order_Status VARCHAR(30)
);

INSERT INTO Orders_Ecom
VALUES
(101,1,'2026-07-01','Delivered'),
(102,2,'2026-07-02','Delivered'),
(103,1,'2026-07-05','Pending'),
(104,3,'2026-07-06','Delivered');

--ORDER ITEMS:

CREATE TABLE Order_Items_Ecom
(
    Order_Item_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT
);

INSERT INTO Order_Items_Ecom
VALUES
(1,101,201,1),
(2,101,202,2),
(3,102,203,1),
(4,103,202,3),
(5,104,201,1),
(6,104,203,2);

SELECT * FROM Customers_Ecom;
SELECT * FROM Products_Ecom;
SELECT * FROM Orders_Ecom;
SELECT * FROM Order_Items_Ecom;

--2 TABEL JOIN :

--Customer name and their orders.

SELECT
Customer_Name,
Order_ID,
Order_Date
FROM Customers_Ecom
INNER JOIN Orders_Ecom
On Customers_Ecom.Customer_ID = Orders_Ecom.Customer_ID;

--3 TABLE JOIN :
--Show customer name, order ID and product ID.

SELECT
Customer_Name,
Orders_Ecom.Order_ID,
Product_ID,
Quantity
FROM Customers_Ecom
Inner join Orders_Ecom
ON Customers_Ecom.Customer_ID = Orders_Ecom.Customer_ID

INNER JOIN Order_Items_Ecom
On Orders_Ecom.Order_ID = Order_Items_Ecom.Order_ID;


--Show customer, product, quantity and price for every purchase.

SELECT
Customer_Name,
Product_Name,
Price,
Quantity,
Order_Status
FROM Customers_Ecom

INNER JOIN Orders_Ecom
ON Customers_Ecom.Customer_ID = Orders_Ecom.Customer_ID

INNER JOIN Order_Items_Ecom
ON Orders_Ecom.Order_ID = Order_Items_Ecom.Order_ID

INNER JOIN Products_Ecom
ON Order_Items_Ecom.Product_ID = Products_Ecom.Product_ID;

--Show only delivered orders.

Select
C.Customer_Name,
P.Product_Name,
O.Order_Status,
OI.Quantity
FROM Customers_Ecom C
INNER JOIN Orders_Ecom O
ON C.Customer_ID = O.Customer_ID

 INNER JOIN Order_Items_Ecom OI
ON O.Order_ID = OI.Order_ID

INNER JOIN Products_Ecom P
ON OI.Product_ID = P.Product_ID

WHERE Order_Status = 'Delivered';


--3. Calculate the total order amount for each customer.

SELECT 
Customer_Name,
SUM(Price * Quantity) AS Total_Amount
FROM Customers_Ecom
INNER JOIN Orders_Ecom
On Customers_Ecom.Customer_ID = Orders_Ecom.Customer_ID 

INNER JOIN Order_Items_Ecom
ON Orders_Ecom.Order_ID = Order_Items_Ecom.Order_ID

INNER JOIN Products_Ecom
On Order_Items_Ecom.Product_ID = Products_Ecom.Product_ID

GROUP BY Customer_Name;

--Find products that have never been ordered.

SELECT
P.Product_ID,
P.Product_Name,
P.Price
FROM Products_Ecom P
LEFT JOIN Order_Items_Ecom OI
ON P.Product_ID = OI.Product_ID
WHERE OI.Product_ID IS NULL;























-----------------------------------------------------------------------------------------------------------------

--Dataset 1. College Management System (Beginner)

--STUDENTS:

CREATE TABLE Std
(
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Std
VALUES
(1,'Amit','Indore'),
(2,'Rahul','Bhopal'),
(3,'Neha','Pune'),
(4,'Priya','Delhi');


--Courses:

CREATE TABLE Courses
(
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Fees DECIMAL(10,2)
);

--Enrollments:

INSERT INTO Courses
VALUES
(101,'SQL',10000),
(102,'Python',12000),
(103,'Power BI',8000);

--Enrollments:

CREATE TABLE Enrollments
(
    Enrollment_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT
);

INSERT INTO Enrollments
VALUES
(1,1,101),
(2,1,102),
(3,2,101),
(4,3,103),
(5,4,102);

SELECT * FROM Std

SELECT * FROM Courses

SELECT * FROM Enrollments

--1. Show Student Name and Course Name

SELECT
Student_Name,
Course_Name,
Fees
FROM Std
INNER JOIN Enrollments
On std.Student_ID = Enrollments.Student_ID 

INNER JOIN Courses
on Enrollments.Course_ID = Courses.Course_ID;

--2. Show students from Pune with course names.

SELECT
Student_Name,
City,
Course_Name
FROM Std
Inner join Enrollments
ON Std.Student_ID = Enrollments.Student_ID

INNER JOIN Courses
on Enrollments.Course_ID = Courses.Course_ID

where City = 'Pune';

--3. Count students in each course.

SELECT
Course_Name,
COUNT(*) Student_Count
FROM Courses
INNER JOIN Enrollments
on Courses.Course_ID=Enrollments.Course_ID
Group by Courses.Course_Name;

--4. Find the most expensive course taken by each student.

SELECT
Student_Name,
MAX(Fees)as Exp_Course
FROM Std
Inner join Enrollments
on Std.Student_ID = Enrollments.Student_ID

INNER JOIN Courses
ON Enrollments.Course_ID = Courses.Course_ID

GROUP BY Student_Name;


-----------------------------------------------------------------------------------------------------------------

--DATASET:2
--Hospital Database

CREATE TABLE Patients
(
Patient_ID INT PRIMARY KEY,
Patient_Name VARCHAR(50)
);

INSERT INTO Patients
VALUES
(1,'Amit'),
(2,'Rahul'),
(3,'Neha');


CREATE TABLE Doctors
(
Doctor_ID INT PRIMARY KEY,
Doctor_Name VARCHAR(50)
);

INSERT INTO Doctors
VALUES
(1,'Dr. Sharma'),
(2,'Dr. Mehta');

CREATE TABLE Appointments
(
Appointment_ID INT PRIMARY KEY,
Patient_ID INT,
Doctor_ID INT,
Visit_Date DATE
);

INSERT INTO Appointments
VALUES
(101,1,1,'2026-08-01'),
(102,2,2,'2026-08-02'),
(103,3,1,'2026-08-03');

SELECT * FROM PATIENTS;
SELECT * FROM DOCTORS;
SELECT * FROM Appointments;

--1. Show patient and doctor names.

SELECT
Patient_Name,
Doctor_Name
FROM Patients
INNER JOIN Appointments
ON Patients.Patient_ID = Appointments.Patient_ID

INNER JOIN Doctors
ON Appointments.Doctor_ID = Doctors.Doctor_ID;


--2. Show appointments after August 2.

Select
Patient_Name,
Visit_Date,
Doctor_Name
FROM Patients
INNER JOIN Appointments
on Patients.Patient_ID = Appointments.Patient_ID

INNER JOIN Doctors
on Appointments.Doctor_ID = Doctors.Doctor_ID
WHERE Visit_Date > '2026-08-02';














