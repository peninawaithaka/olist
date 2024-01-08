-- records snapshots of the data using the check strategy

{% snapshot orders_snapshot %}

{{
    config(
        target_database = 'OLIST',
        target_schema = 'RAW',
        unique_key = 'order_id',

        strategy = 'check',
        check_cols = ['order_status']
    )
}}

select * from {{ source('olist', 'raw_orders_dataset')}}

{% endsnapshot %}