# 📘 Unary Relationships (ER Modeling)

## 🔥 What is a Unary Relationship?

A **unary relationship** occurs when:

> An entity is related to **itself**

- Same entity type
- Different instances (rows)
- Also called a **recursive relationship**

---

## 🧠 Simple Mental Model

Instead of:

- Student → Course (binary)

You have:

- Employee → Employee
- Person → Person
- Product → Product

---

## 📊 Common Real-World Examples

| Entity   | Relationship              |
| -------- | ------------------------- |
| Person   | married to another person |
| Person   | parent of another person  |
| Employee | manages another employee  |
| Product  | part of another product   |

---

## 🔺 Types of Unary Relationships

---

### 1️⃣ One-to-One (1:1)

**Definition:**
Each entity instance relates to exactly **one** other instance.

**Example:**

- A salesperson backs up ONE other salesperson
- That salesperson is backed up by ONE salesperson

**Key Idea:**

- 1 ↔ 1 relationship
- Often **mandatory** on both sides

---

### 2️⃣ One-to-Many (1:M)

**Definition:**
One entity relates to **many** others, but each of those relates back to **one**

**Example:**

- A manager manages MANY employees
- Each employee has ONE manager

**Key Idea:**

- 1 ↔ many
- Most common unary relationship

---

### 3️⃣ Many-to-Many (M:N)

**Definition:**
Entities relate to **many of each other**

**Example (Bill of Materials):**

- A product is made of many parts
- A part can be used in many products

**Key Idea:**

- many ↔ many
- Both directions allow multiple relationships

---

## 🔢 Cardinality vs Modality (CRITICAL)

### Cardinality = **How many**

- One
- Many

### Modality = **Optional or Required**

- 0 → optional
- 1 → required

---

### 🧠 Phrase Translation Table

| Phrase       | Meaning               |
| ------------ | --------------------- |
| exactly one  | required (1)          |
| zero or one  | optional (0 or 1)     |
| zero or many | optional many (0..\*) |
| one or many  | required many (1..\*) |

---

## 🧠 How to Analyze Any Question

### Step-by-step:

1. Identify BOTH directions
2. Extract numbers (0, 1, many)
3. Determine each side
4. Match pattern

---

### 🔍 Pattern Recognition

| Pattern     | Relationship Type |
| ----------- | ----------------- |
| 1 ↔ 1       | One-to-One        |
| 1 ↔ many    | One-to-Many       |
| many ↔ many | Many-to-Many      |

---

## ⚠️ Common Mistakes

### ❌ Looking at only one side

Always analyze **both directions**

---

### ❌ Confusing modality

- "zero or one" ≠ required
- "exactly one" = required

---

### ❌ Ignoring keywords

Focus on:

- 0
- 1
- many

Ignore the story context

---

## 🧱 Database Implementation

Unary relationships are implemented using a:

> **Self-referencing foreign key**

---

### 💻 Example: Employee Manager

```sql
CREATE TABLE Employee (
  EmployeeID INT PRIMARY KEY,
  Name VARCHAR(100),
  ManagerID INT,
  FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID)
);
```

### 🧠 Explanation:

- Each employee can reference another employee
- `ManagerID` points to another row in the same table

---

## 🔁 Visual Representation

```
Employee ─── manages ─── Employee
```

- Same entity
- Different roles (manager vs subordinate)

---

## 🔥 High-Yield Summary

- Unary relationship = entity relates to itself
- Types:
  - 1:1
  - 1:M
  - M:N

- Always analyze BOTH directions
- Extract numbers (0, 1, many)
- Use pattern matching to classify

---

## 🧠 Final Tip

> Ignore the story — focus on the numbers and direction.

---

## 🚀 Why This Matters

- Used in org charts (managers)
- Used in hierarchies (products, categories)
- Shows up frequently in ER modeling questions on exams

---
