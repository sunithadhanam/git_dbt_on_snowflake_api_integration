{{ config(materialized='table') }}

with stg as (
    select * from {{ ref('stg_orders') }}
),

aggregated as (
    select
        customer_id,
        count(distinct order_id) as total_orders,
        sum(total_amount) as total_sales,
        min(order_date) as first_order_date,
        max(order_date) as last_order_date
    from stg
    group by customer_id
)

select * from aggregated
