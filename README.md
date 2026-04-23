# SQL and Data Management Learning Journey

This repository is my personal SQL exploration through a textbook-style tutorial.
I am learning chapter by chapter, writing examples, and documenting what I understand in my own words.

## Learning Map

- `01_introduction/`
  - First steps with SQL basics and a simple Python query example.

- `02_database_management/`
  - Core SQL operations: data types, DDL/DML/DQL, keys, constraints, and referential integrity.

- `03_complex_queries/`
  - Intermediate query work: filtering logic, NULL rules, operators, functions, aggregates, joins, and views.

- `04_Database_Design/`
  - Database design concepts from the textbook: ER modeling, cardinality, strong/weak entities, subtype/supertype, and normalization.

- `05_Indexes/`
  - Notes and practice on table structures and indexing fundamentals.

## What This Repo Is

- A textbook tutorial notebook in repository form
- My hands-on SQL practice space
- A running log of what I learned as I move through each module

## How I Use This Repo

- I follow topics in order, like textbook chapters
- Each major topic/module gets its own folder
- I keep both practice SQL files and concept notes
- I rewrite ideas in plain language so I can actually retain them

## Safety Habit While Practicing SQL

- I test rows with `SELECT` first before running `UPDATE`, `DELETE`, or `DROP`
- For risky changes, I use transactions
- `ROLLBACK` undoes changes in an open transaction
- `COMMIT` saves changes permanently
