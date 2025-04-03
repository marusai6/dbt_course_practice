{% set status_query %}
select distinct status
from {{ ref("stg_flights__facts__flights") }}
{% endset %}

{% set status_query_result = run_query(status_query) %}
{% if execute %}
    {% set important_status = status_query_result.columns[0].values() %}
{% else %}
    {% set important_status = [] %}
{% endif %}

select
{% for status_ in important_status %}
SUM(CASE WHEN status = '{{ status_ }}' THEN 1 ELSE 0 END) as status_{{ status_|replace(' ', '_') }}
    {% if not loop.last %},{% endif %}
{% endfor %}
from
    {{ ref("stg_flights__facts__flights") }}