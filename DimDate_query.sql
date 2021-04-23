use sakiladw
GO

TRUNCATE TABLE dbo.DimDate
SET LANGUAGE English;
SET NOCOUNT ON
DECLARE @date DATE = '2000-01-01'

-- 2000~2010
WHILE @date < '2011-01-01'
BEGIN
	INSERT INTO dbo.DimDate(DateId,CalYear,CalQuarter,CalMonth,CalDay,Weekday,FullDate)
		VALUES(
			CONVERT(VARCHAR(8),@date,112),
			DATEPART(YEAR, @date),
			DATEPART(QUARTER, @date),
			DATEPART(MONTH, @date),
			DATEPART(DAY, @date),
			DATENAME(WEEKDAY, @date),
			CAST(@date AS DATE)
		)  
	SET @date  = DATEADD(DAY, 1, @date)
END
