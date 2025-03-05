{% snapshot dim_aircrafts %}

{{ config(
        target_schema = 'snapshot',
        unique_key = 'aircraft_code',
        strategy = 'check',
        check_cols = ['model', 'range']
    )
}}

select
aircraft_code, model, range
from
    {{ ref("stg_flights__aircrafts") }}

{% endsnapshot %}