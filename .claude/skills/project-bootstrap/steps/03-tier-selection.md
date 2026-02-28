# Step 3: Process Tier Selection

> **Previous state**: Gap filling completed, all critical areas covered (Step 2).

## Goal

Select the appropriate process tier for the project.

## Agent: `product-manager`

Based on the information gathered in Steps 1-2, the PM selects the tier. This is a **structural project decision** — it determines which quality gates apply and the level of documentation required throughout the entire project lifecycle.

## Options

Use `AskUserQuestion` to present the tier options with context:

| Tier | When | Agents | Clarity Gate | Readiness Check |
|------|------|--------|-------------|-----------------|
| **Tier 1 - Standard** | Any structured product in production | All 7 agents (UX Designer per project type) | Mandatory | Mandatory |
| **Tier 2 - Governed** | Sensitive data, heavy compliance, multi-team, regulated industries | All 7 agents + external audit | Mandatory, score >= 9 | Mandatory + DPIA |

## Decision Criteria

Start from the **suggested tier** detected in Step 2 (from `project-types.csv`), then adjust based on:

| Signal | Effect |
|--------|--------|
| Domain complexity = high (from `domain-complexity.csv`) | Push toward Tier 2 - Governed |
| Compliance requirements present (HIPAA, PCI-DSS, GDPR heavy) | Push toward Tier 2 - Governed |
| Data sensitivity (PII, financial, health) | Push toward Tier 2 - Governed |
| Regulated industry (healthcare, fintech, govtech) | Push toward Tier 2 - Governed |
| Standard product, no heavy compliance | Tier 1 - Standard |

**Default**: Tier 1 - Standard. The PM has final say.

## Output

Tier documented in the header of `project.md` (field "Process Tier"). This choice applies to all subsequent sprints.
