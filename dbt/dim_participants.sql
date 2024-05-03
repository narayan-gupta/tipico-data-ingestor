{{ config(materialized='table') }}

SELECT
    DISTINCT participant.id AS participant_id,
    participant.name,
    participant.position,
    participant.abbreviation
FROM
    {{ source('tipico', 'sports-data') }},
    UNNEST(participants) AS participant
