{% set current_date = run_started_at | string | truncate(10, True, "") %}
{% set current_year = 2025 %}
{% set prev_year = 2015 %}
{% set prev_date = current_date | replace(current_year, prev_year) %}

select count(*)
from {{ ref('fct_flights') }}
where scheduled_departure between '{{ prev_date }}'  and '{{ current_date }}'