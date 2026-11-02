USE SQL_Practice;
GO

CREATE TABLE Customer2(
Customer_ID INT PRIMARY KEY,
Name VARCHAR(50) NOT NULL
);

CREATE TABLE Order2
(Order_ID INT PRIMARY KEY,
 Customer_ID INT,
 Product VARCHAR(100),

 FOREIGN KEY(Customer_ID)
 REFERENCES Customer2(Customer_ID)
);

INSERT INTO Customer2(Customer_ID,Name)
VALUES (101,'Rahul'),
(102,'Riya'),
(103,'Gunjan');

INSERT INTO Order2(Order_ID,Customer_ID,Product)
VALUES(1,101,'Mobile'),
(2,102,'Laptop'),
(3,103,'Tablet');

SELECT * FROM Customer2;
SELECT * FROM Order2;

DELETE FROM Customer2
WHERE Customer_ID = 101;

ALTER TABLE Order2
DROP CONSTRAINT FK__Order2__Customer__7E37BEF6;

EXEC sp_help 'Order2'; --It is used to check foreign key constraints.

ALTER TABLE Order2
ADD CONSTRAINT FK_Order2_Customer2
FOREIGN KEY (Customer_ID)
REFERENCES Customer2(Customer_ID)
ON DELETE CASCADE;

DELETE FROM Customer2
WHERE Customer_ID = 101;

SELECT * FROM Customer2;
SELECT * FROM Order2;

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';