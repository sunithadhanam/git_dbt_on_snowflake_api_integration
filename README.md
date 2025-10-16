# dbt Orders Demo — PoC for dbt Projects on Snowflake

This PoC demonstrates dbt Core running inside **Snowflake’s file-based UI**.

## Workflow
1. GitHub repo → Snowflake Workspace
2. Run `dbt deps`, `dbt run`, `dbt test` directly in Snowsight

## Models
- `RAW_ORDERS` (table) → source
- `stg_orders` → cleans orders
- `fct_orders` → aggregates order metrics per customer
