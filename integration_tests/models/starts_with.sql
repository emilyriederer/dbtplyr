{% set cols_n = dbtplyr.starts_with('amt', ref('data')) %}
select {{ dbtplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}