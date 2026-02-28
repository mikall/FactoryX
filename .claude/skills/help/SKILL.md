---
name: help
description: Inspects the current project state (which documents exist, which sprint is active, what's missing) and suggests the logical next step. Use when unsure about what to do next.
user-invocable: true
---

# Project Status & Next Step Guide

Inspects the project state and recommends the next action.

## Trigger

Invoke with `/help` when:
- You don't know what to do next
- You want to understand the current project state
- You need to know which skill to run

## Workflow

### Step 0: Check for Session Handover

Before anything else, check for interrupted work:
1. Look for files in `.tmp/handover-*.md`
2. If a handover file exists, read it and present to the user:
   - "Found a session handover from [date]. You were working on [skill], Phase [N]."
   - "Resume from where you left off?"
3. If the user confirms, resume the interrupted workflow instead of proceeding with status discovery.

---

### Step 1: Project Discovery

Inspect the project structure to determine what exists:

```
Check for:
├── .tmp/handover-*.md                  → Interrupted session?
├── project.md                          → Project initialized?
├── intake/                             → Intake materials present?
├── analysis/
│   ├── functional-analysis.md          → Functional analysis done?
│   ├── technical-analysis.md           → Technical analysis done?
│   ├── HLA.md                          → Architecture defined?
│   ├── principles.md                   → Principles set?
│   ├── risk-register.md                → Risk tracking initialized?
│   └── checklists/                     → Checklists present?
├── requirements/
│   ├── requirements-list.md            → Requirements extracted?
│   ├── plan.md                         → Sprint plan exists?
│   └── sprints/sprint-*-roadmap.md     → Which sprints planned?
├── test/
│   └── testbook.md                     → Testbook exists?
└── src/apps/                           → Source code exists?
```

### Step 2: State Classification

Based on what exists, classify the project state:

| State | Condition | Next Action |
|-------|-----------|-------------|
| **Not started** | No `project.md`, no `intake/` | Create `intake/` and add materials, then `/project-bootstrap` |
| **Materials ready** | `intake/` has files, no `project.md` | Run `/project-bootstrap` |
| **Bootstrapped** | `project.md` exists, no sprint roadmaps | Run `/sprint-planning` for Sprint 1 |
| **Sprint planned** | `sprint-N-roadmap.md` exists, analysis not updated | Run `/requirements-analysis` for Sprint N |
| **Requirements ready** | Analysis updated, Clarity Gate not yet run | Complete Clarity Gate and Readiness Check in `/requirements-analysis` |
| **Ready for dev** | Clarity Gate PASS, Readiness Check PASS | Run `/sprint-execution` |
| **In development** | Code being written, tests pending | Continue `/sprint-execution` |
| **Sprint complete** | Sprint report generated | Run `/sprint-planning` for Sprint N+1 |
| **Bug reported** | Issue in existing functionality | Run `/quick-fix` |

### Step 3: Present Status

Present a concise status to the user:

```markdown
## Project Status

**Project**: [name from project.md or "Not initialized"]
**Tier**: [tier from project.md or "Not set"]
**Current Sprint**: [latest sprint-N-roadmap or "None"]
**State**: [classification from Step 2]

### Documents
| Document | Status |
|----------|--------|
| project.md | EXISTS / MISSING |
| functional-analysis.md | EXISTS / MISSING |
| technical-analysis.md | EXISTS / MISSING |
| ... | ... |

### Recommended Next Step
**Run `/[skill-name]`** — [brief explanation of why]

### Available Skills
| Skill | When to Use |
|-------|-------------|
| `/project-bootstrap` | Process intake materials into structured context |
| `/sprint-planning` | Plan the next sprint |
| `/requirements-analysis` | Detail requirements, run Clarity Gate and Readiness Check |
| `/sprint-execution` | Develop, test, review, close sprint |
| `/quick-fix` | Fix a bug without changing specs |
| `/help` | This command — check status and next step |
```

## Rules

- Be concise — the user wants guidance, not a lecture
- If the state is ambiguous, ask one clarifying question
- Always recommend ONE specific next step (not multiple options)
- If documents exist but are incomplete (full of placeholders), flag them as "EXISTS (incomplete)"
- If `analysis/risk-register.md` contains CRITICAL risks, warn the user prominently
