# Week 2: SQL Sublanguages

This week I learned the core SQL sublanguages and what each one is used for.

## What I Learned So Far

- `DDL` (Data Definition Language): defines database structure.
  - Example: `CREATE TABLE City (ID INTEGER, Name VARCHAR(15), Population INTEGER);`
- `DQL` (Data Query Language): retrieves data.
  - Example: `SELECT Name FROM City WHERE Population > 15000;`
- `DML` (Data Manipulation Language): inserts, updates, and deletes data.
  - Example: `INSERT INTO City VALUES (100, 'Geneva', 206000);`
- `DTL` (Data Transaction Language): manages transactions.
  - Example: `START TRANSACTION; COMMIT;`
- `DCL` (Data Control Language): controls user access and permissions.
  - Example: `CREATE USER 'jordan'; GRANT ALL ON sakila.actor TO 'jordan';`

## Week 2 Goal

Use each SQL sublanguage in small hands-on exercises so the differences between them are clear.
