{{ 
    config(
        materialized='table'
        ) 
    }}

select
    ticket_no, 
    book_ref, 
    passenger_id, 
    passenger_name, 
    contact_data
from {{ ref("stg_flights__facts__tickets") }}
where passenger_id not in (select id from {{ ref("stg_dict__id_staff") }})