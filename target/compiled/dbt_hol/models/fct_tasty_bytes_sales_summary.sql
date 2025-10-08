

select
  count(*) as total_orders,
  sum(price) as total_sales
from DBT_POC_DB.DBT_POC_SCHEMA.stg_tasty_bytes_orders