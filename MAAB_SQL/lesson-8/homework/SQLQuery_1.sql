drop table if EXISTS Groupings
CREATE TABLE Groupings(
    [Step Number] int PRIMARY KEY ,
    Status VARCHAR(10)
);

INSERT into  Groupings
VALUES (1, 'Passed'),
(2, 'Passed'),
(3, 'Passed'),
(4, 'Passed'),
(5, 'Failed'),
(6, 'Failed'),
(7, 'Failed'),
(8, 'Failed'),
(9, 'Failed'),
(10,'Passed'),
(11, 'Passed'),
(12, 'Passed');

SELECT * from Groupings;


with withgroups as (
    SELECT *,
     case when lag(Status) over(order by [Step Number]) = Status then 0 else 1 
     End as IsNewGroup
from Groupings     
),
GroupNumbers as (
    SELECT * , 
    sum(IsNewGroup) over(order by [Step Number]) as GroupNum
    from withgroups
)

SELECT 
MIN([Step Number]) as [Min Step Number],
MAX([Step Number]) as [Max Step Number],
Status,
Count(*) as [Consecutive Count]
from GroupNumbers
Group by GroupNum , Status
order by [Min Step Number]



---=========================
---2
--=======================

CREATE TABLE [dbo].[EMPLOYEES_N]
(
    [EMPLOYEE_ID] [int] NOT NULL,
    [FIRST_NAME] [varchar](20) NULL,
    [HIRE_DATE] [date] NOT NULL
);


INSERT INTO [dbo].[EMPLOYEES_N]
VALUES
	(1001,'Pawan','1975-02-21'),
	(1002,'Ramesh','1976-02-21'),
	(1003,'Avtaar','1977-02-21'),
	(1004,'Marank','1979-02-21'),
	(1008,'Ganesh','1979-02-21'),
	(1007,'Prem','1980-02-21'),
	(1016,'Qaue','1975-02-21'),
	(1155,'Rahil','1975-02-21'),
	(1102,'Suresh','1975-02-21'),
	(1103,'Tisha','1975-02-21'),
	(1104,'Umesh','1972-02-21'),
	(1024,'Veeru','1975-02-21'),
	(1207,'Wahim','1974-02-21'),
	(1046,'Xhera','1980-02-21'),
	(1025,'Wasil','1975-02-21'),
	(1052,'Xerra','1982-02-21'),
	(1073,'Yash','1983-02-21'),
	(1084,'Zahar','1984-02-21'),
	(1094,'Queen','1985-02-21'),
	(1027,'Ernst','1980-02-21'),
	(1116,'Ashish','1990-02-21'),
	(1225,'Bushan','1997-02-21');







WITH AllYears AS (
    SELECT 1975 AS YearValue
    UNION ALL
    SELECT YearValue + 1
    FROM AllYears
    WHERE YearValue + 1 <= YEAR(GETDATE())
),
HireYears AS (
    SELECT DISTINCT YEAR(HIRE_DATE) AS HireYear
    FROM [dbo].[EMPLOYEES_N]
),
MissingYears AS (
    SELECT a.YearValue
    FROM AllYears a
    LEFT JOIN HireYears h ON a.YearValue = h.HireYear
    WHERE h.HireYear IS NULL
)

SELECT 
  MIN(YearValue) AS [StartYear],
  MAX(YearValue) AS [EndYear]
FROM (
  SELECT *,
         YearValue - ROW_NUMBER() OVER (ORDER BY YearValue) AS GroupKey
  FROM MissingYears
) AS Grouped
GROUP BY GroupKey
ORDER BY StartYear;
