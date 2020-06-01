use AdventureWorks2017


SELECT a.City, Count(City) as [Priority] 
FROM Sales.Customer as c
JOIN Person.BusinessEntityAddress as bea
  ON c.PersonID = bea.BusinessEntityID
JOIN Person.Address as a
  ON a.AddressID = bea.AddressID
WHERE a.City NOT IN (
  SELECT DISTINCT a.City 
  FROM HumanResources.Employee AS e 
  JOIN Person.BusinessEntityAddress as bea 
    ON e.BusinessEntityID = bea.BusinessEntityID
  JOIN Person.Address as a
    ON a.AddressID = bea.AddressID
  GROUP BY a.City
)
GROUP BY a.City
ORDER BY [Priority] DESC