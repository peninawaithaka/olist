-- load the products data from raw_products dataset
-- where product_id is not null
-- clean up quotations from product id column
-- correct the column names naming

with raw_products as (

    select * from {{ source('olist', 'raw_products_dataset')}}
)

select 
    replace(product_id, '"', '') as product_id,
    product_category_name as product_category,
    product_name_lenght as product_name_length,
    product_description_lenght as product_description_length,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
from raw_products
where product_id is not null
