USE AdventureWorks2017

SELECT soh1.CustomerID              --этот ужас ли для того,
      ,soh1.SalesOrderID            --чтобы вывести СustomerId первым
      ,soh1.RevisionNumber
      ,soh1.OrderDate
      ,soh1.DueDate
      ,soh1.ShipDate
      ,soh1.Status
      ,soh1.OnlineOrderFlag
      ,soh1.SalesOrderNumber
      ,soh1.PurchaseOrderNumber
      ,soh1.AccountNumber
      ,soh1.SalesPersonID
      ,soh1.TerritoryID             
      ,soh1.BillToAddressID
      ,soh1.ShipToAddressID
      ,soh1.ShipMethodID
      ,soh1.CreditCardID
      ,soh1.CreditCardApprovalCode
      ,soh1.CurrencyRateID
      ,soh1.SubTotal
      ,soh1.TaxAmt
      ,soh1.Freight
      ,soh1.TotalDue
      ,soh1.Comment
      ,soh1.rowguid
      ,soh1.ModifiedDate
FROM Sales.SalesOrderHeader as soh1
WHERE soh1.SalesOrderID IN (           --не самый лучший approach, но рабочий
        SELECT TOP(1) soh.SalesOrderID
        FROM Sales.SalesOrderHeader as soh
        WHERE soh.CustomerID = soh1.CustomerID
        ORDER BY soh.OrderDate)
ORDER BY soh1.CustomerID
    