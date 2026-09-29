# Source labels (from DM-0001)

Every data point in an ADR or documentation file carries exactly one `Source` label.
Only these six values are allowed.

| Value | Confidence | When to use | Needs human validation |
|---|---|---|---|
| `DATABASE_METADATA` | High, verifiable | Fact read from DDL: table, column type, FK, index, constraint | No |
| `APPLICATION_CODE` | High, verifiable | Behavior read from code: stored procedures, triggers, views, ORM mappings | No |
| `SQL_QUERY` | High, requires access | Result of running a query: row counts, live statistics | No (but requires system access) |
| `BUSINESS_EXPERT` | High, human-validated | Confirmed by a business or technical person. Must include the date: `BUSINESS_EXPERT (YYYY-MM-DD)` | No (already validated) |
| `DOCUMENTATION` | Medium, may be outdated | Taken from wikis, specs, tickets, old diagrams | Recommended |
| `AI_INFERENCE` | Low until validated | Anything the AI described, summarized or inferred | **Yes, before `Published`** |

## Confidence ranking (highest to lowest)

Used to resolve the combination and consistency rules:

1. `DATABASE_METADATA`
2. `APPLICATION_CODE`
3. `SQL_QUERY`
4. `BUSINESS_EXPERT`
5. `DOCUMENTATION`
6. `AI_INFERENCE`

> Note: DM-0001 does not define an explicit order among the "High" values.
> This ranking is a proposal and should be confirmed by the team.

## Rules

- **Combination rule:** if several labels apply to one segment, use the lowest-confidence one.
- **Consistency rule:** a container (section or whole document) cannot be more confident than anything inside it. One `AI_INFERENCE` cell makes the document-level `source` `AI_INFERENCE`.
- **Date rule:** `BUSINESS_EXPERT` without a date is incomplete and cannot be published.

## Quick example

| Column | Type | Meaning | Source |
|---|---|---|---|
| `policy_id` | `BIGINT` | Primary key | `DATABASE_METADATA` |
| `premium_amount` | `DECIMAL(12,2)` | Annual premium after discounts | `AI_INFERENCE` |

Document-level `source` → `AI_INFERENCE` (lowest label present).
