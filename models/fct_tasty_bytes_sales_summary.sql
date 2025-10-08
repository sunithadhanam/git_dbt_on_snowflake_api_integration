{{ config(materialized='table') }}

select
  count(*) as total_orders,
  sum(price) as total_sales
from {{ ref('stg_tasty_bytes_orders') }}
