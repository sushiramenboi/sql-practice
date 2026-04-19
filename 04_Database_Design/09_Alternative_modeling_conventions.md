# 📘 4.9 Alternative Modeling Conventions (Reviewer)

## 📌 Core Idea

This section is about:

> **Different ways to represent the SAME ER modeling concepts**

- The **logic does NOT change**
- Only the **visual style or terminology changes**

---

# 🎯 1. Diagram Conventions (Visual Variations)

ER diagrams are **not standardized**, so you may see:

### 🔷 Relationships

- Diamond (Chen notation)
- Simple labeled line (modern style)

### 🟥 Weak Entities

- Double rectangle
- Or labeled differently

### 🟢 Attributes

- Separate ellipses (classic)
- Inside entity box (modern)

### 🔺 Subtype / Supertype

- Inside supertype entity
- Or via **IsA relationship**

### 🎨 Additional Visual Indicators

- Dashed lines
- Double lines
- Colors

👉 Used to show:

- Optional vs required
- Weak vs strong
- Special relationships

---

# 🔢 2. Alternative Cardinality Notation (CRITICAL)

## 📌 Textual Notation Format

```
MAXIMUM (MINIMUM)
```

- First value → **maximum**
- Value in parentheses → **minimum**

---

## 📊 Meaning of Symbols

| Symbol             | Meaning        |
| ------------------ | -------------- |
| M                  | many (plural)  |
| 1                  | one (singular) |
| 0                  | optional       |
| 1 (in parentheses) | required       |

---

## 📊 Common Cases

| Notation | Meaning                   |
| -------- | ------------------------- |
| M(0)     | 0 to many (optional many) |
| M(1)     | 1 to many (required many) |
| 1(0)     | 0 or 1 (optional one)     |
| 1(1)     | exactly 1 (required one)  |

---

## 🧠 Example

**Faculty advises Student**

- Faculty → Student: `M(0)`
  → A faculty advises **0 to many students**

- Student → Faculty: `1(1)`
  → A student has **exactly 1 advisor**

---

# 🔁 3. Matching Meaning to Notation

| Meaning             | Notation |
| ------------------- | -------- |
| plural + optional   | M(0)     |
| plural + required   | M(1)     |
| singular + optional | 1(0)     |
| singular + required | 1(1)     |

---

# 🔗 4. Identifying Relationships

### 📌 Alternative Representation

- Sometimes shown as **double solid lines** instead of a diamond

### 🧠 Meaning

> Indicates a **weak entity depends on a strong entity**

---

# 🧱 5. Model Terminology Variations

| Standard Term | Alternative        |
| ------------- | ------------------ |
| Strong entity | Independent entity |
| Weak entity   | Dependent entity   |

---

# 🧩 6. Subject Area

### 📌 Definition

> A **group of related entities**

### 🧠 Purpose

- Break large ER models into smaller sections
- Improve organization and readability

---

# 🌐 7. Modeling Standards (Know These Names)

### 🧑‍💻 UML (Unified Modeling Language)

- Used in **software development**
- Can represent database structures

---

### 🏛️ IDEF1X

- Used by **U.S. Department of Defense**
- More formal modeling standard

---

### 📜 Chen Notation

- Original ER diagram style
- Uses:
  - Diamonds (relationships)
  - Ellipses (attributes)

---

## 🔥 Key Point

> Differences between standards are mostly **stylistic, not functional**

---

# 👻 8. Intangible Entities

### 📌 Definition

> Entity shown in the model but **NOT stored in the database**

### 🧠 Representation

- Dashed rectangle
- Different color

---

# ☁️ 9. Subject Areas in Practice

Large systems are divided into subject areas such as:

- Party
- Payment
- Product
- Shipment
- Sales Order

### Example:

**Shipment subject area includes:**

- Shipment
- ShipmentProduct
- ShipmentPackage
- ShipmentDocument
- etc.

---

## 🧠 Key Idea

> Complex systems are broken into **manageable groups of related entities**

---

# 🚨 10. MUST-MEMORIZE (OA FOCUS)

## 🔥 Cardinality Rules

- Format: `MAX (MIN)`
- M = many, 1 = one
- 0 = optional, 1 = required

---

## 🔥 Vocabulary

- Weak entity = **Dependent**
- Strong entity = **Independent**
- Subject area = **Group of related entities**

---

## 🔥 Standards

- UML → software development
- IDEF1X → DoD standard
- Chen → original ER notation

---

## 🔥 Concepts

- Diagram styles ≠ different meaning
- Only representation changes

---

## 🔥 Special Concept

- Intangible entity = **not stored in database**

---

# 🧠 Final Mental Model

> This section tests your ability to **translate between different representations**

You are NOT learning new database logic —
you are learning how to **recognize the same concept in different forms**
