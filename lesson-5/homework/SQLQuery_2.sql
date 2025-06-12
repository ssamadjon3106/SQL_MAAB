drop table if EXISTS Employees
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    HireDate DATE NOT NULL
);

INSERT INTO Employees (Name, Department, Salary, HireDate) VALUES
    ('Alice', 'HR', 50000, '2020-06-15'),
    ('Bob', 'HR', 60000, '2018-09-10'),
    ('Charlie', 'IT', 70000, '2019-03-05'),
    ('David', 'IT', 70000, '2021-07-22'),
    ('Eve', 'Finance', 90000, '2017-11-30'),
    ('Frank', 'Finance', 75000, '2019-12-25'),
    ('Grace', 'Marketing', 65000, '2016-05-14'),
    ('Hank', 'Marketing', 72000, '2019-10-08'),
    ('Ivy', 'IT', 67000, '2022-01-12'),
    ('Jack', 'HR', 52000, '2021-03-29');
--1
    SELECT *, 
    ROW_NUMBER() over(order by salary) from Employees;

---2

    WITH RankedEmployees AS (
    SELECT *, DENSE_RANK() OVER (ORDER BY Salary) AS SalaryRank
    FROM Employees
)
SELECT Name, Salary, SalaryRank
FROM RankedEmployees
WHERE SalaryRank IN (
    SELECT SalaryRank
    FROM RankedEmployees
    GROUP BY SalaryRank
    HAVING COUNT(*) > 1
)
ORDER BY SalaryRank;

---3

SELECT *
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS rn
    FROM Employees
) AS ranked
WHERE rn <= 2;
--4
SELECT *
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary ASC) AS rn
    FROM Employees
) AS ranked
WHERE rn= 1;

--5

SELECT Department, 
    sum(Salary) as sum
    from Employees
    group by Department;

--6
SELECT Department, sum(Salary) over(PARTITION by Department ) as sum
from Employees;


--7
SELECT Department ,
AVG(Salary) over(PARTITION by department )
from Employees;

--8
select * , 
    AVG(Salary) over(PARTITION by department ) as average,
    Salary - AVG(Salary) over(PARTITION by department ) as differences

from Employees;


--9
SELECT *,
       AVG(Salary) OVER (
           ORDER BY EmployeeID
           ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
       ) AS Moving_Avg_Salary
FROM Employees;


--10

SELECT *, 
    sum(Salary) over(order by HireDate DESC rows between current row and 2 following) as sum
from Employees;

---11
SELECT *, 
    sum(Salary) over(order by HireDate DESC rows between  unbounded preceding and current row) as sum
from Employees;


--12
SELECT *, 
    max(Salary) over(order by HireDate DESC rows between 2 preceding and 2 following) as max_value
from Employees;

--13
select *, 
CAST(Salary/sum(Salary) Over() * 100  as decimal(10, 2)) as PERCENTAGE

from Employees;