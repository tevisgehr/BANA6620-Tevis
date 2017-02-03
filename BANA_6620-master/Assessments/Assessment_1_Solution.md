##### Assignment 1 Solutions

----

1. Provide an ERD for the above.  **Again, this will not necessarily follow what we have discussed in class in terms of required relationships for SQL.**

For each of the below questions provide a query written in SQL that will answer the question of interest.

2. What is the number of users that fall into each campaign type?  Your solution should contain two columns: `campaign` and the `count` for the number of users in the campaign.

```sql
SELECT campaign_id, COUNT(*) CT
FROM Users
GROUP BY campaign_id;
```

3. What is the average price for each meal type?  Sort your results from most expensive to least expensive.

```sql
SELECT type, AVG(price) mean_price
FROM Meals
GROUP BY type
ORDER BY mean_price  DESC;
```

4. For each user identify the number of times the user has provided a bought, like, and share.  Your final result should have a `userid` column, a `share` column, a `bought` column, and a `like` column.  

```sql
SELECT ct.userid, SUM(ct.buy) buys, SUM(ct.like_it) likes, SUM(ct.share) shares
FROM
    (SELECT userid,
          CASE  
             WHEN event = 'bought' THEN 1  
             ELSE 0  
          END AS buy,
          CASE  
             WHEN event = 'like' THEN 1  
             ELSE 0  
          END AS like_it,
          CASE  
             WHEN event = 'share' THEN 1  
             ELSE 0  
          END AS share    
    FROM Events) ct
GROUP BY ct.userid
ORDER BY ct.userid;
```

5. Now, provide the same information as in the previous question, but for each meal type.

```sql
SELECT ct.meal_id, SUM(ct.buy) buys, SUM(ct.like_it) likes, SUM(ct.share) shares
FROM
    (SELECT meal_id,
          CASE  
             WHEN event = 'bought' THEN 1  
             ELSE 0  
          END AS buy,
          CASE  
             WHEN event = 'like' THEN 1  
             ELSE 0  
          END AS like_it,
          CASE  
             WHEN event = 'share' THEN 1  
             ELSE 0  
          END AS share    
    FROM Events) ct
GROUP BY ct.meal_id
ORDER BY ct.meal_id;
```

6. Determine the total amount spent for each meal.  Order the total spent from most to least.  Also allow me to see which `type` each meal fell into.  

```sql
SELECT m.meal_id, m.type, SUM(m.price) total
FROM
    (SELECT meal_id, event
    FROM Events) e
JOIN
    (SELECT meal_id, type, price
    FROM Meals) m
ON e.meal_id = m.meal_id
WHERE event = 'bought'
GROUP BY m.meal_id, m.type
ORDER BY total DESC;
```

7.  We would like to provide a rebate to those who are making an impact by referring new customers.  Provide a table that allows us to understand which userids are associated with making the biggest impact.  Provide the top 20 individuals listed as `referred_by`.

```sql
SELECT referred_by, COUNT(*) refer
FROM Referrals
GROUP BY referred_by
ORDER BY refer DESC
LIMIT 20;
```

8. Provide a table with the number of `events` that happen in each `year`.

```sql
--Postgres
SELECT date_part('year', dt) AS year, COUNT(*) tot_events
FROM Events
GROUP BY year;

--SQL Server
SELECT DATEPART(yyyy, dt) AS year, COUNT(*) tot_events
FROM Events
GROUP BY year;
```

9. Provide a table with the number of events of each `event` type that occur within each `month` of each `year`.

```sql
--Postgres
SELECT date_part('year', dt) AS year, date_part('month', dt) AS month, event, COUNT(*) tot_events
FROM Events
GROUP BY year, month, event
ORDER BY year, month, event;

--SQL Server
SELECT DATEPART(yyyy, dt) AS year, DATEPART(mm, dt) AS month, event, COUNT(*) tot_events
FROM Events
GROUP BY year, month, event
ORDER BY year, month, event;
```

10. For each meal `type` provide the number of `buys`, `likes`, and `shares`.

```sql
SELECT m.type, SUM(ct.buy) buys, SUM(ct.like_it) likes, SUM(ct.share) shares
FROM Meals m
LEFT JOIN
(SELECT   meal_id,
     CASE  
         WHEN event = 'bought' THEN 1  
         ELSE 0  
      END AS buy,
      CASE  
         WHEN event = 'like' THEN 1  
         ELSE 0  
      END AS like_it,
      CASE  
         WHEN event = 'share' THEN 1  
         ELSE 0  
      END AS share    
 FROM Events) ct
ON ct.meal_id = m.meal_id
GROUP BY m.type;
```

11. Provide the total number of `referrals` made in this database.

```sql
SELECT COUNT(*) refers
FROM Referrals;
```

12. For each `meal_id`, determine which `campaign_id` is most frequently used to purchase.  Your final table should hold information regarding the `type`, and the count of how many times each `campaign_id` was associated with a purchase.

```sql
SELECT b.type, b.meal_id, c.campaign_id,      COUNT(*) Purchase_Count
FROM Events a
JOIN Meals  b
ON a.meal_id = b.meal_id
JOIN Users c
ON a.userid = c.userid
WHERE a.event= 'bought'  
GROUP BY b.meal_id , b.type, c.campaign_id
ORDER BY b.meal_id, b.type, Purchase_Count DESC, c.campaign_id;
```




_______

##### Part 2

1. Describe the advantages and disadvantages of using a SQL database as opposed to some other method for storing data.
```
'''
SQL Databases are built to be scalable and fast (in most cases).  They allow us to define the relationships that exist between tables, and determine a schema for the variable types as well as these relationships.

Furthermore, they SQL is a nice language for working with dates, strings, and other variable types that can be a struggle in other environments.  SQL is one of the most common languages in any environment, and a foundational tool every developer should be able to use with ease.
'''
```
2. What is the difference between `WHERE` and `HAVING` in SQL?

```
'''
WHERE is used as a conditional statement, as is HAVING.  However, HAVING is used with aggregate statements, which break in WHERE statements.
'''
```

3. Describe what `LIKE` is used for in SQL.  What other operations you would likely use with a `LIKE` statement.

```
'''
LIKE is used as a tool for REGEX in a way - it allows us to look for strings that look a particular way.  A common syntax that will be used with LIKE is '%', as this provides a means for looking for things that start, end, or have a middle part that look like a particular string.  For some illustrative examples, see [this](http://www.w3schools.com/sql/sql_like.asp).
'''
```

4. Provide feedback on the best part of this learning experience.  What was the worst part?  Any information or teaching styles that would better assist you in furthering your grasp of the course material?



 5. View the following [link](https://www.toptal.com/sql/interview-questions) for more fundamental SQL questions with solutions.  Additional questions can be found [here](http://www.tutorialspoint.com/sql/sql_interview_questions.htm).  I personally find this second set a little less likely in an interview, but you never know.  Additionally, the idea of a [self join](https://dwbi.org/database/sql/72-top-20-sql-interview-questions-with-answers) is very common in interviews (in my experience - Twitter commonly asks self join query questions).  It is discussed on the above link.  Nothing to answer here - just additional resources to better grasp SQL.
