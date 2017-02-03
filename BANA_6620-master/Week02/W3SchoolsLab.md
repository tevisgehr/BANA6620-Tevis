#### Lab using W3Schools

For this lab, we will be using the built in database at the [w3schools website](http://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all).  This will provide a nice introduction to working with the basics of writing queries.  

1. Before we can begin by writing any queries, we need to draw out our ERD based on the schema of the database.  Work with your neighbors to write out all tables (entities), identify all the primary keys, foreign keys, and the corresponding relationships between the tables.

2. Now that we have our database created.  Let's try to get some questions answered regarding the data stored in these tables.  Look at the top 5 rows of each table to understand the data being stored in each - you might choose to add the column name information to your tables in your ERD to keep everything straight.  

For the following 3 questions, use the `Customers` table.  

3. Provide a table of all the customer information for customers in either Brazil, Germany, or France.

4. Provide the same information as the above query; however, use the `IN` command to provide the results.  If you used `IN` above, use `OR` statements in this solution.

5. Provide all customer information for customers with a first name beginning with `A`.

For the following 2 queries use the `Products` table.

6. Find the average, max, and min price for each supplier, as well as a count of the number of products that exist for each supplier.

7. Find the average, max, and min price for each category as well as a count of the number of products that exist for each category. Order the rows by the categories with the most number of products first.

First trials with JOINS.

8. For your query in 6, pull information regarding the supplier city and phone number.  The final table should have this new information along with all of the original information in the previous query.

9. For your query in 7, pull information regarding the category name and description.  The final table should have this new information along with all of the original information in the previous query.

First Subquery and Join.

10. Which product has been ordered the most? Provide the product name and product price along with how often it has been ordered.  What is the total amount spent on the product to date? Is the amount spent on this product more than any other product?

__________________

##### Lab Check Access

For today, we are going to get our hands on a built in, large database within SQL Server.  This will give us an idea of how we can write SQL in a production environment.  In order to login to your SQL Server instance, you need the following:

1. **Server type:** Database Engine

2.  **Sever name:** 132.194.167.53\BANA6620

3.  **Authentication:** SQL Server Authentication

4. **Login:** Your username for github (case sensitive, but without all punctuation)

5. **Password:** Bana6610 (who can keep track of the real key for this class anyway)

Once you have entered into SQL Server, you have access to all the databases in your profile via the left margin.  At the top in the third toolbar, you will see a drop down menu that states we are currently in the **master** database.  You will want to change this to the **AdventureWorks** database.  You can view the ERD for this database [here](http://merc.tv/img/fig/AdventureWorks2008.gif).  
