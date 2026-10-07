SELECT *
FROM {{ source('raw', 'flights_clean') }}