# {{PROJECT_NAME}} - Architectural Principles

> Version: 1.0.0 | Date: {{DATE}}

## Governance

- These principles are IMMUTABLE unless formally amended
- Every amendment requires: documentation + rationale + migration plan
- Every violation must be justified in the Complexity Tracking table
- This document takes precedence over all other practices

---

## Principles

### P1: Simplicity and Economy
The simplest solution that works is always the right one. Less code, fewer functions, fewer abstractions. The best code is code that doesn't exist.

**Implications**:
- Modular monolith first, microservices later (maybe never)
- No abstraction before 3 concrete uses
- No configurability for hypothetical cases

### P2: Performance as a Design Constraint
The system must be clean, lightweight, and scalable. Performance is not a future optimization, it's a design constraint.

**Implications**:
- Optimized queries from day 1 (no N+1, indices on FK)
- Minimal API payloads
- Lazy loading / pagination by default

### P3: Layered Security
Security, privacy, and compliance are non-negotiable constraints, implemented progressively.

**Implications**:
- Day 1: HTTPS, managed authentication, row-level access control, input validation
- Month 1: Rate limiting, audit log, backup
- Month 3: Penetration test, full GDPR audit

### P4: Spec-Driven Development
Specs lead, code follows. When there's a discrepancy, fix the spec BEFORE the code.

**Implications**:
- No code without an approved spec
- Bug fixes don't change specs (they change implementation)
- Change Requests change specs (full cycle)

### P5: Testability by Design
Every component must be testable in isolation. A system that cannot be tested is a system that cannot be released.

**Implications**:
- APIs with clear and verifiable contracts
- The tester can request test infrastructure (mocks, simulators, logging)
- Automated tests are first-class artifacts

### P6: Privacy by Design
{{PRIVACY_PRINCIPLE - adapt to domain. E.g., "Sensitive data is never persisted at rest."}}

**Implications**:
- {{PRIVACY_IMPLICATION_1}}
- {{PRIVACY_IMPLICATION_2}}

---

## Complexity Tracking

Every principle violation must be justified:

| Violated Principle | Where | Why Necessary | Simpler Alternative Rejected Because |
|-------------------|-------|---------------|-------------------------------------|
| _no violations so far_ | | | |

---

## Changelog

| Date | Version | Type | Description |
|------|---------|------|-------------|
| {{DATE}} | 1.0.0 | MAJOR | Initial creation |
