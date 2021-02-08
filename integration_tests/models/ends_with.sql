{% set cols_n = dbt_dplyr.ends_with( ref('data'), 'c') %}
select {{ dbt_dplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}