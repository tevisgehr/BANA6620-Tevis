-----------------String Concepts, Date Concepts and View Concepts------------------

USE COSTUME
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


SELECT CITY + STATE 
FROM EMPLOYEE_TBL;

-- To create a better reading output:

SELECT LAST_NAME + ', ' + FIRST_NAME  'Full Name'
FROM EMPLOYEE_TBL;

-- What else do you notice about this statement that is different?

--Try creating a similar query to link City and Zip or State. 



SELECT CITY + STATE FROM EMPLOYEE_TBL

SELECT CITY + ', ' +STATE FROM EMPLOYEE_TBL

--Using CONCAT as an alternative

SELECT CONCAT (Cust_Name, ' ', Cust_Address,' ', Cust_City) As Customer
FROM Customer_TBL

--Try using ORDER BY

SELECT CONCAT (Cust_Name, ' ', Cust_Address,' ', Cust_City) As Customer
FROM Customer_TBL
ORDER BY  CUST_NAME




-- Translating

--REPLACE(’VALUE’, ’VALUE’, [ NULL ] ’VALUE’)
--This statement returns all the first names and changes any occurrence of T to B:
--SELECT REPLACE(FIRST_NAME,’T’, ‘B’) FROM EMPLOYEE_TBL

-- First look at the employee table again:

Select * 
FROM EMPLOYEE_TBL;

SELECT REPLACE(FIRST_NAME,'T', 'B') 
FROM EMPLOYEE_TBL;

SELECT CITY, REPLACE(CITY,'I','Z')
FROM EMPLOYEE_TBL;

--Upper and Lower

--UPPER (Character String)
--LOWER (Character String)

SELECT CITY 
FROM EMPLOYEE_TBL

SELECT UPPER(CITY)
FROM EMPLOYEE_TBL;

SELECT LOWER(CITY)
FROM EMPLOYEE_TBL;

----Sub String
--The syntax for SQL Server is
--SUBSTRING(COLUMN NAME, STARTING POSITION, LENGTH)

SELECT EMP_ID
FROM EMPLOYEE_TBL;

--This SQL statement returns the first three characters of EMP_ID:
SELECT SUBSTRING(EMP_ID,1,3) 
FROM EMPLOYEE_TBL;
--This SQL statement returns the fourth and fifth characters of EMP_ID:
SELECT SUBSTRING(EMP_ID,4,2) 
FROM EMPLOYEE_TBL;

--LEFT and RIGHT for parsing data
SELECT CUST_NAME, LEFT(CUST_NAME,5) as 'LEFT'
FROM CUSTOMER_TBL;

SELECT CUST_NAME, RIGHT(CUST_NAME,5) as 'RIGHT'
FROM CUSTOMER_TBL;


Conversion of types

SELECT PAY = PAY_RATE, NEW_PAY = STR(PAY_RATE)
FROM EMPLOYEE_PAY_TBL
WHERE PAY_RATE IS NOT NULL;

--CAST

SELECT Cust_ID, CAST (CUST_ID as INT) as Number
FROM Customer_Tbl;

SELECT QTY, CAST(QTY as varchar) as Character
FROM ORDERS_TBL;

--CONVERT

SELECT Cust_id, CONVERT(INT, CUST_ID) AS Number
FROM Customer_tbl;

SELECT Qty, CONVERT(Varchar, Qty) as Character
FROM ORDERS_TBL;


--CAST VS CONVERT

--Both do much the same, but the syntax is significantly different
--CONVERT(datatype[length]expression [style])  -gives more control over formatting date
--CAST(expression as data type [length])

--COALESCE

--To GIVE THE FIRST NON null values in a SET OF COLUMNS

SELECT EMP_ID,BONUS, SALARY, PAY_RATE
FROM EMPLOYEE_PAY_TBL;

SELECT EMP_ID, COALESCE(BONUS,SALARY)
FROM EMPLOYEE_PAY_TBL;

SELECT EMP_ID, COALESCE(BONUS,SALARY,PAY_RATE)
FROM EMPLOYEE_PAY_TBL;

-- Multiple String Functions:

SELECT CONCAT(LAST_NAME,', ',FIRST_NAME) NAME,
CONCAT(SUBSTRING(EMP_ID,1,3),'-',
SUBSTRING(EMP_ID,4,2),'-',
SUBSTRING(EMP_ID,6,4)) AS ID
FROM EMPLOYEE_TBL;

--EXERCISE
--1 Concatenate the first and last name from the Employee table.  

--2. Create a query to output each employee’s concatenated name and his or her area code.  Make the output readable.

--3. Write an SQL statement that lists employee email addresses. Email isnot a stored column. 
--The email address for each employee should be as follows:
--LAST@PERPTECH.COM
--For example, Smith’s email address is SMITH@PERPTECH.COM.

--4. Write an SQL statement that lists each employee’s name, employee ID, and phone number in the following formats:
--a. The name should be displayed as SMITH, JOHN.
--b. The employee ID should be displayed as 999-99-9999.
--c. The phone number should be displayed as (999)999-9999.

--5. Write a sql statement to convert customer zip codes to integers using the cast and convert functions.  


--DATE AND TIME

--There are three standard SQL data types for date and time (DATETIME) storage:
--DATETIME—Stores date literals. DATE is formatted as YYYY-MM-DD and
--ranges from 0001-01-01 to 9999-12-31.
--SMALLDATETIME same as above with smaller range
--DATE  Stores only a date value
--TIME—Stores time literals. TIME is formatted as HH:MI:SS.nn... and
--ranges from 00:00:00... to 23:59:61.999....

SELECT GETDATE()

--DATEADD  Adding time to dates:

SELECT DATE_HIRE, DATEADD(YEAR, 1, DATE_HIRE) AS 'Hire Plus 1'
FROM EMPLOYEE_PAY_TBL;

SELECT DATE_HIRE, DATEADD(MONTH, 1, DATE_HIRE)
FROM EMPLOYEE_PAY_TBL;

SELECT DATE_HIRE, DATEADD(DAY, 1, DATE_HIRE)
FROM EMPLOYEE_PAY_TBL;

--COnverting dates to strings in different formats:

SELECT DATE_HIRE = DATENAME(YY, DATE_HIRE)
FROM EMPLOYEE_PAY_TBL;

SELECT DATE_HIRE = DATENAME(YEAR, DATE_HIRE)
FROM EMPLOYEE_PAY_TBL;

SELECT DATE_HIRE = DATENAME(MONTH, DATE_HIRE)
FROM EMPLOYEE_PAY_TBL;

SELECT DATE_HIRE = DATENAME(DW, DATE_HIRE)
FROM EMPLOYEE_PAY_TBL;


--Date Part Functions:

SELECT Ord_Date, YEAR(Ord_Date) AS OrderYear,
MONTH(Ord_Date) AS OrderMonth,
DAY(Ord_Date) AS OrderDay
FROM ORDERS_TBL;

-- or Date Part
SELECT Ord_Date, DATEPART(YY, Ord_Date) AS OrderYear
FROM ORDERS_TBL;


--DATE DIFF

SELECT DATEDIFF(YY,DATE_HIRE, GETDATE())
FROM EMPLOYEE_PAY_TBL

SELECT DATEDIFF(YY,DATE_HIRE, DATE_LAST_RAISE)
FROM EMPLOYEE_PAY_TBL

SELECT DATE_HIRE, DATEADD(MM,3,DATE_HIRE) AS PLUS
FROM EMPLOYEE_PAY_TBL

SELECT DATE_LAST_RAISE, DATEADD(YY, 1,DATE_LAST_RAISE) AS 'NEXT RAISE DATE'
FROM EMPLOYEE_PAY_TBL
WHERE DATE_LAST_RAISE IS NOT NULL;

SELECT DATENAME(YY,GETDATE())
SELECT DATEPART(YEAR,GETDATE())

--Using Convert and CAST with Date Functions
--Convert to convert a string into a date value
SELECT CONVERT(DATETIME,'02/25/2010 12:00:00 AM') AS FORMAT_DATE
FROM EMPLOYEE_PAY_TBL;

SELECT DATE_HIRE, CAST(DATE_HIRE as VARCHAR)
FROM EMPLOYEE_PAY_TBL;

SELECT CAST('20141013' AS DATETIME) AS DATEVALUE;

SELECT DATE_LAST_RAISE, CAST(DATE_LAST_RAISE AS VARCHAR) AS 'NEW'
FROM EMPLOYEE_PAY_TBL;

SELECT CONVERT(INT,GETDATE())
SELECT CONVERT(VARCHAR,GETDATE(),0)
SELECT CONVERT(VARCHAR,GETDATE(),1)
SELECT CONVERT(VARCHAR,GETDATE(),101)
SELECT CONVERT(VARCHAR,GETDATE(),2)
SELECT CONVERT(VARCHAR,GETDATE(),102)
SELECT CONVERT(VARCHAR,GETDATE(),112)

--Exercises:

--Before proceeding, look at all the date and time data types and functions:

--http://msdn.microsoft.com/en-us/library/ms186724.aspx

1. Get the current date

SELECT getdate()

2. Get the specific year hired for each employee using two different methods



SELECT EMP_ID, Year(Date_hire) AS 'Year Hired'
FROM EMPLOYEE_PAY_TBL;

SELECT EMP_ID, DATEPART(YY, Date_hire) AS 'Year Hired'
FROM EMPLOYEE_PAY_TBL;

Here is a list of the codes which can be used:

3. Now find out which day of the week each employee was hired.  Show as a number and as Text



SELECT EMP_ID, DATEPART(DW, Date_hire) AS 'Day Hired'
FROM EMPLOYEE_PAY_TBL;

SELECT EMP_ID, DATENAME(DW, Date_hire) AS 'Day Hired'
FROM EMPLOYEE_PAY_TBL;
----------------------------------------------------------------

--Creating Views

--looks and acts like a table, but does not require physical storage.--
--based on a SELECT statement..Essentially Stored Views.
--Used as a form of security or to maintain summarized datas

--CREATE [RECURSIVE]VIEW VIEW_NAME
--[COLUMN NAME [,COLUMN NAME]]
--[-OF UDT NAME [UNDER TABLE NAME]
--[REF IS COLUMN NAME SYSTEM GENERATED |USER GENERATED | DERIVED]
--[COLUMN NAME WITH OPTIONS SCOPE TABLE NAME]]
--AS
--{SELECT STATEMENT}

--Single table view
CREATE VIEW CUSTOMERS_VIEW AS
SELECT *
FROM CUSTOMER_TBL;

Select * from Customers_view;

--Security view

CREATE VIEW EMP_VIEW AS
SELECT LAST_NAME, FIRST_NAME, MIDDLE_NAME
FROM EMPLOYEE_TBL;

select * from EMP_VIEW;

--You can manipulate the data if you are going to use that statement frequently

CREATE VIEW NAMES AS
SELECT LAST_NAME + ','  + FIRST_NAME + ' ' + MIDDLE_NAME NAME
FROM EMPLOYEE_TBL;

SELECT * FROM NAMES;

--And from multiple tables

CREATE VIEW CITY_PAY AS
SELECT E.CITY, AVG(p.PAY_RATE) AS AVG_PAY
FROM EMPLOYEE_TBL E,
EMPLOYEE_PAY_TBL P
WHERE E.EMP_ID = P.EMP_ID
GROUP BY E.CITY;

SELECT * FROM CITY_PAY;

--With Check Option
--WITH CHECK OPTION is a CREATE VIEW statement option. The purpose of WITH
--CHECK OPTION is to ensure that all UPDATE and INSERT commands satisfy the
--condition(s) in the view definition. If they do not satisfy the condition(s), the
--UPDATE or INSERT returns an error. WITH CHECK OPTION actually enforces referential
--integrity by checking the view’s definition to see that it is not violated.


CREATE VIEW EMPLOYEE_PAGERS AS
SELECT LAST_NAME, FIRST_NAME, PAGER
FROM EMPLOYEE_TBL
WHERE PAGER IS NOT NULL
WITH CHECK OPTION;

SELECT * FROM EMPLOYEE_PAGERS;

--If you try to insert a null, it gives an error

INSERT INTO EMPLOYEE_PAGERS
VALUES ('SMITH','JOHN',NULL);

--You can also go the other way and create tables from views

--First a view
CREATE VIEW ACTIVE_CUSTOMERS AS
SELECT C.*
FROM CUSTOMER_TBL C,
ORDERS_TBL O
WHERE C.CUST_ID = O.CUST_ID;


SELECT * FROM ACTIVE_CUSTOMERS;

--Now use that to create a table
CREATE TABLE CUSTOMER_ROSTER_TBL AS
SELECT CUST_ID, CUST_NAME
FROM ACTIVE_CUSTOMERS;

--You cannot use the ORDER BY clause , but you can use the GROUP BY:

CREATE VIEW NAMES2 AS
SELECT LAST_NAME + ','  + FIRST_NAME + ' ' + MIDDLE_NAME NAME
FROM EMPLOYEE_TBL
ORDER BY LAST_NAME + ','  + FIRST_NAME + ' ' + MIDDLE_NAME;


CREATE VIEW NAMES2 AS
SELECT LAST_NAME + ','  + FIRST_NAME + ' ' + MIDDLE_NAME NAME
FROM EMPLOYEE_TBL
GROUP BY LAST_NAME + ','  + FIRST_NAME + ' ' + MIDDLE_NAME;

SELECT * FROM NAMES;

SELECT * FROM NAMES2;

--There are 

DROP VIEW CITY_PAY;
DROP VIEW CUSTOMERS_VIEW;
DROP VIEW EMPLOYEE_PAGERS;
DROP VIEW NAMES;
DROP VIEW NAMES2;


--Why Do We Like Views?

Use AdventureWorksLT2012
GO

Select * from Example;


Create a query from the tabkes which outputs all of this, Then turn it into the View Example


CREATE VIEW view_name AS
SELECT C.FirstName, C.MiddleName, C.LastName, A.AddressLine1, A.AddressLine2, 
       A.City, A.StateProvince, A.CountryRegion, A.PostalCode, 
       soh.AccountNumber, soh.SalesOrderID,soh.OrderDate, soh.ShipDate, soh.TotalDue,
       sod.SalesOrderDetailID, sod.OrderQty, P.Name, sod.UnitPrice, P.StandardCost,
       PC.Name AS SubCategoryOfProduct
       
	FROM SalesLT.Customer AS C
			INNER JOIN SalesLT.CustomerAddress AS CA
			  ON C.CustomerID=CA.CustomerID
			INNER JOIN SalesLT.Address AS A
			  ON CA.AddressID=A.AddressID
		    INNER JOIN SalesLT.SalesOrderHeader AS SOH
			  ON C.CustomerID=SOH.CustomerID
			INNER JOIN SalesLT.SalesOrderDetail AS SOD
			  ON SOH.SalesOrderID=SOD.SalesOrderID
			INNER JOIN SalesLT.Product AS P
			  ON P.ProductID=SOD.ProductID
			INNER JOIN SalesLT.ProductCategory AS PC
			  ON PC.ProductCategoryID=P.ProductCategoryID;

--Look how much easier it is to run a query now:

Select LastName, City, TotalDue
FROM Example
Where TotalDue > 100000;

--Now the Easy Way to create Views (and Queries!)

--Click on Views, New

--Now see if you can design this one:
SELECT TOP 20 [FirstName]
      ,[LastName]
      ,[CompanyName]
      ,[SalesOrderID]
      ,[OrderDate]
      ,[OrderQty]
      ,[ProductID]
      ,[UnitPrice]
      ,[Name]
      ,[TotalDiscount]
  FROM [AdventureWorksLT2012].[dbo].[CalcExample];
--Synonyms: another name for a table or view
--The only advantage is that it can be made public or private;

CREATE SYNONYM CUST FOR CUSTOMER_TBL;

SELECT * FROM CUST;

DROP SYNONYM CUST;

