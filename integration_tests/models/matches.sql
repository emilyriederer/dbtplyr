{% set cols_n = dbt_dplyr.matches( ref('data'), '.*_c') %}
select {{ dbt_dplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}