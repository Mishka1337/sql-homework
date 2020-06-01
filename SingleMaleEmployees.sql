CREATE PROCEDURE HumanResources.Bachelors (
  @fromDate AS date,
  @toDate AS date,
  @count AS int OUTPUT
)
AS
  SELECT p.FirstName,p.LastName, e.* INTO #bachelors --наверно это не очень хорошо
  FROM HumanResources.Employee as e
  JOIN Person.Person as p
    ON p.BusinessEntityID = e.BusinessEntityID
  WHERE e.Gender = 'M' 
      AND e.MaritalStatus = 'S'
      AND e.BirthDate BETWEEN @fromDate AND @toDate

  SELECT @count = COUNT(*) FROM #bachelors           --и это
  SELECT * FROM #bachelors                           --и это тоже  
GO

DECLARE @counts int
EXEC HumanResources.Bachelors '1970', '1980', @counts OUTPUT
SELECT @counts as count
GO

DROP PROC HumanResources.Bachelors
GO

