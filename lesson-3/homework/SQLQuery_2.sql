CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES
(1,  'John',     'Smith',     'IT',         65000.00, '2020-03-15'),
(2,  'Emma',     'Johnson',   'HR',         55000.00, '2019-06-01'),
(3,  'Liam',     'Williams',  'Finance',    72000.00, '2021-01-10'),
(4,  'Olivia',   'Brown',     'Marketing',  60000.00, '2018-09-23'),
(5,  'Noah',     'Davis',     'IT',         68000.00, '2022-11-30'),
(6,  'Ava',      'Miller',    'HR',         54000.00, '2021-05-19'),
(7,  'Elijah',   'Wilson',    'Finance',    73000.00, '2017-02-03'),
(8,  'Sophia',   'Moore',     'Marketing',  61000.00, '2020-08-21'),
(9,  'William',  'Taylor',    'IT',         67000.00, '2019-04-17'),
(10, 'Isabella', 'Anderson',  'HR',         56000.00, '2022-07-11'),
(11, 'James',    'Thomas',    'Finance',    75000.00, '2021-12-05'),
(12, 'Mia',      'Jackson',   'Marketing',  62000.00, '2023-01-01'),
(13, 'Benjamin', 'White',     'IT',         69000.00, '2020-10-10'),
(14, 'Charlotte','Harris',    'HR',         58000.00, '2022-03-14'),
(15, 'Lucas',    'Martin',    'Finance',    71000.00, '2018-06-30'),
(16, 'Amelia',   'Thompson',  'Marketing',  60500.00, '2019-11-23'),
(17, 'Henry',    'Garcia',    'IT',         66000.00, '2023-05-05'),
(18, 'Harper',   'Martinez',  'HR',         57000.00, '2020-09-09'),
(19, 'Alexander','Robinson', 'Finance',    76000.00, '2021-07-07'),
(20, 'Evelyn',   'Clark',     'Marketing',  61500.00, '2017-12-12'),
(21, 'Daniel',   'Rodriguez','IT',         70000.00, '2022-02-22'),
(22, 'Abigail',  'Lewis',     'HR',         59000.00, '2019-08-08'),
(23, 'Matthew',  'Lee',       'Finance',    74000.00, '2020-10-25'),
(24, 'Ella',     'Walker',    'Marketing',  63000.00, '2023-03-03'),
(25, 'Sebastian','Hall',      'IT',         67500.00, '2018-05-15'),
(26, 'Scarlett', 'Allen',     'HR',         56500.00, '2021-09-29'),
(27, 'David',    'Young',     'Finance',    72000.00, '2017-04-04'),
(28, 'Grace',    'Hernandez', 'Marketing',  64000.00, '2019-10-10'),
(29, 'Joseph',   'King',      'IT',         68500.00, '2020-01-20'),
(30, 'Chloe',    'Wright',    'HR',         55500.00, '2022-06-06');


--1
SELECT TOP 10 PERCENT
Salary from Employees
ORDER BY Salary DESC

    
   
SELECT department ,SUM(Salary)/COUNT(*) as average_salary
  from Employees
  GROUP BY department
  ORDER BY average_salary DESC
  OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY;


SELECT Salary,'High' as SalaryCategory
from Employees
Where Salary>80000 
UNION ALL
select Salary, 'Medium' as SalaryCategory
from Employees
where Salary BETWEEN 50000 and 80000
UNION ALL
select Salary, 'Low' AS SalaryCategory
from Employees;




----------2------
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);
INSERT INTO Orders (OrderID, CustomerName, OrderDate, TotalAmount, Status)
VALUES
(1,  'Alice Johnson',     '2023-01-10', 150.75, 'Pending'),
(2,  'Bob Smith',         '2023-01-12', 200.50, 'Shipped'),
(3,  'Charlie Davis',     '2023-01-15', 320.00, 'Delivered'),
(4,  'Diana Adams',       '2023-01-18', 120.99, 'Cancelled'),
(5,  'Ethan Brown',       '2023-01-20', 400.00, 'Delivered'),
(6,  'Fiona Clark',       '2023-01-22', 250.50, 'Pending'),
(7,  'George Evans',      '2023-01-25', 175.30, 'Shipped'),
(8,  'Hannah Foster',     '2023-01-28', 90.00,  'Delivered'),
(9,  'Ian Green',         '2023-02-01', 310.10, 'Pending'),
(10, 'Jenna Harris',      '2023-02-03', 220.75, 'Shipped'),
(11, 'Kevin Irving',      '2023-02-06', 180.00, 'Delivered'),
(12, 'Lily Johnson',      '2023-02-09', 145.60, 'Cancelled'),
(13, 'Michael King',      '2023-02-12', 330.90, 'Pending'),
(14, 'Nina Lewis',        '2023-02-14', 510.00, 'Delivered'),
(15, 'Owen Moore',        '2023-02-16', 295.25, 'Shipped'),
(16, 'Paula Nelson',      '2023-02-18', 85.40,  'Cancelled'),
(17, 'Quentin Owens',     '2023-02-20', 260.00, 'Delivered'),
(18, 'Rachel Perry',      '2023-02-22', 110.99, 'Pending'),
(19, 'Steve Quinn',       '2023-02-25', 190.75, 'Shipped'),
(20, 'Tina Ross',         '2023-02-28', 300.00, 'Delivered'),
(21, 'Umar Smith',        '2023-03-02', 400.50, 'Pending'),
(22, 'Vera Taylor',       '2023-03-04', 210.10, 'Shipped'),
(23, 'Will Underwood',    '2023-03-06', 155.20, 'Delivered'),
(24, 'Xena Valentine',    '2023-03-08', 170.00, 'Cancelled'),
(25, 'Yusuf White',       '2023-03-10', 245.00, 'Pending'),
(26, 'Zara Young',        '2023-03-12', 370.80, 'Shipped'),
(27, 'Adam Zane',         '2023-03-14', 90.99,  'Delivered'),
(28, 'Bella Carter',      '2023-03-16', 280.00, 'Cancelled'),
(29, 'Chris Daniels',     '2023-03-18', 410.25, 'Pending'),
(30, 'Derek Emerson',     '2023-03-20', 305.99, 'Delivered');


select * from Orders
where OrderDate BETWEEN '2023-01-01' and '2023-12-31';


Groups by OrderStatus and finds the total number of orders and total revenue.
Filters only statuses where revenue is greater than 5000.
Orders by TotalRevenue descending.

SELECT *, 'Completed' AS OrderStatus
FROM Orders
WHERE Status IN ('Shipped', 'Delivered')

UNION ALL

SELECT *, 'Pending' AS OrderStatus
FROM Orders
WHERE Status = 'Pending'

UNION ALL

SELECT *, 'Cancelled' AS OrderStatus
FROM Orders
WHERE Status = 'Cancelled';
SELECT
  CASE
    WHEN Status IN ('Shipped', 'Delivered') THEN 'Completed'
    WHEN Status = 'Pending' THEN 'Pending'
    WHEN Status = 'Cancelled' THEN 'Cancelled'
  END AS OrderStatus,
  COUNT(*) AS TotalOrders,
  SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderDate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY
  CASE
    WHEN Status IN ('Shipped', 'Delivered') THEN 'Completed'
    WHEN Status = 'Pending' THEN 'Pending'
    WHEN Status = 'Cancelled' THEN 'Cancelled'
  END
HAVING SUM(TotalAmount) > 5000
ORDER BY TotalRevenue DESC;




-------3----------



CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

INSERT INTO Products (ProductID, ProductName, Category, Price, Stock) VALUES
(1, 'Wireless Mouse', 'Electronics', 19.99, 150),
(2, 'Bluetooth Headphones', 'Electronics', 49.99, 80),
(3, 'USB-C Charger', 'Electronics', 15.00, 200),
(4, 'Laptop Stand', 'Accessories', 29.50, 120),
(5, 'Mechanical Keyboard', 'Electronics', 75.00, 60),
(6, 'Notebook', 'Stationery', 2.99, 500),
(7, 'Ballpoint Pen', 'Stationery', 0.99, 1000),
(8, 'Desk Lamp', 'Home Office', 22.00, 70),
(9, 'Office Chair', 'Furniture', 120.00, 30),
(10, 'Monitor 24-inch', 'Electronics', 130.00, 45),
(11, 'Graphic Tablet', 'Electronics', 85.00, 40),
(12, 'Smartphone Case', 'Accessories', 10.00, 300),
(13, 'Power Bank 10000mAh', 'Electronics', 25.00, 110),
(14, 'Sticky Notes', 'Stationery', 1.50, 400),
(15, 'Desk Organizer', 'Home Office', 18.75, 90),
(16, 'Webcam HD', 'Electronics', 40.00, 65),
(17, 'Backpack', 'Accessories', 35.00, 55),
(18, 'Portable Speaker', 'Electronics', 45.00, 75),
(19, 'Flash Drive 64GB', 'Electronics', 12.00, 220),
(20, 'Wireless Router', 'Electronics', 59.99, 50),
(21, 'Whiteboard Markers', 'Stationery', 4.00, 300),
(22, 'Filing Cabinet', 'Furniture', 145.00, 15),
(23, 'Ergonomic Keyboard', 'Electronics', 60.00, 25),
(24, 'Surge Protector', 'Electronics', 16.99, 90),
(25, 'Calendar 2025', 'Stationery', 6.50, 200),
(26, 'Laptop Bag', 'Accessories', 28.00, 70),
(27, 'HDMI Cable', 'Electronics', 7.99, 180),
(28, 'Smartwatch', 'Electronics', 110.00, 35),
(29, 'Desk Clock', 'Home Office', 12.75, 100),
(30, 'Adjustable Standing Desk', 'Furniture', 250.00, 10);


SELECT distinct Category from Products;
SELECT *
FROM Products
WHERE Price = (
    SELECT MAX(Price)
    FROM Products AS p2
    WHERE p2.Category = Products.Category
);
SELECT Stock,
    IIF(Stock = 0,'Out of Stock', 
        IIF(Stock between 1 and 10, 'Low Stock', 'In Stock' ))
        as Status
        from Products;

SELECT * FROM Products
ORDER BY Price DESC
OFFSET 5 ROWS;


