-- fetch the orders data from the raw_orders table
-- clean the quotations from the order_id and customer_id
-- change time datatypes

--todo 
-- test for not null for order_id and customer_id
-- test for accepted values in the order status column

with raw_orders as (

    select * from {{ source('olist', 'raw_orders_dataset')}}

)

select
    replace(order_id, '"', '') as order_id,
    replace(customer_id, '"', '') as customer_id,
    order_status,
    cast(order_purchase_timestamp as timestamp_tz) as order_purchase_timestamp,
    cast(order_approved_at as timestamp_tz) as order_approved_at,
    cast(order_delivered_carrier_date as timestamp_tz) as order_delivered_carrier_date,
    cast(order_delivered_customer_date as timestamp_tz) as order_delivered_customer_date,
    cast(order_estimated_delivery_date as date) as order_estimated_delivery_date

from raw_orders
