-- load the sellers data from the raw_sellers_dataset table
-- where seller_id is not null

with raw_sellers as (

    select * from {{ source('olist','raw_sellers_dataset')}}
)

select
    replace(seller_id, '"', '') as seller_id,
    replace(seller_zip_code_prefix, '"', '') as seller_zip_code_prefix,
    seller_city,
    seller_state
from raw_sellers
where seller_id is not null

