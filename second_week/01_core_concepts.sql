-- Week 2 Notes: New SQL Concepts

-- 1) Statement vs Clause vs Expression
-- Statement = full SQL command
SELECT * FROM actor;

-- Clause = part of a statement (SELECT, FROM, WHERE)
-- Expression = logic/condition used inside a clause
SELECT FirstName
FROM Student
WHERE age > 30;

-- 2) SELECT (READ ONLY)
-- Gets data only (does NOT change data)
-- You can filter by columns that are not in SELECT
SELECT FirstName
FROM Student
WHERE LastName = 'Smith';

-- 3) Syntax Symbols (documentation notation, not executable SQL)
-- []  = optional
-- {}  = choose one
-- |   = OR
-- ... = repeat values
-- Example notation:
-- SELECT [DISTINCT] column_name FROM table_name;
-- ORDER BY {ASC | DESC};

-- 4) INSERT (ADD DATA)
-- Table must already exist
INSERT INTO City (ID, Name)
VALUES (1, 'A'), (2, 'B');

-- 5) Quotes
-- Strings must use single quotes
-- Correct:
SELECT *
FROM Student
WHERE LastName = 'Smith';

-- Incorrect (example only):
-- WHERE LastName = Smith;

-- 6) Schema
-- A schema is like a folder inside a database; it contains tables
CREATE SCHEMA school;
CREATE TABLE school.Student (
    ID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- 7) SQL Standard Parts
-- SQL standard = set of SQL features/rules (not a network protocol)
-- Database systems implement these features in their own engines.

-- 8) Command Types
-- SELECT  -> read data
-- INSERT/UPDATE/DELETE -> modify data
-- CREATE  -> define structure
-- GRANT   -> permissions