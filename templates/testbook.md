# {{PROJECT_NAME}} - Test Book

> Complete test case catalog, traceability matrix, and quality metrics.
> This document GROWS over time. Do not create separate files per sprint.
>
> **Fundamental principle**: Tests are designed FROM specification documents (functional-analysis.md, technical-analysis.md, requirements-list.md), NEVER from source code. The testbook is populated BEFORE implementation starts. Tests verify expected behavior as defined in specs — if a test fails, the bug is in the code, not in the test.

---

## 1. Quality Metrics (Governance Dashboard)

### Current Sprint: S{{N}}

| Metric | Target | Actual | Trend |
|--------|--------|--------|-------|
| Requirements covered by tests | 100% FR | {{X}}% | {{up/down/stable}} |
| Pass Rate (P0/P1) | 100% | {{X}}% | |
| Pass Rate (P2/P3) | > 95% | {{X}}% | |
| Defect Density | < 5/KLOC | {{X}} | |
| Defect Escape Rate | < 2% | {{X}}% | |
| Automation Rate | > 60% | {{X}}% | |
| Test Execution Time | < {{X}} min | {{X}} min | |
| Mean Time to Detect | < {{X}}h | {{X}}h | |
| Flaky Test Rate | < 5% | {{X}}% | |
| Regression Pass Rate | 100% | {{X}}% | |

### Sprint History

| Sprint | Total Tests | Pass | Fail (resolved) | Skip | Bugs Found | Bugs in Prod |
|--------|------------|------|-----------------|------|------------|-------------|
| S1 | | | | | | |

---

## 2. Traceability Matrix (Bidirectional)

### 2.1 Requirement → Test (Forward)

| Requirement | User Story | Test Case(s) | Endpoint/Module | Sprint | Last Result |
|-------------|-----------|-------------|-----------------|--------|------------|
| FR-001 | US-001 | TC-001, TC-002 | POST /api/v1/... | S1 | PASS |

### 2.2 Test → Requirement (Reverse)

> For impact analysis during quick-fix and regressions.

| Test Case | Requirements Covered | Impacted Modules | Type | Regression Suite? |
|-----------|---------------------|------------------|------|-------------------|
| TC-001 | FR-001 | Auth, Users | E2E | Yes |

---

## 3. Test Infrastructure

### Tools and Artifacts

| Artifact | Type | Purpose | Path | Sprint |
|----------|------|---------|------|--------|
| {{tool}} | Mock Server | Simulate external service X | test/mocks/... | S1 |
| {{tool}} | Logger | Capture requests for analysis | test/tools/... | S1 |
| {{tool}} | Fixture Manager | Test data setup/teardown | test/fixtures/... | S1 |

---

## 4. Regression Suite and Smoke Tests

### 4.1 Smoke Test Suite (execute before any other test)

> Fundamental tests to verify the software installs, starts, and responds.
> These MUST PASS before running any functional, integration, or E2E test.
> Smoke tests should be executable in any development environment without external dependencies.

| TC | Scenario | Pass Criterion | Max Time |
|----|----------|---------------|----------|
| SMOKE-001 | Installation succeeds | Build/install completes with exit code 0 | 60s |
| SMOKE-002 | Software starts | Entry point runs without crash | 5s |
| SMOKE-003 | Version/help responds | `--version` or `--help` (or equivalent) returns expected output | 2s |
| SMOKE-004 | Health check (if applicable) | API health endpoint responds HTTP 200 | 5s |

### 4.2 Regression Suite (execute every sprint)

> Tests covering consolidated functionality. A failure indicates regression.

| TC | Protected Feature | Origin Sprint | Automated | Last Run |
|----|------------------|---------------|-----------|---------|
| _populate during sprints_ | | | | |

**Composition rules**:
- Every bug fix MUST add a TC to the regression suite to prevent recurrence
- Every TC covering a P0/P1 requirement or a critical E2E flow is an automatic candidate for the regression suite
- The test engineer decides on final promotion during sprint closure

### 4.3 Test Data Management

| Type | Strategy | Tool/Method |
|------|----------|-------------|
| Test data | Deterministic fixtures, replicable seed | Fixture Manager |
| Cleanup | Automatic teardown post-test | Test API / transaction rollback |
| Sensitive data | NEVER real data in tests, use faker/generators | Faker library |
| Isolation | Each test suite restores initial state | Setup/teardown per suite |

---

## 5. Test Cases

> **Mode field (mandatory)**: Every test case MUST declare its execution mode at design time:
> - **Real** — Executed against the actual system/integration
> - **Stub** — Executed using stubs, mocks, or simulators (document which artifacts are needed in Section 3)
> - **Skip** — Not executable in this environment/sprint (must have documented justification)
>
> This decision is made during testbook design (before implementation), based on what integrations are available in the development environment. If a test requires a stub, the stub must be listed in Section 3 (Test Infrastructure).

### 5.1 Module: {{MODULE_NAME}}

#### TC-001: {{TEST_NAME}}

| Field | Value |
|-------|-------|
| **Priority** | P0 / P1 / P2 / P3 |
| **Type** | Functional / Integration / E2E / Performance |
| **Mode** | Real / Stub / Skip — _decided during testbook design, before implementation_ |
| **Automation** | Automated / Manual / Candidate |
| **Requirements** | FR-001, FR-002 |
| **Sprint** | S1 |

**Preconditions**:
- {{precondition 1}}
- {{precondition 2}}

**Steps**:
1. {{step 1}}
2. {{step 2}}
3. {{step 3}}

**Expected Result**:
- {{expected result}}

**Test Data**:
| Input | Value |
|-------|-------|
| {{field}} | {{value}} |

**Postconditions / Cleanup**:
- {{cleanup_action}}

**Execution History**:
| Sprint | Date | Result | Notes |
|--------|------|--------|-------|
| S1 | {{DATE}} | PASS/FAIL | |

---

## 6. Edge Cases and Boundary Values

### Module: {{MODULE_NAME}}

| TC | Scenario | Input | Expected | Type |
|----|----------|-------|----------|------|
| TC-E01 | Lower boundary value | {{min}} | {{expected}} | Boundary |
| TC-E02 | Upper boundary value | {{max}} | {{expected}} | Boundary |
| TC-E03 | Empty input | null/empty | Error 400 | Negative |
| TC-E04 | Malformed input | {{invalid}} | Error 400 | Negative |

---

## 7. Executions

### Sprint {{N}} - Execution {{DATE}}

| TC | Result | Notes | Evidence |
|----|--------|-------|----------|
| TC-001 | PASS / FAIL / SKIP | {{note}} | {{screenshot/log}} |

---

## Testbook Maintenance

> Every 3-5 sprints, perform a testbook review:
> - Remove obsolete TCs (features removed or rewritten)
> - Verify regression suite doesn't contain redundant TCs
> - Update traceability matrix for modified requirements
> - Verify flaky TCs have been stabilized or removed
> - Archive old executions (> 5 sprints) in the Archive section

---

## Changelog

| Sprint | Date | Changes |
|--------|------|---------|
| S1 | {{DATE}} | Initial creation |
