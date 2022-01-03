create schema if not exists sde authorization sde;
grant usage on schema sde to public;
-- secure schema usage pattern
-- https://www.postgresql.org/docs/current/ddl-schemas.html#DDL-SCHEMAS-PATTERNS
revoke create on schema public from public;