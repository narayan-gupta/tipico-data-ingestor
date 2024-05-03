{{ config(materialized='table') }}

SELECT
    id AS event_id,
    startTime AS event_start_time,
    messageTime AS event_message_time,
    sportType,
    matchState,
    status,
    marketCount,
    `group`.id as group_id  -- Assuming group_id is properly extracted or derived from your raw data
FROM
    {{ source('tipico', 'sports-data') }}