# {{PROJECT_NAME}} - Functional Analysis

> Single Source of Truth for functional requirements, user stories, business rules, and user flows.
> This document GROWS over time. Do not create separate files per sprint.
> Version: 1.0 | Last update: Sprint S0

---

## 1. Overview

### 1.1 System Purpose
{{SYSTEM_PURPOSE}}

### 1.2 Users and Roles

| Role | Description | Access |
|------|-------------|--------|
| {{ROLE_1}} | {{DESCRIPTION}} | {{ACCESS_LEVEL}} |

### 1.3 Main User Flow
```
[Step 1] ──> [Step 2] ──> [Step 3] ──> [Step N]
```

---

## 2. Functional Modules

### 2.1 Module: {{MODULE_NAME}}

#### Purpose
One sentence: what it does and why.

#### User Stories

| ID | As a | I want to | So that |
|----|------|-----------|---------|
| US-001 | {{role}} | {{action}} | {{benefit}} |

#### Business Rules

| ID | Rule | Condition | Action | Exception |
|----|------|-----------|--------|-----------|
| BR-001 | {{name}} | {{when}} | {{then}} | {{otherwise}} |

#### Acceptance Criteria

```gherkin
Given [precondition]
When [user action]
Then [expected result]
```

#### Detailed Flow
```
[Input] ──> [Validation] ──> [Processing] ──> [Output]
                │
                └── [Error] ──> [Error handling]
```

#### Anti-patterns

| Don't Do | Do Instead | Why |
|----------|-----------|-----|
| {{dont}} | {{do}} | {{why}} |
| {{dont}} | {{do}} | {{why}} |
| {{dont}} | {{do}} | {{why}} |

---

## 3. Entity Lifecycles

> For each main entity, document possible states and transitions.

### 3.1 Entity: {{ENTITY_NAME}}

```
[State_1] ──(event)--> [State_2] ──(event)--> [State_3]
                             │
                             └──(event)--> [State_4]
```

| State | Description | Allowed Transitions | Who Can Trigger |
|-------|-------------|-------------------|-----------------|
| {{state}} | {{desc}} | → {{target_state}} (via {{event}}) | {{role}} |

**Constraints**:
- {{constraint on disallowed transitions}}

---

## 4. Non-Functional Requirements

| ID | Category | Requirement | Metric | Target |
|----|----------|-------------|--------|--------|
| NFR-001 | Performance | API response time | p95 latency | < 200ms |
| NFR-002 | Availability | Uptime | monthly % | > 99.5% |
| NFR-003 | Security | Authentication | Standard | JWT/OAuth2 |

---

## 5. External Integrations

| System | Type | Protocol | Data Exchanged | Error Handling |
|--------|------|----------|---------------|----------------|
| {{SYSTEM}} | {{IN/OUT/BIDI}} | {{REST/WS/...}} | {{DATA}} | {{FALLBACK}} |

---

## 6. Glossary

| Term | Definition | Usage Context |
|------|-----------|---------------|
| {{TERM}} | {{DEF}} | {{CONTEXT}} |

---

## Changelog

| Sprint | Date | Changes |
|--------|------|---------|
| S0 | {{DATE}} | Initial creation |
