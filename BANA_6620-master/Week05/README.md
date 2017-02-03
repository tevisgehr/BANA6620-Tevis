#### Subqueries

The final topic of interest that we will cover regarding SQL is in using **subqueries**.  The idea of a subquery is that it allows you to perform essentially the same task that we did regarding views, but without storing a table.  

The tools for performing a subquery are already well known to you; however, we are just going to piece them together in a new way.  In our `FROM` statement, we can have an entire statement that creates a table that we can then query.  Let's take a look at how this works.

Below we can see an example of a subquery at work.  Notice in the `FROM` statement we are actually creating a table.  Then we are running an additional query to pull only the `sub.resolution = 'NONE'`, and we are aliasing our entire table from the subquery as `sub`.  

```sql
SELECT sub.*
  FROM (
        SELECT *
          FROM tutorial.sf_crime_incidents_2014_01
         WHERE day_of_week = 'Friday'
       ) sub
 WHERE sub.resolution = 'NONE'
 ```

This is essentially all you need to be able to write your own subqueries.  Note, we can write subqueries in any part of our original sql statements, as you will practice with in the homework assignment by using subqueries within `WHERE` statements.

#### CASE WHEN

Unfortunately, 'if' statements do not exist in the same syntax in SQL.  Instead, we use `CASE WHEN` statements.  Further reading on these statements can be found [here](https://community.modeanalytics.com/sql/tutorial/sql-case/).  Let's take a look at one of these statements to better understand how they work.  

```sql
SELECT player_name,
       weight,
       CASE WHEN weight > 250 THEN 'over 250'
            WHEN weight > 200 THEN '201-250'
            WHEN weight > 175 THEN '176-200'
            ELSE '175 or under' END AS weight_group
  FROM benn.college_football_players
```

You can see we are creating a column called `weight_group`.  The different values that can take place are provided next to the `THEN` statement, and our condition is provided next to the `WHEN` statement.  You can see this is a useful means for changing a continuous variable to something closer to categorical.
______

##### Quick Review

With that, a quick review of SQL and ERDs - we have the ability to query data that can be connected amongst many tables via `primary-foreign key` relationships using SQL.  

The key concepts of SQL to take away:

1. We can `JOIN` tables in nice ways.

2. We can subset our data using `WHERE` and `HAVING` statements.

3. We have nice ways of working with strings and dates.

4. We can write subqueries and views to work with data.

5. There are ways to work with t-SQL that are beyond the scope of this class.  My preferred method for working with data in a way that would require using t-SQL is to move it to an easier platform to conduct these analyses (like R or Python).
