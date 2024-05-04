{{ config(materialized='table') }}

SELECT
    main.id as event_id,
    market.id as market_id,
    outcome.id as outcome_id,
    outcome.name,
    outcome.isTraded,
    outcome.trueOdds,
    outcome.status
FROM    
{{ source('tipico', 'sports-data') }} main, 
    UNNEST(main.markets) AS market,
    UNNEST(market.outcomes) AS outcome
