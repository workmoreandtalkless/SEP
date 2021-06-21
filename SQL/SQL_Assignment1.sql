use AdventureWorks2019
--1.	Write a query that retrieves the columns ProductID, Name, Color and ListPrice 
--from the Production.Product table, with no filter. 
select pp.ProductID,pp.Name, pp.Color,PP.ListPrice
from Production.Product pp

--2.	Write a query that retrieves the columns ProductID, Name, Color and ListPrice 
--from the Production.Product table, the rows that are 0 for the column ListPrice ? is 0 or not?
select pp.ProductID,pp.Name, pp.Color,PP.ListPrice
from Production.Product pp 
where ListPrice = 0

--3.	Write a query that retrieves the columns ProductID, Name, Color and ListPrice 
--from the Production.Product table, the rows that are rows that are NULL for the Color column.
select pp.ProductID,pp.Name, pp.Color,PP.ListPrice
from Production.Product pp 
where Color is NULL

--4.	Write a query that retrieves the columns ProductID, Name, Color and ListPrice 
--from the Production.Product table, the rows that are not NULL for the Color column.
select pp.ProductID,pp.Name, pp.Color,PP.ListPrice
from Production.Product pp 
where Color is not NULL

--5.	Write a query that retrieves the columns ProductID, Name, Color and ListPrice 
--from the Production.Product table, 
--the rows that are not NULL for the column Color, 
--and the column ListPrice has a value greater than zero.
select pp.ProductID,pp.Name, pp.Color,PP.ListPrice
from Production.Product pp 
where Color is not NULL and ListPrice>0

--6.	Generate a report that concatenates the columns Name and Color 
-- from the Production.Product table by excluding the rows that are null for color.
select pp.Name +':'+ pp.Color AS report
from Production.Product pp 
where Color is not NULL

--7.	Write a query that generates the following result set  from Production.Product:
-- Name And Color
-- --------------------------------------------------
--NAME: LL Crankarm  --  COLOR: Black
select 'NAME: '+ pp.Name + ' ' + '--' + ' ' + 'COLOR:' + pp.Color AS [Name and Color]
from Production.Product pp 
where Color is not NULL

--8.	Write a query to retrieve the to the columns ProductID and Name 
--from the Production.Product table filtered by ProductID from 400 to 500
select pp.ProductID ,pp.Name 
from Production.Product pp 
where ProductID between 400 and 500

--9.	Write a query to retrieve the to the columns  ProductID, Name and color 
--from the Production.Product table restricted to the colors black and blue
select pp.ProductID ,pp.Name ,pp.Color
from Production.Product pp 
where pp.Color in ('black','blue')

--10.	Write a query to generate a report on products that begins with the letter S. 
select pp.ProductID,pp.Name
from Production.Product pp 
where pp.Name like 'S%'

--11.	Write a query that retrieves the columns Name and ListPrice from the Production.Product table. 
--Your result set should look something like the following. Order the result set by the Name column. 

select pp.Name , pp.ListPrice
from Production.Product pp 
order by Name

--12.	Write a query that retrieves the columns Name and ListPrice 
--from the Production.Product table. Your result set should look something like the following. Order the result set by the Name column. 
--The products name should start with either 'A' or 'S'
select pp.Name,pp.ListPrice
from Production.Product pp 
where pp.Name like '[A,S]%'

select pp.Name,pp.ListPrice
from Production.Product pp 
where pp.Name like 'A%' or pp.Name like 'S%'


--13.	Write a query so you retrieve rows that have a Name that begins with the letters SPO, 
--but is then not followed by the letter K.
--After this zero or more letters can exists. Order the result set by the Name column.
select pp.Name
from Production.Product pp 
where pp.Name like 'SPO[^k]%'
order by pp.Name

--14.	Write a query that retrieves unique colors 
--from the table Production.Product. Order the results  in descending  manner
select distinct pp.Color
from Production.Product pp 
Order by pp.Color desc

--15.	Write a query that retrieves the unique combination of columns ProductSubcategoryID and Color 
--from the Production.Product table. Format and sort so the result set accordingly to the following.
--We do not want any rows that are NULL.in any of the two columns in the result.
--? how to unique the combination of columns Prod and color using Distinct?
select Distinct pp.ProductSubcategoryID, pp.Color
from Production.Product pp
where pp.ProductSubcategoryID is not NULL and
pp.Color is not NULL
order by pp.ProductSubcategoryID, pp.Color

--16.	Something is “wrong” with the WHERE clause in the following query. 
--We do not want any Red or Black products from any SubCategory 
--than those with the value of 1 in column ProductSubCategoryID, unless they cost between 1000 and 2000.
--Note:
--The LEFT() function will be covered in a forthcoming module.
/* 
SELECT ProductSubCategoryID
      , LEFT([Name],35) AS [Name]
      , Color, ListPrice 
FROM Production.Product
WHERE Color IN ('Red','Black') 
      OR ListPrice BETWEEN 1000 AND 2000 
      AND ProductSubCategoryID = 1
ORDER BY ProductID
*/
SELECT ProductSubCategoryID
      , LEFT([Name],35) AS [Name]
      , Color, ListPrice 
FROM Production.Product
WHERE 
	  (Color in ('Red','Black') and ProductSubCategoryID = 1)
      OR ListPrice BETWEEN 1000 AND 2000 
      
ORDER BY ProductID

select ProductSubcategoryID,LEFT([NAME],35) AS [NAME],color,ListPrice from Production.Product
where ListPrice between 1000 and 2000 or ( ProductSubcategoryID = 1 and Color in ('Red','Black'))
order by ProductID

--17.	Write the query in the editor and execute it. 
--Take a look at the result set and then adjust the query so it delivers the following result set.
--? 
select pp.ProductSubcategoryID,pp.Name, pp.Color,pp.ListPrice
from Production.Product pp
where Color is not NULL
Order by ProductSubcategoryID desc

