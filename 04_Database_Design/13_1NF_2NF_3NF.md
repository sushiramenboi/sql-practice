# 📘 D426 — Module 4.13 Reviewer

## First, Second, and Third Normal Form (1NF, 2NF, 3NF)

---

# 🧠 Functional Dependence (FOUNDATION)

## 📌 Definition

A column **A depends on column B** if:

> Each value of **B** is related to **at most ONE value of A**

### Notation:

```sql
B → A
```

👉 Read as:
**“B determines A”**

---

## 🔑 Determinant

> A determinant is a column (or set of columns) that determines another column

---

## ✅ Example

| EmployeeID | LastName | HourlyRate |
| ---------- | -------- | ---------- |
| E101       | Smith    | 45         |
| E102       | Jones    | 50         |

- `EmployeeID → LastName` ✅
- `EmployeeID → HourlyRate` ✅
- `HourlyRate → EmployeeID` ❌

---

## ⚠️ IMPORTANT

- Functional dependency reflects **business rules**
- ❌ Cannot always be proven from sample data alone

---

# 🔁 Redundancy

## 📌 Definition

> Redundancy = repetition of related values

### Example:

```text
(222, Elvira Yin)
(222, Elvira Yin)
(222, Elvira Yin)
```

---

## 🚨 Why it’s bad

- Inconsistent data risk
- Hard updates
- Slower queries

---

## 🔥 Key Rule

> Redundancy occurs when a column depends on a **non-unique column**

---

# 🧱 Normal Forms Overview

| Normal Form | Purpose                          |
| ----------- | -------------------------------- |
| 1NF         | Basic structure                  |
| 2NF         | Remove partial dependencies      |
| 3NF         | Remove transitive dependencies   |
| BCNF        | Remove all dependency redundancy |
| 4NF         | Remove multivalued dependencies  |
| 5NF         | Remove join dependencies         |

👉 As you go down → **less redundancy**

---

# 🥇 First Normal Form (1NF)

## 📌 Rules

- Has a **primary key**
- No duplicate rows
- Each cell contains **one value**

---

## 🧠 Key Insight

> Every non-key column depends on the primary key

---

## ⚠️ Notes

- Strings are still **single values**
- In theory, all relational tables are in 1NF

---

# 🥈 Second Normal Form (2NF)

## 📌 Definition

A table is in 2NF if:

1. It is in **1NF**
2. All non-key columns depend on the **whole primary key**

---

## 🔑 Partial Dependency

Occurs when:

- Primary key is **composite**
- A column depends on only **part** of it

---

## ❌ Example

Primary key:

```sql
(PassengerNumber, FlightCode)
```

Dependency:

```sql
PassengerNumber → PassengerName
```

👉 Depends only on part of the key ❌

---

## ✅ Fix

Split into:

```sql
Passenger(PassengerNumber, PassengerName)

Booking(PassengerNumber, FlightCode, FareClass, BoardingZoneNumber)
```

---

## 🔥 Rule

> If primary key is **simple**, table is automatically in 2NF

---

# 🥉 Third Normal Form (3NF)

## 📌 Definition

A table is in 3NF if:

1. It is in **2NF**
2. No non-key column depends on another non-key column

---

## 🔑 Transitive Dependency

```sql
A → B → C
```

👉 C depends on B instead of A

---

## ❌ Example

```sql
FareClass → BoardingZoneNumber
```

👉 FareClass is NOT the key ❌

---

## ✅ Fix

```sql
Booking(PassengerNumber, FlightCode, FareClass)

Fare(FareClass, BoardingZoneNumber)
```

---

## 🔥 Golden Rule

> Every non-key column must depend on:
> **the key, the whole key, and nothing but the key**

---

# 🧠 Booking Table Breakdown (FROM MODULE)

## Original Table Issues

Primary Key:

```sql
(PassengerNumber, FlightCode)
```

---

## ❌ Problem 1 — 2NF Violation

```sql
PassengerNumber → PassengerName
```

- Depends on part of key
- Causes repetition

---

## ❌ Problem 2 — 3NF Violation

```sql
FareClass → BoardingZoneNumber
```

- Depends on non-key column
- Causes repetition

---

## ✅ Final Normalized Tables

```sql
Passenger(
  PassengerNumber PK,
  PassengerName
)

Booking(
  PassengerNumber PK, FK,
  FlightCode PK,
  FareClass
)

Fare(
  FareClass PK,
  BoardingZoneNumber
)
```

---

# ⚠️ OA TRAPS

- ❌ Order of rows DOES NOT matter
- ❌ Functional dependency ≠ just repeated values
- ❌ Don’t assume dependency from sample data
- ❌ Primary key dependency NEVER causes redundancy

---

# 🚀 Quick Decision Guide

## 1NF

- One value per cell
- Has primary key

## 2NF

- No partial dependency
- (Only matters for composite keys)

## 3NF

- No non-key → non-key dependency

---

# 🧠 Final Mental Model

- 1NF → clean table
- 2NF → remove obvious duplication
- 3NF → remove hidden duplication

---

# 🎯 One-Line Summary

> Normalization organizes data so each fact is stored **once**, eliminating redundancy and preventing inconsistency.

---
