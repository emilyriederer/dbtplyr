{% macro get_column_names(relation) %}

{% if relation is sequence %}
  {{ return(relation) }}
{% endif %}

{% set relation_query %}
select column_name
FROM {{relation.database}}.{{relation.schema}}.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = '{{relation.identifier}}';
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
