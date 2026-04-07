-- SQL Sublanguages Examples
-- This file contains examples of different SQL sublanguages as shown in Table 2.1.1

-- Data Definition Language (DDL)
-- Defines database structure and schema
-- Used to create, modify, and delete database objects
CREATE TABLE City (
    ID INTEGER, 
    Name VARCHAR(15), 
    Population INTEGER
);

-- Data Query Language (DQL)
-- Retrieves data from the database
-- Used to query and fetch data based on specific criteria
SELECT Name 
FROM City 
WHERE Population > 15000;

-- Data Manipulation Language (DML)
-- Inserts, updates, and deletes data in the database
-- Used to manage data within database objects
INSERT INTO City VALUES (100, 'Geneva', 206000);

-- Data Transaction Language (DTL)
-- Manages transactions to ensure data integrity
-- Used to control transaction processing
START TRANSACTION;
COMMIT;

-- Data Control Language (DCL)
-- Specifies user access permissions and security
-- Used to grant or revoke privileges and manage users
CREATE USER 'jordan';
GRANT ALL ON sakila.actor TO 'jordan';