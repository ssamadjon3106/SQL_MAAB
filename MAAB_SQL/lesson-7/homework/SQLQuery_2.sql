CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);



-- Retrieve All Customers With Their Orders (Include Customers Without Orders)


SELECT c.CustomerName, o.OrderID, o.OrderDate
from Customers as c
left join Orders as o
    on c.CustomerID=o.CustomerID;

--2️ Find Customers Who Have Never Placed an Order


SELECT c.CustomerName, o.OrderID, o.OrderDate
from Customers as c
left join Orders as o
    on c.CustomerID=o.CustomerID
WHERE OrderID is NULL;

--List All Orders With Their Products

SELECT p.ProductName , od.Quantity
from OrderDetails as od
join Products as p
    on p.ProductID=od.OrderDetailID;


--Find Customers With More Than One Order

SELECT CustomerName 
from Customers c
join Orders o
    on c.CustomerID=o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(o.OrderID) > 1;

--5️ Find the Most Expensive Product in Each Order

SELECT *
from (
    select *, 
        RANK() over(PARTITION by OrderID order by Price DESC) as rk
from OrderDetails) as ranked
WHERE rk=1
;



--6️ Find the Latest Order for Each Customer

    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS rn
    from Orders;


---Find Customers Who Ordered Only 'Electronics' Products


SELECT c.CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(DISTINCT CASE WHEN p.Category <> 'Electronics' THEN p.ProductID END) = 0;


--Find Customers Who Ordered at Least One 'Stationery' Product
 

SELECT DISTINCT  c.CustomerName  
FROM Customers c
JOIN Orders o on o.CustomerID=c.CustomerID
join OrderDetails od on o.OrderID=od.OrderID
join Products p on p.ProductID=od.ProductID
WHERE Category='Stationery';

--Find Total Amount Spent by Each Customer

SELECT   c.CustomerID , c.CustomerName ,
    SUM(od.Price * od.Quantity) AS TotalSpent

from Customers as c 
join   Orders as o on o.CustomerID=c.CustomerID
join  OrderDetails  as od on o.OrderID=od.OrderID
GROUP BY c.CustomerID, c.CustomerName;
