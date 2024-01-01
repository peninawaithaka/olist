-- fetch all source data from raw_customers dataset where ids are not null
-- remove the "" in varchar ids

--to do
-- test for uniqueness and not null for customer id and customer unique_id

with raw_customers as (

    select * from {{ source('olist', 'raw_customers_dataset')}}
)

select 
    replace(customer_id, '"', '') as customer_id,
    replace(customer_unique_id, '"', '') as customer_unique_id,
    replace(customer_zip_code_prefix, '"', '') as customer_zip_code_prefix,
    customer_city,
    customer_state
from raw_customers
where customer_id is not null and customer_unique_id is not null
