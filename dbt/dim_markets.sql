{{ config(materialized='table') }}

SELECT
    main.id as event_id,
    market.id AS market_id,
    market.name,
    market.type,
    market.status,
    market.mostBalancedLine,
    market.sgpEligable
FROM {{ source('tipico', 'sports-data') }} main,
UNNEST(markets) AS market