# Week 2: SQL Sublanguages

This week I learned the core SQL sublanguages and what each one is used for.

## What I Learned in `01_core_concepts.sql`

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

## What I Learned in `02_sublanguages.sql`

- Practiced `DDL` by creating a table structure for `City`.
  - Example: `CREATE TABLE City (ID INTEGER, Name VARCHAR(15), Population INTEGER);`
- Practiced `DQL` by reading data with a condition.
  - Example: `SELECT Name FROM City WHERE Population > 15000;`
- Practiced `DML` by inserting a new row into a table.
  - Example: `INSERT INTO City VALUES (100, 'Geneva', 206000);`
- Practiced transaction control with `DTL` to make changes reliable.
  - Example: `START TRANSACTION; COMMIT;`
- Practiced `DCL` by creating a user and granting permissions.
  - Example: `CREATE USER 'jordan'; GRANT ALL ON sakila.actor TO 'jordan';`

## What I on 03_datatypes.sql

- Understood the purpose of `IF NOT EXISTS` and `IF EXISTS` in SQL.
  - `CREATE TABLE IF NOT EXISTS` prevents errors when rerunning scripts.
  - `DROP TABLE IF EXISTS` safely removes tables only if they exist.

- Learned that square brackets `[ ]` in documentation mean optional syntax, not something to type in SQL.

- Practiced creating a full table with proper data types and inserting multiple rows.

- Understood the importance of matching data types with inserted values.
  - Example: using `DECIMAL` instead of `INT` for values with decimals.

- Learned about binary data and `BLOB`.
  - `BLOB` stores large files like images, PDFs, and documents.
  - One file = one BLOB.
  - Real-world systems usually store files outside the database and save only the file path.

- Learned MySQL-specific integer types and their storage limits:
  - `TINYINT`, `SMALLINT`, `MEDIUMINT`, `INT`, `BIGINT`
  - More bytes = larger range of values.

- Understood `SIGNED` vs `UNSIGNED`:
  - `SIGNED` → allows negative values
  - `UNSIGNED` → only positive values, larger max range

- Learned how to choose the optimal data type:
  - Always use the smallest data type that fits the required range.
  - Avoid overusing larger types like `BIGINT` unless necessary.

- Practiced selecting appropriate data types based on requirements:
  - `SMALLINT UNSIGNED` for limited numeric ranges
  - `VARCHAR` for variable-length text
  - `CHAR` for fixed-length values
  - `DATETIME` for date and time
  - `FLOAT` for approximate decimal values with smaller storage

## What I on 04_inserting_updating_default.sql

- `INSERT INTO` → used to add new rows into a table
- Can specify column names (best practice) or rely on table order

- Learned that:
  - Column order must match when omitting column names
  - Multiple rows can be inserted in a single statement

- `DEFAULT` → assigns a value automatically if none is provided
  - Prevents missing data issues
  - Example: Salary defaults to `0.00`

- Understood behavior:
  - With `DEFAULT` → value is auto-filled
  - Without `DEFAULT` → becomes `NULL`
  - With `NOT NULL` and no value → causes error

- `UPDATE` → modifies existing records
  - `SET` used to change column values

- Learned critical rule:
  - With `WHERE` → updates specific rows
  - Without `WHERE` → updates ALL rows (dangerous)

- Practiced:
  - Updating multiple columns at once
  - Verifying data before running updates

## Week 2 Goal

Use each SQL sublanguage in small hands-on exercises so the differences between them are clear.
