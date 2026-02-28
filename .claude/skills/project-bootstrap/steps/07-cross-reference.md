# Step 7: Cross-Reference & Gap Analysis

> **Previous state**: Technical assessment and stack selected (Step 6).

## Goal

Verify overall coherence across all artifacts produced before generating final documents.

## Participants: All agents (including UX Designer if activated)

Joint review across 6 dimensions:

### 7.1 Requirements ↔ Technical Feasibility
- Can we build what's required with the chosen stack?
- Are there requirements that need technologies not planned for?

### 7.2 Requirements ↔ Business Value
- Is everything aligned with the value proposition?
- Are there requirements without clear business value?

### 7.3 Coverage
- Are there areas mentioned in business docs without corresponding requirements?
- Does every user journey have requirements that cover it?

### 7.4 Regulatory Gaps
- Does the domain require things nobody mentioned? (GDPR, accessibility, etc.)
- Have the appropriate checklists been identified?

### 7.5 UX ↔ Requirements (if UX Designer activated)
- Do user stories translate into coherent user journeys?
- Are UI states (empty, loading, error, success) defined for every interaction?
- Is accessibility covered as a cross-cutting NFR?

### 7.6 Contradiction Resolution
- PM decides on business contradictions
- Architect decides on technical contradictions
- UX Designer flags usability contradictions (conflicting interaction patterns)
- Document every resolution with rationale

## Output

Gap analysis report presented to the user. If critical gaps are found, resolve them before proceeding.
