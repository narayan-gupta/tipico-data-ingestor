{{ config(materialized='table') }}

SELECT
    DISTINCT outcome.id AS outcome_id,
    outcome.name,
    outcome.isTraded,
    outcome.trueOdds,
    outcome.status
FROM
    {{ source('tipico', 'sports-data') }},
    UNNEST(markets) AS market,
    UNNEST(market.outcomes) AS outcome
