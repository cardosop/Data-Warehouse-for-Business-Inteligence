/* Query 1*/
/*
SELECT Name, SUM(ExtCost) AS CostSum,
  RANK() OVER (ORDER BY SUM(ExtCost) DESC) AS SumCostRank
  FROM Inventory_fact,cust_vendor_dim
  WHERE Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey AND Inventory_fact.TransTypeKey = 5
 GROUP BY Name;
 
 */
 
 /*Query 2*/
 /*
 SELECT State,Name, SUM(ExtCost) AS CostSum,
  RANK() OVER (PARTITION BY State ORDER BY SUM(ExtCost) DESC) AS SumCostRank
  FROM Inventory_fact,cust_vendor_dim
  WHERE Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey AND Inventory_fact.TransTypeKey = 5
 GROUP BY State,Name
 ORDER BY State;
 
 */
 
 /*Query 3*/
 /*
 SELECT Name, COUNT(*) AS TransCount,
  RANK() OVER (ORDER BY COUNT(*) DESC) AS RankCount,
  DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS DenseRankCount
  FROM Inventory_fact,cust_vendor_dim
  WHERE Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey AND Inventory_fact.TransTypeKey = 5
 GROUP BY Name;
 */
 
 
 /*Query 4*/
 /*
 SELECT Zip,CalYear,CalMonth, SUM(ExtCost) AS SumCost,
  SUM(SUM(ExtCost)) OVER (
    ORDER BY Zip,CalYear,CalMonth
    ROWS UNBOUNDED PRECEDING ) AS CumSumCost
 FROM Inventory_fact,cust_vendor_dim,date_dim
  WHERE Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey AND Inventory_fact.DateKey = date_dim.DateKey
  AND Inventory_fact.TransTypeKey = 5
 GROUP BY Zip,CalYear,CalMonth;
 */
 
 /*Query 5*/
 /*
  SELECT Zip,CalYear,CalMonth, SUM(ExtCost) AS SumCost,
  SUM(SUM(ExtCost)) OVER (PARTITION BY Zip,CalYear
    ORDER BY Zip,CalYear,CalMonth
    ROWS UNBOUNDED PRECEDING ) AS CumSumCost
 FROM Inventory_fact,cust_vendor_dim,date_dim
  WHERE Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey AND Inventory_fact.DateKey = date_dim.DateKey
  AND Inventory_fact.TransTypeKey = 5
 GROUP BY Zip,CalYear,CalMonth
 ORDER BY Zip,CalYear;
 */
 
 /*Query 6*/
 /*
 SELECT SecondItemId,SUM(ExtCost) AS CostSum,RATIO_TO_REPORT(SUM(ExtCost)) 
         OVER () AS SumCostRatio
 FROM Inventory_fact,Item_master_dim 
 WHERE Inventory_fact.ItemMasterKey = Item_master_dim.ItemMasterKey AND Inventory_fact.TransTypeKey = 1
 GROUP BY SecondItemId
 ORDER BY SUM(ExtCost) DESC;
 */
 
 /*Query 7*/
 /*
 SELECT CalYear,SecondItemId,SUM(ExtCost) AS CostSum,RATIO_TO_REPORT(SUM(ExtCost)) 
         OVER (PARTITION BY CalYear) AS SumCostRatio
 FROM Inventory_fact,Item_master_dim,date_dim 
 WHERE Inventory_fact.ItemMasterKey = Item_master_dim.ItemMasterKey AND Inventory_fact.DateKey = date_dim.DateKey AND Inventory_fact.TransTypeKey = 1
 GROUP BY CalYear,SecondItemId
 ORDER BY CalYear,SUM(ExtCost) DESC;
 */
 /*Query 8*/
 /*
 SELECT BPName,CompanyKey,CarryingCost,
  RANK() OVER (ORDER BY CarryingCost) As RankCarryingCost,     
  PERCENT_RANK() 
    OVER (ORDER BY CarryingCost) As PercentRankCarryingCost,
  CUME_DIST() 
    OVER (ORDER BY CarryingCost) As CumDistCarryingCost
 FROM branch_plant_dim;
 
 */
 
 /* Query 9*/
 /*
 SELECT BPName,CompanyKey,CarryingCost,CumDistCarryingCost
 FROM 
  (SELECT BPName,CompanyKey,CarryingCost,
  CUME_DIST() 
    OVER (ORDER BY CarryingCost DESC) As CumDistCarryingCost
 FROM branch_plant_dim)
 WHERE CumDistCarryingCost <= 0.15;
 
 */
 /*
  SELECT BPName,CompanyKey,CarryingCost,
 
  CUME_DIST() 
    OVER (ORDER BY CarryingCost DESC) As CumDistCarryingCost
 FROM branch_plant_dim;
 */
 
 /* Query 10 */
 
 
 
 
 