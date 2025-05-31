CREATE DATABASE homework;
use homework;

CREATE table student(
    id int NULL, 
    name VARCHAR (50) NULL, 
    age int NULL
);
ALTER TABLE student
ALTER COLUMN id INT NOT NULL;


--2

CREATE table product(
    product_id int UNIQUE,
    product_name VARCHAR(50), 
    price int 
    );
Alter table product
alter column product_id int ;  

Alter table product
add UNIQUE(product_id) ; 
Alter table product
add UNIQUE(product_name) ; 

--3
DROP TABLE if EXISTS orders
create table orders(
    order_id int CONSTRAINT PK_orders_order_id PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE
);


ALTER table orders
Drop CONSTRAINT PK_orders_order_id;

alter table orders
add CONSTRAINT PK_orders_order_id PRIMARY KEY(order_id);


--4(foriegn key)

CREATE table category(
    category_id int PRIMARY KEY,
    category_name VARCHAR(50)
);
DROP table if EXISTS item
CREATE table item(
    item_id int PRIMARY KEY,
    item_name VARCHAR(50),
    category_id int CONSTRAINT PK_item_category_id FOREIGN KEY references category(category_id)
);

alter table item
drop CONSTRAINT PK_item_category_id;

alter table item
add CONSTRAINT PK_item_category_id FOREIGN KEY (category_id) references category(category_id);


--5  CHECK Constraint

drop table if EXISTS account;
create table account(
    account_id int PRIMARY KEY,
    balance DECIMAL Check(balance>=0),
    account_type VARCHAR(10) Constraint CK_account_account_type CHECK(account_type='Saving' OR  account_type='Checking')
);

alter table account
drop CONSTRAINT CK_account_account_type;

alter table account
add CONSTRAINT CK_account_account_type  CHECK(account_type='Saving' OR  account_type='Checking');


--6   DEFAULT Constraint
drop table if EXISTS customer;
create table customer(
    customer_id int  PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(23) Constraint DF_customer_city DEFAULT 'Unknown'
);

alter table customer 
drop CONSTRAINT DF_customer_city;

alter table customer
add CONSTRAINT DF_customer_city DEFAULT 'Unknown' FOR city;


--7 IDENTITY
drop table if EXISTS invoice;
create table invoice(
    invoice_id int IDENTITY,
    amount DECIMAL
);
insert into invoice
VALUES( 123.213), 
    (123.232),
    (213.1231),
    (324.141),
    (11.121);
 


SET IDENTITY_INSERT invoice OFF;


insert into invoice
VALUES(12, 123121.321)  ; 

SET IDENTITY_INSERT invoice ON;
SELECT * from invoice

-- 8 All at once
-- Step 1: Drop the table if it exists
DROP TABLE IF EXISTS books;

-- Step 2: Create the table
CREATE TABLE books (
    book_id INT IDENTITY PRIMARY KEY,            -- Auto-incrementing ID
    title VARCHAR(100) NOT NULL,                 -- Title must be provided
    price DECIMAL CHECK(price > 0),              -- Price must be > 0
    genre VARCHAR(50) DEFAULT 'Unknown'          -- Default genre if not provided
);

-- Step 3: Insert rows
INSERT INTO books(title, price, genre)
VALUES
    ('Salom', 122.23, 'Adventure'),   -- Note: You had a typo 'Adcenture'

    ('Bor', 213, 'Book');

-- Step 4: View data
SELECT * FROM books;
INSERT into books(title, price)
VALUES
('Salom', 122.23);   

--9 Scenario: Library Management System









-- 1. Drop the Loan table first (because it depends on Book and Member)
DROP TABLE IF EXISTS Loan;

-- 2. Then drop the dependent tables
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Member;

-- 3. Now recreate the tables in the correct order

-- Book table
CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    published_year INT
);

-- Member table
CREATE TABLE Member (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(100)
);

-- Loan table with foreign key constraints
CREATE TABLE Loan (
    loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE,
    return_date DATE NOT NULL,
    CONSTRAINT FK_Loan_book_id FOREIGN KEY (book_id) REFERENCES Book(book_id),
    CONSTRAINT FK_Loan_member_id FOREIGN KEY (member_id) REFERENCES Member(member_id)
);


INSERT into Book
VALUES 
    (1, 'Good morning', 'Samadjon Sayfullayev', 2023),
    (2, 'Good afternoon', 'Samadjon Sayfullayev', 2024),
    (3, 'Good evening', 'Samadjon Sayfullayev', 2025);

INSERT into Member
VALUES
    (1, 'Samadjon', 'samadjonsayfullayev3106@gmail.com', '+998992703106'),   
    (2, 'Abdurahmon', 'abdurahmon@gmail.com', '+998992703106');
INSERT into Loan
VALUES
    (111, 1, 1,'2024-05-25' , '2024-06-25'),
    (112, 3, 2,'2024-04-20' , '2024-07-24');
    
SELECT * from Book;
SELECT * from Member;
SELECT * from Loan;