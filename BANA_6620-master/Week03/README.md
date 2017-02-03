#### SQL JOINS

The real bread and butter of SQL is in **JOIN** statements.  Essentially, **JOIN** statements are essential, as they allow us to combine tables together in a way that gives us more insight than we are able to obtain from a single table.  

The below image provides the most used joins in the SQL language.  A further explanation of JOINs can also be found [here](http://www.sql-join.com/)

 <img src="./Visual_SQL_JOINS_orig.jpg" height="400">

 _____

 The JOIN statements that I use most frequently include

 - **RIGHT JOIN**
 - **LEFT JOIN**
 - **INNER JOIN**

I will occasionally need to use some sort of **OUTER JOIN**, but most frequently it the above three joins with the most frequent JOIN being an **INNER JOIN**. In most SQL distributions, **JOIN** is used as a synonym to **INNER JOIN**.

The best way to get better at JOINs is simply to use them.  So, let's get to it.

Let's consider the AdventureWorksLT2012 database.

```sql
SELECT COUNT(*)
FROM SalesLT.Product


SELECT DISTINCT ProductID
FROM SalesLT.SalesOrderDetail;
```

Here we will do a JOIN between these two tables.  Let's see what this looks like in practice.  Remember, most of the time we will be performing some sort of **INNER JOIN**, and we want to use aliases to reduce the length of our queries.

```sql
SELECT SOD.SalesOrderID, P.Name, SOD.OrderQty
FROM SalesLT.SalesOrderDetail SOD INNER JOIN SalesLT.Product P
ON SOD.ProductID = P.ProductID
```

You will notice that in all of our JOIN statements, we are linking via our **primary key - foreign key** relationship.  That is the column we want to match from each table.  The **INNER JOIN** here provides a means for us to only pull rows that share a `ProductID`.  Then we are pulling all that match, and bringing those rows to the new table.  That is, if the `ProductID` only shows up one time in the first table, but it shows up 20 times in the second table, we will have 20 rows in our new table.  

Note, if we did not set up our **primary key - foreign key** relationship correctly, we are going to have a weird matching.  Imagine having `ProductID` twice in one table and 20 times in the other table, we will now obtain 40 observations when performing our **INNER JOIN**.

Consider we want the same table as above, but we want it where the order quantity is more than 1.  We can achieve this result with the following:

```sql
SELECT SOD.SalesOrderID, P.Name, SOD.OrderQty
FROM SalesLT.SalesOrderDetail SOD INNER JOIN SalesLT.Product P
ON SOD.ProductID = P.ProductID
WHERE SOD.OrderQty > 1
```

Now we might want to limit on products that are yellow instead of based on quantity.  We can achieve this result in the following way:

```sql
SELECT SOD.SalesOrderID, P.Name, SOD.OrderQty
FROM SalesLT.SalesOrderDetail SOD INNER JOIN SalesLT.Product P
ON SOD.ProductID = P.ProductID
WHERE P.Name LIKE '%Yellow%'
```

We could also limit on both of the above criteria:

```sql
SELECT SOD.SalesOrderID, P.Name, SOD.OrderQty
FROM SalesLT.SalesOrderDetail SOD INNER JOIN SalesLT.Product P
ON SOD.ProductID = P.ProductID
WHERE P.Name LIKE '%Yellow%' AND SOD.OrderQty > 1
```

Now imagine that for each product name, we want to know what is the total quantity ordered.

```sql
SELECT P.Name, SUM(SOD.OrderQty) Amount_Ordered
FROM SalesLT.Product P INNER JOIN SalesLT.SalesOrderDetail SOD
ON SOD.ProductID = P.ProductID
GROUP BY P.Name
```

Now let's do a few examples to show that you can actually join more than 2 tables together.  In fact, you can join all the tables in your RDBMS together if you would like.  However, there are computational reasons (even though SQL in the traditional sense is highly optimized) for why you might not do that especially if you are working on a large cluster environment of data.

```sql
SELECT SOD.SalesOrderID, P.Name FullName, SOD.OrderQty, P.Color, PM.Name PartialName
FROM SalesLT.SalesOrderDetail SOD
INNER JOIN SalesLT.Product P
ON SOD.ProductID = P.ProductID
INNER JOIN SalesLT.ProductModel PM
ON P.ProductModelID = PM.ProductModelID
```

Now, we might like to order the above table by product model name and then again order by product name.

```sql
SELECT SOD.SalesOrderID, P.Name FullName, SOD.OrderQty, P.Color, PM.Name PartialName
FROM SalesLT.SalesOrderDetail SOD
INNER JOIN SalesLT.Product P
ON SOD.ProductID = P.ProductID
INNER JOIN SalesLT.ProductModel PM
ON P.ProductModelID = PM.ProductModelID
ORDER BY PM.Name, P.Name
```

Finally, we could throw an aggregate in there and order by the value of our aggregate.

```sql
SELECT PM.Name, SUM(SOD.OrderQty) Product_Model_Qty
FROM SalesLT.SalesOrderDetail SOD
INNER JOIN SalesLT.Product P
ON SOD.ProductID = P.ProductID
INNER JOIN SalesLT.ProductModel PM
ON P.ProductModelID = PM.ProductModelID
GROUP BY PM.Name
ORDER BY Product_Model_Qty
```

This set of lecture notes should prove as a means to get your feet wet with SQL Joins.  The true power of SQL is here with JOIN statements.  You can do some very powerful analysis this way.  In the next section, we will consider working with dates and strings.  Then in the final set of notes, we will look at subqueries, which make it so we do not need to create temp tables all the time to do more advanced querying (although I have met many individuals in practice that keep a large number of VIEWs in SQL Server).
