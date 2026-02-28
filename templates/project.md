# {{PROJECT_NAME}} - Project Reference

> {{PROJECT_DESCRIPTION}}

---

## Project Info

| Field | Value |
|-------|-------|
| Project Name | **{{PROJECT_NAME}}** |
| Type | {{PROJECT_TYPE}} |
| Target | {{TARGET_USERS}} |
| Start Date | {{START_DATE}} |
| Current Sprint | **S0 - Initial Setup** |
| Process Tier | **Tier 1 - Standard** |
| Vision | {{VISION_STATEMENT}} |

---

## Business Context

| Field | Value |
|-------|-------|
| **Business Domain** | {{BUSINESS_DOMAIN}} (e.g., HealthTech, FinTech, EdTech, E-commerce, SaaS B2B) |
| **Industry Regulations** | {{REGULATIONS}} (e.g., GDPR, HIPAA, PCI-DSS, SOC2, none) |
| **Target Market** | {{TARGET_MARKET}} (e.g., EU, US, Global) |

## Team Expertise

| Area | Technologies / Competencies |
|------|---------------------------|
| **Frontend** | {{FE_EXPERTISE}} (e.g., React, Next.js, TypeScript, Tailwind) |
| **Backend** | {{BE_EXPERTISE}} (e.g., Python, FastAPI, Node.js, Go) |
| **Database** | {{DB_EXPERTISE}} (e.g., PostgreSQL, Supabase, MongoDB) |
| **DevOps** | {{DEVOPS_EXPERTISE}} (e.g., Vercel, AWS, Docker, CI/CD) |
| **Domain Knowledge** | {{DOMAIN_KNOWLEDGE}} (e.g., payments, ML/AI, real-time, IoT) |

> These fields inform agent decisions. The architect will prefer technologies within team expertise. The PM will consider domain regulations when prioritizing.

---

## Directory Structure

```
{{PROJECT_NAME}}/
├── project.md                      <- This file (central reference)
├── intake/                         <- Drop any unstructured material here
├── analysis/
│   ├── principles.md               <- Versioned architectural principles
│   ├── HLA.md                      <- High Level Architecture (C4 Model) + ADR + DevOps
│   ├── functional-analysis.md      <- Functional analysis (SoT)
│   ├── technical-analysis.md       <- Technical analysis + Data Model
│   ├── risk-register.md            <- Risk tracking (updated per sprint)
│   └── checklists/                 <- Thematic quality gates
│       ├── clarity-gate.md
│       ├── security.md
│       ├── privacy.md
│       ├── performance.md
│       └── accessibility.md
├── requirements/
│   ├── requirements-list.md        <- Requirements list FR/NFR + User Stories
│   ├── plan.md                     <- Sprint plan
│   └── sprints/                    <- Roadmap per sprint
│       └── sprint-N-roadmap.md
├── src/apps/                        <- Application code (structure defined during /project-bootstrap)
├── deliverables/
│   ├── db/                         <- SQL Migrations
│   ├── api/                        <- API Specs (OpenAPI)
│   └── deploy/                     <- Deployment guides
└── test/
    ├── testbook.md                 <- Test case catalog + traceability
    └── sprint-N/                   <- Executions per sprint
        ├── executions/
        └── bug-reports/
```

---

## Deliverable List

| ID | Deliverable | Path | Status | Sprint |
|----|-------------|------|--------|--------|
| D01 | Requirements List | `requirements/requirements-list.md` | Pending | S0 |
| D02 | Sprint Plan | `requirements/plan.md` | Pending | S0 |
| D03 | Principles | `analysis/principles.md` | Pending | S0 |
| D04 | High Level Architecture | `analysis/HLA.md` | Pending | S0 |
| D05 | Functional Analysis | `analysis/functional-analysis.md` | Pending | S0 |
| D06 | Technical Analysis | `analysis/technical-analysis.md` | Pending | S0 |
| D07 | Database Schema | `deliverables/db/` | Pending | S1 |
| D08 | Test Book | `test/testbook.md` | Pending | S1+ |
| D09 | Source Code | `src/apps/` | Pending | S1+ |
| D10 | Risk Register | `analysis/risk-register.md` | Pending | S0 |
| D11 | Deploy Guide | `deliverables/deploy/` | Pending | S3+ |

---

## Success KPIs

| KPI | Target | Rationale |
|-----|--------|-----------|
| **{{KPI_1_NAME}}** | {{KPI_1_TARGET}} | {{KPI_1_RATIONALE}} |
| **{{KPI_2_NAME}}** | {{KPI_2_TARGET}} | {{KPI_2_RATIONALE}} |
| **{{KPI_3_NAME}}** | {{KPI_3_TARGET}} | {{KPI_3_RATIONALE}} |

---

## Technology Stack

> Defined during `/project-bootstrap`. See `analysis/HLA.md` and `analysis/technical-analysis.md` for details.

| Layer | Technology |
|-------|-----------|
| Frontend | {{FRONTEND_STACK}} |
| Backend | {{BACKEND_STACK}} |
| Database | {{DATABASE}} |
| Auth | {{AUTH}} |
| Hosting | {{HOSTING}} |

---

## Quick Links

- [Requirements List](requirements/requirements-list.md)
- [Sprint Plan](requirements/plan.md)
- [Principles](analysis/principles.md)
- [High Level Architecture](analysis/HLA.md)
- [Functional Analysis](analysis/functional-analysis.md)
- [Technical Analysis](analysis/technical-analysis.md)
- [Risk Register](analysis/risk-register.md)
- [Test Book](test/testbook.md)

---

## Changelog

| Date | Version | Description |
|------|---------|-------------|
| {{START_DATE}} | 0.1 | Project creation, initial setup |
