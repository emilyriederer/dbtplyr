{% macro get_matches(input_list, regex) %}
    {{ adapter.dispatch('get_matches', 'dbtplyr') (input_list, regex) }}
{% endmacro %}


{% macro default__get_matches(input_list, regex) %}

{% set results_list = [] %}
{% for l in input_list %}
    {% if modules.re.match(regex, l, modules.re.IGNORECASE) %}
        {{ results_list.append(l) or "" }}
    {% endif %}
{% endfor %}

{{ return(results_list) }}

{% endmacro %}
