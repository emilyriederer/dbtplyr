{% set cols_n = dbtplyr.one_of(['amt_c'], ref('data')) %}
select 
  {{ dbtplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}