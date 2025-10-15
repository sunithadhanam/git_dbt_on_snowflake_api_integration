{{ config(
    materialized='table',
    schema='PUBLIC',
    alias='FCT_SALES_SUMMARY'
) }}

with orders as (
    select * from {{ ref('stg_orders') }}
)

, summarized as (
    select
        ORDER_STATUS,
        count(distinct ORDER_ID) as TOTAL_ORDERS,
        sum(TOTAL_AMOUNT) as TOTAL_SALES
    from orders
    group by ORDER_STATUS
)

select * from summarized

