drop table if EXISTS Departments
create table Departments(
    DepartmentID int PRIMARY KEY,
    DepartmentName VARCHAR(10)

);

drop table if EXISTS Employees
create TABLE Employees(
    EmployeeID int PRIMARY key IDENTITY,
    Name  VARCHAR(10),
    DepartmentID int FOREIGN key REFERENCES Departments(DepartmentID),
    Salary INT
);


drop table if EXISTS Projects
create TABLE Projects(
    ProjectID int, 
    ProjectName VARCHAR(10),
    EmployeeID int FOREIGN key REFERENCES Employees(EmployeeID)
);

insert into Departments
VALUES (101,'IT' ),
(102,'HR' ),
(103,'Finance' ),
(104,'Marketing' );

INSERT into Employees
VALUES ('Alice', 101, 60000),
('Bob', 102, 70000),
('Charlie', 101, 65000),
('David', 103, 72000),
('Eva', NUll, 68000);


INSERT into Projects
VALUES (1, 'Alpha', 1),
(2, 'Beta', 2),
(3, 'Gamma', 1),
(4, 'Delta', 4),
(5, 'Omega', NUll);

--Inner join
SELECT e.Name, d.DepartmentName
from Employees as e
JOIN Departments as d
on e.DepartmentID=d.DepartmentID


--LEFT JOIN
SELECT e.Name, d.DepartmentName
from Employees as e
LEFT JOIN Departments as d
on e.DepartmentID=d.DepartmentID


--RIGHT JOIN
SELECT d.DepartmentName
from Employees as e
LEFT JOIN Departments as d
on e.DepartmentID=d.DepartmentID

--FULL OUTER JOIN
SELECT *
from Employees as e
FULL OUTER JOIN Departments as d
on e.DepartmentID=d.DepartmentID


--JOIN with Aggregation

SELECT * , 
SUM(Salary) over(partition by DepartmentName) as SUM_eachdept
from Employees e
JOIN Departments d
on e.DepartmentID=d.DepartmentID;



SELECT e.Name, d.DepartmentName
from Employees as e
JOIN Departments as d
on e.DepartmentID=d.DepartmentID


---CROSS JOIN

SELECT *
from Employees as e
cross JOIN Departments as d;

--MULTIPLE JOINS
SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName,
    p.ProjectName
FROM 
    Employees e
LEFT JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
LEFT JOIN 
    Projects p ON e.EmployeeID = p.EmployeeID;


