# Step 5: Requirements Mining

> **Previous state**: Business context extracted (Step 4).

## Goal

Extract and structure requirements from all intake materials.

## Agent: `spec-analyst`

From ALL intake materials, extract and structure:

1. **Functional requirements** (FR-xxx) with MoSCoW priority
2. **Non-functional requirements** (NFR-xxx) with metrics
3. **User stories** in As a/I want to/So that format
4. **Business rules** with conditions and exceptions
5. **Acceptance criteria** in Given/When/Then format
6. **Ambiguities and gaps** — what's mentioned but not clear enough
7. **Contradictions** — conflicting requirements across sources
8. **Assumptions** — what's implied but never stated

## Agent: `ux-designer` (if activated for this project type)

After Spec Analyst drafts requirements, UX Designer reviews for:

1. **UX completeness** — are empty states, loading states, error states defined for UI features?
2. **User flow coherence** — do requirements map to intuitive user journeys?
3. **Accessibility requirements** — are WCAG 2.1 AA needs captured as NFRs?
4. **Interaction gaps** — are there user interactions implied but not explicitly required?

## Rules

- Trace every requirement back to its source file in `intake/`
- Flag any requirement that fails the Clarity Gate checks
- Identify anti-patterns from competitor analysis
- Separate MUST (validated needs) from WISH (stakeholder desires without evidence)

## Output

Draft `requirements/requirements-list.md`
