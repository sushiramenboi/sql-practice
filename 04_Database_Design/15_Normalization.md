# 🧠 Applying Normal Form (BCNF) — Complete Reviewer

## 📌 What This Module Is About

Normalization is the **final step of logical database design**.

> 🎯 Goal: **Eliminate redundancy** by breaking one table into multiple tables.

---

## 🔥 Core Rule (BCNF — MOST IMPORTANT)

> If column **A depends on column B**, then **B MUST be unique**

---

## 🧠 Key Definitions

- **Dependency** → One column determines another
  → Example: `CourseNumber → CourseName`

- **Unique Column** → No duplicates (Primary Key or Candidate Key)

- **Composite Unique Column** → Combination of columns that is unique
  → Example: `(StudentID, CourseNumber, Term)`

- **Minimal Composite Key** → No unnecessary columns included

---

## ⚙️ 3-Step Normalization Process (BCNF)

### ✅ Step 1: List All Unique Columns

- Identify:
  - Primary Key (simple)
  - Composite Keys

- Ensure composite keys are **minimal**

---

### ✅ Step 2: Identify Dependencies on Non-Unique Columns

Look for:

#### ❌ External Dependency

- Depends on a column NOT part of any key

#### ❌ Partial Dependency

- Depends on PART of a composite key

---

### ✅ Step 3: Eliminate Bad Dependencies (Decompose)

If:

```
A depends on non-unique B
```

### 🔥 Do This:

1. REMOVE A from original table
2. CREATE new table with (B → A)
3. B becomes:
   - Primary Key in new table
   - Foreign Key in original table

---

## 🧠 Key Insight

> You are NOT deleting data — you are **moving it to the correct table**

---

## 🔍 Example: Registration Table

### ❌ Original Table

```
RegistrationCode (PK)
StudentID
CourseNumber
Term
CourseName
Credit
```

### 🚨 Problem

```
CourseNumber → CourseName, Credit
```

But:

- CourseNumber is NOT unique ❌

---

### ✅ Solution

#### Table 1: Registration

```
RegistrationCode (PK)
StudentID
CourseNumber (FK)
Term
```

#### Table 2: Course

```
CourseNumber (PK)
CourseName
Credit
```

---

## 📦 Shipment Example (VERY TESTABLE)

### Columns

```
TrackingID
OrderCode
ProductNumber
ProductName
ShipperCode
ShipperName
```

---

### 🔍 Unique Columns

- `TrackingID` → simple unique
- `(OrderCode, ProductNumber)` → composite unique

---

### 🚨 Problems

#### ❌ Partial Dependency

```
ProductNumber → ProductName
```

#### ❌ External Dependency

```
ShipperCode → ShipperName
```

---

### ✅ Final Tables

#### Shipment

```
TrackingID
OrderCode
ProductNumber
ShipperCode
```

#### Product

```
ProductNumber (PK)
ProductName
```

#### Shipper

```
ShipperCode (PK)
ShipperName
```

---

## ⚠️ Common Traps

### ❌ Trap 1: Extra columns in composite key

- Remove unnecessary columns

### ❌ Trap 2: Hidden dependencies

- Example:

```
ProductNumber → ProductName
```

### ❌ Trap 3: Ignoring repeated values

- Repetition = likely normalization issue

---

## 🔥 Denormalization (IMPORTANT)

### 📌 Definition

> Intentionally adding redundancy

---

### ✅ Why Use It

- Faster queries
- Fewer joins

---

### ❌ Trade-offs

| Normalization | Denormalization |
| ------------- | --------------- |
| No redundancy | Has redundancy  |
| More joins    | Fewer joins     |
| Cleaner       | Faster          |

---

### 🧠 Rules

- Improves performance **sometimes**, not always
- Results in **1NF or 2NF tables**
- Used for **reporting databases**
- Avoid in frequently updated systems

---

## 🧩 Final Design Process (TESTED)

### Step 8A

👉 Identify dependencies on non-unique columns

### Step 8B

👉 Decompose tables (normalize)

### Step 8C

👉 Consider denormalization (for reporting)

---

## 🧠 Terminology

- **Normalization (modern)** → Achieving higher normal forms (2NF, 3NF, BCNF)
- **Normalization (original - Codd)** → Achieving 1NF

---

## 🚀 How To Think During the OA

### ALWAYS:

1. Identify keys
2. Identify dependencies
3. Check:
   - Partial dependency (2NF issue)
   - Transitive dependency (3NF issue)
   - Non-unique dependency (BCNF issue)

---

## 🧠 Final Mental Model

> 🔥 **Every fact should exist in ONE place only**

---

## ✅ Quick Checklist (Before Answering)

- Is there a primary key?
- Are there composite keys?
- Does any column depend on a non-unique column?
- Is there repeated data?
- Should this be split into multiple tables?

---

**If YES → Normalize**
