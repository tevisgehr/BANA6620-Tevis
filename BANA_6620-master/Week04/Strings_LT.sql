-----------------String Concepts, Date Concepts and View Concepts------------------

USE AdventureWorksLT2012
GO

--A number of SQL string functions not supported by sql server, but many are.
--for a full list look at http://msdn.microsoft.com/en-us/library/ms181984.aspx

-- Concatenation
----Combine two strings of text into one
-- Substrings
----Extract part of a text string

--Common Character Functions
---You use character functions mainly to compare, join, search, and extract
---a segment of a string or a value in a column. Several character functions
---are available to the SQL programmer.

--Concatenation Function
--The syntax for SQL Server is
--COLUMN_NAME + [ ‘’ + ] COLUMN_NAME [ COLUMN_NAME ]

SELECT FirstName + LastName
FROM SalesLT.Customer;

--To create a better reading output:

SELECT CONCAT(FirstName,', ' , LastName) AS 'Full Name' 
FROM SalesLT.Customer;

SELECT CONCAT( Title, ' ', FirstName, ' ', LastName) As Customer
FROM SalesLT.Customer;

--The CONCAT function is essentially what R does with all 
--vectors when you use c() to create a vector.

--We can also use ORDER BY
SELECT CONCAT( Title, ' ', FirstName, ' ', LastName) As Customer
FROM SalesLT.Customer
ORDER BY FirstName;

--REPLACE(’VALUE’, ’VALUE’, [ NULL ] ’VALUE’)
--This statement returns all the first names and changes any occurrence of K to T:
--SELECT REPLACE(FIRST_NAME,’K’, ‘T’) FROM SalesLT.Customer


--Taking a look at the table

SELECT *
FROM SalesLT.Customer;

SELECT REPLACE(FirstName, 'K', 'T')
FROM SalesLT.Customer;

SELECT REPLACE(CompanyName, ' Bike', ' Bicycle')
FROM SalesLT.Customer;


--Upper and Lower

--UPPER (Character String)
--LOWER (Character String)

SELECT UPPER(FirstName) UpFirst
FROM SalesLT.Customer;

SELECT LOWER(FirstName) LoFirst
FROM SalesLT.Customer;

----Sub String
--The syntax for SQL Server is
--SUBSTRING(COLUMN NAME, STARTING POSITION, LENGTH)


--This SQL statement returns the first three characters of PhoneNumber:
SELECT SUBSTRING(Phone,1,3) First3Digits
FROM SalesLT.Customer;

--Notice the above pulls those even when they start with 1 ( 
SELECT DISTINCT SUBSTRING(Phone,1,3) First3Digs
FROM SalesLT.Customer
WHERE Phone NOT LIKE '1 (%';

--Pull the Correct first 3 for the other phone numbers
SELECT SUBSTRING(Phone, 8,3) '8 through 10'
FROM SalesLT.Customer
WHERE Phone LIKE '1 (%'; 

--LEFT and RIGHT for parsing data
SELECT AddressLine1
FROM SalesLT.Address;

--Pulls first 3 characters
SELECT AddressLine1, LEFT(AddressLine1, 3)
FROM SalesLT.Address;

--Pulls the last 5 characters
SELECT AddressLine1, RIGHT(AddressLine1, 5)
FROM SalesLT.Address;

--CHARINDEX 
SELECT CHARINDEX('N','JOHNNY BELL')

--Pulls everything to the left of the first space
--TOGETHER
SELECT AddressLine1, LEFT(AddressLine1, CHARINDEX(' ',AddressLine1))
FROM SalesLT.Address;


--CAST and CONVERT
--Both do much the same, but the syntax is significantly different
--CONVERT(datatype[length]expression [style])  -gives more control over formatting date
--CAST(expression as data type [length])

SELECT CONVERT(INT, SUBSTRING(Phone,1,3))  First3Digs
FROM SalesLT.Customer
WHERE Phone NOT LIKE '1 (%'; 

SELECT CAST(SUBSTRING(Phone,1,3) AS INT)  First3Digs
FROM SalesLT.Customer
WHERE Phone NOT LIKE '1 (%'; 

SELECT CONVERT(NVARCHAR, OrderQty)  Qty
FROM SalesLT.SalesOrderDetail

SELECT CAST(OrderQty AS NVARCHAR) Qty
FROM SalesLT.SalesOrderDetail

--HAVING allows you to put AGGREGATE FUNCTIONS IN A STATEMENT THAT IS LIKE A 'WHERE' STATEMENT

SELECT AVG(OrderQty) averageqty, ProductID
FROM SalesLT.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(OrderQty) > 3

SELECT MAX(OrderQty)
FROM SalesLT.SalesOrderDetail

SELECT ProductID
FROM SalesLT.SalesOrderDetail
WHERE OrderQty = (SELECT MAX(OrderQty)
FROM SalesLT.SalesOrderDetail)

SELECT AVG(OrderQty) averageqty, ProductID
FROM SalesLT.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(OrderQty) < 3


--EXERCISE
--1 We are interested in making a password.  To make it, we will take the first letter of your first name,
--last letter of your middle name, the first letter of your last name, and then we will take the first three digits
--of your company name.  Create a table that supplies an individuals password, first, last, and companyname 
--in alphabetical order 

--2. Create a table that creates a new email address for each customer that is the customer first name (dot) last name @PERPTECH.COM

--3. From the Product Table, provide a table that has a single column with the ProductID and color separated by a comma.

--4. Write a sql statement to obtain a list from SalesOrderHeader of all the CustomerIDs where the  
--average subtotal Plus the taxamt is greater than 2000

--5. Write a sql statement to obtain the Billing and Shipping Addresses for all of the individuals you found in part 4
 

--DATE AND TIME

--There are three standard SQL data types for date and time (DATETIME) storage:
--DATETIME—Stores date literals. DATE is formatted as YYYY-MM-DD and
--ranges from 0001-01-01 to 9999-12-31.
--SMALLDATETIME same as above with smaller range
--DATE  Stores only a date value
--TIME—Stores time literals. TIME is formatted as HH:MI:SS.nn... and
--ranges from 00:00:00... to 23:59:61.999....

--Get today's date
SELECT GETDATE()

--DATEADD  Adding time to dates:

SELECT OrderDate, DATEADD(YEAR, 1, OrderDate) AS 'Order Date Plus 1 Year'
FROM SalesLT.SalesOrderHeader;

SELECT OrderDate, DATEADD(MONTH, 1, OrderDate) AS 'Order Date Plus 1 Month'
FROM SalesLT.SalesOrderHeader;

SELECT OrderDate, DATEADD(DAY, 1, OrderDate) AS 'Order Date Plus 1 Day'
FROM SalesLT.SalesOrderHeader;

--Converting dates to strings in different formats:

SELECT OrderDate = DATENAME(YY, OrderDate)
FROM SalesLT.SalesOrderHeader;

SELECT OrderDate = DATENAME(YEAR, OrderDate)
FROM SalesLT.SalesOrderHeader;

SELECT OrderDate = DATENAME(MONTH, OrderDate)
FROM SalesLT.SalesOrderHeader;

SELECT OrderDate = DATENAME(DW, OrderDate) 
FROM SalesLT.SalesOrderHeader;

--Date Part Functions:
SELECT OrderDate, YEAR(OrderDate) OrderYear,
MONTH(OrderDate) OrderMonth, DAY(OrderDate) OrderDay
FROM SalesLT.SalesOrderHeader;

-- or Date Part
SELECT OrderDate, DATEPART(DW, OrderDate) AS OrderYear
FROM SalesLT.SalesOrderHeader;


--DATE DIFF

SELECT DATEDIFF(YY,OrderDate, GETDATE())
FROM SalesLT.SalesOrderHeader;

SELECT DATEDIFF(DAY,OrderDate, ShipDate)
FROM SalesLT.SalesOrderHeader;

SELECT OrderDate, DATEADD(MM,3, OrderDate) AS PLUS
FROM SalesLT.SalesOrderHeader;

SELECT OrderDate, DATEADD(YY, 1, OrderDate) AS 'NEXT EMAIL DATE'
FROM SalesLT.SalesOrderHeader;

SELECT DATENAME(YY,GETDATE())
SELECT DATEPART(YEAR,GETDATE())

--Using Convert and CAST with Date Functions
--Convert to convert a string into a date value

SELECT CONVERT(INT,GETDATE())
SELECT CONVERT(VARCHAR,GETDATE(),0)
SELECT CONVERT(VARCHAR,GETDATE(),1)
SELECT CONVERT(VARCHAR,GETDATE(),101)
SELECT CONVERT(VARCHAR,GETDATE(),2)
SELECT CONVERT(VARCHAR,GETDATE(),102)
SELECT CONVERT(VARCHAR,GETDATE(),112)

--Create 5 Different Queries using the above functions with DueDate, OrderDate, and/or ShipDate

--Use the AdventureWorks2012 database to complete this exercise. 


--1. Write a query that calculates the number of days between the date an order was
--placed and the date that it was shipped using the Sales.SalesOrderHeader table.
--Include the SalesOrderID, OrderDate, and ShipDate columns.
--2. Write a query that displays only the date, not the time, for the order date and ship
--date in the Sales.SalesOrderHeader table.
--3. Write a query that adds six months to each order date in the
--Sales.SalesOrderHeader table. Include the SalesOrderID and OrderDate columns.
--4. Write a query that displays the year of each order date and the numeric month of
--each order date in separate columns in the results. Include the SalesOrderID and
--OrderDate columns.
--5. Change the query written in question 4 to display the month name instead.
--6. Create a view which has customers, orders and order dates.
