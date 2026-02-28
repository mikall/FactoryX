# Step 8: Agent Expertise & Red Team Configuration

> **Previous state**: Cross-reference completed, gaps resolved (Step 7).

## Goal

Calibrate agents to the specific domain and configure the Red Team strategy.

## 8.1 Agent Expertise Calibration

Based on the chosen stack, domain, and project characteristics, define domain-specific expertise:

- **Product Manager**: industry domain knowledge, regulatory awareness, market context
- **Solution Architect**: stack-specific expertise, infrastructure patterns, scaling strategies
- **Spec Analyst**: domain-specific requirement patterns, compliance requirements
- **UX Designer** (if activated): domain-specific design patterns, platform conventions, accessibility standards for the target audience
- **Test Engineer**: testing frameworks and strategies appropriate to the chosen stack
- **Code Reviewer**: language-specific best practices, framework idioms, stack anti-patterns
- **Security Auditor**: stack-specific vulnerability patterns, compliance frameworks

## 8.2 Red Team Configuration

Define the adversarial testing strategy:
- **Red Team scope**: which attack surfaces to test (API, auth, data, UI, infra)
- **Approach**: automated (OWASP ZAP, dependency scanning) + manual review
- **Schedule**: at minimum once per sprint, mandatory before production deploy
- **Checklist**: added to `analysis/checklists/security.md`

## Output

- Agent expertise profiles documented in `project.md` section "Agent Configuration"
- Red Team strategy in `analysis/HLA.md` section "Security"
