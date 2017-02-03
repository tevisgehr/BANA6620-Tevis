##### AdventureWorks Solution

1.
```sql
SELECT SalesOrderID, OrderDate, ShipDate, DATEDIFF(day,OrderDate,DueDate) OrderToShip
FROM Sales.SalesOrderHeader;
```

2.
```sql
SELECT CAST(OrderDate AS DATE) Order, CAST(ShipDate AS DATE) Ship
FROM Sales.SalesOrderHeader;
```

3.
```sql
SELECT SalesOrderID, OrderDate, DATEADD(MONTH, 6, OrderDate) SixMonthAfterOrder
FROM Sales.SalesOrderHeader;
```

4.
```sql
SELECT SalesOrderID, OrderDate, DATEPART(YEAR, OrderDate) Year, DATEPART(MONTH, OrderDate) Month
FROM Sales.SalesOrderHeader;
```

5.
```sql
SELECT SalesOrderID, OrderDate, DATEPART(YEAR, OrderDate) Year, DATENAME(MONTH, OrderDate) Month
FROM Sales.SalesOrderHeader;
```

6.
```sql
SELECT *, CASE
            WHEN StandardCost < 50 THEN 1
            WHEN StandardCost < 150 AND StandardCost >= 50 THEN 2
            WHEN StandardCost < 250 AND StandardCost >= 150 THEN 3            
            WHEN StandardCost < 350 AND StandardCost >= 250 THEN 4
            ELSE 5
            END AS StandardCostCategory
FROM Production.Product;
```

7.
```sql
SELECT *, CASE
            WHEN StandardCost < 50 THEN 1
            WHEN StandardCost < 150 AND StandardCost >= 50 THEN 2
            WHEN StandardCost < 250 AND StandardCost >= 150 THEN 3            
            WHEN StandardCost < 350 AND StandardCost >= 250 THEN 4
            ELSE 5
            END AS StandardCostCategory,
        ListPrice - StandardCost AS MarkUp, CASE
                    WHEN ListPrice = StandardCost THEN 0
                    ELSE (ListPrice - StandardCost)/StandardCost
                    END AS MarkUpPerc
FROM Production.Product;
```

8.
```sql
SELECT *, CASE
            WHEN StandardCost < 50 THEN 1
            WHEN StandardCost < 150 AND StandardCost >= 50 THEN 2
            WHEN StandardCost < 250 AND StandardCost >= 150 THEN 3            
            WHEN StandardCost < 350 AND StandardCost >= 250 THEN 4
            ELSE 5
            END AS StandardCostCategory,
        ListPrice - StandardCost AS MarkUp, CASE
                    WHEN ListPrice = StandardCost THEN 0
                    ELSE (ListPrice - StandardCost)/StandardCost
                    END AS MarkUpPerc,
       CASE
         WHEN ListPrice = StandardCost THEN 0
         WHEN (ListPrice - StandardCost)/StandardCost < .50 THEN 1
         WHEN (ListPrice - StandardCost)/StandardCost < .75 AND (ListPrice - StandardCost)/StandardCost >= .50 THEN 2
         WHEN (ListPrice - StandardCost)/StandardCost < 1.00 AND (ListPrice - StandardCost)/StandardCost >= .75 THEN 3            
         WHEN (ListPrice - StandardCost)/StandardCost < 1.50 AND (ListPrice - StandardCost)/StandardCost >= 1.00 THEN 4
         ELSE 5
         END AS MarkupPercCategory
FROM Production.Product;
```

9.
```sql
SELECT MarkupPercCategory, COUNT(*) AS Num
FROM (SELECT *, CASE
         WHEN MarkUpPerc = 0 THEN 0
         WHEN MarkUpPerc < .50 THEN 1
         WHEN MarkUpPerc < .75 AND MarkUpPerc >= .50 THEN 2
         WHEN MarkUpPerc < 1.00 AND MarkUpPerc >= .75 THEN 3            
         WHEN MarkUpPerc < 1.50 AND MarkUpPerc >= 1.00 THEN 4
         ELSE 5
         END AS MarkupPercCategory
      FROM (SELECT *, CASE
                      WHEN StandardCost < 50 THEN 1
                      WHEN StandardCost < 150 AND StandardCost >= 50 THEN 2
                      WHEN StandardCost < 250 AND StandardCost >= 150 THEN 3            
                      WHEN StandardCost < 350 AND StandardCost >= 250 THEN 4
                      ELSE 5 END AS StandardCostCategory,
            ListPrice - StandardCost AS MarkUp, CASE
                                                  WHEN ListPrice = StandardCost THEN 0
                                                  ELSE (ListPrice - StandardCost)/StandardCost END AS MarkUpPerc
            FROM Production.Product) AS table1) table2
GROUP BY MarkupPercCategory;


SELECT StandardCostCategory, COUNT(*) AS Num
FROM (SELECT *, CASE
         WHEN MarkUpPerc = 0 THEN 0
         WHEN MarkUpPerc < .50 THEN 1
         WHEN MarkUpPerc < .75 AND MarkUpPerc >= .50 THEN 2
         WHEN MarkUpPerc < 1.00 AND MarkUpPerc >= .75 THEN 3            
         WHEN MarkUpPerc < 1.50 AND MarkUpPerc >= 1.00 THEN 4
         ELSE 5
         END AS MarkupPercCategory
      FROM (SELECT *, CASE
                      WHEN StandardCost < 50 THEN 1
                      WHEN StandardCost < 150 AND StandardCost >= 50 THEN 2
                      WHEN StandardCost < 250 AND StandardCost >= 150 THEN 3            
                      WHEN StandardCost < 350 AND StandardCost >= 250 THEN 4
                      ELSE 5 END AS StandardCostCategory,
            ListPrice - StandardCost AS MarkUp, CASE
                                                  WHEN ListPrice = StandardCost THEN 0
                                                  ELSE (ListPrice - StandardCost)/StandardCost END AS MarkUpPerc
            FROM Production.Product) AS table1) table2
GROUP BY StandardCostCategory;

SELECT MarkupPercCategory, StandardCostCategory, COUNT(*) AS Num
FROM (SELECT *, CASE
         WHEN MarkUpPerc = 0 THEN 0
         WHEN MarkUpPerc < .50 THEN 1
         WHEN MarkUpPerc < .75 AND MarkUpPerc >= .50 THEN 2
         WHEN MarkUpPerc < 1.00 AND MarkUpPerc >= .75 THEN 3            
         WHEN MarkUpPerc < 1.50 AND MarkUpPerc >= 1.00 THEN 4
         ELSE 5
         END AS MarkupPercCategory
      FROM (SELECT *, CASE
                      WHEN StandardCost < 50 THEN 1
                      WHEN StandardCost < 150 AND StandardCost >= 50 THEN 2
                      WHEN StandardCost < 250 AND StandardCost >= 150 THEN 3            
                      WHEN StandardCost < 350 AND StandardCost >= 250 THEN 4
                      ELSE 5 END AS StandardCostCategory,
            ListPrice - StandardCost AS MarkUp, CASE
                                                  WHEN ListPrice = StandardCost THEN 0
                                                  ELSE (ListPrice - StandardCost)/StandardCost END AS MarkUpPerc
            FROM Production.Product) AS table1) table2
GROUP BY MarkupPercCategory, StandardCostCategory;
```

10.
```sql
SELECT P.ProductID, P.NetGain * WO.Tot_Qty AS NetProfit
FROM (SELECT ProductID, ListPrice - StandardCost AS NetGain
      FROM Production.Product) AS P
JOIN (SELECT ProductID, SUM(OrderQty) Tot_Qty
      FROM Production.WorkOrder
      GROUP BY ProductID) AS WO
ON P.ProductID = WO.ProductID
ORDER BY NetProfit DESC;
```

11.
```sql
SELECT TOP (1) P.StandardCostCategory, SUM(WO.Tot_Qty) Cat_Tot_Orders
FROM (SELECT *, CASE
            WHEN StandardCost < 50 THEN 1
            WHEN StandardCost < 150 AND StandardCost >= 50 THEN 2
            WHEN StandardCost < 250 AND StandardCost >= 150 THEN 3            
            WHEN StandardCost < 350 AND StandardCost >= 250 THEN 4
            ELSE 5
            END AS StandardCostCategory
      FROM Production.Product) P
JOIN (SELECT ProductID, SUM(OrderQty) Tot_Qty
      FROM Production.WorkOrder
      GROUP BY ProductID) WO
ON P.ProductID = WO.ProductID
GROUP BY P.StandardCostCategory
ORDER BY Cat_Tot_Orders DESC;
```

12.
```sql
SELECT TOP (1) P.MarkupPercCategory, SUM(WO.Tot_Qty) Cat_Tot_Orders
FROM (SELECT *, CASE
         WHEN MarkUpPerc = 0 THEN 0
         WHEN MarkUpPerc < .50 THEN 1
         WHEN MarkUpPerc < .75 AND MarkUpPerc >= .50 THEN 2
         WHEN MarkUpPerc < 1.00 AND MarkUpPerc >= .75 THEN 3            
         WHEN MarkUpPerc < 1.50 AND MarkUpPerc >= 1.00 THEN 4
         ELSE 5
         END AS MarkupPercCategory
      FROM (SELECT *, CASE
                      WHEN StandardCost < 50 THEN 1
                      WHEN StandardCost < 150 AND StandardCost >= 50 THEN 2
                      WHEN StandardCost < 250 AND StandardCost >= 150 THEN 3            
                      WHEN StandardCost < 350 AND StandardCost >= 250 THEN 4
                      ELSE 5 END AS StandardCostCategory,
            ListPrice - StandardCost AS MarkUp, CASE
                                                  WHEN ListPrice = StandardCost THEN 0
                                                  ELSE (ListPrice - StandardCost)/StandardCost END AS MarkUpPerc
            FROM Production.Product) AS table1) AS P
JOIN (SELECT ProductID, SUM(OrderQty) Tot_Qty
      FROM Production.WorkOrder
      GROUP BY ProductID) AS WO
ON P.ProductID = WO.ProductID
GROUP BY P.MarkupPercCategory
ORDER BY Cat_Tot_Orders DESC;
```
