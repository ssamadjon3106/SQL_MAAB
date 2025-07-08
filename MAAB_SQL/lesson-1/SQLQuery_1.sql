CREATE DATABASE class1;
GO
USE class1;

CREATE TABLE test(
    id INT, 
    name VARCHAR(100)
);

INSERT INTO test
VALUES
(1, 'hello'),
(2, 'Bob');

SELECT * FROM class1.dbo.test;
