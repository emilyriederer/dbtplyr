{% set cols_n = dbtplyr.everything( ref('data')) %}
select 
  {{ dbtplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}