
##### AdventureWorks Lab 1

Today, we will again use the AdventureWorks database.  However, we will be focusing on working with dates.  [This](http://www.w3schools.com/sql/sql_dates.asp) is a nice resource for getting the basics of what is possible in using columns that hold dates in our databases.  We also want to get some practice writing more complex queries by using subqueries.  I do not like I having a ton of temporary tables saved in my database, because it can clutter the main database.  However, it is possible to create these temporary tables as `VIEW` tables to be queried from later.  Below is an example of how you might go about creating a table as a VIEW.

```sql
CREATE VIEW table_name AS

SELECT columns_we_are_interested_in keeping
FROM table1
JOIN table2
ON pk = fk
JOIN table3
ON pk1 = fk1
```

Then we can query the table, `table_name` we just created the same way we would query any other table in our database.

1. Write a query that calculates the number of days between the date an order was placed and the date that it was shipped using the Sales.SalesOrderHeader table. Besides the number of days between order and ship, include the SalesOrderID, OrderDate, and ShipDate columns.


2. Write a query that displays only the date, not the time, for the order date and ship date in the Sales.SalesOrderHeader table.


3. Write a query that adds six months to each order date in the
Sales.SalesOrderHeader table. Include the SalesOrderID and OrderDate columns.


4. Write a query that displays the year of each order date and the numeric month of each order date in separate columns in the results. Include the SalesOrderID and OrderDate columns.


5. Change the query written in question 4 to display the month name instead.


6. For the `Production.Product` table, create a new column for the table that has 5 different levels of `StandardCost`:

    * `less than 50`
    * `50 to 150`
    * `150 to 250`
    * `250 to 350`
    *  `greater than 350`

You can add this as a column to your table called `StandardCostCategory`.

7. Compute two new columns for the `Production.Product` table.

    * Let the first column be called `MarkUp`, which takes the difference between the `ListPrice` and `StandardCost`.

    * Let the second column be called `MarkUpPerc` as `Markup`divided by the `StandardCost`.

8. Similar to question 6, determine 5 categories of `MarkupPerc`.

    * `less than 50 percent`
    * `between 50 and 75 percent`
    * `between 75 and 100 percent`
    * `between 100 and 150 percent`
    *  `greater than 150 percent`

You can add this as a column to your table called `MarkupPercCategory`.


9. Determine the count of items that fall into each `StandardCostCategory`.  Then determine the count of items that fall into each category of `MarkupPercCategory`.  Finally, determine the count of items that fall into any possible combination of `StandardCostCategory` and `MarkupPercCategory`.


10. Using the `Prouction.Product` and `Production.WorkOrder` tables, determine the net profit for each product.

11. Using the `Prouction.Product` and `Production.WorkOrder` tables, determine which product category as described in part 6. has the most total orders.

12. Similar to the previous question, using `Production.Product` and `Production.WorkOrder` tables, determine which category in part 8. has the most total orders.
