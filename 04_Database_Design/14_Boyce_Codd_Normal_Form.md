# 🏆 Boyce-Codd Normal Form (BCNF) — Complete Guide

---

## 📌 Functional Dependency

A **functional dependency** means one column determines another.

```
B → A
```

👉 Meaning:

- Each value of **B** is associated with **at most one value of A**

### Example:

```
PassengerNumber → PassengerName
```

- One passenger number = one name

---

## ⚠️ Redundancy (THE PROBLEM)

### 📌 Definition

**Redundancy = repeated data**

Occurs when:

> A column depends on a column that is **NOT unique**

### 🚨 Why it's bad:

- Wastes storage
- Causes update issues
- Leads to inconsistent data

---

## 🔑 Key Rule (MEMORIZE)

> If a column depends on a **non-unique column → redundancy occurs**

---

## 🧠 Unique vs Non-Unique Columns

### ✅ Unique Columns:

- No duplicate values
- Examples:
  - Primary keys
  - Candidate keys

### ❌ Non-Unique Columns:

- Can have duplicates
- Most regular columns fall here

---

## 🔑 Candidate Key

### 📌 Definition:

A column (or combination) that is:

- **Unique**
- **Minimal** (nothing can be removed)

### Example:

```
(PassengerNumber, FlightCode)
```

---

## 📌 Non-Key Column

A column that is **NOT part of any candidate key**

---

## 🧠 Third Normal Form (3NF)

### 📌 Definition:

A table is in **3NF** if:

> Whenever a **non-key column A depends on column B → B must be UNIQUE**

---

### ⚠️ Limitation of 3NF:

- Only checks **non-key columns**
- Some redundancy may still exist

---

## 🏆 Boyce-Codd Normal Form (BCNF)

### 📌 Definition:

A table is in **BCNF** if:

> For **EVERY dependency** `B → A`, **B must be UNIQUE**

---

## 🔥 Difference: 3NF vs BCNF

| 3NF                             | BCNF                                                   |
| ------------------------------- | ------------------------------------------------------ |
| Applies to non-key columns only | Applies to ALL columns                                 |
| Allows some redundancy          | Eliminates ALL redundancy from functional dependencies |

---

## 🚨 GOLD RULE (MEMORIZE)

> If ANY dependency uses a **non-unique column → NOT BCNF**

---

## 🔍 How to Analyze a Table (OA METHOD)

### Step 1: Identify dependencies

Look for relationships:

```
PassengerNumber → PassengerName
FareClass → BoardingZoneNumber
```

---

### Step 2: Check the LEFT side (determinant)

- If **unique** → ✅ OK
- If **not unique** → ❌ redundancy

---

### Step 3: Decide

- If ANY violation exists → **NOT BCNF**

---

## ✈️ Example (Booking Table)

### Primary Key:

```
(PassengerNumber, FlightCode)
```

### Dependency:

```
PassengerNumber → PassengerName
```

### Problem:

- PassengerNumber is **NOT unique**
- Same passenger appears multiple times

### Result:

❌ Redundancy (repeated names)

---

## 🔥 Another Example

```
TaskName → ProjectName
```

If:

- TaskName is NOT unique

➡️ This creates redundancy
➡️ NOT BCNF

---

## 🔧 Fix (Decomposition)

### ❌ Bad Table:

```
EmployeeProjectTask(EmployeeID, ProjectName, TaskName)
```

---

### ✅ Split into:

```
EmployeeTask(EmployeeID, TaskName)
TaskProject(TaskName, ProjectName)
```

---

### 💡 Why this works:

- Removes dependency on non-unique column
- Eliminates redundancy

---

## ⚠️ Trivial Dependencies

### 📌 Definition:

If A is part of B:

```
B → A
```

### Example:

```
(FlightCode, FareClass) → FareClass
```

---

### 🚨 Important:

- These are **ignored** in normalization

---

## 🧠 Summary Table

| Concept               | Meaning                                    |
| --------------------- | ------------------------------------------ |
| Functional Dependency | One column determines another              |
| Redundancy            | Repeated data                              |
| Unique Column         | No duplicates                              |
| Candidate Key         | Unique + minimal                           |
| 3NF                   | Non-key columns depend on unique columns   |
| BCNF                  | ALL dependencies must be on unique columns |

---

## 🎯 What You Will Be Tested On

### 🧠 Identify:

- Functional dependencies
- Candidate keys
- Non-key columns
- Unique vs non-unique columns

---

### ⚠️ Detect:

- Redundancy
- 3NF vs BCNF violations

---

### 🔧 Fix:

- Which column causes issue
- How to decompose tables

---

## 🚨 Common Traps

### ❌ Trap 1:

Thinking:

> “3NF = good enough”

➡️ WRONG — BCNF is stricter

---

### ❌ Trap 2:

Not checking if determinant is unique

---

### ❌ Trap 3:

Confusing:

- Candidate key vs primary key
- Unique vs non-unique

---

### ❌ Trap 4:

Missing hidden dependencies

---

## 🧠 Final Mental Model

Ask yourself:

1. What depends on what?
2. Is the determining column UNIQUE?
3. If not → ❌ redundancy → NOT BCNF

---

## 🔥 TLDR (MEMORIZE)

- `B → A` = B determines A
- Redundancy = dependency on NON-UNIQUE column
- 3NF = checks non-key columns only
- BCNF = checks ALL columns
- BCNF = gold standard
- Fix = split tables (decompose)

---
