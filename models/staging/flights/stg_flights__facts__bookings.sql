{{
      config(
        materialized = 'incremental',
        incremental_strategy = 'append'
        )
}}

select
  {{ bookref_to_bigint(bookref = 'book_ref') }} as book_ref, 
  book_date, 
  total_amount
from {{ source('demo_src', 'bookings') }}
{% if is_incremental() %}
where 
  book_ref > (select MAX(book_ref) from {{ this }})
{% endif %}