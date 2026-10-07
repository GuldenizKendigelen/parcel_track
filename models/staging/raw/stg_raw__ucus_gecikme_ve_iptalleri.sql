with 

source as (

    select * from {{ source('raw', 'ucus_gecikme_ve_iptalleri') }}

),

renamed as (

    select
        fl_date,
        airline,
        airline_dot,
        airline_code,
        dot_code,
        fl_number,
        origin,
        origin_city,
        dest,
        dest_city,
        crs_dep_time,
        dep_time,
        dep_delay,
        taxi_out,
        wheels_off,
        wheels_on,
        taxi_in,
        crs_arr_time,
        arr_time,
        arr_delay,
        cancelled,
        cancellation_code,
        diverted,
        crs_elapsed_time,
        elapsed_time,
        air_time,
        distance,
        delay_due_carrier,
        delay_due_weather,
        delay_due_nas,
        delay_due_security,
        delay_due_late_aircraft

    from source

)

select * from renamed