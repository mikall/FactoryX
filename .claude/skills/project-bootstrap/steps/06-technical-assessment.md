# Step 6: Technical Assessment & Stack Selection

> **Previous state**: Requirements extracted and structured (Step 5).

## Goal

Assess architecture and select the technology stack.

## Agent: `solution-architect`

From technical materials, extracted requirements, and team expertise:

1. **Technology stack** — complete recommendation with justification for every layer:
   - Frontend framework & UI library
   - Backend framework & language
   - Database & data layer
   - Authentication & authorization
   - Hosting & infrastructure
   - CI/CD & DevOps

2. **Architecture** — architectural style (monolith, microservices, serverless) with C4 diagrams (Level 1: System Context + Level 2: Container Diagram)

3. **Infrastructure & deployment** — hosting plan, environments (dev/staging/prod), deployment strategy

4. **Data model** draft — core entities and relationships

5. **Integration points** — external systems, APIs, services

6. **Architectural constraints** — what's non-negotiable (e.g., GDPR, existing infrastructure)

7. **Risk assessment** — top technical risks and mitigations

8. **ADR-001**: Stack selection decision with alternatives considered and rationale

9. **Scalability targets** — initial sizing based on business projections

## Rules

- Stack MUST be informed by team expertise documented in `project.md` section "Team Expertise"
- Prefer technologies the team already knows — avoid learning curves unless justified
- Every technology choice must have a 1-line rationale
- The Architect proposes, the PM validates feasibility against timeline/budget

## Output

Draft `analysis/HLA.md` (C4 Level 1 + Level 2, crosscutting concepts, DevOps) and initial `analysis/technical-analysis.md`
