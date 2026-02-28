# Privacy Checklist

> Must pass every sprint. Reference: GDPR.

## Data Minimization
- [ ] Only strictly necessary data is collected
- [ ] No "extra" fields collected "for the future"
- [ ] Sensitive data not persisted if not necessary

## Consent
- [ ] Explicit consent collected before processing
- [ ] Consent recorded with timestamp
- [ ] Consent revocable by the user
- [ ] Privacy policy accessible

## Data Subject Rights
- [ ] Right of access implemented (data export)
- [ ] Right of rectification implemented
- [ ] Right of erasure implemented (or planned)
- [ ] Right to portability (standard format)

## Retention
- [ ] Retention policy defined for each data type
- [ ] Automatic cleanup for expired data
- [ ] No data retained beyond necessity

## Data Protection by Design
- [ ] Sensitive data separated from operational data
- [ ] Role-based data access (RLS)
- [ ] Data in transit encrypted (HTTPS/TLS)
- [ ] Data at rest encrypted (if required by domain)
- [ ] No extra-EU transfer without legal basis

## Logging and Audit
- [ ] No PII in application logs
- [ ] Audit trail for sensitive data access
- [ ] Processing records documented

## Incident Management
- [ ] Data breach notification procedure documented (72h GDPR)
- [ ] DPIA conducted for high-risk processing (Tier 2 - Governed)
- [ ] Data processor agreements (DPA) in place
- [ ] Privacy officer/DPO identified
