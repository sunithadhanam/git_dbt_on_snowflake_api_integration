{{ config(materialized='view') }}

with source as (
    select * 
    from {{ source('raw', 'orders') }}
),

renamed as (
    select
        cast(order_id as varchar) as order_id,
        cast(customer_id as varchar) as customer_id,
        try_to_date(order_date) as order_date,
        cast(total_amount as numeric(10,2)) as total_amount,
        order_status,
        current_timestamp() as _loaded_at
    from source
)

select * from renamed
