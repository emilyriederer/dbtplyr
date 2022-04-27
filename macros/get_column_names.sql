{% macro get_column_names(relation) %}
    {{ adapter.dispatch('get_column_names', 'dbtplyr')(relation) }}
{% endmacro %}

{% macro default__get_column_names(relation) %}

{# if relation is not actually a reference simply pass through #}
{# this is useful so downstream functions can accept either list or relation #}

{% if relation.database is not defined %}
  {{ return(relation) }}
{% endif %}

{%- set cols_list  = adapter.get_columns_in_relation(relation) -%}
{% set results_list = [] %}
{% for c in cols_list %}
        {{ results_list.append(c.name) }}
{% endfor %}
{{ return(results_list) }}

{% endmacro %}
