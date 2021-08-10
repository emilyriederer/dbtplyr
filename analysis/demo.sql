{% set cols = dbtplyr.get_column_names( source('chinook','albums') ) %}
{% set cols_n = dbtplyr.ends_with('Id', cols) %}
{% set cols_ind = dbtplyr.ends_with('Id', cols) %}

select

  {% call(var) dbtplyr.across(cols_n) %}
    sum({{var}}) as {{var}}_tot
  {% endcall %},
  {% call(var) dbtplyr.across(cols_ind) %}
    avg({{var}}) as {{var}}_avg
  {% endcall %}

from {{ source('chinook','albums') }}