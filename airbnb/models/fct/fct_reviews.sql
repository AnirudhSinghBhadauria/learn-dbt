{{
     config (
          materialized = 'incremental',
          on_schema_change = 'fail'
     )
}}

WITH src_reviews AS (
     SELECT * 
     FROM {{ ref('src_reviews') }}
)
SELECT * FROM src_reviews
where review_text is not null

{% if is_incremental() %}
     AND review_date > (select max(review_date) from {{ this }})
{% endif %}

/*

Here this refers to this model i.e 'fact_reviews'

The logic is basically like, if we have more current review then it will be incrementally loaded in the table.

 */