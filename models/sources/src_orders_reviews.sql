-- fetch all the reviews data from raw_orders_reviews dataset
-- where order_id is not null
-- clean up review_answer_timestamp
-- clean up quotations

with raw_order_reviews as (

    select * from {{ source('olist', 'raw_order_reviews_dataset')}}
)

select 
    replace(review_id, '"', '') as review_id,
    replace(order_id, '"', '') as order_id,
    review_score,
    review_comment_title as review_title,
    review_comment_message as review_message,
-- validates that a varchar text is a valid date
    try_to_date(review_answer_timestamp) as review_timestamp
from raw_order_reviews
where order_id is not null