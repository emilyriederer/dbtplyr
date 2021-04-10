{% macro get_column_names(relation) %}

{% if relation.database is not defined %}

  {{ return(relation) }}

{% else %}

  {%- set results_list  = adapter.get_columns_in_relation(relation) -%}
  {{ return(results_list) }}

{% endif %}

{% endmacro %}


