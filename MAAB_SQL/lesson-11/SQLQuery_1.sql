

--========================
-- SQL Serve Variables
--========================

declare @number int;
set @number=10
SELECT @number


DECLARE @num INT
SELECT @num=10
SELECT @num

--SELECT 1, @num=2
--Must declare the scalar variable "@num".


select @@SERVERNAME

SELECT @@IDENTITY

SELECT @@ROWCOUNT

create table emp(
    num int PRIMARY key IDENTITY,
    name VARCHAR(10)
);


insert into emp
values  ('john'), ('madina');



SELECT @@TRANCOUNT

begin TRAN t1
insert into emp(name)
VALUES ('adam')

COMMIT TRAN t1
ROLLBACK TRAN t1

SELECT * from emp



-- Table variable


DECLARE @dept TABLE (
    id INT,
    name VARCHAR(23)
);

INSERT INTO @dept
VALUES (1, 'ffaf'), (2, 'sdcasdv');

SELECT * FROM @dept;

select * into newtable from @dept



--==========================
----SQL Server Temporary table
--==========================



create table #sales(
    id int, 
    name VARCHAR(10)
);

insert into #sales
VALUES(1, 'asdas'), (2, 'sadsad')


SELECT * from #sales



--==========================
----SQL Server Global Temp table 
--==========================

create table ##salom(
    name VARCHAR(10), 
    age INT
)
INSERT into ##salom
VALUES ('Samadjon', 19),
('Samadjon', 23),
('sadsd', 23),
('asdas', 19),
('dsa', 3),
('sdasa', 23),
('Samadjon', 32),
('das', 32),
('asd', 1923);

SELECT * from ##salom






--==========================
----SQL Server VIEW
--==========================



create table demo(
    name VARCHAR(10), 
    age INT
)
INSERT into demo
VALUES ('Samadjon', 19),
('Samadjon', 23),
('sadsd', 23),
('asdas', 19),
('dsa', 3),
('sdasa', 23),
('Samadjon', 32),
('das', 32),
('asd', 1923);

SELECT * from demo


UPDATE demo 
set age=222
where name='das'


CREATE VIEW parts AS
    SELECT * from demo
    WHERE age>20;


SELECT * from parts
