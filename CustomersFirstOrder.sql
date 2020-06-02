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
INNER JOIN (
    SELECT soh.CustomerID,MIN(soh.OrderDate) as OrderDate --без correlated subquery
    FROM Sales.SalesOrderHeader as soh                    --выведет больше результатов,
    GROUP BY soh.CustomerID) as CustmerFirstOrderDates    --т.к. у некоторых пользвователей
  ON CustmerFirstOrderDates.CustomerID = soh1.CustomerID  --есть два "первых" заказа
    AND CustmerFirstOrderDates.OrderDate = soh1.OrderDate
ORDER BY soh1.CustomerID