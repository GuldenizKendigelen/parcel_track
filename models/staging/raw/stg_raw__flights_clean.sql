with 

source as (

    select * from {{ source('raw', 'flights_clean') }}

),

renamed as (

    select
        fl_date,
        airline,
        origin,
        dest,
        crs_dep_time,
        dep_time,
        dep_delay,
        arr_time,
        arr_delay,
        cancelled,
        cancellation_code,
        distance,
        diverted,
        delay_due_carrier,
        delay_due_weather,
        delay_due_nas,
        delay_due_late_aircraft,
        year,
        month,
        day_of_week,
        season,
        scheduled_dep_hour,
        time_of_day,
        is_delayed,
        is_weather_delay,
        is_weather_cancellation,
        is_late_aircraft_delay,
        has_delay_cause,
        is_covid_2020

    from source

)

select * from renamed