

-- mock up some data for the POC
select
  1 as order_id,
  'burger' as item_name,
  5.99 as price,
  '2025-10-08'::date as order_date
union all
select
  2 as order_id,
  'fries' as item_name,
  3.49 as price,
  '2025-10-08'::date as order_date