CREATE DATABASE class2;

--DDL (DATA DEFINITION LANGUAGE)

/* COMMON DATA TYPES*/

--INTEGER
/*
1. TINYINT = (0, 255)
2. SMALLINT =(-32,.., 32,...)
3. INT =(-2B, 2B)
4. BIGINT =(-2^63, 2^63-1)

*/

drop table if EXISTS demo;
CREATE table demo(
    id TINYINT
);

INSERT into demo
VALUES(12), (21);
SELECT * from demo


--DECIMAL

drop table if EXISTS demo;
CREATE table demo(
    id int PRIMARY KEY IDENTITY,
    name VARCHAR(255),
    price DECIMAL(10, 2)
);
insert into demo
VALUES ('Salom', 12.321);
select * from demo;


--FLOAT
drop table if EXISTS demo;
CREATE table demo(
    id int PRIMARY KEY IDENTITY,
    name VARCHAR(255),
    price FLOAT
);
insert into demo
VALUES ('Salom', 12.321);
select * from demo;


--String
--CHAR(50), NCHAR(50), VARCHAR(50), NVARCHAR(50)
--TEXT, TEXT
--NVARCHAR(MAX)

--DATE & TIME
--TIME=HH:MM:SS
--DATETIME=YYYY-MM-DD HH:MM:SS

CREATE table clock(
    name VARCHAR(50),
    date DATE
);
insert into clock
VALUES ('Sas', '2023-12-21');

SELECT * from clock;

select GETDATE();
drop table if EXISTS [Salom hey];
CREATE table [Salom hey](
    name VARCHAR(50), 
    time DATETIME
);

INSERT into [Salom hey]
select 'Me', GETDATE();
SELECT * from [Salom hey];


SELECT GETUTCDATE();
SELECT GETDATE();

SELECT NEWID();

create table emp(
    id  UNIQUEIDENTIFIER,
    name VARCHAR(50)
);

insert into emp
select NEWID(), 'JOn';
SELECT* from emp;

--give id to someone
insert into emp
VALUES
('74f48c5c-62e0-46ca-acf3-aac6d024c4e2', 'Kike');


--Ma'lumotlar ba'zasiga rasm saqlash

SELECT @@SERVERNAME;