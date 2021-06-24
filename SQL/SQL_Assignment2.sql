/*
Assignment Day2 –SQL:  Comprehensive practice
Answer following questions
1.	What is a result set?
	A result set is a set of records, including not only the data itself, 
	but also metadata like column names, types and sizes.

2.	What is the difference between Union and Union All?
	(1)	Union will automatically clean up duplications, 
		while Union All will not.
	(2)	Union will sort the result by the order of first column by default, 
		while Union All will remain the original sequence by default. 


3.	What are the other Set Operators SQL Server has?
	(1)	INTERSECT 
	(2)	EXCEPT
	(3)	MINUS
	Set Operators in SQL Server (UNION, UNION ALL, INTERSECT, EXCEPT) SET operators 
	are mainly used to combine the same type of data from two or more tables

4.	What is the difference between Union and Join?
	Union is used to combine multiple queries into a single query
	with all the records of queries and the same column forms. (Vertically)
	Join is used to combine data from multiple queries with the column names of all queries.
	The number of rows depends on the kinds of joins and the queries. (Horizontally)

5.	What is the difference between INNER JOIN and FULL JOIN?
	INNER JOIN will return the rows that has matched elements in both left and right query.
	FULL JOIN will return all the rows of both queries, even if there is no match.

6.	What is difference between left join and outer join
	Left join is a kind of outer join. Left outer join will return all rows from left query, 
	even if there are unmatched data. 
	There are another two kinds of outer joins, which are right join and full join.  

7.	What is cross join?
	Cross join returns the product of query multiplication, which represents all the combination of queries elements.

8.	What is the difference between WHERE clause and HAVING clause?
	WHERE could only work on columns that already exist in original queries, 
	after FROM and before key words like “GROUP BY”. 
	Having could be used on columns that don’t exist in original queries, 
	but created during the former processes. 
	Having shall be written after GROUP BY (all in specific sequence).


9.	Can there be multiple group by columns?
	Yes, there could be. If there are multiple columns following GROUP BY, 
	SQL will put the rows with the same values in all those columns in the same group.

10. Self join:
	Self Join: Self Join is used to join a table to itself after temporally renaming. 
	There’s not key word like “SELF JOIN”, 
	self join is achieved by key word like “WHERE”.
*/
/*
Write queries for following scenarios
1.	How many products can you find in the Production.Product table?
*/
	select count(pp.ProductID) as "count"
	from Production.Product pp
/*
2.	Write a query that retrieves the number of products in the Production.
	Product table that are included in a subcategory. 
	The rows that have NULL in column ProductSubcategoryID are considered to not be a part of any subcategory.
*/
	SELECT COUNT(ProductID) AS "Number of Products in A Category" 
	FROM Production.Product AS P
	WHERE P.ProductSubcategoryID IS NOT NULL;

/*
3.	How many Products reside in each SubCategory?
	Write a query to display the results with the following titles.
	ProductSubcategoryID CountedProducts
	-------------------- ---------------
*/
	select pp.ProductSubcategoryID,count(pp.ProductID) as "CountedProducts"
	from Production.Product pp
	WHERE pp.ProductSubcategoryID IS NOT NULL
	group by pp.ProductSubcategoryID

	SELECT ProductSubcategoryID, COUNT(ProductID) AS " CountedProducts" 
	FROM Production.Product AS P
	WHERE P.ProductSubcategoryID IS NOT NULL
	GROUP BY ProductSubcategoryID;
/*
4.	How many products that do not have a product subcategory. 
*/
	select count(pp.ProductID) as "count"
	from Production.Product pp
	where pp.ProductSubcategoryID is null

	SELECT COUNT(ProductID) AS "Number of Products Not in A Category" 
	FROM Production.Product AS P
	WHERE P.ProductSubcategoryID IS NULL;
/*
5.	Write a query to list the summary of products quantity in the Production.ProductInventory table.
*/
	select Sum(pp.Quantity)
	from Production.ProductInventory pp

	SELECT SUM(Quantity) AS 'Summary of Products' 
	FROM Production.ProductInventory
	GROUP BY ProductID;
/*
6.	 Write a query to list the summary of products in the Production.
	 ProductInventory table and LocationID set to 40 
	 and limit the result to include just summarized quantities less than 100.
			ProductID			TheSum
			-----------        ----------
			???? how to say the summarized quatities less than 100
			we using keyword having to finish the query
*/
	select ppi.ProductID, sum(ppi.Quantity) as "TheSum"
	from Production.ProductInventory ppi
	where ppi.LocationID = 40 
	group by ppi.ProductID
	having  sum(ppi.Quantity)<100

	SELECT ProductID, SUM(Quantity) AS TheSum
	FROM Production.ProductInventory
	WHERE LocationID =40
	GROUP BY ProductID
	HAVING SUM(Quantity) < 100;

/*
7.	Write a query to list the summary of products with the shelf information in the Production.
	ProductInventory table and LocationID set to 40 
	and limit the result to include just summarized quantities less than 100
	Shelf      ProductID    TheSum
	---------- -----------        -----------
*/
	select Shelf,ppi.ProductID, sum(ppi.Quantity) as "TheSum"
	from Production.ProductInventory ppi
	where ppi.LocationID = 40
	group by Shelf,ppi.ProductID
	having sum(Quantity) < 100

	SELECT Shelf, ProductID, SUM(Quantity) AS TheSum
	FROM Production.ProductInventory
	WHERE LocationID =40
	GROUP BY ProductID, Shelf
	HAVING SUM(Quantity) < 100;
/*
8.	Write the query to list the average quantity for products 
	where column LocationID has the value of 10 
	from the table Production.ProductInventory table.
*/
	select ppi.ProductID, avg(ppi.Quantity) as "TheSum"
	from Production.ProductInventory ppi
	where ppi.LocationID = 10
	group by ppi.ProductID

	SELECT ProductID, AVG(Quantity) AS TheAvg
	FROM Production.ProductInventory
	WHERE LocationID = 10
	GROUP BY ProductID;
/*
9.	Write query to see the average quantity of products by shelf  
	from the table Production.ProductInventory
	ProductID   Shelf      TheAvg
	----------- ---------- -----------
*/
	select ppi.ProductID,Shelf, avg(ppi.Quantity) as "TheSum"
	from Production.ProductInventory ppi
	group by ppi.ProductID,Shelf

	SELECT ProductID, Shelf, AVG(Quantity) AS TheAvg
	FROM Production.ProductInventory
	GROUP BY ProductID,Shelf;
/*
10.	Write query  to see the average quantity  of  products by shelf excluding rows 
	that has the value of N/A in the column Shelf from the table Production.ProductInventory
	ProductID   Shelf      TheAvg
	----------- ---------- -----------
*/
	select ppi.ProductID,Shelf, avg(ppi.Quantity) as "TheSum"
	from Production.ProductInventory ppi
	where not(Shelf = 'N/A')
	group by ppi.ProductID,Shelf

	SELECT ProductID, Shelf, AVG(Quantity) AS TheAvg
	FROM Production.ProductInventory
	WHERE Shelf <> 'N/A'
	GROUP BY ProductID, Shelf;
/*
11.	List the members (rows) and average list price in the Production.Product table. 
	This should be grouped independently over the Color and the Class column. 
	Exclude the rows where Color or Class are null.
	Color           	Class 	TheCount   	 AvgPrice
	--------------	- ----- 	----------- 	---------------------

	what's the different between count(*) with count(ProductID)?
*/
	select Color, Class, count(ProductID) as "TheCount", AVG(ListPrice) as "AvgPrice"
	from Production.Product
	where Color is not null and Class is not null
	group by Color,Class

	SELECT Color, Class, Count(*) AS TheCount, AVG(ListPrice) AS AvgPrice
	FROM Production.Product
	WHERE Color IS NOT NULL AND Class IS NOT NULL
	GROUP BY Color, Class;
	
/*
Joins:
12.	  Write a query that lists the country and province names from person. CountryRegion and person. 
		StateProvince tables. Join them and produce a result set similar to the following. 

	Country                        Province
	---------                          ----------------------
*/
	select cr.Name as "Country", ps.Name as "Province"
	from Person.CountryRegion cr
	join Person.StateProvince ps
	on cr.CountryRegionCode = ps.CountryRegionCode


	--(1)	
	SELECT c.Name AS Country, s.Name AS Province 
	FROM Person.CountryRegion c 
	FULL JOIN
	Person.StateProvince s
	ON c.CountryRegionCode = s.CountryRegionCode;
	--(2)	
	SELECT c.Name AS Country, s.Name AS Province 
	FROM Person.CountryRegion c 
	RIGHT JOIN
	Person.StateProvince s
	ON c.CountryRegionCode = s.CountryRegionCode;
/*
13.	Write a query that lists the country and province names from person. CountryRegion 
	and person. StateProvince tables and list the countries filter them by Germany and Canada. 
	Join them and produce a result set similar to the following.

Country                        Province
---------                          ----------------------
        
*/
		select cr.Name as "Country", ps.Name as "Province"
		from Person.CountryRegion cr
		join Person.StateProvince ps
		on cr.CountryRegionCode = ps.CountryRegionCode
		where cr.Name in ('Germany','Canada')


		--(1)	
	SELECT c.Name AS Country, s.Name AS Province 
	FROM Person.CountryRegion c 
	FULL JOIN
	Person.StateProvince s
	ON c.CountryRegionCode = s.CountryRegionCode
	WHERE c.Name NOT IN ('Germany', 'Canada');	
		--(2)	
	SELECT c.Name AS Country, s.Name AS Province 
	FROM Person.CountryRegion c 
	JOIN
	Person.StateProvince s
	ON c.CountryRegionCode = s.CountryRegionCode
	WHERE c.Name NOT IN ('Germany', 'Canada');	

/*
	Using Northwnd Database: (Use aliases for all the Joins)
14.	List all Products that has been sold at least once in last 25 years.
*/
	select distinct p.ProductName
	from Products p
	full join [Order Details] od 
	on od.ProductID = p.ProductID
	full join  Orders o
	on o.OrderID = od.OrderID
	where YEAR(GetDate()) - YEAR(o.OrderDate) < 25

	SELECT DISTINCT p.*
	FROM Orders o
	FULL JOIN
	[Order Details] od
	ON o.OrderID =  od.OrderID
	LEFT JOIN 
	Products p
	ON od.ProductID = p.ProductID
	WHERE DATEDIFF(year, o.OrderDate, GETDATE())< 25;

/*
15.	List top 5 locations (Zip Code) where the products sold most.
*/
	select top 5 o.ShipPostalCode as "Location", sum(od.Quantity) as "Count" 
	from Orders o
	join [Order Details] od
	on o.OrderID = od.OrderID
	where o.ShipPostalCode is not null
	group by o.ShipPostalCode
	order by Count desc;

	SELECT TOP 5 o.ShipPostalCode, SUM(od.Quantity) as qty FROM 
	Orders o
	FULL JOIN
	[Order Details] od
	ON o.OrderID =  od.OrderID
	WHERE o.ShipPostalCode IS NOT NULL
	GROUP BY ShipPostalCode
	ORDER BY qty DESC;

/*
16.	List top 5 locations (Zip Code) where the products sold most in last 20 years. last 20 years is <21
	???? 
*/	
	select top 5 o.ShipPostalCode as "Location", sum(od.Quantity) as "Count" 
	from Orders o
	join [Order Details] od
	on o.OrderID = od.OrderID
	where YEAR(GetDate()) - YEAR(o.OrderDate) < 21 and o.ShipPostalCode is not null
	group by o.ShipPostalCode
	order by Count desc;

	SELECT TOP 5 o.ShipPostalCode, SUM(od.Quantity) as qty FROM 
	Orders o
	FULL JOIN
	[Order Details] od
	ON o.OrderID =  od.OrderID
	WHERE o.ShipPostalCode IS NOT NULL 
		AND DATEDIFF(year, o.OrderDate, GETDATE())< 21
	GROUP BY ShipPostalCode
	ORDER BY qty DESC;
	
/*
17.	 List all city names and number of customers in that city.     
*/
	select o.ShipCity,COUNT(o.CustomerID) as "Count"
	from Orders o
	group by o.ShipCity

	select count(customerID),City
	from customers
	group by City
/*
18.	List city names which have more than 10 customers, and number of customers in that city 
*/
		select o.ShipCity,COUNT(o.CustomerID) as "Count"
		from Orders o
		group by o.ShipCity
		having COUNT(o.CustomerID)>10

		select count(customerID),City
		from customers
		group by City
		having  count(customerID)>10
/*
19.	List the names of customers who placed orders after 1/1/98 with order date.
*/
	select distinct c.CompanyName, o.OrderDate
	from Orders o
	inner join Customers c
	on o.CustomerID = c.CustomerID
	where o.OrderDate > '1/1/98'

	select distinct c.CustomerID, c.CompanyName,c.ContactName, o.OrderDate
	from Orders o
	inner join Customers c
	on o.CustomerID = c.CustomerID
	where o.OrderDate > '1/1/98'

	select distinct c.CustomerID, c.CompanyName,c.ContactName
	from Orders o
	inner join Customers c
	on o.CustomerID = c.CustomerID
	where o.OrderDate > '1/1/98'

	SELECT DISTINCT c.CustomerID, c.CompanyName, c.ContactName FROM 
	Orders o
	INNER JOIN 
	Customers c
	ON o.CustomerID = c.CustomerID
	WHERE OrderDate > '1998-1-1';
/*
20.	List the names of all customers with most recent order dates 
	??? top 1 is the firt 1 result, may be not what you want
*/
		select c.CustomerID, c.CompanyName,c.contactName
		from Orders o
		left join Customers c
		on c.CustomerID = o.CustomerID
		where o.OrderDate in (
			select top 1 o.OrderDate 
			from Orders o
			where o.OrderDate is not null
			order by o.OrderDate desc
		)


		SELECT c.CustomerID, c.CompanyName, c.ContactName FROM
		Orders o
		INNER JOIN
		Customers c
		ON o.CustomerID = c.CustomerID
		WHERE o.OrderDate IN 
		(SELECT TOP 1 OrderDate FROM Orders
		WHERE OrderDate IS NOT NULL
		GROUP BY OrderDate
		ORDER BY OrderDate DESC);
/*
21.	Display the names of all customers along with the count of products they bought 
*/
	select c.CustomerID,c.CompanyName,c.ContactName,sum(od.Quantity) as "QTY"
	from Customers c
	left join Orders o
	on c.CustomerID = o.CustomerID
	left join [Order Details] od
	on od.OrderID = o.OrderID
	group by c.CustomerID,c.CompanyName,c.ContactName
	order by QTY

	SELECT c.CustomerID, c.CompanyName, c.ContactName, 
	SUM(od.Quantity) AS QTY FROM 
	Customers c 
	LEFT JOIN 
	Orders o 
	ON c.CustomerID = o.CustomerID
	LEFT JOIN 
	[Order Details] od
	ON o.OrderID = od.OrderID
	GROUP BY c.CustomerID, c.CompanyName, c.ContactName
	ORDER BY QTY;
/*
22.	Display the customer ids who bought more than 100 Products with count of products.
*/
	select c.CustomerID, sum(od.Quantity) as QTY
	from Customers c
	join Orders o
	on o.CustomerID = c.CustomerID
	join [Order Details] od
	on od.OrderID = o.OrderID
	group by c.CustomerID
	having sum(od.Quantity)>100
	order by QTY

	SELECT c.CustomerID,
	SUM(od.Quantity) AS QTY FROM 
	Customers c 
	LEFT JOIN 
	Orders o 
	ON c.CustomerID = o.CustomerID
	LEFT JOIN 
	[Order Details] od
	ON o.OrderID = od.OrderID
	GROUP BY c.CustomerID
	HAVING SUM(od.Quantity) > 100
	ORDER BY QTY;

/*
23.	List all of the possible ways that suppliers can ship their products. 
	Display the results as below
	????
	Supplier Company Name   	Shipping Company Name
	---------------------------------            ----------------------------------
*/
	select distinct o.CustomerID , o.ShipName
	from Orders o
	join Orders os
	on o.CustomerID = os.CustomerID
	order by o.CustomerID

	SELECT DISTINCT sup.CompanyName, ship.CompanyName FROM 
	Orders o
	LEFT JOIN
	[Order Details] od
	ON o.OrderID = od.OrderID
	INNER JOIN 
	Products p
	ON od.ProductID = p.ProductID
	RIGHT JOIN
	Suppliers sup
	ON p.SupplierID = sup.SupplierID
	INNER JOIN
	Shippers ship
	ON o.ShipVia = ship.ShipperID;
/*
24.	Display the products order each day. Show Order date and Product Name.
	how to list each day ???
	
*/
	select o.OrderDate, p.ProductName
	from Orders o
	join [Order Details] od
	on o.OrderID = od.OrderID
	join Products p
	on p.ProductID = od.ProductID
	
	

	SELECT o.OrderDate, p.ProductName FROM 
	Orders o
	LEFT JOIN
	[Order Details] od
	ON o.OrderID = od.OrderID
	INNER JOIN
	Products p
	ON od.ProductID = p.ProductID
	GROUP BY o.OrderDate, p.ProductName
	ORDER BY o.OrderDate;
/*
25.	Displays pairs of employees who have the same job title.
	????
*/
	select e1.title, e1.LastName + ' ' + e1.FirstName as "name 1", e2.LastName + ' ' + e2.FirstName as "name 2"
	from Employees e1
	join Employees e2
	on e1.Title = e2.Title
	

	select e1.title, e1.LastName + ' ' + e1.FirstName as "name 1", e2.LastName + ' ' + e2.FirstName as "name 2"
	from Employees e1
	join Employees e2
	on e1.Title = e2.Title
	WHERE e1.FirstName <> e2.FirstName and e1.LastName <>        e2.LastName
	ORDER BY Title;

	--(1)	
	SELECT Title, LastName + ' ' + FirstName AS Name 
	FROM Employees
	ORDER BY Title;

	--(2)
	SELECT e1.Title, e1.LastName + ' ' + e1.FirstName AS Name1, e2.LastName + ' ' + e2.FirstName AS Name2 
	FROM Employees e1
	JOIN 
	Employees e2
	ON e1.Title = e2.Title 
	WHERE e1.FirstName <> e2.FirstName OR e1.LastName <>        e2.LastName
	ORDER BY Title;

/*
26.	Display all the Managers who have more than 2 employees reporting to them.
	focus on this question???
*/
	select e.ReportsTo,e.ReportsTo as "Subordinate" 
	from Employees e

	SELECT * FROM Employees AS T1
	join
	(select e.ReportsTo, COUNT(e.ReportsTo) as "Subordinate" 
	from Employees e
	where e.ReportsTo is not null
	group by e.ReportsTo
	having COUNT(e.ReportsTo) > 2) T2
	on T2.ReportsTo = T1.EmployeeID

	SELECT * FROM (SELECT * FROM Employees) AS T1
	INNER JOIN
	(SELECT ReportsTo, COUNT(ReportsTo) AS Subordinate  FROM Employees
	WHERE ReportsTo IS NOT NULL
	GROUP BY ReportsTo
	HAVING COUNT(ReportsTo) > 2) T2
	ON T2.ReportsTo= T1.EmployeeID;
	--Question: How to keep most columns but drop only a few of them?

/*
27.	Display the customers and suppliers by city. The results should have the following columns
	City 
	Name 
	Contact Name,
	Type (Customer or Supplier)
	???? how to connect the two table?
	???? Customer as Type???
*/
	Select s.City , s.ContactName,
	from Suppliers s

	SELECT c.City, c.CompanyName, c.ContactName, 'Customer' as Type
	FROM Customers c
	UNION
	SELECT s.City, s.CompanyName, s.ContactName, 'Supplier' as Type
	FROM Suppliers s;

/*
28. Have two tables T1 and T2
	F1.T1	F2.T2
	 1		  2
	 2		  3
	 3		  4
			   

	F1.T1	F2.T2
	 1		  
	 2		  2
	 3		  3
			  4  

				
*/
	create table 
	
/*
Please write a query to inner join these two tables and write down the result of this query.
 29. Based on above two table, 
	 Please write a query to left outer join these two tables and write down the result of this query.

GOOD  LUCK.
*/
	28. 
SELECT * FROM F1 INNER JOIN F2;
ON F1.T1 = F2.T2
----------
2		2
3		3

29.
SELECT * FROM F1 LEFT JOIN F2;
ON F1.T1 = F2.T2
1		NULL

2		2
3		3

30. 
SELECT * FROM F1 FULL JOIN F2;
ON F1.T1 = F2.T2
1		NULL
2		2
3		3
4 		NULL


