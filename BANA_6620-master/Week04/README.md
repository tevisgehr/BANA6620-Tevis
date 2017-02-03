#### Lecture 4 - Strings and Dates

##### String Commands

As we come to the end of working with SQL, I want to point out a few features that I use on a regular basis in working with SQL in 'real world' cases.  The first of these is in working with string data in our columns.  A nice reference is provided [here](http://www.tutorialspoint.com/sql/sql-string-functions.htm).  Often times we need to clean data, which we might choose to do within another language like Python or R.  However, I have found that SQL is quite nice for formatting both dates and text.

Some really nice functions worth noting that are also provided in the above link include those that are also available within Python.  These functions include:

- `LOWER` and `UPPER` to change a string to all caps or all lower case.

- `REPLACE` allows you to replace all of a particular character with another character.  This comes in very handy with cleaning messy text data.

- `TRIM` removes those unwanted spaces that sometimes show up at the beginning and end of a text field.  

- `LENGTH` provides the number of characters in a field.  

- `LIKE` which we have seen in previous lectures is very commonly used with text.

- `REGEXP` is for regular expression.  Learning regular expression statements takes a lot of practice and patience, but this is extremely powerful.  There are [entire books](https://www.amazon.com/Mastering-Regular-Expressions-Jeffrey-Friedl/dp/0596528124?ie=UTF8&tag=stackoverfl08-20) on this topic.

____

##### Dates

I mostly hate working with dates, Excel is absolutely terrible with dates - I utterly hate working with dates in Excel.  If I absolutely must use with dates, SQL and [Pandas within Python](http://pandas.pydata.org/) are my two favorite environments.  

[Here](http://www.w3schools.com/sql/sql_dates.asp) are a few of the date commands that are extremely useful.  I will pull out date commands that I use on a regular basis.  

- `DATEPART` is one of the best ways of being able to extract months, days, or years in different ways from date columns.  See the [following](http://www.w3schools.com/sql/func_datepart.asp) for specific use cases of `DATEPART`.

- `DATEDIFF` is an incredible resource for being able to see how far apart two dates are in terms of different measures: Days, Months, Years, Hours, Minutes, Seconds, and [more](http://www.w3schools.com/sql/func_datediff.asp).

- `GETDATE` is a command I use regularly to compare existing dates in the database to today's date and assure we are under certain time restrictions.  Therefore, this is frequently used alongside `DATEDIFF`.

- `DATEADD` is extremely useful when looking at completion activity dates.  Maybe you have a database of employees, and they need to have all HR work completed within 30 days.  You can set reminders through your database by adding columns to a hire date column to express followup deadlines.  Consider the [following](http://www.w3schools.com/sql/func_dateadd.asp) available to assist when using `DATEADD`.

_____

##### ASIDE on INSERT, DELETE, UPDATE

This set of lecture notes is a bit of special topics that you may or may not use.  With many of the above commands, they are supported differently depending on your SQL environment.  Additional commands that you would usually not use as an analyst, but may be useful to be aware of include the commands of `INSERT INTO`, `DELETE`, and `UPDATE` as a means of changing the rows that exist in a particular table of your database.  

Full disclosure, I rarely use the above commands, but depending on what portion of the analytics department you are working with or how large your group, you may need to use these commands regularly to change your table to keep up with changing data (or mistakes in your data).

- `INSERT INTO` allows an individual to create new rows within an existing table.  Using this command means that you have an existing table, and you have existing columns for which you would like to insert information associated with a particular row.  

An example is provided here that shows we are inserting a CustomerName of 'Cardinal', City of 'Stavanger', and Country of 'Norway' all into the Customers table.  If this table contains more than these three columns, they will simply have `null` values.  

```sql
INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');
```

You can see additional examples provided [here](http://www.w3schools.com/sql/sql_insert.asp).


- `DELETE` allows a user to remove individual rows from a table (or all rows).  An example is provided, but you can also see more [here](http://www.w3schools.com/sql/sql_delete.asp).  Notice that when you delete, you only need to specify a value in a particular row, but you actually remove a full row when running the command.

```sql
DELETE FROM Customers
WHERE CustomerID = 2;
```

The above query deletes the entire row where CustomerID is 2 from the Customers table.

- `UPDATE` allows you to update information in the rows of existing tables.  We need to be careful to only update the specific rows we would like to update, which requires the use of **WHERE**.

An example of the update command is provided below along with additional information provided [here](http://www.w3schools.com/sql/sql_update.asp)

```sql
UPDATE Customers
SET City='Hamburg'
WHERE CustomerName='Alfred';
```

With this command we are updating the row the Customers table where the CustomerName is 'Alfred' to have a city of 'Hamburg'.

In most analyst roles, if you are lucky enough to have access to the database, it is not likely that you will have write access to use these types of commands on the database.  In my experience, I am totally good without having this type of access.  The last thing you want to do is blow up a table that you cannot restore, or you did not have backed up.
_____

##### Creating Temporary Tables Using VIEWS

In the next section, we will look at **subqueries**, which may allow us to forego creating temporary tables in may cases.  However, there are often times that we want to create a table for the purposes of reusing it multiple times.  Different languages have alternative ways of creating these temporary tables.  In Microsoft SQL Server, we create `views`.  You can create an actual table, but again, many individuals cannot write a table to the database based on their credentials.  


```sql
CREATE VIEW [Products Above Average Price] AS
SELECT ProductName,UnitPrice
FROM Products
WHERE UnitPrice>(SELECT AVG(UnitPrice) FROM Products)
```

Now, we will have this table, `[Products Above Average Price]`, available for us to query the same way we can query from any other table.  These will be stored in the sidebar under `VIEWS`.  

If you are only querying from this table once or twice, creating a view is probably more than necessary.  However, if you are going to be querying multiple times, the creation of a view can be very convenient.  For more information on views, see the following [link](http://www.w3schools.com/sql/sql_view.asp).

Additionally, there are commands in the homework that were not covered specifically in these notes.  Use the notes here, as well as those in the homework assignments, to assist in completing the homework, which can be found at the very bottom of the `Strings_LT.sql` and `Strings.sql` notes.
