# SQL and Data Management Learning Journey

This repository tracks my SQL and data management progress by week.

## Structure

- `01_introduction/`
  - Beginner SQL and Python database practice.
  - Includes its own `README.md`.
- `02_database_management/`
  - SQL database management concepts and practice files.
  - Includes its own `README.md`.
- `03_complex_queries/`
  - Reserved for upcoming advanced query practice.

## What I Learned So Far

### 01_introduction

- `sql/01_bankusers_table.sql`
  - Created a basic table and practiced core data types (`INT`, `VARCHAR`, `DATE`, `DECIMAL`).

- `sql/02_sakila_basics.sql`
  - Practiced database navigation (`SHOW DATABASES`, `USE`, `SHOW TABLES`) and data reading with `SELECT`.

- `python/01_book_query_example.py`
  - Practiced running a SQL query from Python and printing results.

### 02_database_management

- `01_core_concepts.sql`
  - Learned core SQL terms and command types, plus basics of `SELECT`, `INSERT`, quoting, and schemas.

- `02_sublanguages.sql`
  - Practiced all five SQL sublanguages: `DDL`, `DQL`, `DML`, `DTL`, and `DCL`.

- `03_datatypes.sql`
  - Practiced safe table setup and choosing practical data types, including `UNSIGNED` usage.

- `04_inserting_updating_default_delete.sql`
  - Practiced `INSERT`, `DEFAULT`, `UPDATE`, and `DELETE`, with emphasis on safe use of `WHERE`.

- `05_primarykey_foreignkey.sql`
  - Practiced `PRIMARY KEY`, composite key, `FOREIGN KEY`, `AUTO_INCREMENT`, and insert/value matching rules.

- `06_referential_integrity.sql`
  - Practiced parent-child integrity and referential actions (`RESTRICT`, `CASCADE`, `SET NULL`, `SET DEFAULT`).

- `07_constraints.sql`
  - Practiced creating and managing constraints (`UNIQUE`, `CHECK`, `NOT NULL`) and MySQL-specific drop rules.

## How I Use This Repo

- Each week gets its own folder
- Each week folder includes a dedicated `README.md`
- Practice files are grouped by topic/language for easier review

## Transactions, Rollback, and Commit

- For risky SQL changes, use transactions so changes can be undone.
- `ROLLBACK` undoes changes inside an open transaction.
- `COMMIT` saves changes permanently.
- Without a transaction, many changes cannot be undone.
- Always test the target rows with `SELECT` first before running `UPDATE`, `DELETE`, or `DROP`.
