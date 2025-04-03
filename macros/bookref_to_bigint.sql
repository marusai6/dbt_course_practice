{% macro bookref_to_bigint(bookref) %}
    (('0x' || {{ bookref }})::bigint)
{% endmacro %}