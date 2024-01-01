-- fetch all the geolocation data from raw_geolocation dataset
-- remove quotations from the geolocation code prefix


with raw_geolocation as (

    select * from {{source('olist', 'raw_geolocation_dataset')}}

)

select 
    replace(geolocation_zip_code_prefix, '"', '') as customer_zip_code_prefix,
    geolocation_lat,
    geolocation_lng,
    geolocation_city as customer_city,
    geolocation_state as customer_state
from raw_geolocation
