{% snapshot scd_raw_listings %}

{{
    config(
        target_schema='dev',
        strategy='timestamp',
        unique_key='id',
        updated_at='updated_at',
        invalidate_hard_deletes=True
    )
}}

SELECT *
FROM {{ source('airbnb', 'listings') }}

{% endsnapshot %}