drop table if EXISTS Orders
CREATE TABLE Orders(
    OrderID int PRIMARY key,
    CustomerName VARCHAR(10),
    OrderDate DATE 
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductName VARCHAR(100),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Orders VALUES
(1, 'Alice', '2024-03-01'),
(2, 'Bob', '2024-03-02'),
(3, 'Charlie', '2024-03-03');

INSERT INTO OrderDetails VALUES
(1, 1, 'Laptop', 1, 1000.00),
(2, 1, 'Mouse', 2, 50.00),
(3, 2, 'Phone', 1, 700.00),
(4, 2, 'Charger', 1, 30.00),
(5, 3, 'Tablet', 1, 400.00),
(6, 3, 'Keyboard', 1, 80.00);


SELECT * from Orders
SELECT * from OrderDetails

SELECT CustomerName,ProductName , Quantity , UnitPrice from
    (select o.CustomerName, od.ProductName, od.Quantity, od.UnitPrice, ROW_NUMBER() over(partition by o.CustomerName order by od.UnitPrice desc) as rk
    from Orders o
    join OrderDetails od
    on od.OrderID=o.OrderID) as t1
WHERE rk=2    

with cte as (
    SELECT o.OrderID, o.CustomerName,  od.ProductName , od.Quantity, od.UnitPrice, DENSE_RANK() over(partition by o.OrderID order by od.UnitPrice desc) as rank
    from OrderDetails od
    join Orders o 
    on o.OrderID=od.OrderID
) 
SELECT OrderID, CustomerName, ProductName, Quantity, UnitPrice from cte
where rank=1



SELECT OrderID, CustomerName, 
(select max(UnitPrice) as MaxPrice from OrderDetails od WHERE o.OrderID=od.OrderID), (
select od.ProductName as ProductName from OrderDetails od WHERE o.OrderID=od.OrderID
) from Orders o

CREATE TABLE TestMax (
    Year1 INT,
    Max1 INT,
    Max2 INT,
    Max3 INT
);

INSERT INTO TestMax VALUES
(2001, 10, 101, 87),
(2002, 103, 19, 88),
(2003, 21, 23, 89),
(2004, 27, 28, 91);


SELECT Year1, GREATEST(Max1, Max2, Max3) from TestMax