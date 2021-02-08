{% macro starts_with(relation, string) %}

{%set cols = dbt_dplyr.get_column_names(relation) %}
{%set regex = "^" ~ string ~ ".*" %}
{%set results = get_matches(cols, regex) %}
{{return(results)}}

{% endmacro %}

{% macro ends_with(relation, string) %}

{%set cols = dbt_dplyr.get_column_names(relation) %}
{%set regex = "^.*" ~ string ~ "$" %}
{%set results = get_matches(cols, regex) %}
{{return(results)}}

{% endmacro %}

{% macro contains(relation, string) %}

{%set cols = dbt_dplyr.get_column_names(relation) %}
{%set regex = "^.*" ~ string ~ ".*$" %}
{%set results = get_matches(cols, regex) %}
{{return(results)}}

{% endmacro %}

{% macro not_contains(relation, string) %}

{%set cols = dbt_dplyr.get_column_names(relation) %}
{%set regex = "^((?!" ~ string ~ ").)*$" %}
{%set results = get_matches(cols, regex) %}
{{return(results)}}

{% endmacro %}

{% macro one_of(relation, strings) %}

{%set cols = dbt_dplyr.get_column_names(relation) %}
{%set regex = "^("+ strings|join("|") +")$" %}
{%set results = get_matches(cols, regex) %}
{{return(results)}}

{% endmacro %}

{% macro not_one_of(relation, strings) %}

{%set cols = dbt_dplyr.get_column_names(relation) %}
{%set results = cols | reject('in', strings) %}
{{return(results)}}

{% endmacro %}

{% macro matches(relation, string) %}

{%set cols = dbt_dplyr.get_column_names(relation) %}
{%set regex = string %}
{%set results = get_matches(cols, regex) %}
{{return(results)}}

{% endmacro %}


{% macro everything(relation) %}

{%set cols = dbt_dplyr.get_column_names(relation) %}
{{return(cols)}}

{% endmacro %}