{% set cols_n = dbt_dplyr.not_contains( ref('data'), 'n') %}
select {{ dbt_dplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}