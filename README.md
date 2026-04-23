# 🗃️ Montgomery County Crime Database

A normalized relational database built on 300,000+ public incident records from the Montgomery County Police Department — designed for clarity, privacy, and actionable public safety insights.

---

## 📌 Project Overview

This project transformed a complex, daily-updated public dataset from the Montgomery County Police Department (MCPD) into a streamlined relational database. Rather than inheriting the sprawling structure of the source data, we re-architected it into a clean, normalized model optimized for accuracy and usability.

The database covers both open and closed cases dating back to **July 2016**, with analysis focused on the **200 most recent incidents** to surface high-activity areas and track evolving regional trends.

---

## 🏗️ Database Architecture

The design moves away from the original flat public structure toward a fully normalized relational model, centered on a **primary Crime table** linked to specialized supplemental tables via distinct IDs.

### Entity-Relationship Overview

```
                        ┌─────────────┐
                        │    Crime    │  ← Core table (Incident ID, CR number,
                        │  (Primary)  │    victim counts, start/end dates)
                        └──────┬──────┘
             ┌─────────────────┼──────────────────┐
             │                 │                  │
      ┌──────▼──────┐   ┌──────▼──────┐   ┌──────▼──────┐
      │  Location   │   │   Agency    │   │  Dispatch   │
      │             │   │             │   │             │
      │ Block addr  │   │ District    │   │ Response    │
      │ City        │   │ Responding  │   │ date & time │
      │ Zip code    │   │ agency      │   └─────────────┘
      └─────────────┘   └─────────────┘
                                │
                        ┌───────▼───────┐
                        │ Offense/NIBRS │
                        │               │
                        │ Crime type    │
                        │ NIBRS codes   │
                        └───────────────┘
```

### Table Descriptions

| Table | Key Fields | Purpose |
|-------|-----------|---------|
| `Crime` | `incident_id`, `cr_number`, `victim_count`, `start_date`, `end_date` | Core incident record |
| `Location` | `block_address`, `city`, `zip_code` | Privacy-safe geography |
| `Agency` | `district_name`, `district_number`, `agency_name` | Responding law enforcement |
| `Offense` | `offense_code`, `crime_name_1/2/3` | Hierarchical crime classification |
| `NIBRS` | `nibrs_code`, `nibrs_description` | Standardized federal categorization |
| `Dispatch` | `dispatch_date`, `dispatch_time` | Law enforcement response timing |

---

## ✨ Key Design Decisions

**Granular Severity Tracking**
Added a `victim_count` field per incident to surface the real-world impact of crimes beyond a simple tally — enabling district-level comparisons and hotspot identification.

**Privacy-First Geography**
Replaced exact house numbers with block-level addresses (e.g., `600 BLK DENHAM RD`) to preserve spatial trends while protecting individual privacy.

**Standardized Crime Classification**
Isolated NIBRS codes into a dedicated table, enabling consistent cross-jurisdictional categorization and compatibility with federal crime reporting standards.

**VARCHAR Optimization**
Testing revealed most `VARCHAR` fields required only ~10 characters despite an initial 45-character allocation. Right-sizing these fields meaningfully improved database efficiency.

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
