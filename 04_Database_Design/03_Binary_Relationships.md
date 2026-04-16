# 📚 SQL & Database Design – Binary Relationships (4.3)

## 🔹 What is a Binary Relationship?

A **binary relationship** is a relationship between **two entity types**.

**Example:**

- Salesperson ↔ Product
- Student ↔ Course

👉 Always read relationships **in BOTH directions**:

- "Salesperson sells Product"
- "Product is sold by Salesperson"

---

## 🔹 Cardinality (MAX)

Cardinality defines the **maximum number of relationships**.

### 1️⃣ One-to-One (1:1)

- One entity ↔ One entity

**Example:**

- Person ↔ Passport

---

### 2️⃣ One-to-Many (1:M)

- One entity → Many entities
- Many → only one

**Example:**

- Instructor → Courses
- Customer → One salesperson

---

### 3️⃣ Many-to-Many (M:N)

- Many ↔ Many

**Example:**

- Students ↔ Courses
- Salespersons ↔ Products

---

## 🔹 How to Identify Cardinality

Read BOTH statements:

| Statement A | Statement B | Relationship |
| ----------- | ----------- | ------------ |
| Many        | Many        | M:N          |
| One         | Many        | 1:M          |
| One         | One         | 1:1          |

---

## 🔹 Modality (MIN)

Modality defines the **minimum participation**.

| Value | Meaning  |
| ----- | -------- |
| 0     | Optional |
| 1     | Required |

---

## 🔹 How to Read E-R Diagrams

- **Inner symbol** = minimum (modality)
- **Outer symbol** = maximum (cardinality)

### Examples:

- (1,1) → exactly one
- (0,1) → optional, max one
- (0,n) → optional many
- (1,n) → at least one

---

## 🔹 Key Terminology (TEST IMPORTANT)

| Phrase        | Meaning      |
| ------------- | ------------ |
| "may have"    | 0 (optional) |
| "must have"   | 1 (required) |
| "at most one" | max = 1      |
| "many"        | max = n      |

---

## 🔹 Many-to-Many Relationships (CRITICAL)

### ❌ Problem:

You cannot store relationship data in either entity.

**Example:**

- Salesperson sells Product
- Attribute: `Quantity`

👉 Cannot go in:

- Salesperson ❌
- Product ❌

---

## 🔹 Intersection Data

Data that describes the **relationship itself**, not the entity.

**Example:**

- Salesperson 137 sold Product 24013 → Quantity = 170

👉 This belongs to the **relationship**

---

## 🔹 Associative Entity (Junction Table)

### 🔥 Converts M:N → 2 One-to-Many relationships

```
Salesperson → SALES ← Product
```

### SALES table contains:

- SalespersonID (FK)
- ProductID (FK)
- Quantity (intersection data)

---

## 🔹 Cardinality Change (IMPORTANT)

After conversion:

- SALES → 1 salesperson
- SALES → 1 product
- Salesperson → many SALES
- Product → many SALES

---

## 🔹 Attribute Placement Rules

| Attribute Type         | Where it goes      |
| ---------------------- | ------------------ |
| Describes entity       | Entity             |
| Describes relationship | Associative Entity |

---

## 🔹 Example

| Attribute    | Location           |
| ------------ | ------------------ |
| Student Name | Student            |
| Course Name  | Course             |
| Grade        | Associative Entity |
| Semester     | Associative Entity |

---

## 🔹 Unique Identifier (Primary Key)

### Option 1: Composite Key

```
(SalespersonID, ProductID)
```

---

### Option 2: Add attribute for uniqueness

```
(SalespersonID, ProductID, Year)
```

---

### Option 3: Surrogate Key

```
SalesID (Primary Key)
```

---

## 🔹 Important Rules for OA

- Always read relationships **both directions**
- Know difference:
  - Cardinality = MAX
  - Modality = MIN

- M:N relationships require:
  - Associative entity (junction table)

- Intersection data:
  - Goes in associative entity ONLY

- Understand:
  - 1:1, 1:M, M:N instantly

---

## 🔹 Common Mistakes

❌ Confusing cardinality vs modality
❌ Putting relationship attributes in entities
❌ Forgetting to convert M:N relationships
❌ Not reading both sides of relationship

---

## 🔹 Mental Checklist (USE THIS IN OA)

1. What are the entities?
2. What is the relationship?
3. What is the MAX? (cardinality)
4. What is the MIN? (modality)
5. Is it many-to-many? → Create associative entity

---

## 🚀 TL;DR

- Binary relationship = 2 entities
- Cardinality = max (1 or many)
- Modality = min (0 or 1)
- M:N → must use associative entity
- Relationship attributes → go in junction table

---
