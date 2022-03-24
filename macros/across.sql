{% macro across(var_list, script_string = '{{var}}', final_comma) %}

  {% for v in var_list %}
  {{ script_string | replace('{{var}}', v) }}
  {%- if not loop.last %},{% endif %}
  {%- if loop.last and final_comma|default(false) %},{% endif %}
  {% endfor %}

{% endmacro %}

{% macro c_across(var_list, script_string) %}

  {% if script_string | length < 2 %}
    {{ var_list | join(script_string) }}
  {% else %}
	{% set vars = var_list | join(",") %}
	{{ script_string | replace('{{var}}', vars) }}
  {% endif %}

{% endmacro %}