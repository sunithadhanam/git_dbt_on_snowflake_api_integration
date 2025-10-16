with raw_orders as (

    select * from {{ source('raw', 'RAW_ORDERS') }}

)

select
    order_id,
    customer_id,
    order_date,
    total_amount,
    status,
    case
        when status = 'Completed' then 1
        else 0
    end as is_completed
from raw_orders
