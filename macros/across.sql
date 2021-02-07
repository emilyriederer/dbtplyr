{% macro across(var_list, script_string) %}

  {% for v in var_list %}
  {{ script_string | replace('{{var}}', v) }}
  {%- if not loop.last %},{% endif %}
  {% endfor %}

{% endmacro %}