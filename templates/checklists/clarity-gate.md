# Clarity Gate Checklist

> Mandatory gate between requirements-analysis and sprint-execution.
> **Source of truth**: The Clarity Gate checks in `/requirements-analysis` SKILL.md (Phase 4) are the authoritative checklist. This file is a reference copy for human stakeholders.

## Scoring

Foundation Checks, Architecture Checks, Ambiguity Scan, and Information Density are **blocking prerequisites** (all must pass). The **AI Understandability Score** (X/10) determines the verdict:

- **Tier 1 - Standard**: PASS >= 9/10; conditional pass at 7-8; FAIL < 7
- **Tier 2 - Governed**: minimum score 9/10 required (no conditional pass)

## Foundation Checks (7 checks — all must pass)

- [ ] **Actionable**: Can AI act on every sentence without guessing?
- [ ] **Current**: No obsolete or "to be reviewed" decisions?
- [ ] **Single Source**: No duplicated information between docs?
- [ ] **Decision**: Is every statement a concrete decision, not a wish?
- [ ] **Prompt-Ready**: Would you put this in an AI prompt?
- [ ] **No Future State**: No "eventually", "in the future", "phase 2"?
- [ ] **No Fluff**: No motivational/marketing content?

## Architecture Checks (10 checks — all must pass)

- [ ] **Anti-patterns**: Does every module have min. 3 documented anti-patterns? (fewer accepted for trivial modules with justification)
- [ ] **Error handling**: Does every external service have a detection/response/fallback matrix?
- [ ] **Test scenarios**: Are acceptance criteria in Given/When/Then format?
- [ ] **Deep links**: No vague references?
- [ ] **API contracts**: Does every endpoint have request/response/errors defined?
- [ ] **DB schema**: Does every table have columns, types, constraints, indices?
- [ ] **Cross-artifact consistency**: No contradictions between functional-analysis and technical-analysis? Same terminology used consistently? No duplicated requirements?
- [ ] **Implementation coherence**: New features don't break assumptions of existing features? Shared resources (tables, APIs, auth) are compatible?
- [ ] **Correct**: Does each requirement accurately represent the real user need, not the analyst's interpretation?
- [ ] **Modifiable**: Can each requirement be changed without cascading rewrites across multiple documents?

## Ambiguity Scan

Terms to quantify (if present):
- [ ] "fast" → specific metric (e.g., < 200ms p95)
- [ ] "scalable" → concrete number (e.g., 1000 concurrent users)
- [ ] "secure" → specific checklist (e.g., OWASP Top 10)
- [ ] "user-friendly" → UX metric (e.g., task completion < 3 clicks)
- [ ] No "should", "if necessary", "appropriate", "etc.", "various"

## Information Density Scan

- [ ] No conversational filler ("The system will allow users to..." → "Users can...")
- [ ] No wordy phrases ("Due to the fact that" → "because")
- [ ] No redundant expressions ("future plans" → "plans")
- Threshold: < 5 violations = PASS, 5-10 = WARNING, > 10 = CRITICAL

## AI Understandability Score

Evaluated on 6 dimensions:
| Dimension | Weight |
|-----------|--------|
| Actionability | 25% |
| Specificity | 20% |
| Consistency | 15% |
| Structure | 15% |
| Disambiguation | 15% |
| Reference Clarity | 10% |
