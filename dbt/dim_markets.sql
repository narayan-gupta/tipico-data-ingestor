{{ config(materialized='table') }}

SELECT
    DISTINCT market.id AS market_id,
    market.name,
    market.type,
    market.status,
    market.mostBalancedLine,
    market.sgpEligable
FROM
    {{ source('tipico', 'sports-data') }},
    UNNEST(markets) AS market
