{{ config(materialized='table') }}

SELECT
    DISTINCT `group`.id AS group_id,
    `group`.name,
    `group`.parentGroup.id AS parent_group_id
FROM
    {{ source('tipico', 'sports-data') }}