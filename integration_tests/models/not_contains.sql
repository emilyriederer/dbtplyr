{% set cols_n = dbtplyr.not_contains('n', ref('data')) %}
select 
  {{ dbtplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}