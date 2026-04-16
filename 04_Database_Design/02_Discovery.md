# 📘 SQL / Database Design Notes — Module 4.2: Discovery

## 🧠 Core Idea

**Discovery** is the first step of the **conceptual design phase**, where you extract:

- **Entities**
- **Relationships**
- **Attributes**

from:

- Interviews (users, managers)
- Documents (manuals, old systems)

> ⚠️ This process is **iterative**, not linear — you go back and forth.

---

## 🧱 Entities (Things)

- Usually **nouns**
- Represent real-world objects the database tracks

### ✅ Examples:

- Passenger, Flight, Airport, Booking

### ❌ Avoid:

- Generic nouns → `information`, `record`
- Irrelevant items → things not tracked
- Data fields → `name`, `number`

### ⚠️ Key Rules:

- Not all nouns are entities
- Combine synonyms:
  - `Traveler = Passenger`
  - `Airplane = Aircraft`

- Some complex data can become entities:
  - `Address`, `CreditCard`

---

## 🔗 Relationships (Connections)

- Usually **verbs**
- Connect entities

### ✅ Examples:

- `Passenger-Makes-Booking`
- `Flight-ArrivesAt-Airport`
- `Flight-DepartsFrom-Airport`

### ⚠️ Key Rules:

- Ignore irrelevant verbs
- Remove redundant relationships

#### 🔥 Redundancy Example:

- `Flight-Includes-Booking`
- `Passenger-Makes-Booking`

👉 Already implies:

- Flight ↔ Passenger

❌ So remove:

- `Flight-Has-Passenger`

---

## 🧾 Attributes (Data)

- Specific data values about entities

### ✅ Examples:

- `PassengerName`
- `AirportCode`
- `TotalCost`
- `MileagePlanNumber`

### ⚠️ Key Rules:

- Attributes = **specific values**, not objects
- Ask:
  - “Does this have multiple fields?”
    - Yes → Entity
    - No → Attribute

---

## 🏷️ Naming Conventions

### 📌 Entities

- Singular nouns
- ✅ `Passenger`
- ❌ `Passengers`, `People`

---

### 📌 Relationships

- Format: `Entity-Verb-Entity`
- Use **active voice**

### ✅ Examples:

- `Employee-Manages-Department`
- ❌ `Department-IsManagedBy-Employee`

---

### 📌 Attributes

- Format: `EntityQualifierType`

### Example:

- `PassengerMileagePlanNumber`

### Structure:

- Entity → `Passenger`
- Qualifier → `MileagePlan`
- Type → `Number`

### ⚠️ Rule:

- Must include a **type**
  - ❌ `License`
  - ✅ `LicenseNumber`

---

## 🔁 Synonyms

- Different words for same concept

### Example:

- Passenger = Traveler = Customer

### Rules:

- Only **one official name**
- Others stored as synonyms in glossary
- ❗ Synonyms do NOT need naming conventions

---

## 📖 Descriptions

Each entity, relationship, and attribute needs:

### Must include:

1. Name + definition
2. Examples
3. Counterexamples

### ⚠️ Common Mistakes:

- Doesn’t start with name
- Not full sentences
- Missing examples

---

## 🧠 Discovery Workflow (How to Think)

### Step 1: Identify Entities

- Find nouns → filter relevant ones

### Step 2: Identify Relationships

- Find verbs → remove redundant ones

### Step 3: Identify Attributes

- Find specific data values

---

## 🔄 Database Design Process

| Step | Activity                                          |
| ---- | ------------------------------------------------- |
| 1A   | Identify entities, relationships, attributes      |
| 1B   | Draw ER diagram                                   |
| 1C   | Define attribute types                            |
| 1D   | Document glossary (names, synonyms, descriptions) |

> ⚠️ Steps happen **in parallel**, not strictly in order

---

## 🎯 OA Traps to Watch

- Not all nouns = entities
- Not all verbs = relationships
- Entity vs Attribute confusion
- Redundant relationships
- Naming violations
- Synonyms confusion
- Weak descriptions

---

## ⚡ TLDR (Quick Recall)

- **Entities** = important nouns (things tracked)

- **Relationships** = verbs (connections)

- **Attributes** = specific data values

- Ignore:
  - irrelevant info
  - redundant relationships

- Naming:
  - Entity → singular noun
  - Relationship → active verb
  - Attribute → Entity + Qualifier + Type

- Process = **iterative**

---

## 🧠 Mental Model

> “Extract structure from real-world language.”

If you can read a paragraph and correctly identify:

- Entities
- Relationships
- Attributes

👉 You’re ready for the OA.
