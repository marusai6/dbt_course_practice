{{
      config(
        materialized = 'table'
        )
}}

select id
from {{ ref("passenger_id_staff") }}