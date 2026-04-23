# 🗃️ Montgomery County Crime Database

A normalized relational database built on 300,000+ public incident records from the Montgomery County Police Department — designed for clarity, privacy, and actionable public safety insights.

---

## 📌 Project Overview

This project transformed a complex, daily-updated public dataset from the Montgomery County Police Department (MCPD) into a streamlined relational database. Rather than inheriting the sprawling structure of the source data, we re-architected it into a clean, normalized model optimized for accuracy and usability.

The database covers both open and closed cases dating back to **July 2016**, with analysis focused on the **200 most recent incidents** to surface high-activity areas and track evolving regional trends.

---

## 🗺️ Entity-Relationship Diagram

![ERD Design](https://github.com/0daylamb/Montgomery-County-Crime-DB/blob/main/ERD%20Design.png)

---

## 🏗️ Database Architecture

The schema follows a fully normalized relational model centered on a **primary `Crime` table**, linked to six specialized tables through foreign keys and a many-to-many linking table.

### Table Descriptions

| Table | Primary Key | Key Fields | Purpose |
|-------|-------------|-----------|---------|
| `crime` | `crime_id` | `nibrs_id`, `offense_id`, `agency_id`, `dispatch_id`, `victims_num`, `start_date`, `end_date`, `place_name` | Core incident record |
| `offense` | `offense_id` | `offense_code`, `crime_name` | Hierarchical crime classification (Levels 1–3) |
| `nibrs` | `nibrs_id` | `nibrs_code` | Federal NIBRS standardized crime categorization |
| `location` | `location_id` | `street_num`, `address`, `city`, `state`, `zip_code` | Privacy-safe block-level geography |
| `agency` | `agency_id` | `police_number`, `police_district`, `police_agency` | Responding law enforcement unit |
| `dispatch` | `dispatch_id` | `dispatch_start_time`, `dispatch_end_time`, `dispatch_date` | Law enforcement response timing |
| `linking_table` | `crime_id` + `location_id` (composite PK) | — | Resolves the many-to-many relationship between `crime` and `location` |

### Relationships

| Type | Relationship |
|------|-------------|
| One-to-Many | `crime` →  `offense` |
| One-to-Many | `crime` →  `nibrs` |
| One-to-Many | `crime` →  `agency` |
| One-to-Many | `crime` →  `dispatch` |
| Many-to-Many | `location` ↔ `crime` (via `linking_table`) |

---

## 🔢 Sample Data

**Crime Classification**

| State | crime_name_1 | crime_name_2 | crime_name_3 |
|-------|-------------|-------------|-------------|
| MD | Crime Against Property | All Other Larceny | LARCENY |
| MD | Crime Against Property | Shoplifting | LARCENY - SHOPLIFTING |
| MD | Crime Against Society | Weapon Law Violations | LARCENY - CONCEALED |

**Incident Records**

| Incident ID | Offense Code | NIBRS Code | Victims |
|-------------|-------------|-----------|---------|
| 201408297 | 2399 | 23H | 1 |
| 201408298 | 2316 | 23H | 1 |
| 201408298 | 2501 | 250 | 1 |

**Location Records**

| Block Address | City | State | Zip Code |
|---------------|------|-------|---------|
| 19600 BLK CRYSTAL ROCK DR | Germantown | MD | 20874 |
| 13700 BLK CONNECTICUT AVE | Rockville | MD | 20906 |

---

## 📐 Normalization

The schema was developed across three normal forms:

**1NF — First Normal Form**
Established the foundational `crime` and `agency` tables, eliminating repeating groups and ensuring atomic values per field.

**2NF — Second Normal Form**
Further decomposed the `crime` table by extracting `offense` and `location` into their own tables, removing partial dependencies. A `linking_table` was introduced to manage the many-to-many relationship between crimes and locations.

**3NF — Third Normal Form**
Created the `nibrs` table to remove the transitive dependency of NIBRS codes on the `offense` table. The `agency` table was further split by extracting dispatch data into a dedicated `dispatch` table.

---

## 📐 SQL Views

Pre-built views are included to answer the most common public safety queries out of the box.

| View | Description |
|------|-------------|
| `avg_victims_per_dist` | Average victim count per police district |
| `total_crimes_by_city` | Total incident volume grouped by city |
| `high_victims_crimes` | Incidents filtered by highest victim counts |
| `crimes_locations_agency` | Full join — incident location + responding agency |
| `crimes_grouped_by_nibr` | Incidents organized by NIBRS crime category |

---

## ✨ Key Design Decisions

**Granular Severity Tracking**
Added a `victims_num` field per incident to surface the real-world impact of crimes beyond a simple count — enabling district-level comparisons and hotspot identification.

**Privacy-First Geography**
Replaced exact house numbers with block-level addresses (e.g., `19600 BLK CRYSTAL ROCK DR`) to preserve spatial trends while protecting individual privacy.

**Standardized Crime Classification**
Isolated NIBRS codes into a dedicated table, enabling consistent cross-jurisdictional categorization and compatibility with federal crime reporting standards.

**VARCHAR Optimization**
Testing revealed most `VARCHAR` fields required only ~10 characters despite an initial `VARCHAR(45)` allocation throughout the schema. Right-sizing these fields meaningfully improved database efficiency.

---

## ⚖️ Ethics & Privacy

**Excluded Identifiers**
Although crime statistics are public record, we deliberately omitted any personal identifiers — race, name, age — that could perpetuate stereotypes or enable discriminatory use of the data.

**Informed Community Use**
This database is designed to empower residents with awareness of local crime patterns to support safer decision-making, not to surveil or profile individuals or communities.

> ⚠️ This data must not be used for racial profiling, discriminatory resource allocation, or any purpose that undermines community trust. Responsible use means pairing crime statistics with socioeconomic context — not treating incident counts as the full picture.

---

## 🔭 Future Work

- **Predictive Modeling** — Integrate ML models to forecast high-risk periods and locations
- **Geospatial Analysis** — Layer crime data onto interactive maps for visual hotspot identification
- **Socioeconomic Integration** — Incorporate external indicators (poverty, housing, education) to contextualize crime trends
- **Dashboard** — Build a public-facing visualization layer for non-technical stakeholders

---

## 📄 License

Built on publicly available data from the [Montgomery County Open Data Portal](https://data.montgomerycountymd.gov/). Please review Montgomery County's data terms of use before redistributing or publishing derivative works.
