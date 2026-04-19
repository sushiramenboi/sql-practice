# 🧬 Supertype & Subtype Entities (WGU D426 - Section 4.8)

## 📌 Core Definitions

- **Entity type** = a set of entity instances
- **Entity instance** = one specific object (one row)

- **Supertype entity** = general entity
- **Subtype entity** = subset of a supertype

> Example:  
> `Employee` (supertype)  
> `Manager` (subtype)

---

## 🧠 Core Concept (VERY IMPORTANT)

- A subtype **IS-A** supertype

> Manager **is an** Employee  
> ElectricVehicle **is a** Vehicle

👉 This is called an **IsA relationship** (usually NOT shown in ER diagrams)

---

## 🧱 ER Diagram Rules

- Subtypes are drawn **inside** the supertype
- Supertype attributes apply to **ALL subtypes**
- Subtype attributes apply to **ONLY that subtype**

---

## 🔥 Example

### Supertype:

`Vehicle`

### Subtypes:

- `ElectricVehicle`
- `GasVehicle`

### Attributes:

| Attribute         | Location        | Reason         |
| ----------------- | --------------- | -------------- |
| PassengerQuantity | Supertype       | applies to all |
| WheelsNumber      | Supertype       | applies to all |
| BatteryCapacity   | ElectricVehicle | only electric  |
| CylinderQuantity  | GasVehicle      | only gas       |

---

## 🎯 Benefits of Supertype/Subtype

### ✅ 1. Clarity

- Separates subsets with different attributes

### ✅ 2. Fewer NULL values

- Optional attributes move to subtypes → become required

### ✅ 3. No duplication

- Shared attributes stored once in supertype

---

# 🔁 How They Are Created

## 🔹 1. From Similar Entities

If entities share many attributes:

Before:

- Student
- Faculty
- Administrator

After:

- Supertype: `Person`
- Subtypes:
  - Student
  - Faculty
  - Administrator

👉 Shared attributes → supertype  
👉 Unique attributes → subtype

---

## 🔹 2. From Optional Attributes

If an entity has many optional attributes:

Before:

- Vehicle:
  - ManufacturerCode (required)
  - BatteryCapacity (optional)
  - ChargingType (optional)

After:

- Supertype: `Vehicle`
- Subtype: `ElectricVehicle`

👉 Optional attributes become **required in subtype**

---

# 🧩 Partitions (VERY IMPORTANT)

## 📌 Definition

A **partition** = a group of **mutually exclusive subtype entities**

👉 Subtypes in the SAME partition:

- ❌ Do NOT share instances
- ❌ Cannot overlap
- ✅ One entity instance → one subtype only

---

## 🔑 Rules

### Same partition:

- Mutually exclusive (disjoint)

### Different partitions:

- Can overlap
- One entity instance can belong to multiple subtypes (from different partitions)

---

```sql
CREATE TABLE Card (
    CardID INT PRIMARY KEY,

    -- Partition 1 (Type)
    CreditType VARCHAR(10) NOT NULL,

    -- Partition 2 (Brand)
    SponsorCode VARCHAR(20) NOT NULL,

    -- Enforce valid partition values
    CHECK (CreditType IN ('Credit', 'Debit', 'Gift')),
    CHECK (SponsorCode IN ('Visa', 'MasterCard', 'Discover'))

);
```

## 🔥 Example (Zybooks)

Supertype: `Card`

### Partition 1:

- CreditCard
- DebitCard
- GiftCard

👉 Partition attribute: `CreditType`  
👉 Values: `"Credit"`, `"Debit"`, `"Gift"`

---

### Partition 2:

- Visa
- MasterCard
- Discover

👉 Partition attribute: `SponsorCode`

---

## 🧠 Partition Attribute (CRITICAL)

- Stored in **supertype**
- Determines subtype membership

👉 Each value corresponds to **one subtype**

---

## ⚡ Example Instance

| CardID | CreditType | SponsorCode |
| ------ | ---------- | ----------- |
| 1      | Credit     | Visa        |

👉 This ONE entity instance is:

- a **CreditCard** (Partition 1)
- a **Visa** (Partition 2)

---

## 🚨 Partition Rules (TESTED)

| Statement                                               | Truth    |
| ------------------------------------------------------- | -------- |
| Instance can be in two subtypes of SAME partition       | ❌ False |
| Instance can be in two subtypes of DIFFERENT partitions | ✅ True  |
| Each partition attribute value → one subtype            | ✅ True  |
| One attribute controls multiple partitions              | ❌ False |

---

# 🧬 IsA Relationship

- Subtypes are identified by the supertype
- Relationship: **Subtype → Supertype**

👉 Usually NOT drawn in ER diagrams

---

## 🔑 Identification Rules (VERY IMPORTANT)

- Subtypes **do NOT have their own identifying attribute**
- They use the **supertype’s identifier**

> Example:

- VehicleIdentificationNumber identifies:
  - Vehicle
  - ElectricVehicle
  - GasVehicle

---

## ⚠️ Weak vs Subtype (Zybooks nuance)

- Subtypes have an **identifying relationship (IsA)**
- Therefore:

👉 **All subtype entities are weak entities**

BUT

👉 **Not all weak entities are subtype entities**

---

# 🧠 Design Process (FROM ZYBOOKS)

### Step 4A

Identify supertype and subtype entities

### Step 4B

Replace:

- Similar entities
- Optional attributes

### Step 4C

Identify:

- Partitions
- Partition attributes

### Step 4D

Document in ER diagram

---

# 🔁 Full Conceptual Design Flow

1. Discover entities, relationships, attributes
2. Determine cardinality
3. Distinguish strong vs weak entities
4. Create supertype and subtype entities

---

# ⚡ Quick Recognition Cheat Sheet

| Situation                   | Action               |
| --------------------------- | -------------------- |
| Many shared attributes      | Create supertype     |
| Few unique attributes       | Keep in subtype      |
| Attribute applies to all    | Supertype            |
| Attribute applies to some   | Subtype              |
| Many optional attributes    | Create subtype       |
| Mutually exclusive subtypes | Partition            |
| Overlapping categories      | Different partitions |

---

# 🧠 Mental Model

Think like OOP:
