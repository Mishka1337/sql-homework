USE AdventureWorks2017

SELECT per.FirstName + ' ' + per.LastName as Name,
       prod.Name as ProductName,
       COUNT(prod.ProductID) as Quantity
FROM Person.Person as per
JOIN Sales.Customer as cust
  ON cust.PersonID = per.BusinessEntityID
JOIN Sales.SalesOrderHeader as soh
  ON cust.CustomerID = soh.CustomerID
JOIN Sales.SalesOrderDetail as sod
  ON soh.SalesOrderID = sod.SalesOrderID
JOIN Production.Product as prod
  ON sod.ProductID = prod.ProductID
GROUP BY per.BusinessEntityID, per.FirstName, per.LastName, prod.ProductID, prod.Name
ORDER BY Name, Quantity DESC

