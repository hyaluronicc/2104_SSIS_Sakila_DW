/*DECLARE @date DATE = '2000-01-01'
CONVERT(CHAR(8), @date, 112)*/

WITH Dumy 
AS
( 
 SELECT GETDATE() DT  
 UNION ALL
 SELECT DT + 1 FROM Dumy 
 WHERE DT + 1 < DATEADD(day, 90, GETDATE())
) 

SELECT DATENAME(WEEKDAY, DT)
FROM Dumy 
OPTION (MAXRECURSION 0);

--SELECT (CAST(YEAR(@dt) AS bigint) * 100 + MONTH(@dt)) * 100 + DAY(@dt)