WITH src_reviews AS (
    SELECT * 
    -- FROM AIRBNB.RAW.RAW_REVIEWS - defined a source for this!
    FROM {{ source('airbnb', 'reviews') }}
)
SELECT 

    listing_id,
    date as review_date,
    reviewer_name,
    comments as review_text,
    sentiment as review_sentiment

FROM src_reviews
