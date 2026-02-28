# Step 2: Interactive Gap Filling

> **Previous state**: Intake inventory completed and classified (Step 1).

## Goal

Identify what's missing from intake materials and fill gaps by interrogating the user.

## Fundamental Rule: No Ambiguity, No Development

The bootstrap is **adversarial by design**. At every question:
1. **ASK** — use `AskUserQuestion`. Never assume, never infer, never skip.
2. **CHALLENGE** — push back on vague answers. "It should be fast" → "What is the target p95 latency? For which endpoints? Under what load?"
3. **PROBE** — explore adjacent areas: compliance, edge cases, failure modes, data lifecycle, roles, multi-tenancy, i18n.
4. **BLOCK** — refuse to proceed if the current area lacks sufficient clarity.

## Domain & Project Type Detection

**Before asking questions**, read the data files to identify domain and project type:

1. **Read** `.claude/skills/project-bootstrap/data/domain-complexity.csv` — match intake materials against `detection_signals` to identify the domain
2. **Read** `.claude/skills/project-bootstrap/data/project-types.csv` — match intake materials against `detection_signals` to identify the project type
3. **Apply domain-specific questions**: use the `mandatory_questions` column from the matched domain row
4. **Apply domain-specific checklists**: note `required_checklists` for later (Step 8: Agent Calibration)
5. **Note compliance requirements**: `compliance_requirements` feeds into principles.md and security checklist
6. **Note suggested tier**: `suggested_tier` from project type informs Step 3 (Tier Selection)

Present the detection results to the user for confirmation:
```
Detected domain: [domain] (complexity: [high/medium/low])
Detected project type: [type]
Suggested tier: [tier]
Compliance requirements: [list]
```

If detection is ambiguous, ask the user to clarify.

## Mandatory Interrogation Areas

Ask domain-specific mandatory questions first (from CSV), then cover general areas not already addressed (one area at a time):

1. **Business context**: Who are the users? What problem are we solving? Why now? Who are the competitors?
2. **Domain rules**: What are the business rules? What happens in edge cases? Regulatory landscape?
3. **Roles & permissions**: How many user types? What can each do? Multi-tenancy?
4. **Data sensitivity**: PII? Financial data? Health data? Retention/deletion requirements?
5. **Integrations**: External systems? APIs? Legacy systems? Third-party services?
6. **Team & constraints**: Technologies the team knows? Budget? Timeline? How many developers?
7. **Quality expectations**: Expected load? Uptime target? Performance targets? Accessibility requirements?
8. **Deployment context**: Where will it run? Cloud provider preferences? On-premise constraints? Multi-region?

## Conservative Default Rule

> When the user cannot or will not provide clarity on a topic, the team makes the most conservative choice possible. Conservative means: simpler architecture, fewer features, more restrictive security, smaller scope, proven technologies. Every conservative default MUST be documented as `[CONSERVATIVE DEFAULT: reason]`.

## Termination Criteria

Proceed to the next step when ALL of the following are covered:
- [ ] Business context and target users are clear
- [ ] Core workflows and user journeys are identified
- [ ] Team expertise and constraints are known
- [ ] Data sensitivity level is assessed

If any of these are missing, **DO NOT proceed**. Explicitly communicate what's blocking.

## Output

Gap analysis summary: areas covered, remaining gaps, conservative defaults applied. Conversation artifact.
