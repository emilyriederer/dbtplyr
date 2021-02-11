{% macro across(var_list, script_string) %}

  {% for v in var_list %}
  {{ script_string | replace('{{var}}', v) }}
  {%- if not loop.last %},{% endif %}
  {% endfor %}

{% endmacro %}

{% macro c_across(var_list, script_string) %}

  {% if modules.re.match('{{var}}', script_string) %}
    {% set vars = var_list | join(",") %}
	{{ script_string | replace('{{var}}', var_lists) }}
  {% else %}
    {{ var_list | join(script_string) }}
  {% endif %}

{% endmacro %}