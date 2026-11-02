

--Unit 36: Running Calculations

/*(   Calculation	           Window frame to use
🟢 Running Calculation	- UNBOUNDED PRECEDING → CURRENT ROW
🔵 Rolling Calculation	- N PRECEDING → CURRENT ROW)*/

CREATE TABLE Monthly_Sales (
    Sale_Month DATE,
    Sales_Amount INT
);

INSERT INTO Monthly_Sales
VALUES
('2026-01-01', 10000),
('2026-02-01', 15000),
('2026-03-01', 12000),
('2026-04-01', 18000),
('2026-05-01', 20000),
('2026-06-01', 17000);

SELECT * FROM Monthly_Sales;

/*ROWS BETWEEN UNBOUNDED PRECEDING
AND CURRENT ROW(From the first row up to the current row.)

OVER()Means - Don't collapse the rows. Instead, calculate the average using a window of rows.
*/

--1. Running Total(A running total means:Keep adding the current value to everything that came before it.)
--Cumulative Sum and Running Total are same only having different analytical name

SELECT
Sale_Month,
Sales_Amount,
SUM(Sales_Amount) OVER(Order by Sale_Month
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Running_Total
FROM Monthly_Sales;

2. Moving Average

SELECT
Sale_Month,
Sales_Amount,
AVG(Sales_Amount)OVER(
Order by Sale_Month
Rows BETWEEN 2 preceding and current row) as Moving_Average
FROM Monthly_Sales;

SELECT
Sale_Month,
Sales_Amount,
AVG(Sales_Amount)OVER(
Order by Sale_Month
Rows BETWEEN 3 preceding and current row) as Moving_Average
FROM Monthly_Sales;

--3. Rolling Metrics(Rolling metrics are calculations performed over a moving window of recent rows.)

--Rolling Sum

SELECT
Sale_Month,
Sales_Amount,
SUM(Sales_Amount)OVER
(Order by Sale_Month
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
FROM Monthly_Sales;

--Rolling MAX()
SELECT
Sale_Month,
Sales_Amount,
Max(Sales_Amount)OVER
(Order by Sale_Month
Rows between 2 preceding and current row)
from Monthly_Sales
Order by Sale_Month;

--Rolling MIN()

SELECT
Sale_Month,
Sales_Amount,
MIN(Sales_Amount)OVER
(Order by Sale_Month
Rows between 2 preceding and current row)
from Monthly_Sales
Order by Sale_Month;