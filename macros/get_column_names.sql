{% macro get_column_names(relation) %}

{% if relation.database is not defined %}
  {{ return(relation) }}
{% endif %}

{% set relation_query %}

  {% if target.type == 'postgres' %}
      select column_name
      from information_schema.columns
      where 
        table_schema = '{{relation.schema}}' and
        table_name = '{{relation.identifier}}';
  {% else %}
      select column_name
      FROM {{relation.database}}.{{relation.schema}}.INFORMATION_SCHEMA.COLUMNS
      WHERE table_name = '{{relation.identifier}}';
  {% endif %}

{% endset %}

{% set results = run_query(relation_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}
