CREATE table person(
    id int not NULL unique,
    name VARCHAR(100));
insert into person 
values   
  (1, 'John'),
  (2, 'Maria')

SELECT * from  person

insert into person
select NULL, 'Josh';

drop TABLE if EXISTS person
CREATE table person(
    id int not NULL ,
    name VARCHAR(100));
insert into person 
values   
  (1, 'John'),
  (2, 'Maria')

SELECT * from  person

insert into person
select NULL, 'Josh';

alter TABLE person
add UNIQUE (id);

-- Primary key
-- not null, unique combined

drop table if EXISTS person;
CREATE TABLE person(
    id int primary KEY,
    name VARCHAR(50)
);
insert into person
VALUES (1, 'John');


--Foreign key

CREATE table department(
   id int PRIMARY key,
   name VARCHAR(50)
);

CREATE table person(
    id int PRIMARY KEY,
    deparment_id int FOREIGN KEY references department(id),
    name VARCHAR(50)
);

insert into department
VALUES
    (1, 'HR'),
    (2, 'Marketing'),
    (3, 'IT');

SELECT * from department    

INSERT into person(id, name, deparment_id)
VALUES
(111, 'John', 1 ),
(112, 'Bob', 3 ),
(113, 'Mark', 2 ),
(114, 'Elizabet', 1 ),
(115, 'Tom', 2);
INSERT into person
VALUES(116, 5, 'Mike' );

select * from person
SELECT * from department 


--Check constraint
--Default

drop table if EXISTS employee;
CREATE table employee(
    id int PRIMARY key, 
    name VARCHAR(100),
    age int CHECK(age>0),
    email VARCHAR(244) DEFAULT 'no email'
)
insert into employee(id, name, age)
VALUES (3, 'Jemie', 2 );
select * from employee

--identity

create table me(
    id int IDENTITY,
    name VARCHAR(10), 
    age int check(age >0),
)

insert into me
VALUES( 'Samadjon', 19)
SELECT * from me