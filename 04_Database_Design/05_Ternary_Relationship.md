# 🔺 Ternary Relationships (SQL / Database Design)

## 📌 Definition

A **ternary relationship** is a relationship that involves **three different entity types at the same time**.

> Example:
> A **Salesperson** sells a **Product** to a **Customer**

This means:

- We must track **who sold what to whom**

---

## 🧠 Key Concept (VERY IMPORTANT)

You **cannot break a ternary relationship into multiple binary relationships** without losing meaning.

### ❌ Incorrect (loses context)

- Salesperson → Customer
- Customer → Product
- Salesperson → Product

👉 This does NOT tell:

> Which product was sold by which salesperson _to which customer_

### ✅ Correct

Use a **single ternary relationship**

---

## 🔗 Associative Entity (Bridge Table)

Ternary relationships are implemented using an **associative entity**.

### Example:

`Sale`

This table connects:

- Salesperson
- Product
- Customer

---

## 🧱 Table Structure

### 🔑 Composite Primary Key

The primary key is made of **all three foreign keys**:

- SalespersonNumber
- ProductNumber
- CustomerNumber

---

### 🔗 Foreign Keys

Each key references its original table:

```sql
FOREIGN KEY (SalespersonNumber) REFERENCES Salesperson(SalespersonNumber),
FOREIGN KEY (ProductNumber) REFERENCES Product(ProductNumber),
FOREIGN KEY (CustomerNumber) REFERENCES Customer(CustomerNumber)
```

---

### 📊 Intersection (Relationship) Attributes

These belong ONLY to the relationship:

- Date
- Quantity

👉 These depend on all 3 entities

---

## 🧠 Attribute Placement Rules (HIGH-YIELD)

### ✔ Entity Attribute

Belongs to **only one entity**

| Attribute       | Goes To     |
| --------------- | ----------- |
| CustomerName    | Customer    |
| ProductPrice    | Product     |
| SalespersonName | Salesperson |

---

### ✔ Relationship Attribute

Depends on **multiple entities**

| Attribute | Goes To |
| --------- | ------- |
| SaleDate  | Sale    |
| Quantity  | Sale    |

---

## 🧠 Decision Framework (FOR OA)

### Step 1:

Does the attribute describe ONE entity?

✔ Yes → Put in that entity
❌ No → Continue

---

### Step 2:

Does it depend on ALL THREE entities?

✔ Yes → Put in associative entity (Sale)

---

## 🧪 Example Scenarios

| Attribute       | Correct Location | Reason                  |
| --------------- | ---------------- | ----------------------- |
| City of house   | House            | Only describes house    |
| Name of realtor | Realtor          | Only describes realtor  |
| Date of sale    | Sale             | Depends on all entities |

---

## 🔄 Cardinality

Ternary relationships are usually:

> **Many-to-Many-to-Many (M:N:N)**

Meaning:

- One salesperson → many customers
- One customer → many products
- One product → many sales

---

## 🧱 SQL Implementation

```sql
CREATE TABLE Sale (
  SalespersonNumber INT,
  ProductNumber INT,
  CustomerNumber INT,
  Date DATE,
  Quantity INT,
  PRIMARY KEY (SalespersonNumber, ProductNumber, CustomerNumber),
  FOREIGN KEY (SalespersonNumber) REFERENCES Salesperson(SalespersonNumber),
  FOREIGN KEY (ProductNumber) REFERENCES Product(ProductNumber),
  FOREIGN KEY (CustomerNumber) REFERENCES Customer(CustomerNumber)
);
```

---

## 🚨 Common Mistakes

### ❌ Putting relationship data in entity tables

Example:

- Putting `Date` in Product → ❌ Wrong

---

### ❌ Breaking ternary into binary relationships

→ Loses meaning

---

### ❌ Not using composite key

→ Causes duplicates and ambiguity

---

## 🧠 Mental Model

Think of a ternary relationship as a:

> 🎯 **Transaction / Event**

Example:

- Who → Salesperson
- What → Product
- To whom → Customer
- When → Date
- How much → Quantity

👉 If it’s an **event involving multiple entities → associative entity**

---

## 🔥 TL;DR (Exam Ready)

- Ternary = **3 entities in one relationship**
- Always use **associative entity**
- Primary key = **combination of all 3 foreign keys**
- Relationship attributes → go in associative entity
- Entity attributes → stay in their own table
- **Do NOT split into binary relationships**

---
