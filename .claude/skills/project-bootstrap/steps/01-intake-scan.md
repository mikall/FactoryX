# Step 1: Inventory, Ingestion & Classification

> **Previous state**: None — this is the first step of the bootstrap.

## Goal

Scan, read, and classify all content in the `intake/` folder.

## Instructions

1. **Scan** the entire `intake/` folder recursively
2. **Read** every file (text files directly, images visually, PDFs page by page)
3. **Catalog** every file with a brief content summary
4. **Classify** each file by relevance area:

| Area | Feeds Into | Priority |
|------|----------|----------|
| Business context | `project.md` (Business Context) | HIGH |
| User needs & pain points | `requirements/requirements-list.md` | HIGH |
| Functional requirements | `analysis/functional-analysis.md` | HIGH |
| Technical constraints | `analysis/technical-analysis.md`, `analysis/HLA.md` | HIGH |
| Domain regulations | `analysis/principles.md`, checklists | MEDIUM |
| Competitive intelligence | `analysis/functional-analysis.md` (anti-patterns) | MEDIUM |
| Design/UX | `analysis/functional-analysis.md` (flows) | MEDIUM |
| Team/resource info | `project.md` (Team Expertise) | LOW |

## Output

Present the intake inventory as a markdown table to the user (file, summary, classification, priority). This is a conversation artifact — no file needed.

## Completion

When the inventory is presented and the user has confirmed, proceed to the next step.
