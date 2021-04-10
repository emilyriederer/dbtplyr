{% macro get_column_names(relation) %}

{# if relation is not actually a reference simply pass through #}
{# this is useful so downstream functions can accept either list or relation #}

{% if relation.database is not defined %}
  {{ return(relation) }}
{% endif %}

{%- set results_list  = adapter.get_columns_in_relation(relation) -%}
{{ return(results_list) }}

{% endmacro %}
