with stg as (
    select * from {{ ref('stg_orders') }}
)

select
    customer_id,
    count(distinct order_id) as total_orders,
    sum(total_amount) as total_revenue,
    sum(case when is_completed = 1 then 1 else 0 end) as completed_orders
from stg
group by customer_id
