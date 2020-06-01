USE AdventureWorks2017


SELECT YEAR(soh.OrderDate) as Year,
       MONTH(soh.OrderDate) as Month,
       SUM(soh.SubTotal) as TotalSales
FROM Sales.SalesOrderHeader as soh
GROUP BY YEAR(soh.OrderDate), MONTH(soh.OrderDate)
ORDER BY [Year],[Month]