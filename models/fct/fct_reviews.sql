-- kan konfiga per modell på detta vis
-- om schema ändras så fångar vi det genom att faila
{{
  config(
    materialized = 'incremental', 
    on_schema_change='fail'      
    )
}}
WITH src_reviews AS (
  SELECT * FROM {{ ref('src_reviews') }}
)
SELECT * FROM src_reviews
WHERE review_text is not null
-- om det är inkrementell modell
-- appenda enbart de senaste recensionerna (review_date > max(review date) -> den första pekar på inkommande recensioner, och den sista på existerande recensioner)
{% if is_incremental() %} 
  AND review_date > (select max(review_date) from {{ this }}) 
{% endif %}