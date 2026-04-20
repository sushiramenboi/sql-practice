# 5.2 Single-Level Indexes

## 📌 Definition

A **single-level index** is a file that stores:

- **column values**
- **pointers** to the rows containing those values

The pointer identifies the **block** containing the row, and sometimes the exact row location inside that block.

---

## 🧠 Core Idea

Indexes help the database find rows faster.

Instead of scanning the whole table, the database can:

1. Look in the index
2. Find the value
3. Follow the pointer to the correct row or block

---

# Sorted Index vs Sorted Table

These are **not the same**.

- A **sorted index** means the **index entries** are in sorted order.
- A **sorted table** means the **actual table rows** are physically stored in sorted order.

> Example:  
> A heap table can be unsorted, but its index can still be sorted.

---

# Unique vs Non-Unique Indexed Columns

## Unique column

If the indexed column is unique:

- one index entry per value

## Non-unique column

If the indexed column is not unique, the index can work in two ways:

### Option A: Duplicate values

Each duplicate value appears more than once, with one pointer each.

### Option B: One value with multiple pointers

The value appears once, followed by multiple pointers.

### Advantage of Option B

- **Index is more compact**

---

# Multi-Column Index

An index can be created on more than one column.

In that case, each entry contains a **combination of values** from the indexed columns.

Aside from that, it behaves like a regular single-column index.

---

# Query Processing

To execute a `SELECT`, the database can use either:

## Table scan

Reads table blocks directly without using an index.

## Index scan

Reads index blocks first, then follows pointers to the needed table blocks.

---

# Hit Ratio / Selectivity

## Definition

**Hit ratio** (also called **filter factor** or **selectivity**) is:

> the percentage of table rows selected by the query

---

## Rule

- **High hit ratio** → use **table scan**
- **Low hit ratio** → use **index scan**

### Why?

If many rows are needed, scanning the whole table is often better.

If only a few rows are needed, using the index is faster.

---

# When the Database Uses an Index

The database uses an index scan when:

- the `WHERE` clause contains an **indexed column**
- the **hit ratio is low**

Then the DB:

1. scans the index
2. finds matching values
3. reads the corresponding table blocks

---

# When the Database Uses a Table Scan

A table scan happens when:

- there is **no index** on the column in the `WHERE` clause
- or the **hit ratio is high**
- or there is **no WHERE clause**

---

# Binary Search on a Sorted Index

If the index is sorted, the database can use **binary search**.

## How binary search works

1. Check the middle of the index
2. Decide whether the value is in the left half or right half
3. Repeat until found

This is much faster than scanning the entire index from beginning to end.

---

# Primary and Secondary Indexes

## Primary index

A **primary index** (also called a **clustering index**) is:

> an index on the **table sort column**

- the table is sorted on that column
- usually created on the primary key
- a table can only have **one** primary index

## Secondary index

A **secondary index** (also called a **nonclustering index**) is:

> an index that is **not** on the table sort column

- a table can have **many** secondary indexes
- all indexes on heap or hash tables are secondary

---

# Dense and Sparse Indexes

## Dense index

A dense index has:

> **one entry for every table row**

### Key points

- can be created on any column
- required when the table is **not sorted** on the indexed column
- secondary indexes are always **dense**

---

## Sparse index

A sparse index has:

> **one entry for every table block**

### Key points

- only works when the table is **sorted on the indexed column**
- usually used for **primary indexes**
- smaller and faster than dense indexes

---

# Why Sparse Indexes Work

Because the table is sorted.

Even if a value does **not appear directly** in the sparse index, the database can still determine which block contains it by using sort order.

### Example

If the sparse index contains:

- `ATL`
- `FRA`
- `ORD`

and the database is looking for `LAX`:

- `LAX` comes after `FRA`
- `LAX` comes before `ORD`

So `LAX` must be in the block pointed to by `FRA`.

> Sparse index = helps find the **correct block**, not always the exact row

---

# Dense vs Sparse Summary

| Type   | Entry For   | Works On           | Common Use        |
| ------ | ----------- | ------------------ | ----------------- |
| Dense  | Every row   | Any indexed column | Secondary indexes |
| Sparse | Every block | Sort column only   | Primary indexes   |

---

# Why Sparse Indexes Are Faster

Sparse indexes have:

- fewer entries
- fewer blocks
- smaller size
- better chance of staying in main memory

Because of that, sparse indexes are often much faster than dense indexes.

---

# Inserts, Updates, and Deletes

## Insert

When a row is inserted:

- a new index entry may be needed
- because the index is sorted, the new entry must go in the correct place

If the correct index block is full:

- the block **splits**
- about half the entries move to a new block
- then the new entry is inserted

### Important idea

Indexes do **not** become bad at searching over time.

Instead:

- **reads stay fast**
- **writes become more expensive to maintain**

---

## Delete

When a row is deleted, the corresponding index entry must also be deleted.

Two possibilities:

### Physically remove the entry

- requires shifting later entries
- slower

### Mark entry as deleted

- more common
- database may later reorganize the index

---

## Update

### If the updated column is not indexed

- the index is unaffected

### If the updated column is indexed

- the old entry is deleted
- a new entry is inserted

So an update behaves like:

> **delete + insert**

That means an update can also cause a **block split**.

---

# Dense vs Sparse Maintenance

## Dense index

Changes happen more often because there is one entry per row.

## Sparse index

Changes happen less often because entries correspond to blocks, not rows.

Sparse index entries are only inserted or deleted when blocks split or merge.

---

# Exercise Answers / Key Takeaways

## 5.2.2 Single-level indexes

### 1) Which index entry refers to Air China flight 1107?

- **The sixth entry**
- Because flight 1107 departs from **HKG**, and the sixth index entry is `HKG`

### 2) Lufthansa flight 44 from Munich (`MUC`) is inserted. Where does the new index entry go?

- **Between `LAX` and `ORD`**
- Because the index is sorted alphabetically on `DepartureAirport`

### 3) Index entry = 12 bytes, pointer = 8 bytes, block = 4 KB. How many rows per index block?

- Entry size = `12 + 8 = 20 bytes`
- `4000 / 20 ≈ 200`
- **Answer: about 200**

### 4) What is the advantage of storing one value with multiple pointers?

- **The index is more compact**

---

## 5.2.4 Query processing with single-level indexes

Scenario:

- table occupies **2,000 blocks**
- index occupies **200 blocks**
- query uses `WHERE FlightNumber = 3988`
- query uses an **index scan**

### 1) Maximum number of blocks needed

- **201**
- at most 200 index blocks + 1 table block

### 2) Minimum number of blocks needed

- **2**
- 1 index block + 1 table block

### 3) If there were no index, maximum blocks needed

- **2,000**
- full table scan

---

## 5.2.6 Dense and sparse indexes

### Main lessons

- If the table is **not sorted** on the indexed column, the index must be **dense**
- If the table **is sorted** on the indexed column, the index **may be sparse**
- A value like `LAX` may not appear in a sparse index, but its block can still be determined from sort order

---

## 5.2.7 Primary and secondary indexes

### Dense index

- **Index with one entry for each table row**

### Sparse index

- **Index with one entry for each table block**

### Primary index

- **Index on the table sort column**

### Secondary index

- **Index that is not on the table sort column**

---

## 5.2.9 Inserts, updates, and deletes

### 1) Inserts to a sorted table are always faster when the table has no indexes

- **False**
- Indexes may slow inserts because new entries must be added
- But an index on the sort column can help find the correct block

### 2) Inserts to a heap table are always faster when the table has no secondary indexes

- **True**
- Heap table inserts go to the end
- Secondary indexes add maintenance work and do not help insertion location

### 3) Most large tables have a primary index

- **True**
- Primary indexes are usually sparse, compact, and fast

### 4) A table update may cause an index block split

- **True**
- Updating an indexed column behaves like delete + insert

---

# Important OA Rules to Memorize

## Rule 1

If the table is **not sorted** on the indexed column, the index must be **dense**.

## Rule 2

If the table **is sorted** on the indexed column, the index may be **sparse**.

## Rule 3

Primary indexes are usually **sparse**.

## Rule 4

Secondary indexes are always **dense**.

## Rule 5

A low hit ratio favors an **index scan**.

## Rule 6

A high hit ratio favors a **table scan**.

## Rule 7

If the `WHERE` clause does not contain an indexed column, the DB must do a **table scan**.

## Rule 8

An update on an indexed column behaves like:

- delete old index entry
- insert new index entry

## Rule 9

Dense sorted indexes may require **block splits** on insert.

## Rule 10

Sparse indexes find the **right block**, not necessarily the exact row.

---

# Mental Model

## Dense index

> every row gets an index entry

## Sparse index

> every block gets an index entry

## Primary index

> index on the sort column

## Secondary index

> index on a non-sort column

## Table scan

> read the table directly

## Index scan

> read the index first, then the table blocks

---

# Final Summary

Single-level indexes improve query performance by storing sorted column values and pointers to rows or blocks. The database chooses between a table scan and an index scan based largely on hit ratio and whether the `WHERE` clause uses an indexed column. Primary indexes are on the sort column and are usually sparse. Secondary indexes are on non-sort columns and are always dense. Dense indexes have one entry per row, while sparse indexes have one entry per block and only work on sorted tables. Inserts, deletes, and updates require index maintenance, and inserts or updates may trigger block splits in dense sorted indexes.

---

# Quick Review Checklist

Make sure you can explain:

- what a single-level index stores
- sorted index vs sorted table
- unique vs non-unique index behavior
- dense vs sparse index
- primary vs secondary index
- hit ratio / selectivity
- table scan vs index scan
- why binary search is faster
- why sparse indexes can skip values like `LAX`
- why inserts/updates may cause block splits
