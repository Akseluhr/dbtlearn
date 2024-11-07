SELECT
    *
FROM
    {{ ref('dim_listings_cleansed') }}
WHERE minimum_nights < 1
LIMIT 10

-- Detta test failar om minimum nights är mindre än 1 vilekt makes sense.