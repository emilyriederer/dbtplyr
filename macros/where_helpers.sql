{% macro if_any(var_list, script_string) %}

  {% for v in var_list %}
  {{ "(" ~ script_string | replace('{{var}}', v) ~ ")" }}
  {%- if not loop.last %} or {% endif %}
  {% endfor %}

{% endmacro %}

{% macro if_all(var_list, script_string) %}

  {% for v in var_list %}
  {{ "(" ~ script_string | replace('{{var}}', v) ~ ")" }}
  {%- if not loop.last %} and {% endif %}
  {% endfor %}

{% endmacro %}