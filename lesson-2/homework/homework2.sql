---------------1---------------------------
create TABLE test_identity(
    id int IDENTITY(1,1) PRIMARY KEY, 
    name VARCHAR(50)
);

insert into test_identity
VALUES ('Samadjon'), ('George'), ('Bob'), ('Holi'), ('Lovee');

select * from test_identity;


--1
drop table test_identity;

--2 
DELETE from test_identity;

select * from test_identity;

--3 
TRUNCATE table test_identity;
select * from test_identity;

--------------------2--------------------
DROP TABLE if EXISTS data_types_demo;
CREATE table data_types_demo(
    day DATETIME,
    id UNIQUEIDENTIFIER
);

insert into data_types_demo
select GETDATE(), NEWID();
SELECT * from data_types_demo;

-----3----------

drop table if EXISTS photos;
create table photos(
    id int primary key,
    photo_format varbinary(max) 

);
-------------4------------
drop table if EXISTS student;
create table student(
    classes int ,
    tuition_per_class float,
    total_tuition AS (tuition_per_class * classes),
);

insert into student
VALUES
    (5, 1200),
    (4, 1223),
    (7, 1133);

SELECT * from student;

------------5------------

CREATE TABLE worker (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

BULK INSERT worker
FROM '/var/opt/mssql/data/workers.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


select * from worker;