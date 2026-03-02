---
name: sprint-execution
description: Sprint execution with development, adversarial code review, iterative testing, security audit, and closure. Use after requirements-analysis when master documents are ready.
user-invocable: true
---

# Sprint Execution Workflow

Kick-off, parallel development, code review, test/fix cycle, security audit, closure.

## Trigger

Invoke with `/sprint-execution` when:
- Master documents are updated and approved
- Clarity Gate is passed
- Team is ready to implement

## Prerequisites (Entry Gate)

**BLOCKING**: Do not proceed if even one prerequisite is missing.

- [ ] Roadmap: `requirements/sprints/sprint-N-roadmap.md` exists
- [ ] Clarity Gate passed (PASS or CONDITIONAL PASS with score >= 7)
- [ ] Implementation Readiness Check passed (READY verdict)
- [ ] `functional-analysis.md` updated for in-scope features
- [ ] `technical-analysis.md` updated for in-scope features
- [ ] Exit criteria defined in roadmap
- [ ] Testbook populated with test scenarios for in-scope features (designed from specs in `/requirements-analysis` Phase 6, reviewed by Spec Analyst in Phase 6b)
- [ ] Security/privacy checklists planned

If a prerequisite is missing → return to `/requirements-analysis`.

## Workflow

### PHASE 1: Technical Kick-off

Everyone reads:
1. `requirements/sprints/sprint-N-roadmap.md`
2. `analysis/functional-analysis.md` (in-scope sections)
3. `analysis/technical-analysis.md` (in-scope sections)
4. `analysis/principles.md`
5. `analysis/risk-register.md` (active risks relevant to this sprint)
6. `analysis/lessons-learned.md` (relevant entries from previous sprints)

Alignment on: questions, dependencies, execution order.

---

### PHASE 2: Development

> **Note**: Test scenarios have already been designed and reviewed during `/requirements-analysis` (Phases 6-6b). The testbook is populated and validated BEFORE development starts.

#### 2.1 Execution Order
```
DB (schema + RLS) ──> Backend (API) ──> Frontend (UI)
```

#### 2.2 Per Module

**Implementation** (Sonnet model for speed):
- Follow contracts from technical-analysis
- Implement EXACTLY what's specified
- Respect documented anti-patterns
- Economy: minimum code possible

**Code Review** (`code-reviewer`):
- Adversarial review across all 6 dimensions (Spec Adherence, Simplicity & Economy, Security, Performance, HLA Coherence, Error Handling — see `.claude/agents/code-reviewer.md`)

**UX Review** (`ux-designer`, if activated — only for frontend code):
- UI implementation matches user flows in functional-analysis
- Interaction patterns consistent with design system
- States handled (empty, loading, error, success)
- Accessibility requirements met (WCAG 2.1 AA)
- MUST find at least 3 specific findings (see `.claude/agents/code-reviewer.md` Minimum Findings Policy)
- Verdict: APPROVED / APPROVED WITH NOTES / CHANGES REQUIRED
- If CHANGES REQUIRED → fix → re-review

**Test** (`senior-test-engineer`):
- Execute ALL test cases from the testbook (designed from specs in `/requirements-analysis` Phases 6-6b, before code)
- The testbook already defines full coverage: data, API, M2M integrations, human interfaces, business rules, performance, regression — execute every applicable category
- Use the test infrastructure built during the sprint (stubs, simulators, test APIs, fixtures)
- Tests run on the development environment's own infrastructure (DB, services, code); external systems use stubs/simulators built during the sprint
- If a test fails, the **first assumption** is that the bug is in the code (the test was designed from specs and reviewed by the Spec Analyst). If the test keeps failing after code fixes, verify testbook alignment with specs (see Phase 3 — Repeated test failures).

#### 2.3 Fix Cycle

```
Code Complete ──> Code Review ──> APPROVED? ──> Test ──> PASS?
     │                  │                          │
     │                  └── No ──> Fix ──> Re-review
     │                                             │
     │                                    └── No ──> Analysis ──> Fix ──> Retest
     ▼
Feature Done
```

---

### PHASE 3: Test Results Management

**PASS**: Feature confirmed, mark test as passed

**FAIL**:
1. Immediate brainstorming (Tester + Dev + optionally Architect)
2. Root Cause Analysis:

| Cause | Action | Who |
|-------|--------|-----|
| Software Bug | Fix code → Retest | Dev |
| Ambiguous Requirement | **FIX THE SPEC** → then fix code and test → Retest | Analyst + Dev |
| Technical Blocker | Mark SKIPPED with reason | Team |

> **Repeated test failures after code rewrites**: If a test fails consistently after 2+ code fix attempts, the problem may be in the testbook, not the code. In this case, the **Spec Analyst** reviews the failing test case against the specifications to verify that the test correctly interprets the spec. Possible outcomes:
> - **Test misinterprets the spec** → Spec Analyst corrects the testbook → Retest
> - **Spec is ambiguous** → Fix the spec first → then update testbook and code → Retest
> - **Test and spec are correct** → The code has a deeper bug → escalate to Architect for analysis

**SKIPPED** (only if):
- [ ] Reason documented
- [ ] Accepted by at least 2 members
- [ ] Task created for future resolution
- [ ] Doesn't impact critical exit criteria

---

### PHASE 4: Security and Privacy Audit

**Agent**: `security-privacy-auditor`

After all functional tests pass:
1. Security audit on new endpoints
2. Verify RLS on new tables
3. Privacy check on sensitive data
4. Checklist `analysis/checklists/security.md`
5. Checklist `analysis/checklists/privacy.md`
6. Checklist `analysis/checklists/performance.md`
7. Checklist `analysis/checklists/accessibility.md` (if frontend modified)

Verdict: PASS / PASS WITH NOTES / FAIL
- If FAIL → fix → re-audit

---

### Session Continuity

Sprint execution is a long workflow. If context degrades or the session must be interrupted:
1. Generate a handover file following the protocol in `CLAUDE.md` (Session Continuity Protocol)
2. Include: current phase, which features are done/in-progress/pending, code review status, test results so far
3. Write to `.tmp/handover-YYYY-MM-DD-HHMMSS.md`

When resuming, read the handover file and continue from the exact point of interruption.

---

### PHASE 4b: Sprint Failure Recovery

If the sprint is irrecoverable (architectural CRITICAL finding, invalidated requirements, insurmountable technical blocker):

1. **STOP** - Don't force closure
2. **Post-mortem**: document what went wrong and why
3. **Save work**: commit working code, update docs with actual state
4. **Re-plan**: return to `/sprint-planning` with lessons learned
5. **Document** in `requirements/plan.md`: "Sprint N - CANCELLED: [reason]"

---

### PHASE 5: Sprint Closure

#### 5.1 Documentation Review
- [ ] Final DB schema = `technical-analysis.md`?
- [ ] Final API contracts match?
- [ ] User flows = `functional-analysis.md`?

#### 5.2 Docs Update (implementation delta only)
If during implementation the actual behavior diverges from the spec (e.g., discovered edge cases, adjusted contracts, schema tweaks), update master docs to reflect the real state:
- Update functional-analysis.md
- Update technical-analysis.md
- Add changelog entry

> **Note**: Master docs were already consolidated during `/requirements-analysis` Phase 5. This step captures only deltas discovered during implementation.

#### 5.3 Update Traceability Matrix
In `test/testbook.md`, update:
```
| Requirement | Test Case | Endpoint/Module | Sprint | Result |
|-------------|-----------|-----------------|--------|--------|
| FR-012 | TC-045 | POST /api/v1/... | S-N | PASS |
```

#### 5.4 Final Report

```markdown
# Sprint N - Final Report

## Summary
| Metric | Value |
|--------|-------|
| Total Tests | XX |
| Passed | XX |
| Failed (resolved) | XX |
| Skipped | XX |
| Code Review findings resolved | XX |
| Security audit: | PASS/FAIL |

## Exit Criteria
- [x] Criterion 1 - VERIFIED
- [x] Criterion 2 - VERIFIED

## Completed Features
| Feature | Status | Notes |

## Resolved Bugs
| Bug | Root Cause | Fix |

## Security & Privacy
| Finding | Severity | Status |

## Doc Updates
- functional-analysis.md: [changes]
- technical-analysis.md: [changes]

## Retrospective
### What worked well
### What to improve
```

#### 5.5 Update Lessons Learned

After generating the Final Report, update `analysis/lessons-learned.md`:

1. **What Worked**: extract from retrospective "What worked well" — add entries with concrete rationale
2. **What Didn't Work**: extract from retrospective "What to improve" + root causes from resolved bugs and failed tests — focus on systemic patterns, not one-off issues
3. **Improvement Actions**: define concrete actions for future sprints, assign owner, set status to "Pending"
4. **Update existing actions**: mark previously "Pending" actions as "Done" if they were applied in this sprint

---

## Closure Checklist

**Tests (BLOCKING)**:
- [ ] Test cases designed from specs BEFORE implementation (completed in `/requirements-analysis` Phase 6-6b)
- [ ] ALL applicable testbook categories executed (data, API, M2M, human interfaces, business rules, performance, regression)
- [ ] Test infrastructure used (own DB and services, stubs/simulators for external systems)
- [ ] Regression suite executed with 100% pass rate
- [ ] All PASS or justified SKIPPED
- [ ] Traceability: every in-scope FR has at least one test case
- [ ] Execution report generated

**Code Review**:
- [ ] Adversarial review completed
- [ ] Zero open CRITICAL findings
- [ ] Zero open HIGH findings

**Security**:
- [ ] Security audit PASS
- [ ] Privacy audit PASS

**Docs**:
- [ ] Master docs updated
- [ ] Traceability updated
- [ ] Changelog updated
- [ ] `analysis/lessons-learned.md` updated (what worked, what didn't, improvement actions)

**Risk Register**:
- [ ] `analysis/risk-register.md` updated (new risks identified, resolved risks closed, mitigations reviewed)

**Delivery**:
- [ ] Final report generated
