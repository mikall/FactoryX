# {{PROJECT_NAME}} - Operational Instructions

> Spec-driven development framework with AI agent teams.

## CORE PRINCIPLES

> Clarity, simplicity, elegance, and economy in solutions are the most evident form of seniority.

### Guiding Principles (non-negotiable)

1. **SIMPLICITY** - The simplest solution that works is always the right one. Less code, fewer functions, fewer abstractions. Three identical lines are better than a premature abstraction.
2. **ECONOMY** - Every function, file, and line of code must justify its existence. If you can solve it with less, solve it with less.
3. **PERFORMANCE** - The system must remain clean, lightweight, and scalable. Performance is not a future optimization, it's a design constraint.
4. **SPECS ONLY** - NEVER add unrequested features. NEVER unrequested improvements. NEVER unnecessary refactoring.
5. **DOCS = TRUTH** - `analysis/*.md` are the Single Source of Truth. Code implements specs, not the other way around.
6. **PROJECT.MD FIRST** - ALWAYS read `project.md` before creating documents or writing code.
7. **FIX THE SPEC, NOT THE CODE** - When a requirement is ambiguous, update the spec FIRST, THEN implement. The spec leads, the code follows.
8. **CONFIRM BEFORE ACTING** - NEVER execute destructive actions (DB, deploy, delete, data modification) without user confirmation.
9. **GIT: APPROVAL REQUIRED** - NEVER execute git commands without explicit approval. ONE command at a time, show the result, propose the next.
10. **SHORT ANSWERS** - Few lines, concise. The user asks for details if they want them.

### Security, Privacy, and Compliance

Every sprint, every feature, every endpoint MUST pass reviews for:
- **Security** - OWASP Top 10, input validation, injection prevention
- **Privacy** - GDPR compliance, data minimization, consent
- **Compliance** - Applicable industry regulations

Use the checklists in `analysis/checklists/` as mandatory gates.

---

## PROCESS CALIBRATION (Process Tailoring)

Two tiers based on regulatory and compliance requirements:

| Tier | When | Agents | Checklists | Clarity Gate | Readiness Check |
|------|------|--------|-----------|-------------|-----------------|
| **Tier 1 - Standard** | Any structured product | All 7 agents (UX Designer activated per project type) | All | Mandatory | Mandatory |
| **Tier 2 - Governed** | Sensitive data, heavy compliance, regulated industries, multi-team | All 7 agents + external audit | All + DPIA | Mandatory + score >= 9 | Mandatory + compliance verification |

**Default**: Tier 1 - Standard. The PM chooses the tier during `/project-bootstrap` and documents it in `project.md`. The tier is a structural project decision, not a per-sprint choice. Tier upgrades (e.g., Standard → Governed when compliance requirements emerge) are exceptional events that require explicit user confirmation.

### Governed Tier Extras
When Tier 2 - Governed is selected, the following additional requirements apply:
- Clarity Gate minimum score: 9/10 (vs 7 for conditional pass in Standard)
- DPIA (Data Protection Impact Assessment) required
- External audit participation in review phases
- Formal sign-off on security and privacy checklists
- Compliance-specific sections in all master documents

### Agents per Tier
- **Tier 1 - Standard**: All 7 agents (UX Designer activated per project type)
- **Tier 2 - Governed**: All 7 agents + external audit

### Definition of Done (per feature)
- [ ] Test scenarios designed from specs BEFORE implementation (in `/requirements-analysis` Phases 6-6b)
- [ ] Code review: APPROVED (or APPROVED WITH NOTES)
- [ ] P0/P1 tests: PASS (E2E + Integration, tested "at the terminals")
- [ ] Security check: no open CRITICAL/HIGH findings
- [ ] Master docs updated (functional + technical analysis)
- [ ] Traceability updated in testbook (every FR has at least one test)
- [ ] Risk register reviewed (new risks added, mitigations updated)

---

## WORK PROCESS

### Two Intervention Modes

| Mode | When | Process | Changes specs? |
|------|------|---------|---------------|
| **Change Request (CR)** | New feature, behavior change, value increment | `/sprint-planning` → `/requirements-analysis` (includes Clarity Gate + Readiness Check + test design from specs) → `/sprint-execution` (development + review + test execution) | YES - full cycle |
| **Bug Fix (BF)** | Bug correction, corrective maintenance | `/quick-fix` | NO - fixes implementation, not the spec |

**Rule**: If during a bug fix you discover the problem is in the spec (ambiguous requirement, unforeseen case), ESCALATE to CR. Bug fix corrects the operational interpretation and implementation. If the "what" changes, go through the full cycle.

---

## TECHNOLOGY STACK

> The technology stack, architecture, and infrastructure are defined during `/project-bootstrap` and documented in `analysis/HLA.md` and `analysis/technical-analysis.md`. See `project.md` section "Technology Stack" for the current project stack.

---

## PROJECT TREE

```
{{PROJECT_NAME}}/
├── project.md                     # Central reference
├── intake/                        # Drop any unstructured material here (docs, images, notes, PDFs...)
├── analysis/
│   ├── principles.md              # Versioned architectural principles
│   ├── HLA.md                     # High Level Architecture (C4 Model) + ADR + DevOps
│   ├── functional-analysis.md     # Functional analysis (Single Source of Truth)
│   ├── technical-analysis.md      # Technical analysis + Data Model
│   ├── risk-register.md           # Risk tracking (updated per sprint)
│   └── checklists/                # Thematic quality gates
│       ├── clarity-gate.md
│       ├── security.md
│       ├── privacy.md
│       ├── performance.md
│       └── accessibility.md
├── requirements/
│   ├── requirements-list.md       # FR/NFR + User Stories
│   ├── plan.md                    # Sprint plan
│   └── sprints/sprint-N-roadmap.md
├── src/apps/                         # Application code (structure defined during /project-bootstrap)
├── deliverables/
│   ├── db/                        # SQL Migrations
│   ├── api/                       # OpenAPI specs
│   └── deploy/                    # Deployment guides
└── test/
    ├── testbook.md                # Test case catalog + traceability matrix
    └── sprint-N/                  # Executions per sprint
```

---

## SKILLS

| Skill | Mode | Description |
|-------|------|-------------|
| `/project-bootstrap` | Setup | Processes intake/ materials into structured project context |
| `/sprint-planning` | CR | PM analyzes, multi-agent technical table, generates roadmap |
| `/requirements-analysis` | CR | Expands requirements, clarity gate, readiness check, updates master docs |
| `/sprint-execution` | CR | Test design from specs, development, code review, test, sprint closure |
| `/quick-fix` | BF | Diagnosis, fix, test, testbook update |
| `/help` | Any | Inspects project state, suggests next step |

---

## AGENTS

| Agent | Role | Model | Activation |
|-------|------|-------|------------|
| `product-manager` | Prioritization, roadmap, metrics | Opus | Always |
| `solution-architect` | Technical decisions, HLA, ADR | Opus | Always |
| `spec-analyst` | Atomic requirements, testability, simplicity | Opus | Always |
| `ux-designer` | User flows, usability, accessibility, design system | Opus | Per project type |
| `senior-test-engineer` | Test plan, QA, Playwright E2E | Opus | Always |
| `code-reviewer` | Adversarial review, quality, spec adherence | Opus | Always |
| `security-privacy-auditor` | Security, privacy, compliance audit | Opus | Always |

> **UX Designer activation**: activated for projects with significant frontend (web_app, mobile_app, saas_b2b, marketplace, ecommerce). Determined during `/project-bootstrap` based on project type detection. For API-only, CLI tools, or data pipelines, the UX Designer is on standby.

### Model Strategy

| Role | Model | Rationale |
|------|-------|-----------|
| **Reasoning agents** (PM, Architect, Spec Analyst, UX Designer, Code Reviewer, Security Auditor) | Latest **Opus** | Deep analysis, complex trade-offs, quality decisions |
| **Test Engineer** (test planning + execution) | Latest **Opus** | Strategic QA reasoning |
| **Implementation** (code writing, not a subagent — main Claude instance) | Latest **Sonnet** | Fast execution, high throughput |

> Always use the latest available model version. Opus for thinking, Sonnet for doing.

### Business Context

Read `project.md` sections "Business Context" and "Team Expertise" to understand:
- **Business domain** and industry regulations (informs security/privacy requirements)
- **Team expertise** (informs technology choices - prefer known technologies)
- **Domain knowledge** (informs architectural decisions and anti-patterns)

---

## SESSION CONTINUITY PROTOCOL

When context gets large or a session is interrupted, generate a **handover file** to enable seamless resume in a new session.

### When to Generate Handover

- Before context window saturation (if you notice responses degrading)
- When explicitly asked to pause work
- At natural breakpoints in long workflows (end of a phase)
- When switching between skills mid-workflow

### Handover File Format

Write to `.tmp/handover-YYYY-MM-DD-HHMMSS.md`:

```markdown
# Session Handover

## Active Workflow
- **Skill**: /[skill-name]
- **Phase**: [current phase number and name]
- **Step**: [current step if micro-file architecture]

## Completed in This Session
- [x] [what was done]
- [x] [what was done]

## In Progress
- [ ] [what's currently being worked on]
- [ ] [state of work: partial draft, waiting for user input, etc.]

## Pending
- [ ] [what still needs to be done]

## Decisions Made
| Decision | Rationale | Who Decided |
|----------|-----------|-------------|
| [decision] | [why] | [PM/Architect/User] |

## Open Questions
- [question that needs user answer]

## Files Modified
- [file path]: [what changed]

## Resume Instructions
[Exact next step to take when resuming]
```

### How to Resume

When starting a new session on an existing project:
1. Read `project.md` (always)
2. Check `.tmp/` for handover files
3. If handover exists, read it and resume from where it left off
4. Confirm with the user: "Found a handover from [date]. Resume from [phase]?"

---

## DOCUMENTATION RULES

1. Read `project.md` to understand the structure
2. Check if the document already exists
3. **UPDATE** existing documents, NEVER duplicate
4. Anti-patterns: for each module, document what NOT to do
5. Deep links: never vague references, always path + section

**Master documents** (grow over time, never fragmented):
- `analysis/functional-analysis.md`
- `analysis/technical-analysis.md`
- `requirements/plan.md`
- `test/testbook.md`

### Document Size Management

When a master document exceeds ~500 lines:
1. **DO NOT fragment** into separate files per sprint
2. **DO** use collapsible sections or navigable index
3. **DO** archive obsolete sections in an `## Archive` section at the bottom
4. **DO** separate by logical domain only if the module is completely autonomous (e.g., `functional-analysis-payments.md`)
