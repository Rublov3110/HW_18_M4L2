USE [AdventureWorks2019]

SELECT ProductID AS Product, COUNT(*) AS [Count] 
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

GO

SELECT TerritoryID, SUM(CommissionPct) as 'CommissionPctSum'
FROM Sales.SalesPerson
GROUP BY TerritoryID
HAVING SUM(CommissionPct) > 0

GO

SELECT *
FROM HumanResources.Employee e
         FULL JOIN Purchasing.PurchaseOrderHeader poh
                   ON poh.EmployeeID = e.BusinessEntityID

GO

SELECT *
FROM HumanResources.Employee e
         Left JOIN Purchasing.PurchaseOrderHeader poh
                   ON poh.EmployeeID = e.BusinessEntityID

GO

SELECT *
FROM HumanResources.Employee e
         Inner JOIN Purchasing.PurchaseOrderHeader poh
                   ON poh.EmployeeID = e.BusinessEntityID

GO

SELECT NationalIDNumber, LoginID, JobTitle
FROM HumanResources.Employee
WHERE LoginID LIKE '%0'

GO

SELECT * 
FROM Sales.CreditCard 
WHERE ExpMonth IN (1, 5, 11);

GO

SELECT BusinessEntityID, FirstName, LastName, MiddleName, ModifiedDate 
FROM Person.Person
ORDER BY FirstName, LastName DESC;

GO

SELECT SalesOrderID, OrderQty 
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (43666, 43660, 43664);

GO


UPDATE Sales.CreditCard
SET CardNumber = '0000000' 
WHERE CardType = 'Vista'

GO

DELETE Sales.CreditCard 
WHERE CardType = 'Vista'

GO

SELECT * FROM Person.PersonPhone;
SELECT * FROM Production.Product;

DECLARE @TestVariableForTr AS INT
SET @TestVariableForTr = 5
PRINT 'TestVariableForTr:'
PRINT @TestVariableForTr 

BEGIN TRANSACTION

	DELETE Person.PersonPhone 
    WHERE PhoneNumberTypeID = 3;
	SELECT * FROM Person.PersonPhone;

	DELETE Person.EmailAddress 
    WHERE EmailAddress LIKE 'k%';
	SELECT * FROM Person.EmailAddress;

	DELETE Production.Product 
    WHERE Name LIKE 'Lock%';
	SELECT * FROM Production.Product;;

IF @TestVariableForTr = 5
BEGIN
	ROLLBACK;
END
ELSE 
BEGIN
	COMMIT
END