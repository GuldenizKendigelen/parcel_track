WITH agg_pp AS(
    select
    parcel_id,
    COUNT(*) as nb_model,
    SUM(quantity) AS qty
    FROM{{ref('stg_raw__parcel_product')}}
    GROUP BY parcel_id
)SELECT p.*,
EXTRACT(MONTH FROM date_purchase)AS month_purchase,
--status,
date_diff(date_shipping, date_purchase, DAY) AS expedition_time,
date_diff(date_delivery, date_shipping, DAY) AS transport_time,
date_diff(date_delivery, date_purchase, DAY) AS delivery_time,
--delay,
qty,
--nb_model
FROM {{ref("stg_raw__parcel")}} as p 
JOIN agg_pp as app 
    ON p.parcel_id = app.parcel_id