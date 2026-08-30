with 

source as (

    select * from {{ source('raw', 'parcel') }}

),

renamed as (

    select 
          Parcel_id AS parcel_id
        , Parcel_tracking AS parcel_tracking
        , Transporter AS transporter
        , Priority AS priority
        , PARSE_DATE('%b %e, %Y', Date_purCHase) AS date_purchase
        --the format tells BigQuery what the SOURCE text looks like — not the format you want as the answer.
        , PARSE_DATE('%b %e, %Y', Date_sHIpping) AS date_shipping
        , PARSE_DATE('%b %e, %Y',DATE_delivery) AS date_delivery
        , PARSE_DATE('%b %e, %Y',DaTeCANcelled) AS datecancelled 

    from source

)

select * from renamed