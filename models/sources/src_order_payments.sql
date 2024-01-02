-- fetch all the order payments data from raw_order_payments dataset
-- where order_id is not null
-- clean up quotations


with raw_order_payments as (

    select * from {{ source('olist', 'raw_order_payments_dataset')}}
)

select
    replace(order_id, '"', '') as order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
from raw_order_payments
where order_id is not null