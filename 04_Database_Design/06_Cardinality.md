# 🔺 Cardinality (ER Modeling / Database Design)

## 📌 Definition

**Cardinality** defines **how many instances** of one entity can relate to another, and whether that relationship is **required or optional**.

It includes:

- **Maximum (max)** → MOST allowed
- **Minimum (min)** → LEAST required

---

## 🧠 Key Concept (VERY IMPORTANT)

Every relationship has:

- **2 maxima** (one for each side)
- **2 minima** (one for each side)

👉 You must evaluate **BOTH directions**

---

## 🔝 Relationship Maximum (Max)

### 📌 Definition

Maximum = **greatest number of instances allowed**

---

### 📊 Types

| Type      | Meaning     |
| --------- | ----------- |
| one-one   | 1 ↔ 1       |
| one-many  | 1 → many    |
| many-one  | many → 1    |
| many-many | many ↔ many |

---

### 🧠 How to Solve (HIGH-YIELD)

Ask:

> “For ONE of this entity, what is the MOST of the other it can have?”

Do this for BOTH sides.

---

### 🎯 Notation (ER Diagram)

- `|` = one
- `crow’s foot` = many

---

### 🧪 Example

**Flight — Includes — Booking**

- One flight → many bookings
- One booking → one flight

👉 **one-many**

---

## 🔽 Relationship Minimum (Min)

### 📌 Definition

Minimum = **least number of instances required**

---

### 📊 Types

| Value | Meaning  |
| ----- | -------- |
| 0     | optional |
| 1     | required |

---

### 🧠 How to Solve (VERY TESTED)

Ask:

> “Can it exist without the other?”

- ✔ Yes → 0
- ❌ No → 1

---

### 🎯 Notation (ER Diagram)

- `○` = optional (0)
- `|` = required (1)

---

### 🚨 Placement Rule

- **Min → farther from entity**
- **Max → closer to entity**

---

### 🧪 Example

**Person — Marries — Person**

- People can be single

👉 **0..0 (optional both sides)**

---

## 🔍 Reading ER Diagram Symbols

Each side = **(min) + (max)**

| Combination      | Meaning |
| ---------------- | ------- |
| ○ + crow’s foot  | 0..many |
| \| + \|          | 1..1    |
| \| + crow’s foot | 1..many |

---

## 🧠 Attribute Cardinality

### 📌 Types

| Type     | Meaning     |
| -------- | ----------- |
| singular | one value   |
| plural   | many values |
| optional | 0 values    |
| required | must exist  |

---

### 🎯 Defaults (VERY IMPORTANT)

👉 Attributes are:

- **singular**
- **optional**

---

### 🎯 Notation

- `R` = required
- `P` = plural

---

### 🧪 Example

| Attribute      | Type              |
| -------------- | ----------------- |
| EmployeeNumber | singular-required |
| PassportNumber | singular-optional |
| SkillCode      | plural-optional   |

---

## 🔑 Unique Attributes

### 📌 Definition

A unique attribute =

> each value belongs to **only ONE entity**

---

### 🚨 DO NOT CONFUSE

| Concept  | Meaning            |
| -------- | ------------------ |
| unique   | value → one entity |
| singular | entity → one value |

---

### 🧪 Example

| Attribute | Type       |
| --------- | ---------- |
| SSN       | unique     |
| FullName  | NOT unique |

---

### 🔗 Composite Unique

Some attributes are only unique when combined:

```sql
(AirlineCode, FlightNumber) → UNIQUE
🔗 Entity–Has–Attribute

Entities have an implicit relationship:

Entity → Has → Attribute

🧠 Rules
Required attribute → must exist
Unique attribute → belongs to one entity
⚠️ Business Rules (CRITICAL)

Cardinality depends on BUSINESS RULES

🧪 Example
Scenario	Result
Employee works in ONE department	many-one
Employee works in MULTIPLE departments	many-many
🧪 Key Examples (EXAM-LEVEL)
Passenger — Booking
Booking → 1 passenger
Passenger → many bookings

👉 one-many (NOT many-many)

Flight — Booking
Flight → 0..many bookings
Booking → exactly 1 flight
Marriage
Optional both sides

👉 0..0

🧠 Decision Framework (FOR OA)
Step 1: Determine Maximum

Ask:

“What is the MOST it can have?”

Step 2: Determine Minimum

Ask:

“Can it exist without the other?”

Step 3: Check Attributes
One or many?
Required or optional?
Step 4: Check Uniqueness

Ask:

“Can multiple entities share this value?”

🚨 Common Mistakes (VERY IMPORTANT)
❌ Assuming real-world logic

👉 Always follow the problem rules

❌ Confusing |
Used for BOTH:
required (min)
one (max)

👉 Position matters

❌ Forgetting minimum

👉 OA LOVES testing 0 vs 1

❌ Assuming attributes are required

👉 They are optional by default

❌ Confusing singular vs unique

👉 They are NOT the same

❌ Assuming many-to-many

👉 Always verify BOTH sides

🧠 Mental Model

Think:

“For ONE of this, how many of THAT can exist?”
“Is it required or optional?”
“Is it unique or shared?”

🔥 TL;DR (Exam Ready)
Cardinality = max + min
Max = one or many
Min = 0 (optional) or 1 (required)
Attributes default = singular + optional
Unique ≠ singular
Business rules determine everything
Always evaluate both sides
Translate English → logic
```
