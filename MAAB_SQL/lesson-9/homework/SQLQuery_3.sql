CREATE TABLE Employees
(
	EmployeeID  INTEGER PRIMARY KEY,
	ManagerID   INTEGER NULL,
	JobTitle    VARCHAR(100) NOT NULL
);
INSERT INTO Employees (EmployeeID, ManagerID, JobTitle) 
VALUES
	(1001, NULL, 'President'),
	(2002, 1001, 'Director'),
	(3003, 1001, 'Office Manager'),
	(4004, 2002, 'Engineer'),
	(5005, 2002, 'Engineer'),
	(6006, 2002, 'Engineer');


with cle as (
    SELECT EmployeeID, 
        ManagerID, 
        JobTitle,
        0 as Depth
    from  Employees
    where ManagerID is NULL

    UNION ALL
    SELECT e.EmployeeID, 
       e.ManagerID, 
        e.JobTitle,
        c.Depth +1 as Depth
        from Employees as e
        join cle as c
        on c.EmployeeID=e.ManagerID
)
select EmployeeID, 
        ManagerID, 
        JobTitle,
        Depth
        from cle
        order by Depth, EmployeeID;




 --------2----------

 DECLARE @n int =10

 ;with Factorials as (
    select 1 as n,
    1 as factorial
    UNION ALL
    SELECT 
    n+1,
    factorial * (n+1)
    from Factorials
    where n<(@n)  
 ) 
 select n, factorial from Factorials;



 -----------3------------
--Find Fibonacci numbers up to $N$.
DECLARE @N INT = 10; -- Set your desired N value here

WITH Fibonacci AS (
    -- Start with the first two Fibonacci numbers (n=1 and n=2)
    SELECT 
        1 AS n,
        CAST(1 AS BIGINT) AS Fibonacci_Number,
        CAST(0 AS BIGINT) AS Previous_Number
    
    UNION ALL
    
    SELECT 
        2 AS n,
        CAST(1 AS BIGINT) AS Fibonacci_Number,
        CAST(1 AS BIGINT) AS Previous_Number
    
    UNION ALL
    
    -- Generate subsequent numbers
    SELECT
        f.n + 1,
        f.Fibonacci_Number + f.Previous_Number,
        f.Fibonacci_Number
    FROM Fibonacci f
    WHERE f.n < @N
)
SELECT 
    n,
    Fibonacci_Number
FROM Fibonacci
WHERE n <= @N
ORDER BY n;