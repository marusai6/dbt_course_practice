select aircraft_code, count(*) as cnt
from {{ ref('stg_flights__seats') }}
group by aircraft_code