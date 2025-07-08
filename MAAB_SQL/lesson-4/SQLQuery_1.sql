CREATE DATABASE class4;
use class4;

--Aggregate functions

--COUNT()
--AVG()
--MIN()
--MAX()
--SUM()
--STRING__AGG()

-- Creating the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

-- Inserting 10 sample rows into the Products table
INSERT INTO Products (ProductID, ProductName, Category, Price, Stock) VALUES
(1, 'Apple iPhone 14', 'Electronics', 799.99, 50),
(2, 'Samsung Galaxy S22', 'Electronics', 749.99, 40),
(3, 'Sony WH-1000XM5 Headphones', 'Electronics', 349.99, 30),
(4, 'Dell XPS 13 Laptop', 'Computers', 999.99, 20),
(5, 'Logitech MX Master 3 Mouse', 'Accessories', 99.99, 75),
(6, 'Amazon Echo Dot', 'Smart Home', 49.99, 100),
(7, 'Nike Air Max 270', 'Footwear', 129.99, 60),
(8, 'Adidas Ultraboost Shoes', 'Footwear', 149.99, 55),
(9, 'KitchenAid Stand Mixer', 'Home Appliances', 379.99, 15),
(10, 'Canon EOS M50 Camera', 'Photography', 649.99, 10);

SELECT Category,
    STRING_AGG(ProductName, ' * ')
from Products
group by Category;

SELECT* from Products;

drop table if EXISTS parent;
create table parent(
    pname VARCHAR(10),
    cname VARCHAR(10),
    gender VARCHAR(1)
);

insert into parent
VALUES ('Karl', 'Bob', 'F'),
('Karl', 'Bob', 'M'),
('Karl', 'Jim', 'M'),
('Karl', 'Monica', 'F'),
('Jam', 'Rebecca', 'F'),
('Jam', 'Smith', 'F'),
('Jam', 'Daniel', 'M'),
('Qayt', 'Leslie', 'F'),
('Qayt', 'Rebecca', 'F'),
('Qayt', 'Mie', 'F'),
('Karl', 'Bob', 'M'),
('Karl', 'Bob', 'M');

SELECT pname from  parent
GROUP by pname
HAVING COUNT(distinct gender)=2;


--NUmber functions

--SQRT()
select sqrt(4);

--ABC (Musbatlash)
SELECT ABS(-121.2111);

--Round()
select round(sqrt(10), 4);

--CEILING--yuqoriga yaxlistlash

SELECT CEILING(1.2)

--FLOOR
SELECT FLOOR(1.5)

--power
SELECT power(2, 4)

--EXP (e^)

SELECT exp(10)

--LOG=ln

select LOG(10);

--LOG10

SELECT LOG10(10);

--Sign
select SIGN(-12), SIGN(0), SIGN(10); 

--RAND (0,1)
select RAND()

SELECT CEILING(100 *RAND())


 --============String function---================

 SELECT pname,
    len(pname) as lenght,
    LEFT(pname, 3),
    RIGHT(pname, 3),
    SUBSTRING(pname, 2,3 ),
    SUBSTRING(pname, -2,4 )
    from parent;

--reverse()

select pname, REVERSE(pname) from parent;

--charindex()


SELECT cname , CHARINDEX('o', cname) from parent;


--replace()

SELECT REPLACE(cname, 'o', '*') from parent;

--trim(), ltrim(), rtrim()

SELECT '       something        ',
LTRIM('       something        '),
RTRIM('       something        '),
TRIM('       something        ');

--upper/lower

--CONCAT
select CONCAT('hello', 'boer', 'meiu');

--space()
select 'heelo'+SPACE(10)+ 'bro'

--replicate
SELECT REPLICATE('apple',10);

--string_split()
SELECT * from string_split('biho,uibi,iui,u,', ',');

--Date functions

select DATEDIFF(day, '2023-12-23', '2030-10-23')
select DATEDIFF(MONTH, '2023-12-23', '2030-10-23')
select DATEDIFF(YEAR, '2023-12-23', '2030-10-23')

SELECT DATEADD(DAY, 12, '2023-12-12')

SELECT GETDATE(), EOMONTH(GETDATE());
--CAST()
SELECT '11'*2


--TRY_CAST()
select TRY_CAST('a' as int), TRY_CAST('12' as int);