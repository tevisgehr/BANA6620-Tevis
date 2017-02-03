#### Introduction to Structured Query Language (SQL)

Beyond Excel, SQL is likely the most fundamental tool that all analysts should be comfortable using.  

SQL was originally designed to assist analysts with the ability to query traditional RDBMSs, but this language (and similar languages) now enables the ability to interact with multiple other stored data types. A few of these cases inclue:

-  [Hive](https://cwiki.apache.org/confluence/display/Hive/Home#Home-ApacheHive) was developed by Facebook to provide a means for analysts to interact with data stored in HaDoop Distributed File Systems (HDFS) without having to write [map-reduce](https://en.wikipedia.org/wiki/MapReduce).

- Another SQL-like language called [pig](https://pig.apache.org/) was developed at YaHoo for their analysts to perform [ETL](https://en.wikipedia.org/wiki/Extract,_transform,_load) without having to write map-reduce.

- Similarly, [SparkSQL](http://spark.apache.org/sql/) was developed to allow for the use of interacting with data using Spark while writing familiar syntax.

- Google created [Google Big Query](https://cloud.google.com/bigquery/) to be able to interact with massive amounts of data living in distributed systems using SQL.  

Each of these languages were introduced to allow analysts the ability to participate in analyzing data living the 'Big Data' worlds that exist at each of these massive data storage companies (FB, YaHoo, and Google), while not having to learn an entirely new language.  

Some of the best resources available to learn SQL include [w3schools](http://www.w3schools.com/sql/default.asp) and [SQLZoo](http://sqlzoo.net/).  For additional practice, you may choose to pursue these resources to continue with learning and reinforce your knowledge outside of this course.

______

##### Key Commands of SQL

The first three commands you should be comfortable using within SQL include:

- **SELECT**: provide the column(s) you would like to return.

- **FROM**: the table(s) from which you would like to select your column(s).

- **WHERE**: A filter that conditions the information you would like to pull from each table.

These commands will begin our trek with using SQL.  You will be using these commands with nearly every command you write in SQL.  For practice, move to the [w3schools' page](http://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all), and answer the following questions (You may have to click restore database to see the tables available).  I have provided solutions to each question at the bottom of the lecture notes for you to compare.  It is worth noting that most SQL distributions are not case sensitive, but many will require a semicolon at the end of the statements for the statement to run.

1. Select all customer information for all customers who live in Germany.

2. Select all product information for all products that have a price greater than $20.

______

Now let's take a look at a few additional niceties SQL provides.  There are a number of aggregate functions we can perform on our columns in our select statement.  When using these aggregates, we will need to provide a **GROUP BY** argument in many cases.  Additionally, we can sort our returned table by a particular column using **SORT BY**.

Common aggregate functions in SQL include

- MAX()
- MIN()
- SUM()
- AVG()
- COUNT()
- FIRST()
- LAST

These are pretty self explanatory commands.  Additional commands are provided [here](http://www.w3schools.com/sql/sql_functions.asp).

Again, let's get our feet wet with a couple of examples.

1. Use the `OrderDetails` table to find the total quantity for each orderID.

2. Use the `Products` table to determine how many products are available from each supplier.

3. Use the `Products` table to determine the average, min, and max price, as well as the number of products available for each product category.   

______

##### Alias, LOGIC, and HAVING

Three final notes for this first introduction.

1. Use [aliases](http://www.w3schools.com/sql/sql_alias.asp) on your columns and tables.  This will come in handy in the future, and it makes your table easier to read after completing your query.

2. Traditional logical operations `AND`, `OR`, `IN`, `NOT IN`, `=`, `<>`, `>`, `<`, `>=`, and `<=`.  Additionally, SQL supports `LIKE` and `BETWEEN`.  Frequently you will see `LIKE` used with `%` signs, as this allows for you to search strings for potential rows you want, but perhaps a typo occurred.  The `BETWEEN` argument allows us to return rows with a value of the column between two values.  These statements will be used in either **WHERE** or **HAVING** statements.  You can read more about these statements [here](http://www.w3schools.com/sql/sql_where.asp)

3. There is a statement similar to **WHERE** called **HAVING** that allows us to create conditions on aggregates; rather than only on individual column values.  See the explanation at the top of [this](http://stackoverflow.com/questions/9253244/sql-having-vs-where) post for a nice statement on the use of each of these commands.

__________

##### Solutions

1.

```sql
SELECT *
FROM Customers
WHERE Country = 'Germany';
```

2.

```sql
SELECT *
FROM Products
WHERE Price > 20;
```

3.

```sql
SELECT OrderID, SUM(Quantity) Quant
FROM OrderDetails
GROUP BY OrderID;
```

4.

```sql
SELECT SupplierID, Count(*) NumberProducts
FROM Products
GROUP BY SupplierID;
```

5.

```sql
SELECT CategoryID, AVG(Price) avg_pr, MAX(Price) max_pr, MIN(Price) min_pr, COUNT(*) num_prods
FROM Products
GROUP BY CategoryID;
```
