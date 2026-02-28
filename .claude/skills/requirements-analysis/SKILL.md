---
name: requirements-analysis
description: Detailed requirements analysis for a sprint. Expands the roadmap into atomic requirements, review with PM and Architect, clarity gate, updates master documents. Use after sprint-planning.
user-invocable: true
---

# Requirements Analysis Workflow

Expands the sprint roadmap into atomic requirements, validates them, and updates master documents.

## Trigger

Invoke with `/requirements-analysis` when:
- The sprint roadmap is ready
- Requirements need detailing before development
- functional-analysis or technical-analysis needs updating

## Prerequisites

- `requirements/sprints/sprint-N-roadmap.md`
- `requirements/requirements-list.md`
- `analysis/functional-analysis.md`
- `analysis/technical-analysis.md`
- `analysis/HLA.md`
- `analysis/principles.md`

## Workflow

### PHASE 1: Input & Scoping

1. Read the sprint roadmap
2. Read `requirements/requirements-list.md`
3. Read current master documents
4. Identify scope: features and requirements in perimeter

**Output**: In-scope feature list with references (FR-xxx)

---

### PHASE 2: Draft (Spec Analyst)

**Agent**: `spec-analyst`

For each in-scope feature:
1. Expand into atomic requirements (testable, unambiguous)
2. Define acceptance criteria (Given/When/Then)
3. Identify edge cases
4. Document anti-patterns (min. 3 per module; fewer accepted for trivial modules with justification)
5. Define error handling matrix
6. Analyze impacts on existing functionality
7. **Waste filter**: verify no requirement introduces extra features beyond the expressed need, relearning of already-documented knowledge, unnecessary handoffs, or foreseeable defects from ambiguity
8. Prepare delta for master documents

#### 2.1 Cross-Artifact Coherence Check (Integrated)

**Before finalizing the draft**, verify coherence with ALL existing master documents:

| Check | What to Verify | Action if Failed |
|-------|---------------|------------------|
| **Terminology consistency** | Same concept uses same name across all docs. Search for synonyms or near-duplicates (e.g., "user" vs "customer" vs "account holder") | Standardize terminology, update all occurrences |
| **No contradictions** | New requirements don't contradict existing FRs, NFRs, or business rules in functional-analysis.md | Resolve contradiction: update existing req or modify new one |
| **No duplication** | New requirement isn't already covered (fully or partially) by an existing FR | Merge or reference existing, don't duplicate |
| **Impact on existing** | New feature doesn't break assumptions of existing features (shared tables, API contracts, auth rules) | Document impact, plan migration or coexistence |
| **Traceability completeness** | Every new FR traces to a business need; every acceptance criterion traces to a FR | Add missing links |

> If cross-artifact issues are found, fix them IN THIS PHASE before proceeding to review. Don't let inconsistencies survive to Phase 3.

**Output**: Draft with new sections for functional-analysis and technical-analysis

---

### PHASE 3: Review Loop (PM, Architect & UX Designer)

Iteration until convergence (max 3 iterations):

**Convergence rule**: If after 3 iterations there's no consensus, the PM has final authority on business priority, the Architect on technical decisions. Document non-consensual decisions with rationale.

#### 3.1 Product Manager (`product-manager`)
- [ ] Requirements aligned with real user needs
- [ ] Priorities respected
- [ ] Scope hasn't expanded (scope creep)
- [ ] User stories cover all use cases
- [ ] Success metrics defined

#### 3.2 Solution Architect (`solution-architect`)
- [ ] Coherence with HLA and `principles.md`
- [ ] Technical feasibility
- [ ] Security (OWASP, GDPR)
- [ ] Performance (queries, latency)
- [ ] Economy (simplest possible solution?)
- [ ] No hidden technical debt

#### 3.3 UX Designer (`ux-designer`) — if activated
- [ ] User flows are intuitive and minimize cognitive load
- [ ] UI states defined (empty, loading, error, success) for every interaction
- [ ] Accessibility requirements met (WCAG 2.1 AA)
- [ ] Interaction patterns consistent with existing UI
- [ ] Error messages are user-friendly and actionable

#### 3.4 Security & Privacy Auditor (`security-privacy-auditor`)
- [ ] New endpoints handling sensitive data identified and flagged
- [ ] RLS/auth implications reviewed
- [ ] Compliance requirements verified (GDPR, HIPAA, PCI-DSS as applicable)
- [ ] Data flow for PII/sensitive data documented
- [ ] No security anti-patterns in proposed design

> The Security Auditor has **veto power on CRITICAL** security findings. If a CRITICAL finding is raised, it MUST be resolved before proceeding.

#### 3.5 Convergence (max 3 iterations)
Open points → discuss trade-offs → document decisions → iterate

**Decision authority in case of stalemate**:
- Priority and scope → PM has final say
- Architecture and technology → Architect has final say
- Security and privacy → Security Auditor has veto on CRITICAL
- Spec quality → Clarity Gate is objective (score)

---

### PHASE 4: Clarity Gate

**MANDATORY GATE** - Do not proceed without passing. All tiers require the Clarity Gate. Tier 2 - Governed requires a minimum score of 9/10.

> A spec that AI must interpret is a bad spec.
> An ambiguous spec generates ambiguous code.
> Code quality cannot exceed spec quality.

Validate the **draft produced in Phase 2 and refined in Phase 3**. The goal is to certify spec quality before consolidating into master documents (Phase 5).

> **Source of truth**: The Clarity Gate checks defined below (in this skill) are the authoritative, complete checklist. The file `analysis/checklists/clarity-gate.md` in the project is a reference copy for human stakeholders — it does NOT override or supplement these instructions.

#### 4.1 Foundation Checks (7 checks — blocking prerequisites)

For each in-scope section, verify:

| # | Check | Question | Fail Example |
|---|-------|----------|-------------|
| 1 | **Actionable** | Can AI act on every sentence without guessing? | "The system must handle users efficiently" |
| 2 | **Current** | No obsolete or "to be reviewed" decisions? | "To be defined in a later phase" |
| 3 | **Single Source** | No duplicated information between docs? | Same table described in functional AND technical |
| 4 | **Decision, not wish** | Is every statement a concrete decision? | "It would be nice to also have..." |
| 5 | **Prompt-Ready** | Would you put this in an AI prompt? | Motivational paragraphs with no operational info |
| 6 | **No Future State** | No "eventually", "in the future", "phase 2"? | "This will be implemented later" |
| 7 | **No Fluff** | No motivational/marketing content? | "Our revolutionary platform..." |

#### 4.2 Document Architecture Checks (10 checks — blocking prerequisites)

| # | Check | What You Verify |
|---|-------|----------------|
| 8 | **Anti-patterns present** | Does every module have min. 3 documented anti-patterns? (fewer accepted for trivial modules with justification) |
| 9 | **Error handling matrix** | Does every external service have detection/response/fallback? |
| 10 | **Test scenarios** | Are acceptance criteria in Given/When/Then format? |
| 11 | **Deep links** | No vague references ("see technical analysis")? |
| 12 | **Complete API contracts** | Does every endpoint have request/response/errors defined? |
| 13 | **Complete DB schema** | Does every table have columns, types, constraints, indices? |
| 14 | **Cross-artifact consistency** | No contradictions between functional-analysis and technical-analysis? Same terminology used consistently? No duplicated requirements? |
| 15 | **Implementation coherence** | New features don't break assumptions of existing features? Shared resources (tables, APIs, auth) are compatible? |
| 16 | **Correct** | Does each requirement accurately represent the real user need, not the analyst's interpretation? Validated against business context in `project.md`? |
| 17 | **Modifiable** | Can each requirement be changed without cascading rewrites across multiple documents? No hidden coupling between independent requirements? |

#### 4.3 Ambiguity Scan

Search all in-scope sections for:

**Vague terms to quantify:**
- "fast" → "< 200ms at 95th percentile"
- "scalable" → "supports X concurrent users"
- "secure" → "RLS active, input validated, OWASP Top 10 verified"
- "user-friendly" → "task completion in < 3 clicks"
- "robust" → "automatic recovery within X seconds"

**Dangerous patterns:**
- "should" (ambiguous: obligation or suggestion?)
- "if necessary" (who decides?)
- "appropriate" (for whom?)
- "etc." (what else?)
- "various" / "several" (which ones exactly?)

#### 4.4 Information Density Scan

> Maximum information per word. Zero fluff. Specs are for building, not for reading pleasure.

Scan all in-scope sections for low-density patterns. Count total violations:

**Conversational filler** (replace with direct statement):
- "The system will allow users to..." → "Users can..."
- "It is important to note that..." → (delete, state the fact directly)
- "In order to..." → "To..."
- "The purpose of this section is..." → (delete)
- "As mentioned above/below..." → (use deep link or delete)

**Wordy phrases** (replace with concise alternative):
- "Due to the fact that" → "because"
- "In the event that" → "if"
- "At this point in time" → "now"
- "Has the ability to" → "can"
- "It should be noted that" → (delete)
- "For the purpose of" → "to"

**Redundant expressions**:
- "Future plans" → "plans"
- "End result" → "result"
- "Completely eliminate" → "eliminate"
- "Basic fundamentals" → "fundamentals"
- "Each and every" → "every"

**Threshold**:
- < 5 violations → PASS
- 5-10 violations → WARNING (fix recommended)
- > 10 violations → CRITICAL (fix required before proceeding)

#### 4.5 AI Understandability Score

Evaluate documents on 6 dimensions (weight):

| Dimension | Weight | Question |
|-----------|--------|----------|
| Actionability | 25% | Can AI generate code from this spec? |
| Specificity | 20% | Does every requirement have concrete values? |
| Consistency | 15% | Uniform terminology across docs? |
| Structure | 15% | Coherent, navigable format? |
| Disambiguation | 15% | Zero ambiguity? |
| Reference Clarity | 10% | Is every reference a deep link? |

**Target**: 9+/10 before proceeding to implementation.

#### 4.6 Scoring Formula

The Clarity Gate score is determined as follows:

1. **Foundation Checks** (4.1): ALL must pass. Any failure → automatic FAIL regardless of score.
2. **Architecture Checks** (4.2): ALL must pass. Any failure → automatic FAIL regardless of score.
3. **Ambiguity Scan** (4.3): All vague terms found must be quantified. Unresolved ambiguities → automatic FAIL.
4. **Information Density** (4.4): CRITICAL threshold (> 10 violations) → automatic FAIL. WARNING is non-blocking.
5. **AI Understandability Score** (4.5): This is **THE score** (X/10) that determines the verdict.

```
IF any Foundation Check FAILS → FAIL
IF any Architecture Check FAILS → FAIL
IF Information Density = CRITICAL → FAIL
ELSE → verdict based on AI Understandability Score (X/10)
```

#### 4.7 Report

```markdown
# Clarity Gate Report - Sprint N

## Verdict: PASS / CONDITIONAL PASS / FAIL

## Score: X/10

## Foundation Checks: X/7 passed
| # | Check | Status | Notes |

## Architecture Checks: X/10 passed
| # | Check | Status | Notes |

## Ambiguities Found
| # | Document | Section | Vague Term | Quantified Proposal |

## Information Density: PASS / WARNING / CRITICAL
- Total violations: X
| # | Document | Section | Pattern Found | Suggested Fix |

## Critical Findings
[Issues that BLOCK implementation]

## Required Actions
[Ordered list of fixes to apply to master docs]
```

#### 4.8 Verdicts

- **PASS** (score >= 9, zero critical findings): proceed with `/sprint-execution`
- **CONDITIONAL PASS** (score 7-8, non-blocking findings): proceed but open findings MUST be tracked as tasks in the sprint roadmap with assigned owner and verified in the final report
- **FAIL** (score < 7 or critical findings): return to Phase 2 for fixes, then re-run Clarity Gate

---

### PHASE 5: Master Documents Consolidation

**Principle**: Master documents grow over time, never fragmented.

#### 5.1 Update `analysis/functional-analysis.md`
- Add/modify sections for features
- Update business rules
- Update user flows
- Add anti-patterns per module

#### 5.2 Update `analysis/technical-analysis.md`
- New tables/columns
- New API endpoints with complete contracts
- Error handling matrix
- Required migrations

#### 5.3 Update `analysis/risk-register.md`
- Add new risks identified during feature analysis (technical, security, dependency, regulatory)
- Update mitigations for existing risks affected by new features
- Close risks that are no longer relevant

#### 5.4 Changelog
```markdown
## Changelog
| Sprint | Date | Changes |
|--------|------|---------|
| S-N | YYYY-MM-DD | [change list] |
```

---

### PHASE 6: Test Design from Specs (BEFORE Development)

**Agent**: `senior-test-engineer`

> Tests come from specs, not from code. The testbook is the behavioral contract.

After specs are consolidated in master documents (Phase 5), the Test Engineer designs test scenarios by reading those documents:

1. **Read** `analysis/functional-analysis.md` for in-scope features — identify user flows, business rules, edge cases
2. **Read** `analysis/technical-analysis.md` for in-scope features — identify API contracts, data model constraints, error handling
3. **Read** `requirements/requirements-list.md` — map every in-scope FR/NFR to test scenarios
4. **Design** test scenarios in Given/When/Then format, derived ENTIRELY from specs
5. **Populate** `test/testbook.md` with new test cases

#### Test Categories (by spec source)

Design test cases for every applicable category. Not every category applies to every project, but the tester MUST evaluate each one:

| Source | Test Type | What to Verify |
|--------|-----------|----------------|
| User stories & acceptance criteria | **E2E** | Complete user journeys on real browser, accessibility (WCAG 2.1 AA), UI states (empty, loading, error, success) |
| API contracts in technical-analysis | **Integration** | Request → Response on real endpoints, status codes, input validation |
| Business rules in functional-analysis | **E2E + Integration** | Rule enforcement at system boundaries, edge cases, boundary values |
| NFR (performance, scalability) | **Performance** | Response times, load behavior, concurrency, resource consumption |
| Error handling matrix | **Integration** | Error codes, fallback behavior, recovery |
| DB schema constraints | **DB verification** | Data integrity after CRUD, RLS policies, migrations, constraints |
| External services, webhooks, queues, scheduled jobs | **M2M Integration** | Calls, responses, timeouts, retries, fallback behavior |
| Existing testbook | **Regression** | Existing TCs impacted by new/modified features |

#### Test Design Rules

- Every test MUST trace to a requirement (FR-xxx, NFR-xxx) or acceptance criterion
- Test the system "at the terminals" (ai morsetti): inputs from outside, verify outputs from outside
- Internal implementation details are NOT tested — behavior is tested
- NO unit tests unless explicitly requested
- Tests run on the development environment's own infrastructure (DB, services, code); external systems use stubs/simulators requested during sprint planning

**Output**: Updated `test/testbook.md` with test cases for in-scope features.

---

### PHASE 6b: Testbook Review (Spec Analyst)

**Agent**: `spec-analyst`

The Spec Analyst reviews the testbook produced in Phase 6 to verify alignment with specifications:

- [ ] Every test scenario correctly interprets the spec (no misunderstandings of business rules)
- [ ] Coverage is complete: every in-scope FR has at least one test
- [ ] Given/When/Then conditions match the acceptance criteria in functional-analysis
- [ ] API contract tests match the contracts in technical-analysis
- [ ] Edge cases from the spec are covered

If misalignment is found → fix the testbook, NOT the spec (unless the spec is genuinely wrong, in which case return to Phase 2).

**Output**: Reviewed and validated testbook.

---

### PHASE 7: Implementation Readiness Check

**MANDATORY GATE** — Do not handoff to development without passing.

This gate verifies end-to-end coherence across ALL project artifacts. It goes beyond the Clarity Gate (which checks spec quality) by checking that the entire system of documents is consistent, complete, and ready for implementation.

#### 7.1 Document Completeness

| Check | Verify | Source |
|-------|--------|--------|
| Every in-scope FR has at least one story/task | requirements-list.md → sprint roadmap | Missing coverage = unplanned work |
| Every story has testable acceptance criteria | sprint roadmap | Missing AC = untestable feature |
| Every API endpoint has request/response/error contract | technical-analysis.md | Missing contract = ambiguous implementation |
| Every new table has complete schema (columns, types, constraints, indices) | technical-analysis.md | Incomplete schema = implementation guesswork |
| Error handling matrix covers all external dependencies | technical-analysis.md | Missing = unhandled failures in production |

#### 7.2 Cross-Artifact Coherence

| Check | Verify | Action if Failed |
|-------|--------|-----------------|
| **Functional ↔ Technical alignment** | Every feature in functional-analysis has corresponding technical design in technical-analysis | Add missing technical design |
| **Requirements ↔ Stories alignment** | Every in-scope FR maps to at least one task in the sprint roadmap | Add missing tasks or defer the FR |
| **Architecture ↔ Implementation alignment** | Planned implementation is consistent with HLA.md and principles.md | Flag architectural drift, decide: update HLA or change approach |
| **No orphan specs** | No sections in technical-analysis without corresponding functional requirement | Remove orphans or add missing FRs |
| **Terminology consistent** | Same terms used across all documents for same concepts | Standardize and update |

#### 7.3 Test Readiness

| Check | Verify |
|-------|--------|
| Testbook has scenarios for every in-scope FR | traceability matrix covers all FRs |
| E2E test scenarios cover all user journeys | functional-analysis user flows → test scenarios |
| Integration test scenarios cover all API contracts | technical-analysis endpoints → test scenarios |
| Test infrastructure requirements identified | sprint roadmap QA plan |

#### 7.4 Readiness Verdict

- **READY**: All checks pass → proceed with `/sprint-execution`
- **NEEDS WORK**: Non-critical gaps found → list specific fixes, apply them, re-check
- **NOT READY**: Critical gaps (missing functional design, contradictory specs, no test coverage) → return to Phase 2

```markdown
# Implementation Readiness Report - Sprint N

## Verdict: READY / NEEDS WORK / NOT READY

## Document Completeness: X/5 checks passed
| Check | Status | Notes |

## Cross-Artifact Coherence: X/5 checks passed
| Check | Status | Notes |

## Test Readiness: X/4 checks passed
| Check | Status | Notes |

## Critical Gaps (if any)
[Issues that BLOCK implementation]

## Required Actions (if NEEDS WORK)
[Ordered list of fixes]
```

---

### PHASE 8: Handoff to Development

**Pre-handoff checklist**:
- [ ] `functional-analysis.md` updated
- [ ] `technical-analysis.md` updated
- [ ] Atomic and testable requirements
- [ ] Anti-patterns documented
- [ ] Acceptance criteria defined
- [ ] Clarity Gate passed
- [ ] Implementation Readiness Check passed
- [ ] Testbook populated with test scenarios (BEFORE code)
- [ ] DB schema delta documented
- [ ] API contracts defined

---

## Anti-Patterns

- **DON'T** create separate files per sprint (e.g., `sprint-1-analysis.md`)
- **DO** update master documents with incremental deltas
- **DON'T** leave vague requirements ("must be fast")
- **DO** measurable requirements ("response < 200ms at 95th percentile")
- **DON'T** skip the Clarity Gate
- **DON'T** skip the PM/Architect review

---

## Relationship with Other Workflows

```
/sprint-planning ──> sprint-N-roadmap.md
                            │
                            ▼
/requirements-analysis ──> functional-analysis.md (updated)
                       ──> technical-analysis.md (updated)
                            │
                      [Phase 4: Clarity Gate PASS]
                            │
                      [Phase 5: Master docs consolidated]
                            │
                      [Phase 6: Testbook designed from specs]
                      [Phase 6b: Testbook reviewed by Spec Analyst]
                            │
                      [Phase 7: Readiness Check PASS]
                            │
                            ▼
                      /sprint-execution
```
