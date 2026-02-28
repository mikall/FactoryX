---
name: project-bootstrap
description: Processes unstructured materials from the intake/ folder (business docs, technical specs, meeting notes, competitor analysis, emails, screenshots) and builds the structured project context. Use at project start (Sprint 0) or when new intake materials arrive.
user-invocable: true
---

# Project Bootstrap Workflow

Transforms unstructured input materials into the structured project context required by the framework.

## Trigger

Invoke with `/project-bootstrap` when:
- Starting a new project (Sprint 0)
- New stakeholder materials have been added to `intake/`
- The project context needs enrichment from new sources

## Prerequisites

Materials in `intake/` folder. Just dump everything in — no need to organize. The agents will classify.

```
intake/
├── business-plan.pdf
├── meeting-notes-kickoff.md
├── competitor-screenshot.png
├── api-specs-legacy.json
├── stakeholder-email.txt
├── wireframe-v2.png
├── regulatory-requirements.docx
└── ... anything else
```

**Accepted formats**: .md, .txt, .pdf, .png, .jpg, .csv, .json, .html, or any text-based file. The more context, the better.

---

## Step-by-Step Execution

This workflow uses **micro-file architecture**: each phase is a separate file loaded just-in-time. This keeps the context focused and prevents instruction degradation.

**Execute each step in sequence. Read the step file, execute its instructions completely, then move to the next.**

| Step | File | Description |
|------|------|-------------|
| 1 | `steps/01-intake-scan.md` | Inventory, ingestion & classification of intake materials |
| 2 | `steps/02-gap-filling.md` | Interactive adversarial interrogation to fill gaps |
| 3 | `steps/03-tier-selection.md` | Process tier selection (Standard/Governed) |
| 4 | `steps/04-context-extraction.md` | Business context extraction (PM) |
| 5 | `steps/05-requirements-mining.md` | Requirements mining from all sources (Spec Analyst) |
| 6 | `steps/06-technical-assessment.md` | Technical assessment & stack selection (Architect) |
| 7 | `steps/07-cross-reference.md` | Cross-reference & gap analysis (all agents) |
| 8 | `steps/08-agent-calibration.md` | Agent expertise & Red Team configuration |
| 9 | `steps/09-document-generation.md` | Document generation & stack finalization |
| 10 | `steps/10-bootstrap-report.md` | Final bootstrap report |

### Execution Protocol

1. **Read** the current step file using the Read tool
2. **Execute** its instructions completely
3. **Verify** the step's output criteria are met
4. **Proceed** to the next step file

> Do NOT read all step files at once. Load each one only when ready to execute it. This preserves context quality.

### Session Continuity

If the session must be interrupted during bootstrap, generate a handover file following the protocol in `CLAUDE.md` (Session Continuity Protocol). Include: current step number, which steps are completed, key decisions made so far. When resuming, read the handover and continue from the last completed step.

---

## Foundational Rules

### No Ambiguity, No Development

The bootstrap process is **ADVERSARIAL by design.** Development MUST NOT start until there is full clarity on domains, contexts, business rules, and technical constraints.

### Conservative Default Rule

When the user cannot or will not provide clarity on a topic, the team makes the most conservative choice possible. Every conservative default MUST be documented as `[CONSERVATIVE DEFAULT: reason]`.

---

## Anti-Patterns

- **DON'T** skip this step and go straight to coding from unstructured notes
- **DON'T** ask the user to organize intake/ — classification is the agents' job
- **DON'T** let the PM/stakeholder define requirements directly in the framework docs (use intake/ as the buffer)
- **DON'T** discard intake materials after processing (they're the audit trail)
- **DON'T** proceed with ambiguity — if something is unclear, ASK
- **DON'T** assume domain knowledge, business rules, or technical constraints — always verify
- **DON'T** start development phases if the bootstrap has unresolved critical gaps
- **DON'T** read all step files at the beginning — load each one just-in-time
- **DO** challenge vague intake ("make it fast") with quantified requirements
- **DO** flag stakeholder wishes without user validation as WISH, not MUST
- **DO** push the user to provide information from ALL perspectives
- **DO** apply conservative defaults when clarity is not achievable

---

## After Bootstrap

The `intake/` folder is **preserved** (never deleted). When new materials arrive:
1. Drop them into `intake/` — no need to organize
2. Run `/project-bootstrap` again — it will detect new/unprocessed files and propose incremental updates
3. New materials that change requirements → trigger `/requirements-analysis`

---

## Relationship with Other Workflows

```
Stakeholder materials
     │
     ▼
[intake/ folder]
     │
     ▼
/project-bootstrap ──> project.md (populated)
                   ──> functional-analysis.md (populated)
                   ──> technical-analysis.md (populated)
                   ──> HLA.md (populated)
                   ──> principles.md (populated)
                   ──> requirements-list.md (populated)
                   ──> plan.md (draft)
                            │
                            ▼
                   /sprint-planning (Sprint 1)
```
