{% set cols_n = dbt_dplyr.everything( ref('data')) %}
select {{ dbt_dplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}