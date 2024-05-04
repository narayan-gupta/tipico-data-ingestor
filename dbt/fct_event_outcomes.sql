{{ config(materialized='table') }}

SELECT
    e.event_id,
    p.participant_id,
    m.market_id,
    o.outcome_id,
    o.trueOdds AS oddsDecimal,
    CASE
        WHEN o.trueOdds >= 2 THEN (o.trueOdds - 1) * 100
        ELSE -100 / (o.trueOdds - 1)
    END AS oddsAmerican,
    o.status
FROM {{ ref('dim_events') }} e
LEFT JOIN {{ ref('dim_participants') }} p ON e.event_id = p.event_id
LEFT JOIN {{ ref('dim_markets') }} m ON e.event_id = m.event_id
LEFT JOIN {{ ref('dim_outcomes') }} o ON m.market_id = o.market_id
