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


{% macro where(fn, relation) %}

{%set cols = adapter.get_columns_in_relation(relation) %}
{%set results = dbtplyr.map(cols, fn) %}
{{return(results)}}

{% endmacro %}


{% macro everything(relation) %}

{%set cols = dbtplyr.get_column_names(relation) %}
{{return(cols)}}

{% endmacro %}
