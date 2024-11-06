WITH raw_reviews AS (
    SELECT
        *
    FROM
        AIRBNB.RAW.RAW_REVIEWS
)
SELECT
    date AS review_date,
    comments AS review_text,
    sentiment AS review_sentiment,
FROM
    raw_reviews
