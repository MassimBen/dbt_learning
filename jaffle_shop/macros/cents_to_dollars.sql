{# A basic example for a project-wide macro to cast a column uniformly #}
{% macro cents_to_dollars(column_name, decimal=2) %}
    round(1.0 * {{ column_name }} / 100, {{ decimal }})
{% endmacro %}