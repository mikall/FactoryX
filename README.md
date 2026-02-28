[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

# Spec-Driven Development Framework

Framework for spec-driven software development with AI agent teams on Claude Code.

## Installation

```bash
# 1. Clone the framework
git clone <your-repo-url> ~/.sdd-framework

# 2. Make the installer executable
chmod +x ~/.sdd-framework/install.sh
```

## Quick Start

```bash
# 1. Initialize a new project
cd /path/to/your/project
~/.sdd-framework/install.sh "ProjectName"

# 2. Open with Claude Code
claude

# 3. Add your materials to intake/
# Drop business docs, tech specs, meeting notes, wireframes into intake/ subfolders

# 4. Start working
# /project-bootstrap     → Process intake/ into structured project context
# /sprint-planning       → Plan the first sprint
# /requirements-analysis → Detail requirements
# /sprint-execution      → Develop and test
# /quick-fix             → Quick bug fixes
```

## What's Included

### Agents (7)
| Agent | Role | Activation |
|-------|------|------------|
| `product-manager` | Prioritization, roadmap, metrics | Always |
| `solution-architect` | Architecture, ADR, technical decisions | Always |
| `spec-analyst` | Atomic requirements, testability | Always |
| `ux-designer` | User flows, usability, accessibility, design system | Per project type |
| `senior-test-engineer` | QA, E2E testing, quality metrics | Always |
| `code-reviewer` | Adversarial review, security | Always |
| `security-privacy-auditor` | Security audit, privacy, GDPR | Always |

### Skills (6)
| Skill | Type | Description |
|-------|------|-------------|
| `/project-bootstrap` | Setup | Processes unstructured intake/ into structured context |
| `/sprint-planning` | CR | Multi-agent sprint planning |
| `/requirements-analysis` | CR | Requirements analysis + clarity gate |
| `/sprint-execution` | CR | Development + review + test + audit |
| `/quick-fix` | BF | Bug fix with scope detection |
| `/help` | Any | Inspects project state, suggests next step |

### Checklists (5)
| Checklist | Reference |
|-----------|-----------|
| Clarity Gate | Stream Coding, Spec Kit |
| Security | OWASP Top 10 |
| Privacy | GDPR |
| Performance | Web Vitals, DB tuning |
| Accessibility | WCAG 2.1 AA |

### Templates (14)
Structured documents inspired by BABOK, PMBOK, modern agile frameworks, and Spec-Driven Development best practices (BMAD, Spec Kit, Stream Coding). Includes risk register, C4-based HLA, and DevOps deployment guidance.

### Future Skills (Planned)
| Skill | Description |
|-------|-------------|
| `/devops-setup` | CI/CD pipeline generation, deployment scripts, monitoring setup. Pipeline scripts are produced during sprint execution; this skill will provide structured automation and refinement guidance. |

## Philosophy

> Clarity, simplicity, elegance, and economy in solutions are the most evident form of seniority.

### Guiding Principles
1. **Simplicity**: the simplest solution that works
2. **Economy**: less code = fewer bugs = more reliability
3. **Performance**: design constraint, not future optimization
4. **Spec-Driven**: specs lead, code follows
5. **Testability**: every component testable in isolation

### Two Modes
- **Change Request (CR)**: value increment, full cycle spec→code→test
- **Bug Fix (BF)**: corrective maintenance, lightweight process, no spec changes

### Process Tailoring (2 Tiers)
- **Tier 1 - Standard**: any structured product (default)
- **Tier 2 - Governed**: sensitive data, heavy compliance, regulated industries

## Inspirations

- BMAD Method (multi-agent, adversarial review, scale-adaptive)
- GitHub Spec Kit (constitution, clarity checklists, cross-artifact analysis)
- Stream Coding (clarity gate, anti-patterns, document architecture)
- C4 Model (zoomable architecture documentation)
- arc42 (crosscutting concepts, pragmatic documentation)
- ISO 31000 (risk management)
- BABOK (requirements engineering, traceability)
- PMBOK (project governance, quality management)
- Agile/Scrum (sprint cycle, iterative delivery)
- Shape Up (appetite-based planning, hill charts)
- SRE (error budgets, observability)

## Contributing

Contributions are welcome! Please open an issue to discuss proposed changes before submitting a pull request.

## License

This project is licensed under the Apache License 2.0 — see the [LICENSE](LICENSE) file for details.
