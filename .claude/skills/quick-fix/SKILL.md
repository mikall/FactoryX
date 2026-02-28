---
name: quick-fix
description: Corrective maintenance for bug fixes. Lightweight process that fixes implementation without modifying specs. If the problem is in the spec, escalate to Change Request.
user-invocable: true
---

# Quick Fix Workflow

Lean process for bug fixes and corrective maintenance. Does NOT change specs, corrects the operational interpretation and implementation.

## Trigger

Invoke with `/quick-fix` when:
- Bug reported in production or testing
- Behavior not conforming to specs
- Targeted fix without architectural impact

## Fundamental Rule

**Bug fix corrects the HOW, not the WHAT.**

If during diagnosis you discover that:
- The requirement is ambiguous → ESCALATE to `/sprint-planning`
- A use case is missing → ESCALATE to `/sprint-planning`
- An architectural change is needed → ESCALATE to `/sprint-planning`

Quick Fix is for: "the spec says X, the code does Y, let's fix the code."

## Workflow

### PHASE 1: Diagnosis

1. **Read the report**: what happens vs what's expected
2. **Verify the spec**: read the relevant section in `functional-analysis.md` and `technical-analysis.md`
3. **Classify**:

| Situation | Action |
|-----------|--------|
| Spec clear, code wrong | Proceed with Quick Fix |
| Spec ambiguous or missing | **STOP** → Escalate to CR |
| Unforeseen use case | **STOP** → Escalate to CR |
| Regression from previous sprint | Proceed with Quick Fix |

4. **Classify severity**:

| Severity | Description | Indicative SLA |
|----------|-------------|----------------|
| **Critical** | System down, data loss, compromised security | Fix within 4h |
| **High** | Core functionality blocked, no workaround | Fix within 1 day |
| **Medium** | Degraded functionality, workaround available | Fix within the sprint |
| **Low** | Cosmetic defect, rare edge case | Backlog |

5. **Scope check**: if the fix touches more than 3 files or requires DB migration → evaluate escalation

**Output**: Diagnosis with root cause, severity, and classification

---

### PHASE 2: Fix

1. Implement the minimal correction
2. Economy principle: the smallest fix that solves the problem
3. DO NOT refactor "while you're at it"
4. DO NOT add features "while you're at it"

---

### PHASE 3: Quick Code Review

**Agent**: `code-reviewer` (light mode)

Verify only:
- [ ] Does the fix resolve the reported bug?
- [ ] Does the fix not introduce obvious regressions?
- [ ] Is the fix minimal (economy)?
- [ ] No security issues introduced?

---

### PHASE 4: Test

1. **Regression test**: is the original bug resolved?
2. **Impact analysis via reverse traceability**: consult the reverse matrix in `test/testbook.md` (section 2.2) to identify ALL test cases covering modified modules
3. **Re-execute impacted TCs**: not just the bug's TC, but all connected to touched modules
4. **Smoke test**: execute the smoke test suite (testbook section 4.1)
5. If the bug had a TC in the testbook, re-execute that TC
6. If there was no TC, **create one** in the testbook AND add it to the **regression suite** (section 4.2)

---

### PHASE 5: Documentation

1. **DO NOT modify** functional-analysis.md or technical-analysis.md (the spec doesn't change)
2. **Update** the testbook if you added a new TC
3. **UX Review** (`ux-designer`, if activated and the fix touches UI) — verify the fix doesn't break interaction patterns or accessibility
4. **Risk feedback**: if the root cause reveals a systemic issue (pattern of similar bugs, architectural weakness), document it in `analysis/risk-register.md` as a new risk
5. **Document** the bug fix:

```markdown
## Bug Fix - BF-XXX

| Field | Value |
|-------|-------|
| Date | YYYY-MM-DD |
| Report | [description] |
| Root Cause | [cause] |
| Fix | [what was modified] |
| Modified Files | [file list] |
| Regression Test | PASS/FAIL |
| New TC Added | TC-XXX (if applicable) |
| Risk Registered | [risk ID if systemic issue, or N/A] |
| Anti-pattern Identified | [pattern that caused the defect — to be added to module anti-patterns during next `/requirements-analysis`] |
```

---

## Scope Detection

If during any phase the work turns out larger than expected:

| Signal | Action |
|--------|--------|
| Fix touches 4+ files | Evaluate escalation |
| Requires DB migration | Almost certainly CR |
| Requires new endpoint | Almost certainly CR |
| Original requirement was wrong | Definitely CR |
| Fix requires > 30 min | Evaluate escalation |

**Communication**: "I started this as a quick-fix but the problem is deeper than a bug. I suggest escalating to Change Request because [reason]."

---

## Relationship with Other Workflows

```
Bug reported
     │
     ▼
/quick-fix ──> Diagnosis
     │
     ├── Spec OK, code wrong ──> Fix ──> Review ──> Test ──> Done
     │
     └── Spec ambiguous/missing ──> ESCALATE
                                       │
                                       ▼
                          /sprint-planning (full CR cycle)
```
