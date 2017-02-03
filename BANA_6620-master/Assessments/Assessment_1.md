#### Assessment 1

This exam is written to have both fairly trivial questions, as well as very difficult questions.  The exam is meant to challenge even students who have a very strong grasp of the material.  Interviews involving SQL frequently will ask some very simple, as well as very in depth questions regarding how to query data.

##### Part 1

Consider we have a database with the following tables Note it does not necessarily follow our traditional schema - all tables were simply added as csv files.  However, matching column names are the same information across tables:

**Events:**

|     dt    | userid | meal_id | eventid  
-----------|--------|---------|--------
2013-01-01 |      3 |      18 | bought
2013-01-01 |      7 |       1 | like
2013-01-01 |     10 |      29 | bought
2013-01-01 |     11 |      19 | share
2013-01-01 |     15 |      33 | like


A Userid, Mealid, Eventid combo is unique in this table.  Any of these three alone may show up more than a single row.  All of the possible events are shown above.

**Meals:**

|meal_id |  type   |     dt     | price
---------|---------|------------|-------
      1 | french  | 2013-01-01 |    10
      2 | chinese | 2013-01-01 |    13
      3 | mexican | 2013-01-02 |     9
      4 | italian | 2013-01-03 |     9
      5 | chinese | 2013-01-03 |    12

The meal_id is a unique identifier in this table.

**Referrals:**

|referred | referred_by
----------|-------------
      54 |          44
     158 |          80
     184 |         139
     263 |         107
     275 |          35

Each of these columns is a userid value - none of the rows in either column is necessarily unique.

**Users:**

|userid |     dt     | campaign_id
--------|------------|-------------
     1 | 2013-01-01 | RE
     2 | 2013-01-01 | PI
     3 | 2013-01-01 | FB
     4 | 2013-01-01 | FB
     5 | 2013-01-01 | TW

The userid is a unique identifier in this table.  All of the possible campaign_id values are shown above.

In order to create an environment in which you can test your code, we will be using [SQL Fiddle](http://sqlfiddle.com/#!15).  I created the below tables using PostgreSQL 9.3.  You will recognize that the syntax is essentially the same as what we covered in class.  I had some difficulties with dates in other environments, but if you would prefer to work with another environment, I am more than happy to accept those SQL solutions as well.  This environment will allow you the opportunity to run your queries in the right window, and assure they work by seeing the result below the window.

You will need to run the following code to create your database within the **PostgreSQL 9.3** environment:

```sql
CREATE TABLE Events
(
dt DATE,
userid INT,
meal_id INT,
eventid VARCHAR(255)
);

INSERT INTO Events (dt, userid, meal_id, eventid)
VALUES (to_date('20130101','YYYYMMDD'),3,18,'bought'),
       (to_date('2013-01-01', 'YYYYMMDD'),7,1,'like'),
       (to_date('2013-01-01', 'YYYYMMDD'),10,29,'bought'),
       (to_date('2013-01-01', 'YYYYMMDD'),11,19,'share'),
       (to_date('2013-01-01', 'YYYYMMDD'),15,33,'like');

CREATE TABLE Meals
(
meal_id INT,
type VARCHAR(255),
dt DATE,
price INT
);

INSERT INTO Meals (meal_id, type, dt, price)
VALUES (1,'french',to_date('20130101','YYYYMMDD'),10),
        (2,'chinese',to_date('20130101','YYYYMMDD'),13),
        (3,'mexican',to_date('20130102','YYYYMMDD'),9),
        (4,'italian',to_date('20130103','YYYYMMDD'),9),
        (5,'chinese',to_date('20130103','YYYYMMDD'),12);


CREATE TABLE Referrals
(
referred INT,
referred_by INT
);

INSERT INTO Referrals (referred, referred_by)
VALUES (54,44),
        (158,80),
        (184,139),
        (263,107),
        (275,35);

CREATE TABLE Users
(
userid INT,
dt DATE,
campaign_id VARCHAR(255)
);

INSERT INTO Users (userid, dt, campaign_id)
VALUES (1,to_date('20130101','YYYYMMDD'),'RE'),
        (2,to_date('20130101','YYYYMMDD'),'PI'),
        (3,to_date('20130101','YYYYMMDD'),'FB'),
        (4,to_date('20130101','YYYYMMDD'),'FB'),
        (5,to_date('20130101','YYYYMMDD'),'TW');

```

If you would like to add more data to better to test your queries, you are more than welcome.  I have provided starter code, which should make it easy to add to moving forward.

__________

1. Provide an ERD for the above.  **Again, this will not necessarily follow what we have discussed in class in terms of required relationships for SQL.**

For each of the below questions provide a query written in SQL that will answer the question of interest.

2. What is the number of users that fall into each campaign type?  Your solution should contain two columns: `campaign` and the `count` for the number of users in the campaign.

3. What is the average price for each `meal` type?  Sort your results from most expensive to least expensive.

4. For each user identify the number of times the user has provided a bought, like, and share.  Your final result should have a `userid` column, a `share` column, a `bought` column, and a `like` column.  

5. Now, provide the same information as in the previous question, but for each `meal` type.

6. Determine the total amount spent for each `meal_id`.  Order the `total spent` for each from most to least.  Also allow me to see which `type` each meal fell into.  

7.  We would like to provide a rebate to those who are making an impact by referring new customers.  Provide a table that allows us to understand which `userids` are associated with making the biggest impact.  Provide the top 20 individuals listed as `referred_by`.

8. Provide a table with the number of `events` that happen in each `year`.

9. Provide a table with the number of times each `event` type occurs within each `month` of each `year`.

10. For each meal `type` provide the number of `buys`, `likes`, and `shares`, as well as the `campaign` that was associated with the most `events` for that meal `type`.

11. Provide the total number of `referrals` made in this database.

12. For each `meal_id`, determine which `campaign_id` is most frequently used to purchase.  Your final table should hold information regarding the `type`, and the count of how many times each `campaign_id` was associated with a purchase.


_______

##### Part 2

1. Describe the advantages and disadvantages of using a SQL database as opposed to some other method for storing data.

2. What is the difference between `WHERE` and `HAVING` in SQL?

3. Describe what `LIKE` is used for in SQL.  Also describe What other operations you would likely use with a `LIKE` statement.

4. Provide feedback on the best part of this learning experience.  What was the worst part?  Any information or teaching styles that would better assist you in furthering your grasp of the course material?

 5. View the following [link](https://www.toptal.com/sql/interview-questions) for more fundamental SQL questions with solutions.  Additional questions can be found [here](http://www.tutorialspoint.com/sql/sql_interview_questions.htm).  I personally find this second set a little less likely in an interview, but you never know.  Additionally, the idea of a [self join](https://dwbi.org/database/sql/72-top-20-sql-interview-questions-with-answers) is very common in interviews (in my experience - Twitter commonly asks self join query questions).  It is discussed on the above link.  Nothing to answer here - just additional resources to better grasp SQL.
