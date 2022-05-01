{% macro across(var_list, script_string = '{{var}}', final_comma = false) %}
    {{ adapter.dispatch('across', 'dbtplyr') (var_list, script_string, final_comma) }}
{% endmacro %}

{% macro default__across(var_list, script_string, final_comma) %}

  {% for v in var_list %}
  {{ script_string | replace('{{var}}', v) }}
  {%- if not loop.last %},{% endif %}
  {%- if loop.last and final_comma|default(false) %},{% endif %}
  {% endfor %}

{% endmacro %}

{% macro c_across(var_list, script_string) %}
    {{ adapter.dispatch('c_across', 'dbtplyr') (var_list, script_string) }}
{% endmacro %}

{% macro default__c_across(var_list, script_string) %}

  {% if script_string | length < 2 %}
    {{ var_list | join(script_string) }}
  {% else %}
	{% set vars = var_list | join(",") %}
	{{ script_string | replace('{{var}}', vars) }}
  {% endif %}

{% endmacro %}
