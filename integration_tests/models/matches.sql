{% set cols_n = dbtplyr.matches('.*_c', ref('data')) %}
select 
  {{ dbtplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}