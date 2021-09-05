{% macro starts_with(string, relation) %}

{%set cols = dbtplyr.get_column_names(relation) %}
{%set regex = "^" ~ string ~ ".*" %}
{%set results = dbtplyr.get_matches(cols, regex) %}
{{return(results)}}

{% endmacro %}

{% macro ends_with(string, relation) %}

{%set cols = dbtplyr.get_column_names(relation) %}
{%set regex = "^.*" ~ string ~ "$" %}
{%set results = dbtplyr.get_matches(cols, regex) %}
{{return(results)}}

{% endmacro %}

{% macro contains(string, relation) %}

{%set cols = dbtplyr.get_column_names(relation) %}
{%set regex = "^.*" ~ string ~ ".*$" %}
{%set results = dbtplyr.get_matches(cols, regex) %}
{{return(results)}}

{% endmacro %}

{% macro not_contains(string, relation) %}

{%set cols = dbtplyr.get_column_names(relation) %}
{%set regex = "^((?!" ~ string ~ ").)*$" %}
{%set results = dbtplyr.get_matches(cols, regex) %}
{{return(results)}}

{% endmacro %}

{% macro one_of(strings, relation) %}

{%set cols = dbtplyr.get_column_names(relation) %}
{%set regex = "^("+ strings|join("|") +")$" %}
{%set results = dbtplyr.get_matches(cols, regex) %}
{{return(results)}}

{% endmacro %}

{% macro not_one_of(strings, relation) %}

{%set cols = dbtplyr.get_column_names(relation) %}
{%set results = cols | reject('in', strings) %}
{{return(results)}}

{% endmacro %}

{% macro matches(string, relation) %}

{%set cols = dbtplyr.get_column_names(relation) %}
{%set regex = string %}
{%set results = dbtplyr.get_matches(cols, regex) %}
{{return(results)}}

{% endmacro %}


{% macro everything(relation) %}

{%set cols = dbtplyr.get_column_names(relation) %}
{{return(cols)}}

{% endmacro %}

{% macro where(fn, relation) %}

  {% set cols = adapter.get_columns_in_relation(relation) %}
  {% set results_list = [] %}

  {%  for c in cols %}
    {% if fn == "is_character" and c.is_character() %}
      {{ results_list.append(c.name) or "" }}
    {% elif fn == "is_number" and c.is_number() %}
      {{ results_list.append(c.name) or "" }}
    {% elif fn == "is_float" and c.is_float() %}
      {{ results_list.append(c.name) or "" }}
    {% elif fn == "is_numeric" and c.is_numeric() %}
      {{ results_list.append(c.name) or "" }}
    {% endif %}
  {% endfor %}

{{return(results_list)}}

{% endmacro %}
