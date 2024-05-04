{{ config(materialized='table') }}

SELECT
    id AS event_id,
    startTime AS start_time,
    messageTime AS message_time,
    sportType,
    matchState,
    status,
    eventName,
    eventType,
    marketCount,
    `group`.id as group_id,  -- Assuming group_id directly links to this event
FROM {{ source('tipico', 'sports-data') }}