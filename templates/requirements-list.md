# {{PROJECT_NAME}} - Requirements List

> Complete catalog of functional requirements (FR), non-functional requirements (NFR), and user stories (US).

---

## Functional Requirements

| ID | Module | Requirement | Priority | Sprint | Status |
|----|--------|-------------|----------|--------|--------|
| FR-001 | {{MODULE}} | {{REQUIREMENT}} | Must | S1 | Pending |
| FR-002 | {{MODULE}} | {{REQUIREMENT}} | Must | S1 | Pending |
| FR-003 | {{MODULE}} | {{REQUIREMENT}} | Should | S2 | Pending |

**Priority Legend (MoSCoW)**:
- **Must**: Mandatory for MVP, system doesn't work without it
- **Should**: Important, planned but deferrable
- **Could**: Desirable if there's time
- **Won't**: Explicitly excluded from this release

**Origin**: Requirements that emerge from design decisions (not from the client) must be marked `[DERIVED]` in the Requirement column and communicated to the PM for business impact assessment.

---

## Non-Functional Requirements

| ID | Category | Requirement | Stimulus | Response | Measure |
|----|----------|-------------|----------|----------|---------|
| NFR-001 | Performance | API response time | User requests any API endpoint | System returns response | < 200ms at p95 |
| NFR-002 | Performance | First Contentful Paint | User navigates to any page | Browser renders first content | FCP < 1s |
| NFR-003 | Availability | Monthly uptime | Any time during the month | System is operational | > 99.5% |
| NFR-004 | Security | Authentication | User attempts login | System verifies identity | {{AUTH_STANDARD}} |
| NFR-005 | Security | Authorization | Authenticated user accesses resource | System enforces permissions | {{AUTH_MECHANISM}} |
| NFR-006 | Privacy | GDPR | System processes personal data | System applies data minimization | Consent + minimization |
| NFR-007 | Scalability | Concurrent users | {{TARGET}} users access simultaneously | System remains responsive | Response within NFR-001 target |
| NFR-008 | Maintainability | Code coverage | Developer runs test suite | Tests cover critical modules | > 80% critical modules |

---

## User Stories

### US-001: {{STORY_TITLE}}

**As a** {{role}},
**I want to** {{action}},
**so that** {{benefit}}.

**Acceptance Criteria**:
```gherkin
Scenario: {{scenario_name}}
  Given {{precondition}}
  When {{action}}
  Then {{result}}
```

**Priority**: Must | **Sprint**: S1 | **Requirements**: FR-001, FR-002

---

## Traceability Matrix

| User Story | Requirements | Module | Sprint |
|-----------|-------------|--------|--------|
| US-001 | FR-001, FR-002 | {{MODULE}} | S1 |

---

## Excluded from MVP (Won't)

| ID | Description | Reason | When |
|----|-------------|--------|------|
| FR-W01 | {{FEATURE}} | {{WHY_EXCLUDED}} | Post-MVP |

---

## Changelog

| Date | Changes |
|------|---------|
| {{DATE}} | Initial creation |
