-- H3 - Overall Airline Delay and Cancellation Rates
-- Dataset period: January 2019 - August 2023
-- 2023 excluded because it is a partial year

SELECT
    YEAR,
    AIRLINE,

    COUNT(*) AS total_flights,

    COUNTIF(CANCELLED = 0) AS completed_flights,

    COUNTIF(IS_DELAYED = 1) AS delayed_flights,

    COUNTIF(CANCELLED = 1) AS cancelled_flights,

    ROUND(
        100 * SAFE_DIVIDE(
            COUNTIF(IS_DELAYED = 1),
            COUNTIF(IS_DELAYED IS NOT NULL)
        ),
        2
    ) AS delay_rate_pct,

    ROUND(
        100 * SAFE_DIVIDE(
            COUNTIF(CANCELLED = 1),
            COUNT(*)
        ),
        2
    ) AS cancellation_rate_pct

FROM {{ ref('stg_flight_analysis__flights_clean') }}

WHERE YEAR BETWEEN 2019 AND 2022

GROUP BY
    YEAR,
    AIRLINE