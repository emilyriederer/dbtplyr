{% macro map(input_list, fn) %}
    {{ return( adapter.dispatch('map', 'dbtplyr') (relation) ) }}
{% endmacro %}

{% macro default__map(input_list, fn) %}

{% set results_list = [] %}
{% for l in input_list %}
    {% if fn(l) %}
        {{ results_list.append(l) or "" }}
    {% endif %}
{% endfor %}

{{ return(results_list) }}

{% endmacro %}
