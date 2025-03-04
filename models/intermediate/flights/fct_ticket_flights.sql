{{ 
    config(
        materialized='table'
        ) 
    }}

select
    ticket_no, 
    flight_id, 
    fare_conditions, 
    amount,
    false as boarding_pass_exists,
    0 as boarding_no, 
    null as seat_no,
    current_date as load_date
from {{ ref("stg_flights__facts__ticket_flights") }}