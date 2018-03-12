/*select count(*) from INVENTORY_FACT;
*/

/*Query 1*/
/*
SELECT CalMonth,AddrCatCode1,SUM(ExtCost) AS CostSum,SUM(Quantity) AS QuanSum
FROM Inventory_fact,date_dim,cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey AND Inventory_fact.TransTypeKey = 5 
AND date_dim.CalYear = 2011
GROUP BY CUBE(CalMonth,AddrCatCode1)
ORDER BY CalMonth,AddrCatCode1;
*/
/*Query 2*/
/*
SELECT CalQuarter,Zip,Name,SUM(ExtCost) AS CostSum,Count(*) AS INVCOUNT
FROM Inventory_fact,date_dim,cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey AND Inventory_fact.TransTypeKey = 5 
AND (date_dim.CalYear = 2011 OR date_dim.CalYear = 2012)
GROUP BY GROUPING SETS( (CalQuarter,Zip,Name) ,(CalQuarter,Zip),(CalQuarter,Name) , (Name,Zip) ,CalQuarter,Zip,Name,())
ORDER BY CalQuarter,Zip,Name;
*/
/*Query 3*/
/*
SELECT CompanyName,BPName,SUM(ExtCost) AS COSTSUM,SUM(Quantity) AS QuanSum 
FROM Inventory_fact,branch_plant_dim,company_dim
WHERE Inventory_fact.BRANCHPLANTKEY = branch_plant_dim.BRANCHPLANTKEY AND branch_plant_dim.COMPANYKEY = company_dim.COMPANYKEY AND Inventory_fact.TransTypeKey = 2
GROUP BY ROLLUP(CompanyName,BPName)
ORDER BY CompanyName,BPName;
*/
/*Query 4*/
/*
SELECT TransDescription,CompanyName,BPName,SUM(ExtCost) AS COSTSUM,Count(*) AS INVCOUNT
FROM Inventory_fact,trans_type_dim,branch_plant_dim,company_dim
WHERE Inventory_fact.BRANCHPLANTKEY = branch_plant_dim.BRANCHPLANTKEY AND branch_plant_dim.COMPANYKEY = company_dim.COMPANYKEY
AND Inventory_fact.TRANSTYPEKEY = trans_type_dim.TRANSTYPEKEY
GROUP BY GROUPING SETS ( (TransDescription,CompanyName,BPName),(TransDescription,CompanyName),TransDescription,())
ORDER BY TransDescription,CompanyName,BPName;
*/

/*Query 5*/
/*
SELECT CalYear,CalQuarter,Name,SUM(ExtCost) AS CUSTSUM,Count(*) AS INVCOUNT
FROM Inventory_fact,date_dim,cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey AND Inventory_fact.TransTypeKey = 5 
AND (date_dim.CalYear = 2011 or date_dim.CalYear = 2012)
GROUP BY Name,ROLLUP(CalYear,CalQuarter)
ORDER BY CalYear,CalQuarter,Name;

*/

/*Query 6*/
/*
SELECT CalMonth,AddrCatCode1,SUM(ExtCost) AS CostSum,SUM(Quantity) AS QuanSum
FROM Inventory_fact,date_dim,cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey AND Inventory_fact.TransTypeKey = 5 
AND date_dim.CalYear = 2011
GROUP BY CalMonth,AddrCatCode1

UNION

SELECT CalMonth,NULL,SUM(ExtCost) AS CostSum,SUM(Quantity) AS QuanSum
FROM Inventory_fact,date_dim,cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey AND Inventory_fact.TransTypeKey = 5 
AND date_dim.CalYear = 2011
GROUP BY CalMonth

UNION

SELECT NULL,AddrCatCode1,SUM(ExtCost) AS CostSum,SUM(Quantity) AS QuanSum
FROM Inventory_fact,date_dim,cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey AND Inventory_fact.TransTypeKey = 5 
AND date_dim.CalYear = 2011
GROUP BY AddrCatCode1

UNION

SELECT NULL,NULL,SUM(ExtCost) AS CostSum,SUM(Quantity) AS QuanSum
FROM Inventory_fact,date_dim,cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey AND Inventory_fact.TransTypeKey = 5 
AND date_dim.CalYear = 2011
ORDER BY 1, 2;

*/

/* Query 7*/
/*
SELECT CompanyName,BPName,SUM(ExtCost) AS COSTSUM,SUM(Quantity) AS QuanSum 
FROM Inventory_fact,branch_plant_dim,company_dim
WHERE Inventory_fact.BRANCHPLANTKEY = branch_plant_dim.BRANCHPLANTKEY AND branch_plant_dim.COMPANYKEY = company_dim.COMPANYKEY AND Inventory_fact.TransTypeKey = 2
GROUP BY CompanyName,BPName
UNION
SELECT CompanyName,NULL,SUM(ExtCost) AS COSTSUM,SUM(Quantity) AS QuanSum 
FROM Inventory_fact,branch_plant_dim,company_dim
WHERE Inventory_fact.BRANCHPLANTKEY = branch_plant_dim.BRANCHPLANTKEY AND branch_plant_dim.COMPANYKEY = company_dim.COMPANYKEY AND Inventory_fact.TransTypeKey = 2
GROUP BY CompanyName
UNION
SELECT NULL,NULL,SUM(ExtCost) AS COSTSUM,SUM(Quantity) AS QuanSum 
FROM Inventory_fact,branch_plant_dim,company_dim
WHERE Inventory_fact.BRANCHPLANTKEY = branch_plant_dim.BRANCHPLANTKEY AND branch_plant_dim.COMPANYKEY = company_dim.COMPANYKEY AND Inventory_fact.TransTypeKey = 2
ORDER BY 1,2;
*/

/*Query 8*/
/*
SELECT CalYear,CalQuarter,Name,SUM(ExtCost) AS CUSTSUM,Count(*) AS INVCOUNT
FROM Inventory_fact,date_dim,cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey AND Inventory_fact.TransTypeKey = 5 
AND (date_dim.CalYear = 2011 or date_dim.CalYear = 2012)
GROUP BY CUBE(Name,(CalYear,CalQuarter))
ORDER BY CalYear,CalQuarter,Name;

*/

/* Query 9 */
/*
SELECT CalMonth,AddrCatCode1,SUM(ExtCost) AS CostSum,SUM(Quantity) AS QuanSum, GROUPING_ID(CalMonth,AddrCatCode1) AS GROUP_NUMBER
FROM Inventory_fact,date_dim,cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey AND Inventory_fact.TransTypeKey = 5 
AND date_dim.CalYear = 2011
GROUP BY CUBE(CalMonth,AddrCatCode1)
ORDER BY CalMonth,AddrCatCode1;
*/

/* Query 10*/
/*
SELECT CalYear,CalQuarter,Name,SUM(ExtCost) AS CUSTSUM,Count(*) AS INVCOUNT
FROM Inventory_fact,date_dim,cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey AND Inventory_fact.TransTypeKey = 5 
AND (date_dim.CalYear = 2011 or date_dim.CalYear = 2012)
GROUP BY GROUPING SETS(Name,ROLLUP(CalYear,CalQuarter))
ORDER BY CalYear,CalQuarter,Name;
*/
