CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);

INSERT INTO Employees (EmployeeID, Name, Department, Salary) VALUES
(1, 'Alice', 'HR', 5000),
(2, 'Bob', 'IT', 7000),
(3, 'Charlie', 'Sales', 6000),
(4, 'David', 'HR', 5500),
(5, 'Emma', 'IT', 7200);





CREATE TABLE #EmployeeTransfers (
    EmployeeID INT,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);

insert into #EmployeeTransfers(EmployeeID, Name, Department, Salary)
    select
        EmployeeID,
        Name, 
        case 
            when Department='HR' THEN 'IT'
            when Department='IT' THEN 'Sales'
            when Department='Sales' THEN 'HR'
            else Department
        END as New_Department,
        Salary 
            from  Employees;

SELECT * from #EmployeeTransfers;
SELECT * from Employees



----2---

-- Main system table
CREATE TABLE Orders_DB1 (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);

-- Backup system table (incomplete)
CREATE TABLE Orders_DB2 (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);

-- Insert data into Orders_DB1
INSERT INTO Orders_DB1 (OrderID, CustomerName, Product, Quantity) VALUES
(101, 'Alice', 'Laptop', 1),
(102, 'Bob', 'Phone', 2),
(103, 'Charlie', 'Tablet', 1),
(104, 'David', 'Monitor', 1);

-- Insert data into Orders_DB2 (only some records)
INSERT INTO Orders_DB2 (OrderID, CustomerName, Product, Quantity) VALUES
(101, 'Alice', 'Laptop', 1),
(103, 'Charlie', 'Tablet', 1);


DECLARE @MissingOrders  TABLE (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);

insert into @MissingOrders(OrderID, CustomerName , Product, Quantity)
    select * from Orders_DB1
    where OrderID not in(select OrderID from Orders_DB2)


SELECT * from @MissingOrders


---------3-----------



CREATE TABLE WorkLog (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    WorkDate DATE,
    HoursWorked INT
);
INSERT INTO WorkLog (EmployeeID, EmployeeName, Department, WorkDate, HoursWorked) VALUES
(1, 'Alice', 'HR', '2024-03-01', 8),
(2, 'Bob', 'IT', '2024-03-01', 9),
(3, 'Charlie', 'Sales', '2024-03-02', 7),
(1, 'Alice', 'HR', '2024-03-03', 6),
(2, 'Bob', 'IT', '2024-03-03', 8),
(3, 'Charlie', 'Sales', '2024-03-04', 9);


select * from WorkLog


 

CREATE VIEW vw_MonthlyWorkSummary AS
SELECT 
    EmployeeID,
    EmployeeName,
    Department,
    SUM(HoursWorked) OVER (PARTITION BY EmployeeName) AS TotalHoursWorked,
    SUM(HoursWorked) OVER (PARTITION BY Department) AS TotalHoursDepartment,
    AVG(HoursWorked) OVER (PARTITION BY Department) AS AvgHoursDepartment
FROM WorkLog;

select * from  vw_MonthlyWorkSummary  
