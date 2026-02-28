# Step 9: Document Generation & Stack Finalization

> **Previous state**: Agents calibrated, Red Team configured (Step 8).

## Goal

Generate/populate all framework documents and finalize the stack.

## Documents to Generate

| Document | Action | Source |
|----------|--------|--------|
| `project.md` | POPULATE | Business context, team expertise, stack, agent config |
| `analysis/principles.md` | POPULATE | Domain constraints, team philosophy |
| `analysis/HLA.md` | POPULATE | Technical assessment, C4 architecture (Level 1 + Level 2), crosscutting concepts, DevOps |
| `analysis/functional-analysis.md` | POPULATE | Requirements mining |
| `analysis/technical-analysis.md` | POPULATE | Technical assessment + data model + conventions |
| `analysis/risk-register.md` | POPULATE | Risks identified during cross-reference and technical assessment |
| `requirements/requirements-list.md` | POPULATE | Requirements mining |
| `requirements/plan.md` | DRAFT | PM prioritization → sprint plan |

## Stack Finalization

After document generation:

1. **Update `project.md`** — fill the Technology Stack table
2. **Update `analysis/HLA.md`** — replace all `{{PLACEHOLDER}}` in C4 diagrams (Level 1 Context + Level 2 Container), fill crosscutting concepts and DevOps sections with actual technologies
3. **Update `analysis/technical-analysis.md`** — fill stack table, set code conventions based on chosen languages
4. **Update `analysis/risk-register.md`** — populate with initial risks identified during bootstrap
5. **Update `CLAUDE.md`** — populate the TECHNOLOGY STACK section with project-specific stack references
6. **Create `src/apps/` directory structure** — based on chosen stack (e.g., `src/apps/backend/`, `src/apps/frontend/`)

## Rules

- Every generated section must reference its source in `intake/`
- Flag sections marked `{{PLACEHOLDER}}` that need human input
- Don't invent information not present in intake materials
- Clearly mark assumptions as `[ASSUMPTION: ...]`
- All technology placeholders MUST be replaced with actual choices
