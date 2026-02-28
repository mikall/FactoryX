# Step 10: Bootstrap Report

> **Previous state**: All documents generated and stack finalized (Step 9).

## Goal

Generate the final bootstrap report and present next steps.

## Report Template

```markdown
# Project Bootstrap Report

## Intake Summary
| Category | Files | Key Insights |
|----------|-------|-------------|

## Documents Generated
| Document | Completeness | Gaps |
|----------|-------------|------|

## Requirements Extracted
- Functional: X (Must: X, Should: X, Could: X)
- Non-Functional: X
- User Stories: X

## Ambiguities & Gaps Found
| # | Source | Issue | Impact | Action Needed |
|---|--------|-------|--------|---------------|

## Contradictions Resolved
| # | Source A | Source B | Resolution | Decided By |

## Assumptions Made
| # | Assumption | Based On | Risk if Wrong |

## Initial Risks Identified
| # | Risk | Category | Probability | Impact | Mitigation |
|---|------|----------|-------------|--------|------------|

> Populated from risks identified during cross-reference (Step 7) and technical assessment (Step 6). These risks are also recorded in `analysis/risk-register.md`.

## Conservative Defaults Applied
| # | Area | Default Chosen | Reason | Suggested Review |

## Recommended Next Steps
1. Review and complete {{PLACEHOLDER}} sections in generated docs
2. Resolve open ambiguities with stakeholders
3. Run `/sprint-planning` to plan Sprint 1
```

## After Bootstrap

The `intake/` folder is **preserved** (never deleted). When new materials arrive:
1. Drop them into `intake/` — no need to organize
2. Run `/project-bootstrap` again — it will detect new/unprocessed files and propose incremental updates
3. New materials that change requirements → trigger `/requirements-analysis`
