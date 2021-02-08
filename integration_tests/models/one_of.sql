{% set cols_n = dbt_dplyr.one_of( ref('data'), ['amt_c']) %}
select {{ dbt_dplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}