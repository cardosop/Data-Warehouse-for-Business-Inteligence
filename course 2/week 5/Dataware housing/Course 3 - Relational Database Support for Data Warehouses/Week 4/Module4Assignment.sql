/*Query 1*/
/*
CREATE MATERIALIZED VIEW SalesByVendorDateKeyMV2011
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
ENABLE QUERY REWRITE AS
SELECT Inventory_fact.CustVendorKey,date_dim.DateKey, SUM(ExtCost) AS TotalCost, 
       SUM(Quantity) AS TotalQty , Count(*) AS TotalCount
 FROM Inventory_fact,date_dim
 WHERE Inventory_fact.DateKey = date_dim.DateKey
   AND Inventory_fact.TransTypeKey = 5
   AND date_dim.CalYear = 2011
 GROUP BY Inventory_fact.CustVendorKey,date_dim.DateKey;
 
 */
 
 /* Query 2*/
 /*
 CREATE MATERIALIZED VIEW SalesByVendorDateKeyMV2012
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
ENABLE QUERY REWRITE AS
SELECT Inventory_fact.CustVendorKey,date_dim.DateKey, SUM(ExtCost) AS TotalCost, 
       SUM(Quantity) AS TotalQty , Count(*) AS TotalCount
 FROM Inventory_fact,date_dim
 WHERE Inventory_fact.DateKey = date_dim.DateKey
   AND Inventory_fact.TransTypeKey = 5
   AND date_dim.CalYear = 2012
 GROUP BY Inventory_fact.CustVendorKey,date_dim.DateKey;
 
 */
 
 /* Query 3*/
 /*
 SELECT date_dim.CalMonth,cust_vendor_dim.AddrCatCode1,SUM(MV1.TotalCost),SUM(MV1.TotalQty)
 FROM SALESBYVENDORDATEKEYMV2011 MV1,cust_vendor_dim,date_dim
 WHERE MV1.CustVendorKey = cust_vendor_dim.CustVendorKey AND MV1.DateKey = date_dim.DateKey
 GROUP BY CUBE(date_dim.CalMonth,cust_vendor_dim.AddrCatCode1)
 ORDER BY date_dim.CalMonth,cust_vendor_dim.AddrCatCode1;
 */
 /*
 SELECT CalMonth,AddrCatCode1,SUM(ExtCost) AS CostSum,SUM(Quantity) AS QuanSum
FROM Inventory_fact,date_dim,cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey AND Inventory_fact.TransTypeKey = 5 
AND date_dim.CalYear = 2011
GROUP BY CUBE(CalMonth,AddrCatCode1)
ORDER BY CalMonth,AddrCatCode1;
 */
 
 
 /* Query 4*/
 /*
SELECT  CalQuarter,Zip,Name,SUM(TotalCost) AS NetSum,SUM(TotalCount) AS NetCount
 FROM
 (
SELECT CalQuarter,Zip,Name,MV1.TotalCost AS TotalCost,MV1.TotalCount AS TotalCount
FROM SALESBYVENDORDATEKEYMV2011 MV1,date_dim,cust_vendor_dim
WHERE MV1.CustVendorKey = cust_vendor_dim.CustVendorKey AND MV1.DateKey = date_dim.DateKey

UNION

SELECT CalQuarter,Zip,Name,MV2.TotalCost AS TotalCost,MV2.TotalCount AS TotalCount
FROM SALESBYVENDORDATEKEYMV2012 MV2,date_dim,cust_vendor_dim
WHERE MV2.CustVendorKey = cust_vendor_dim.CustVendorKey AND MV2.DateKey = date_dim.DateKey 
)
GROUP BY CUBE(CalQuarter,Zip,Name)
ORDER BY CalQuarter,Zip,Name;
 */
 