##### Uber Lab Solution

1.
```sql
SELECT D.DriverID, AVG(R.Driver_Rating) Average_Rating
FROM Drivers D
JOIN Ride R
ON D.DriverID = R.DriverID
GROUP BY D.DriverID
ORDER BY Average_Rating DESC;
```

2.
[This](http://stackoverflow.com/questions/1130062/what-is-the-execution-sequence-of-group-by-having-and-where-clause-in-sql-server) is useful in keeping track of the ordering that results for this query.

```sql
SELECT D.DriverID, AVG(R.Driver_Rating) Average_Rating
FROM Drivers D
JOIN Ride R
ON D.DriverID = R.DriverID
GROUP BY D.DriverID
HAVING COUNT(*) > 9
ORDER BY Average_Rating DESC;
```

3.
The highest tip rate should be a proportion.  Calculating a value that is raw dollar amount misses the fact that some states may just have longer routes on average.

```sql
SELECT State, AVG(Tip_Rate) Average_Tip
FROM (SELECT R.Tip_Amount/R.Fair_Amount Tip_Rate, D.State
      FROM Ride R
      JOIN Drivers D
      ON D.DriverID = R.DriverID) AS t
GROUP BY State
ORDER BY Average_Tip DESC;
```

4.
An ideal situation might revolve around performing an independent t-test of the groups with different phones.  If we were able to determine users who were essentially identical with the exception of having differing phones, we could use a paired t-test.  The paired t-test may be a better way to identify if a difference exists.  We could try to perform a test where we group on all items, and then we only compare between phone types - that is we compare similar gender, age, state, driver, distance, etc. - only the phone type changes.  A fast and easy way is the unpaired t-test, so I will show that below.  This test is not very rigorous.

Here, we could use Welch's t-test.  We might determine if the variances of each group could be deemed equal using a rule of thumb or an F-test if we wanted to be rigorous.

The below table would contain all the information necessary.  The computation can be found [here](https://en.wikipedia.org/wiki/Welch%27s_t-test).  We could then obtain a p-value and make a conclusion as necessary.

```sql
SELECT Rs.Phone_Type, AVG(R.Driver_Rating), STDEV(R.Driver_Rating)
FROM Ride R
JOIN Riders Rs
ON R.RiderID = Rs.RiderID
GROUP BY Rs.Phone_Type
```

5.
I think it might be best to look at month over month growth, quarterly growth, or yearly growth.  The easiest to program might be month to month or yearly growth.  We can do this by looking at the count of rides, or by looking at the total cash flow.  A plot of these values over time might be an ideal view.

```sql
SELECT DATEPART(YEAR, Date) Year, DATEPART(MONTH, Date) Month, COUNT(*) Rides
FROM Ride
GROUP BY Year, Month
ORDER BY Year ASC, Month ASC;
```

6.
Using `CASE WHEN` statements, we can create bins for age.  We might simply bin into age groups by decade.  Depending on the results, we could determine if it is necessary to make those bins larger or smaller.

Based on the results below, we could perform a number of t-tests to assess if there are statistically significant differences between groups.  Since there are a number of comparisons we must make, we would want to use a Bonferroni correction to correct for conducting multiple hypothesis tests.

```sql
SELECT AVG(R.Driver_Rating) mean_rating, Rs.Gender, CASE
                    WHEN R.Age < 30 THEN 1
                    WHEN R.Age >=30 AND R.Age < 40 THEN 2
                    WHEN R.Age >= 40 AND R.Age < 50 THEN 3            
                    WHEN R.Age >= 50 AND R.Age < 60 THEN 4
                    Else 5 END AS AgeCat
FROM Riders Rs
JOIN Ride R
ON Rs.RiderID = R.RiderID
GROUP BY Rs.Gender, AgeCat;
```

7.
```sql
SELECT RiderID, COUNT(*) Rides
FROM Ride
GROUP BY RiderID;
```

8.
```sql
SELECT DISTINCT Rd.RiderID
FROM Ride Rd
JOIN Riders Rs
ON Rd.RiderID = Rs.RiderID
WHERE Rd.RiderID NOT IN
        (SELECT DISTINCT R.RiderID
         FROM Ride R
         WHERE R.Date BETWEEN DATEADD(month, -3, GETDATE()) AND GETDATE());
```

9.
```sql
SELECT DATEPART(YEAR, Date) Year, COUNT(*) Ct
FROM Ride
GROUP BY Year;
```

10.
We have a problem if a rider and driver id are identical on the same ride.  In which case, the ratings associated with these rides would be `padding`.  In many cases, we would not want to remove data.  However, in this case, we would want likely want to remove these ratings.

```sql
SELECT R.DriverID, R.Driver_Rating, R.User_Rating
FROM Ride R
JOIN Ride Rd
ON R.RiderID = Rd.DriverID AND R.DriverID = Rd.RiderID;
```

11.
I will choose an easy way to answer this question - that is by using the state of the rider to see if matches the state of the driver.  Searching the website shows that uber drivers are not able to drive anywhere other than their home state.

Therefore, we can see if these match, suggesting the rider is riding in their home state.  If they do not match, then the rider is riding in a new state.  Obviously, riders who change addresses, but do not update with us could create some difficulty.

For a hard way, but likely more accurate, we could use the start and end location for the ride.  This would truly tell us where the rider was at.  Then we could test this against the home state of the rider.  The second statement above would still create difficulties.

```sql
SELECT T1.Home / (T1.Home + T2.Away) PropHome, T2.Away / (T1.Home + T2.Away) PropAway
FROM (SELECT COUNT(*) AS Home,
      FROM (SELECT Rd.State, R.RideID
            FROM Riders Rd
            JOIN Ride R
            ON Rd.RiderID = R.RiderID) R
      JOIN (SELECT D.State, Rds.RideID
            FROM Ride Rds
            JOIN Drivers D
            ON Rds.DriverID = D.DriverID) D
      ON R.State = D.State AND R) AS T1,
     (SELECT COUNT(*) AS Away,
      FROM (SELECT Rd.State, R.RideID
            FROM Riders Rd
            JOIN Ride R
            ON Rd.RiderID = R.RiderID) R
      JOIN (SELECT D.State, Rds.RideID
            FROM Ride Rds
            JOIN Drivers D
            ON Rds.DriverID = D.DriverID) D
      ON R.State <> D.State AND R.RideID = D.RideID) AS T2;
```

12.

The below will provide the tip rate for in state vs. visitors for each state.  You could certainly have aggregated over all states, or even looked at the results on a per user basis.  There are multiple potential interpretations to the question.  In practice, you might look at each of these to gain different insights.

```sql
SELECT AVG(T1.Tip_Rate_Home) Home_Rate, AVG(T2.Tip_Rate_Away) Away_Rate, T1.State
FROM (SELECT R.Tip_Amount/R.Fare_Amount Tip_Rate_Home, R.State
      FROM (SELECT Rd.State, R.RideID, R.Fare_Amount, R.Tip_Amount
            FROM Riders Rd
            JOIN Ride R
            ON Rd.RiderID = R.RiderID) R
      JOIN (SELECT D.State, Rds.RideID
            FROM Ride Rds
            JOIN Drivers D
            ON Rds.DriverID = D.DriverID) D
      ON R.State = D.State AND R.RideID = D.RideID) AS T1,
     (SELECT R.Tip_Amount/R.Fare_Amount Tip_Rate_Away, R.State
      FROM (SELECT Rd.State, R.RideID, R.Fare_Amount, R.Tip_Amount
            FROM Riders Rd
            JOIN Ride R
            ON Rd.RiderID = R.RiderID) R
      JOIN (SELECT D.State, Rds.RideID
            FROM Ride Rds
            JOIN Drivers D
            ON Rds.DriverID = D.DriverID) D
      ON R.State <> D.State AND R.RideID = D.RideID) AS T2
    WHERE T1.State = T2.State
    GROUP BY T1.State;
```


Example code to test our database is available in the `uber_test_data.md` file.
