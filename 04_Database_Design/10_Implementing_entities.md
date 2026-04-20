# 📦 Implementing Entities (Module 4.10 — Reviewer)

## 📌 Overview

This module focuses on converting **ER diagrams into actual database tables**.

### Core Transformation:

- **Entities → Tables**
- **Attributes → Columns**
- **Primary Keys → Must be selected carefully**

---

# 🔑 Selecting Primary Keys (CRITICAL)

## ✅ Required Properties

A primary key MUST be:

- **Unique** → no duplicates
- **Required (NOT NULL)** → cannot be missing

---

## ⭐ Ideal Properties (Highly Tested)

### 1. Stable

- Value should NOT change
- Prevents cascading updates

### 2. Simple

- Small and easy to use (e.g., INT)
- Faster queries and easier `WHERE` usage

### 3. Meaningless

- No descriptive meaning
- Prevents instability due to real-world changes

---

## ❌ Common Mistakes

| Attribute              | Why it's bad           |
| ---------------------- | ---------------------- |
| Name                   | Not unique, meaningful |
| Email                  | Can change             |
| Large strings          | Not simple             |
| Composite with meaning | Not stable             |

---

## 🧠 Example (Primary Key Selection Logic)

Entity: `Part`

| Attribute            | Issue                                              |
| -------------------- | -------------------------------------------------- |
| PartName             | Unique but meaningful → ❌                         |
| PartCode             | Not unique → ❌                                    |
| (PartCode, PartSize) | Unique but meaningful → ❌                         |
| PartNumber           | Unique, required, stable, simple, meaningless → ✅ |

👉 **Final PK: `PartNumber`**

---

# 🧱 Implementing Strong Entities

## 📌 Definition

A **strong entity**:

- Exists independently
- Has its own primary key

---

## 🔧 Implementation Rule

> Strong entity → becomes a table

---

## 🔑 Primary Key Strategy

### Option 1: Natural Key

- Use if it meets all PK requirements

### Option 2: Composite Key

- Use only if necessary

### Option 3: Artificial Key (VERY IMPORTANT)

## 🤖 Artificial Key

### Definition:

- A system-generated ID (usually integer)

### Why it's good:

- Stable ✅
- Simple ✅
- Meaningless ✅

### Example:

```sql
PassengerKey INT AUTO_INCREMENT PRIMARY KEY
```

---

## 🧠 Example (Passenger)

| Attribute                                  | Issue        |
| ------------------------------------------ | ------------ |
| FullName                                   | Not unique   |
| RewardsNumber                              | Not required |
| (IdentificationNumber, IdentificationType) | Not stable   |

👉 **Solution: Create artificial key `PassengerKey`**

---

# 🧩 Implementing Weak Entities

## 📌 Definition

A **weak entity**:

- Depends on a strong entity
- Cannot exist independently

---

## 🔧 Implementation Rule

> Weak entity → becomes a table WITH a foreign key

---

## 🔑 Primary Key Rules

### Case 1: Singular (rare)

- One weak entity per strong entity
  👉 PK = **foreign key only**

---

### Case 2: Plural (common)

- Multiple weak entities per strong entity
  👉 PK = **composite**

```sql
PRIMARY KEY (ForeignKey, AdditionalColumn)
```

---

## 🧠 Example (Project → Task)

- One task per project → PK = `ProjectCode`
- Many tasks → PK = `(ProjectCode, TaskNumber)`

---

## 🔗 Foreign Key Behavior (Important)

Typical rules:

- **PK UPDATE → CASCADE**
- **PK DELETE → CASCADE**
- **FK INSERT/UPDATE → RESTRICT**

---

# 🧬 Weak Entity with Multiple Parents

## 📌 Rule

If a weak entity depends on multiple strong entities:

👉 PK = **All foreign keys + extra column (if needed)**

---

## 🧠 Example (Booking)

```sql
PRIMARY KEY (FlightCode, PassengerKey, BookingNumber)
```

---

## ⚠️ Why extra column?

- Allows multiple records for same combination

---

# 🧍‍♂️ Implementing Supertype & Subtype

## 📌 Definitions

- **Supertype** = General entity
- **Subtype** = Specialized version

---

## 🔧 Implementation Rules

### Supertype:

- Becomes a table
- Has its own primary key

---

### Subtype:

## 🔑 CRITICAL RULE

> Subtype primary key = SAME as supertype primary key

---

## 🔗 Also:

> Subtype PK is ALSO a foreign key

---

## 🧠 Example

```sql
Passenger (PassengerKey PK)

RewardsPassenger (
  PassengerKey PK, FK,
  EliteStatusCode,
  MileageQuantity
)
```

---

## ⚙️ Referential Rules

- PK DELETE → CASCADE
- FK INSERT/UPDATE → RESTRICT

---

## 🔗 Relationship

- Implements **IsA relationship**

---

# 🧠 Key Selection Patterns (OA Focus)

## ❌ Do NOT use as PK:

- Optional attributes (NULL allowed)
- Unstable attributes (can change)
- Non-unique attributes
- Descriptive attributes
- Complex attributes

---

## ✅ Good PK Choices:

- Artificial key (best practice)
- Small integers
- Stable identifiers

---

## ⚠️ Composite Key Rule

- Use ONLY when necessary
- Common in weak entities

---

# 🔄 Database Design Process

## 📌 This step does:

- Create tables
- Define columns
- Select primary keys

---

## 🚨 IMPORTANT

This is **NOT final design**

More steps:

- Relationships (next module)
- Attributes
- Normalization

---

## 🧱 Steps Summary

| Step | Action                          |
| ---- | ------------------------------- |
| 5A   | Strong entities → tables        |
| 5B   | Create artificial key if needed |
| 5C   | Weak entities → tables          |
| 5D   | Supertype/subtype → tables      |

---

# ⚠️ Common Traps (TEST FAVORITES)

- Thinking "unique" alone is enough → ❌
- Using names/descriptions → ❌
- Forgetting weak entity PK rules → ❌
- Forgetting subtype PK = supertype PK → ❌
- Overusing composite keys → ❌

---

# 🧠 Final Mental Model

### Step 1: Identify entity type

- Strong / Weak / Subtype

### Step 2: Choose PK

- Natural → if valid
- Otherwise → Artificial

### Step 3: Apply rules

| Entity Type | PK Rule           |
| ----------- | ----------------- |
| Strong      | Simple PK         |
| Weak        | FK + extra column |
| Subtype     | Same as supertype |

---

### Step 4: Validate PK

- Unique?
- Required?
- Stable?
- Simple?
- Meaningless?

---

# 🔥 Bottom Line

> A good database design depends heavily on choosing the RIGHT primary keys.

Master this → You pass the OA.
