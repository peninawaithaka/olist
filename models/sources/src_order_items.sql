-- fetch order items data from the raw_order_items dataset
-- where order_id, product_id and seller id is not null
-- clean up qoutations
-- cast shipping limit date to datetime

with raw_order_items as (

    select * from {{ source('olist', 'raw_order_items_dataset')}}
)

select 
    replace(order_id, '"', '') as order_id,
    order_item_id,
    replace(product_id, '"', '') as product_id,
    replace(seller_id, '"', '') as seller_id,
    cast(shipping_limit_date as timestamp_tz) as shipping_limit_date,
    price,
    freight_value
from raw_order_items
where order_id is not null and product_id is not null and seller_id is not null