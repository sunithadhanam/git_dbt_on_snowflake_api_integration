{{ config(
    materialized='view',
    schema='PUBLIC',
    alias='STG_ORDERS'
) }}

with raw_orders as (
    select
        ORDER_ID,
        CUSTOMER_ID,
        cast(ORDER_DATE as date) as ORDER_DATE,
        TOTAL_AMOUNT,
        STATUS
    from {{ source('public_source', 'raw_orders') }}
    where STATUS is not null
)

select
    ORDER_ID,
    CUSTOMER_ID,
    ORDER_DATE,
    TOTAL_AMOUNT,
    upper(STATUS) as ORDER_STATUS,
    current_timestamp() as RECORD_LOADED_AT
from raw_orders;
