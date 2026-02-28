# {{PROJECT_NAME}} - Technical Analysis

> Single Source of Truth for DB schema, API contracts, data architecture, and technical specifications.
> This document GROWS over time. Do not create separate files per sprint.
> Version: 1.0 | Last update: Sprint S0

---

## 1. Technology Stack

> Defined during `/project-bootstrap`. See ADR-001 in `analysis/HLA.md` for rationale.

| Layer | Technology | Version | Rationale |
|-------|-----------|---------|-----------|
| Frontend | {{FRONTEND_STACK}} | {{VER}} | {{RATIONALE}} |
| Backend | {{BACKEND_STACK}} | {{VER}} | {{RATIONALE}} |
| Database | {{DATABASE}} | {{VER}} | {{RATIONALE}} |
| Auth | {{AUTH}} | {{VER}} | {{RATIONALE}} |
| UI Library | {{UI_LIBRARY}} | {{VER}} | {{RATIONALE}} |

---

## 2. Data Model

### 2.1 Table: {{TABLE_NAME}}

| Column | Type | Nullable | Default | Constraints | Notes |
|--------|------|----------|---------|-------------|-------|
| id | UUID | NO | gen_random_uuid() | PK | |
| created_at | TIMESTAMPTZ | NO | now() | | Auto |
| updated_at | TIMESTAMPTZ | NO | now() | | Trigger |

**Indices**:
- `idx_{{table}}_{{col}}` on `{{col}}` (frequent query: {{use_case}})

**Access Control Policies**:
- SELECT: {{SELECT_POLICY}}
- INSERT: {{INSERT_POLICY}}
- UPDATE: {{UPDATE_POLICY}}
- DELETE: {{DELETE_POLICY}}

**Anti-patterns**:

| Don't Do | Do Instead | Why |
|----------|-----------|-----|
| Store derived data | Calculate on the fly | Data inconsistency |

### 2.2 ER Diagram
```
[users] 1──N [{{table_1}}] N──1 [{{table_2}}]
```

---

## 3. API Contracts

### 3.1 {{MODULE}} API

#### `{{METHOD}} /api/v1/{{path}}`

**Purpose**: One sentence.

**Auth**: {{required/optional/none}} | **Roles**: {{roles}}

**Request**:
```json
{
  "field": "string (required, max 100 chars)"
}
```

**Response 200**:
```json
{
  "id": "uuid",
  "field": "string",
  "created_at": "ISO8601"
}
```

**Errors**:

| Status | Code | Message | When |
|--------|------|---------|------|
| 400 | VALIDATION_ERROR | "field X required" | Missing field |
| 401 | UNAUTHORIZED | "Invalid token" | Expired/missing JWT |
| 403 | FORBIDDEN | "Access denied" | Insufficient role |
| 404 | NOT_FOUND | "Resource not found" | Non-existent ID |
| 409 | CONFLICT | "Resource already exists" | Duplicate |

**Error Handling Matrix**:

| External Service | Detection | Response | Fallback | Log Level | Alert |
|-----------------|-----------|----------|----------|-----------|-------|
| {{SERVICE}} | {{DETECTION}} | {{RESPONSE}} | {{FALLBACK}} | {{LOG_LEVEL}} | {{ALERT}} |

---

## 4. Migrations

| # | Name | Description | Sprint | Reversible |
|---|------|-------------|--------|-----------|
| 001 | initial_schema | Initial schema | S1 | NO |

---

## 5. Conventions

### Naming
- DB tables: snake_case, plural (`users`, `order_items`)
- DB columns: snake_case (`created_at`, `user_id`)
- API endpoints: kebab-case (`/api/v1/user-profiles`)
- Code conventions: {{CODE_CONVENTIONS}} (defined during /project-bootstrap based on chosen stack)

### Error Codes
Format: `{DOMAIN}_{ERROR}` (e.g., `AUTH_TOKEN_EXPIRED`, `USER_NOT_FOUND`)

### Pagination
All list endpoints support: `?page=1&per_page=20` (default: page=1, per_page=20, max=100)

---

## Changelog

| Sprint | Date | Changes |
|--------|------|---------|
| S0 | {{DATE}} | Initial creation |
