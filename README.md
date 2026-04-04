# SQL and Data Management Learning Journey

This repository tracks my SQL and data management progress by week.

## Structure

- `first_week/`
  - First week practice with SQL basics and a Python query example.
  - Includes its own `README.md` with details.
- `second_week/`
  - Week 2 learning focused on SQL sublanguages (DDL, DQL, DML, DTL, DCL).
  - Includes its own `README.md` with examples.

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
