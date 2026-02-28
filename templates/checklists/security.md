# Security Checklist

> Must pass every sprint. Reference: OWASP Top 10.

## Authentication
- [ ] JWT validated on every protected endpoint
- [ ] Reasonable token lifetime (< 1h access, < 7d refresh)
- [ ] Logout invalidates the token
- [ ] No protected endpoint accessible without auth

## Authorization
- [ ] RLS active on all tables with user data
- [ ] Every endpoint verifies user role
- [ ] IDOR check: user cannot access other users' resources
- [ ] Principle of least privilege respected

## Input Validation
- [ ] All inputs validated (type, length, format)
- [ ] Parameterized queries (no string concatenation in SQL)
- [ ] File upload: type, size, content-type verified
- [ ] No eval() or exec() on user input
- [ ] SSRF prevention: user URLs not used for server-side fetch without whitelist
- [ ] Mass assignment protection: explicit whitelist of accepted fields
- [ ] API errors do not expose stack traces or internal details in production

## Data Protection
- [ ] HTTPS everywhere
- [ ] No secrets in code (API keys, passwords, tokens)
- [ ] No secrets in logs
- [ ] No PII in logs
- [ ] Encryption at rest for sensitive data
- [ ] Passwords hashed (bcrypt/argon2)

## Headers and Configuration
- [ ] Restrictive CORS policy (domain whitelist)
- [ ] Rate limiting on critical endpoints (login, signup, API)
- [ ] Security headers (X-Frame-Options, X-Content-Type-Options, CSP)
- [ ] No active default credentials

## Dependencies
- [ ] No dependencies with known CVEs (npm audit, pip audit)
- [ ] Dependencies updated to latest patch version

## Logging and Monitoring
- [ ] Failed access attempts logged
- [ ] Critical operations (delete, role update) logged
- [ ] Anomaly alerting configured
