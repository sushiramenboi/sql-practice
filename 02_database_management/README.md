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

## What I on 04_inserting_updating_default_delete.sql

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

- `DELETE FROM` → removes rows from a table

- Learned that:
  - `WHERE` determines which rows are deleted
  - Without `WHERE` → ALL rows are deleted (very dangerous)

- Practiced:
  - Updating multiple columns at once
  - Deleting single and multiple rows
  - Verifying data before running updates or deletes

## What I learned on 05_primarykey_foreignket.sql

- `PRIMARY KEY` → uniquely identifies each row in a table
- Cannot be `NULL` and cannot be duplicated

- Learned that:
  - Each row must have a unique identity
  - Used for main identifiers like `ID`

- `COMPOSITE KEY` → uses multiple columns to ensure uniqueness
- Example: `(ID, Number)`

- Learned that:
  - One column alone may not be unique
  - Combination of columns must be unique together
  - `(ID, Relationship)` may fail if values repeat

- `FOREIGN KEY` → links one table to another
- Ensures data integrity between tables

- Learned that:
  - Value must exist in the referenced (parent) table
  - Prevents invalid or orphan records
  - Used to model relationships (1-to-many)

- `PRIMARY KEY vs FOREIGN KEY`

- Understood that:
  - `PRIMARY KEY` → identifies the row
  - `FOREIGN KEY` → connects rows between tables
  - Both serve different purposes and are used together

- `AUTO_INCREMENT` → automatically generates unique IDs

- Learned that:
  - Database assigns values (1, 2, 3...)
  - No need to manually insert IDs
  - Manual insertion is allowed but risky

- `INSERT rules` → column and value matching

- Learned that:
  - Column count must match value count
  - Order matters when columns are not specified
  - Best practice: always specify column names

- `UNSIGNED` → prevents negative values

- Learned that:
  - Only allows positive numbers (0 and above)
  - Useful for IDs, counts, and quantities
  - Increases positive value range

## What I learned on 06_referential_integrity.sql

- `REFERENTIAL INTEGRITY` → ensures relationships between tables stay valid
- Prevents foreign keys from referencing non-existent rows

- Learned that:
  - Child table depends on parent table
  - Foreign key must match a primary key in the parent table
  - Prevents invalid or orphan records

---

- `FOREIGN KEY ACTIONS` → rules that control what happens when parent data changes

- Learned that:
  - Triggered on `DELETE` or `UPDATE`
  - Automatically handle dependent rows
  - Used to enforce database behavior based on business logic

---

- `RESTRICT` → blocks the action

- Learned that:
  - Cannot delete/update parent if child rows still reference it
  - Forces manual cleanup first
  - Safest option to prevent accidental data loss

---

- `CASCADE` → propagates the same action

- Learned that:
  - Does NOT copy or duplicate data
  - Applies the same action to child rows
  - `DELETE` → removes related child rows
  - `UPDATE` → updates foreign key values
  - Can be powerful but risky if misused

---

- `SET NULL` → removes the relationship

- Learned that:
  - Child row stays
  - Foreign key becomes `NULL`
  - Column must allow NULL
  - Used when relationship is optional

---

- `SET DEFAULT` → assigns a fallback value

- Learned that:
  - Foreign key becomes default value
  - Keeps row but replaces the reference
  - Depends on database support

---

- `ON DELETE vs ON UPDATE`

- Learned that:
  - `ON DELETE` → runs when parent row is deleted
  - `ON UPDATE` → runs when parent key changes
  - Both maintain consistency between tables

---

- `REFERENTIAL INTEGRITY IN PRACTICE`

- Learned that:
  - Keeps data consistent automatically
  - Prevents broken relationships
  - Choice depends on business rules:
    - Critical data → `RESTRICT`
    - Dependent data → `CASCADE`
    - Optional relationships → `SET NULL`

---

- `MENTAL MODEL`

- Understood that:
  - `RESTRICT` → block the action
  - `CASCADE` → pass the action down
  - `SET NULL` → remove the link
  - `SET DEFAULT` → replace the link

## What I learned on 07_constraints.sql

- `CONSTRAINTS` → rules that control what data is allowed in a table
- Prevent invalid, duplicate, or inconsistent data from being stored

- Learned that:
  - Constraints enforce data integrity automatically
  - Data must satisfy constraints or it gets rejected
  - Constraints act like a validation layer before insertion

---

- `PRIMARY KEY` → unique identifier for each row

- Learned that:
  - Cannot contain duplicate values
  - Cannot contain NULL values
  - Each table should have one primary key
  - Used to uniquely identify records

---

- `NOT NULL` → ensures a column must have a value

- Learned that:
  - Prevents empty (NULL) values
  - Acts as a required field
  - Must be added by modifying the column (CHANGE in MySQL)

---

- `UNIQUE` → ensures no duplicate values (or combinations)

- Learned that:
  - Can be applied to a single column or multiple columns
  - Composite UNIQUE ensures combinations are unique
  - Does NOT prevent NULL values (unless specified)
  - In MySQL, UNIQUE is implemented as an INDEX

---

- `CHECK` → enforces a condition on values

- Learned that:
  - Data must satisfy a logical condition (e.g. Age > 18)
  - Can be named using CONSTRAINT
  - Rejects invalid data before insertion
  - NULL values may still pass (treated as UNKNOWN)

---

- `IN` (used in CHECK) → limits values to a specific list

- Learned that:
  - Works like multiple OR conditions
  - Used to restrict allowed values (e.g. 'small', 'medium', 'large')
  - Helps simulate controlled inputs (like dropdowns)

---

- `CONSTRAINT NAMING` → giving a custom name to a rule

- Learned that:
  - Helps identify and manage constraints later
  - Required when dropping or modifying constraints
  - Syntax: CONSTRAINT name TYPE (...)

---

- `ALTER TABLE` → modifies an existing table

- Learned that:
  - Used to add or remove constraints
  - Used to modify column definitions
  - Does NOT create or delete tables

---

- `ADDING CONSTRAINTS`

- Learned that:
  - Named constraints use ADD CONSTRAINT
  - Example: ADD CONSTRAINT name CHECK (...)
  - Fails if existing data violates the constraint

---

- `DROPPING CONSTRAINTS`

- Learned that:
  - Different syntax depending on constraint type (MySQL-specific)
  - PRIMARY KEY → DROP PRIMARY KEY
  - FOREIGN KEY → DROP FOREIGN KEY name
  - UNIQUE → DROP INDEX name
  - CHECK → DROP CHECK name

---

- `COLUMN CONSTRAINTS VS NAMED CONSTRAINTS`

- Learned that:
  - NOT NULL and DEFAULT are part of the column
  - Must use CHANGE to modify them
  - Other constraints (CHECK, UNIQUE, FK) are separate objects

---

- `CHANGE (COLUMN MODIFICATION)`

- Learned that:
  - Used to redefine a column
  - Required for adding/removing NOT NULL
  - Syntax: CHANGE oldName newName newDefinition

---

- `INFORMATION_SCHEMA` → database metadata system

- Learned that:
  - Stores information about tables and constraints
  - Used to inspect constraint names
  - Helps when modifying or debugging constraints

---

- `CONSTRAINT PURPOSE`

- Learned that:
  - Ensures data consistency and reliability
  - Prevents bad or invalid data from entering the system
  - Acts as a safeguard for database integrity

## Week 2 Goal

Use each SQL sublanguage in small hands-on exercises so the differences between them are clear.
