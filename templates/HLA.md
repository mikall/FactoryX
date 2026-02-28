# {{PROJECT_NAME}} - High Level Architecture

> System architecture (C4 Model), technical decisions (ADR), security, scalability, and deployment.

---

## 1. System Architecture (C4 Model)

### Level 1 — System Context

> Who uses the system and what external systems does it interact with?

```
                         ┌─────────────────┐
                         │    {{ACTOR_1}}   │
                         │   (end user)     │
                         └────────┬────────┘
                                  │ HTTPS
                                  ▼
                    ┌──────────────────────────┐
                    │                          │
                    │   {{PROJECT_NAME}}        │
                    │   System                 │
                    │                          │
                    └──┬──────┬──────┬────────┘
                       │      │      │
              ┌────────┘      │      └────────┐
              ▼               ▼               ▼
    ┌──────────────┐ ┌──────────────┐ ┌──────────────┐
    │ {{EXT_SYS_1}}│ │ {{EXT_SYS_2}}│ │ {{EXT_SYS_3}}│
    │ (external)   │ │ (external)   │ │ (external)   │
    └──────────────┘ └──────────────┘ └──────────────┘
```

**Actors:**
| Actor | Description | Interaction |
|-------|-------------|-------------|
| {{ACTOR_1}} | {{ACTOR_DESC}} | {{INTERACTION}} |

**External Systems:**
| System | Purpose | Protocol | Notes |
|--------|---------|----------|-------|
| {{EXT_SYS_1}} | {{PURPOSE}} | {{PROTOCOL}} | {{NOTES}} |

---

### Level 2 — Container Diagram

> What are the major technology building blocks and how do they communicate?

```
[{{ACTOR_1}}]
    │ HTTPS
    ▼
┌─────────────────────────────────────────────────────┐
│                  {{PROJECT_NAME}}                     │
│                                                       │
│  ┌─────────────────┐      ┌─────────────────┐       │
│  │ Frontend         │      │ Backend          │       │
│  │ {{FRONTEND_STACK}}│─────▶│ {{BACKEND_STACK}} │       │
│  │ {{FRONTEND_HOST}} │ REST │ {{BACKEND_HOST}}  │       │
│  └─────────────────┘      └──┬──────┬───────┘       │
│                               │      │                │
│                    ┌──────────┘      └──────────┐    │
│                    ▼                            ▼    │
│           ┌──────────────┐            ┌────────────┐ │
│           │ Database      │            │ Auth       │ │
│           │ {{DATABASE}}  │            │ {{AUTH}}   │ │
│           └──────────────┘            └────────────┘ │
│                                                       │
│           ┌──────────────┐            ┌────────────┐ │
│           │ Storage       │            │ Cache/Queue│ │
│           │ {{STORAGE}}   │            │ {{CACHE}}  │ │
│           └──────────────┘            └────────────┘ │
└─────────────────────────────────────────────────────┘
```

**Containers:**
| Container | Technology | Purpose | Port/Protocol |
|-----------|-----------|---------|---------------|
| Frontend | {{FRONTEND_STACK}} | {{FE_PURPOSE}} | HTTPS/443 |
| Backend | {{BACKEND_STACK}} | {{BE_PURPOSE}} | REST/HTTPS |
| Database | {{DATABASE}} | Persistent storage | {{DB_PORT}} |
| Auth | {{AUTH_PROVIDER}} | Authentication & authorization | {{AUTH_PROTOCOL}} |
| Storage | {{STORAGE_PROVIDER}} | File/media storage | {{STORAGE_PROTOCOL}} |

---

## 2. Crosscutting Concepts

> Recurring patterns and strategies applied consistently across all containers.

### 2.1 Error Handling Strategy
- {{ERROR_STRATEGY}} (e.g., structured error responses with error codes, retry with exponential backoff for external services)

### 2.2 Logging Strategy
- {{LOGGING_STRATEGY}} (e.g., structured JSON logs, correlation IDs across services, no PII in logs)

### 2.3 Authentication & Authorization Pattern
- {{AUTH_PATTERN}} (e.g., JWT validation middleware, RLS in database, RBAC/ABAC)

### 2.4 Caching Strategy
- {{CACHING_STRATEGY}} (e.g., no cache initially, add at measured bottlenecks)

### 2.5 Input Validation Pattern
- {{VALIDATION_PATTERN}} (e.g., validate at API boundary, schema validation with Zod/Pydantic)

---

## 3. Architectural Principles

Full reference: `analysis/principles.md`

Summary:
1. {{ARCH_PRINCIPLE_1}} (e.g., Modular monolith, microservices, serverless)
2. {{ARCH_PRINCIPLE_2}} (e.g., Single database, polyglot persistence)
3. Buy > Build for non-core services
4. {{AUTH_STRATEGY}} (e.g., Row-level access control, RBAC, ABAC)
5. {{API_AUTH}} (e.g., Stateless API with JWT, session-based, API keys)

---

## 4. Architectural Decision Records (ADR)

### ADR-001: {{TITLE}}

| Field | Value |
|-------|-------|
| **Date** | {{DATE}} |
| **Status** | Accepted |
| **Context** | {{CONTEXT}} |
| **Decision** | {{DECISION}} |
| **Alternatives** | {{ALTERNATIVES}} |
| **Consequences** | {{CONSEQUENCES}} |

---

## 5. Security

### 5.1 Authentication
- Method: {{AUTH_METHOD}} (e.g., JWT, Magic Link, OAuth, Session-based)
- Provider: {{AUTH_PROVIDER}}
- Token lifetime: {{TOKEN_LIFETIME}}

### 5.2 Authorization
- {{AUTHORIZATION_STRATEGY}} (e.g., Row-level access control, RBAC, ABAC)
- Backend middleware for role verification
- Principle of least privilege

### 5.3 Data Protection
- HTTPS everywhere (TLS 1.2+)
- Secrets in environment variables (never in code)
- No PII in logs

---

## 6. Scalability

### Initial Targets
- Concurrent users: {{CONCURRENT_USERS}}
- Requests/sec: {{RPS}}
- Data: {{DATA_VOLUME}}

### Scaling Plan
- **Phase 1** (MVP): {{SCALING_PHASE_1}}
- **Phase 2** (Growth): {{SCALING_PHASE_2}}
- **Phase 3** (Scale): {{SCALING_PHASE_3}}

---

## 7. Deployment & DevOps

### 7.1 Environment Map

| Environment | Purpose | URL | Notes |
|-------------|---------|-----|-------|
| Development | Local development | localhost | Developer machines |
| Staging | Pre-production testing | {{STAGING_URL}} | Mirrors production |
| Production | Live system | {{PROD_URL}} | User-facing |

### 7.2 Container Deployment

| Container | Platform | CI/CD | Notes |
|-----------|----------|-------|-------|
| Frontend | {{FRONTEND_HOSTING}} | {{FE_CI_CD}} | {{FE_NOTES}} |
| Backend | {{BACKEND_HOSTING}} | {{BE_CI_CD}} | {{BE_NOTES}} |
| Database | {{DB_HOSTING}} | {{DB_CI_CD}} | {{DB_NOTES}} |

### 7.3 Git Strategy
- **Branching**: {{GIT_STRATEGY}} (e.g., trunk-based with short-lived feature branches)
- **Merge**: {{MERGE_STRATEGY}} (e.g., squash merge to main, PR required)
- **Environments**: feature branch → staging → production

### 7.4 CI/CD Pipeline (placeholder)

> Pipeline scripts and automation will be produced during sprint execution and refined by the DevOps team. See `deliverables/deploy/` for deployment artifacts.

```
[Push to branch] → [Lint + Type Check] → [Test] → [Build] → [Deploy to Staging] → [Manual Approval] → [Deploy to Production]
```

### 7.5 Monitoring & Observability (future)

> To be defined when the application reaches production readiness. Key areas to address:
> - Application metrics (response times, error rates)
> - Infrastructure metrics (CPU, memory, disk)
> - Alerting rules and escalation
> - Log aggregation and search

---

## Changelog

| Sprint | Date | Changes |
|--------|------|---------|
| S0 | {{DATE}} | Initial creation |
