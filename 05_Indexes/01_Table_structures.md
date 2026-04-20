# 🧱 5.1 Table Structures — COMPLETE REVIEWER (WGU D426)

## 📌 Definition

A **table structure** is how rows are **physically stored in blocks on storage media**.

> 💡 Key idea:

- Logical table = what you see (rows/columns)
- Physical structure = how it's stored (performance impact)

---

## 🧠 Storage Fundamentals (IMPORTANT)

- Data is stored in **blocks**
- Each block contains multiple rows
- Structure affects:
  - Insert speed
  - Query speed
  - Update/delete efficiency

---

## 🔥 4 Table Structures (CORE)

1. Heap Table
2. Sorted Table
3. Hash Table
4. Table Cluster

> Each table can use a different structure
> DB assigns default, but can be overridden for optimization

---

# 1️⃣ HEAP TABLE

## 📌 Definition

- Rows stored with **NO ORDER**

---

## ⚙️ How It Works

- DB tracks:
  - Blocks assigned to table
  - **Pointer to first free space**

---

## 🔁 Insert Behavior

- Insert goes to:
  - First free space
  - OR new block if full

---

## 🗑️ Delete Behavior

- Deleted space becomes **free**
- Free spaces are linked as a **linked list**

---

## 🧠 CRITICAL (FROM ZYBOOKS)

> Free space is tracked as a **linked list**

- Free space pointer → first available spot
- Each free space → points to next

---

## ⚡ Performance

### ✅ Pros

- Very fast inserts
- Best for **bulk load**

### ❌ Cons

- Slow for:
  - Ordered queries
  - Range queries

---

## 🧠 USE CASE

- Bulk inserts first, then restructure later

---

## 🧪 Exercise Insight (IMPORTANT)

**Insert order in heap:**

- Always follows **free space pointer chain**
- After space is filled → move to next
- If full → allocate **new block**

---

# 2️⃣ SORTED TABLE

## 📌 Definition

- Rows stored in **order of sort column**

---

## ⚙️ Sort Column

- Usually:
  - Primary key
  - OR multiple columns

> ❗ NOT limited to one column

---

## 🧠 Storage Behavior

- Blocks contain rows within a **range of values**
- Rows within block are **ordered**

---

## ⚠️ Insert Problem

- Maintaining order by shifting rows = ❌ slow

---

## 🔥 Solution (VERY IMPORTANT)

> Uses **linked pointers between rows**

- Rows are NOT physically moved
- Only **2 pointer updates**

---

## 🔁 Insert Behavior

- Insert placed anywhere physically
- Logical order maintained via links

---

## ⚠️ Block Split (VERY TESTED)

When block is full:

- Split into 2 blocks
- Half rows moved

### RESULT:

> Both blocks ≈ **50% full**

---

## ⚡ Performance

### ✅ Pros

- Fast:
  - Range queries
  - ORDER BY
  - JOIN on sort column

### ❌ Cons

- Slower inserts and updates

---

## 🧠 USE CASE (FROM EXERCISE)

> Best approach:

- Use **heap table for bulk load**
- Then convert to **sorted table**

---

# 3️⃣ HASH TABLE

## 📌 Definition

- Rows stored in **buckets using hash function**

---

## 🧠 Core Concepts

### 🔹 Bucket

- Block or group of blocks

### 🔹 Hash Key

- Column used to determine location

### 🔹 Hash Function

- Maps key → bucket

---

## 🔢 Example (Modulo)

Steps:

1. Convert key to integer
2. Divide by # of buckets
3. Remainder = bucket

---

## 🔁 Insert Behavior

- Compute bucket
- Insert into that bucket

---

## ⚠️ Bucket Overflow (VERY IMPORTANT)

When full:

- New block is created
- Linked to bucket

> Creates **chain of blocks**

---

## 🚨 Deep Buckets

- Too many rows → long chains
- Slows down access

---

## 🔄 Solution

> **Dynamic hashing**

- Adds more buckets
- Redistributes rows

---

## ⚡ Performance

### ✅ Pros

- Very fast:
  - Inserts
  - Deletes
  - Exact match queries

### ❌ Cons

- Slow:
  - Range queries
  - Multi-row scans

---

## 🧪 Exercise Insights

- Rows per bucket = block size / row size
- Total capacity = buckets × rows per block
- Worst case → ALL rows in one bucket
- Overflow → new block added (no split)

---

# 4️⃣ TABLE CLUSTER

## 📌 Definition

- Stores **multiple tables together physically**

---

## 🧠 Cluster Key

- Column shared by all tables
- Usually:
  - PK in one table
  - FK in another

---

## ⚙️ Behavior

- Rows with same cluster key are stored together
- Tables are **interleaved**

---

## ⚡ Performance

### ✅ Pros

- Very fast:
  - Joins on cluster key

### ❌ Cons

- Slow:
  - Other joins
  - Single table scans
  - Updates to cluster key

---

## 🚫 Important

- Not commonly used
- Can have **more than 2 tables**

---

## 🧪 Exercise Insights

- Cluster key ≠ always PK of both tables ❌
- Cluster ≠ most common ❌
- Cluster key ≈ sort column ✅
- Can include 3+ tables ✅

---

# ⚠️ HIGH-YIELD COMPARISON

| Structure | Insert    | Range Query | Exact Lookup | Best Use          |
| --------- | --------- | ----------- | ------------ | ----------------- |
| Heap      | 🔥 Fast   | ❌ Slow     | ❌           | Bulk load         |
| Sorted    | ❌ Slower | 🔥 Fast     | ✅           | Ordered reads     |
| Hash      | 🔥 Fast   | ❌ Terrible | 🔥 Fast      | Exact match       |
| Cluster   | ❌ Mixed  | ❌          | ❌           | Join optimization |

---

# 🧠 MUST-KNOW FOR OA

## Heap

- No order
- Free space = **linked list**
- Insert = first available space

---

## Sorted

- Maintains order via **pointers**
- Block split → **50% full each**
- Can use **multiple columns**

---

## Hash

- Uses **hash function**
- Bucket overflow → **linked blocks**
- Bad for range queries

---

## Cluster

- Uses **cluster key**
- Best for joins on that key
- Not common
- Can have multiple tables

---

# 🧠 FINAL MENTAL MODEL

- Heap = messy pile
- Sorted = organized shelf
- Hash = labeled buckets
- Cluster = grouped by relationship

---

# 🚀 STRATEGY FOR OA

When you see a question, ask:

- Bulk insert? → Heap
- Range / ORDER BY? → Sorted
- WHERE id = ? → Hash
- Join optimization? → Cluster

---

This is EVERYTHING you need for 5.1. If you understand this, you will pass the OA questions for this section.
