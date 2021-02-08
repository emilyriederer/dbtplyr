{% set cols_n = dbt_dplyr.starts_with( ref('data'), 'n') %}
select {{ dbt_dplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}