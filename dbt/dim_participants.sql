{{ config(materialized='table') }}

SELECT
    main.id AS event_id,
    participant.id AS participant_id,
    participant.name,
    participant.position,
    participant.abbreviation
FROM
    {{ source('tipico', 'sports-data') }} main,
    UNNEST(main.participants) AS participant