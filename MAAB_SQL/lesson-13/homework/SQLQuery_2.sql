DECLARE @Year INT = 2025;
DECLARE @Month INT = 7;

-- First and Last Day of the Month
DECLARE @FirstDate DATE = DATEFROMPARTS(@Year, @Month, 1);
DECLARE @LastDate DATE = EOMONTH(@FirstDate);

-- Create full date range including padding days for full weeks
;WITH Dates AS (
    SELECT DATEADD(DAY, -DATEPART(WEEKDAY, @FirstDate) + 1, @FirstDate) AS DateValue
    UNION ALL
    SELECT DATEADD(DAY, 1, DateValue)
    FROM Dates
    WHERE DateValue < DATEADD(DAY, 6, @LastDate)
),
Calendar AS (
    SELECT 
        DateValue,
        DATEPART(WEEKDAY, DateValue) AS WeekDay,
        DATEDIFF(WEEK, @FirstDate, DateValue) AS WeekNum
    FROM Dates
)
SELECT 
    MAX(CASE WHEN DATEPART(WEEKDAY, DateValue) = 1 THEN DAY(DateValue) END) AS [Sun],
    MAX(CASE WHEN DATEPART(WEEKDAY, DateValue) = 2 THEN DAY(DateValue) END) AS [Mon],
    MAX(CASE WHEN DATEPART(WEEKDAY, DateValue) = 3 THEN DAY(DateValue) END) AS [Tue],
    MAX(CASE WHEN DATEPART(WEEKDAY, DateValue) = 4 THEN DAY(DateValue) END) AS [Wed],
    MAX(CASE WHEN DATEPART(WEEKDAY, DateValue) = 5 THEN DAY(DateValue) END) AS [Thu],
    MAX(CASE WHEN DATEPART(WEEKDAY, DateValue) = 6 THEN DAY(DateValue) END) AS [Fri],
    MAX(CASE WHEN DATEPART(WEEKDAY, DateValue) = 7 THEN DAY(DateValue) END) AS [Sat]
FROM Calendar
GROUP BY WeekNum
ORDER BY WeekNum
OPTION (MAXRECURSION 1000);


SELECT DATEPART(WeekDay, getdate())