# Performance Checklist

> Must pass every sprint. The system must remain clean, lightweight, and scalable.

## Backend
- [ ] No N+1 queries (use JOIN or batch)
- [ ] Indices on all columns used in WHERE and JOIN
- [ ] Pagination on all list endpoints (default 20, max 100)
- [ ] No full table scan on tables > 1000 rows
- [ ] Connection pooling configured
- [ ] Heavy operations in background (async)
- [ ] Minimal API payloads (only necessary fields)
- [ ] API response time < 200ms (p95)

## Frontend
- [ ] First Contentful Paint < 1s
- [ ] Largest Contentful Paint < 2s
- [ ] Cumulative Layout Shift < 0.05
- [ ] Code splitting active (lazy loading routes)
- [ ] Optimized images (framework image component, WebP)
- [ ] No web fonts (system font stack)
- [ ] Prefetching on predictable routes
- [ ] Skeleton loading (no spinners)

## Database
- [ ] No table without primary index
- [ ] Foreign keys with index
- [ ] EXPLAIN on critical queries (no seq scan)
- [ ] Materialized views for heavy aggregations
- [ ] Vacuum/analyze scheduled

## Economy
- [ ] Frontend bundle size < 200KB gzipped (initial load)
- [ ] No unnecessary dependencies
- [ ] No dead code
- [ ] No duplicate functions
