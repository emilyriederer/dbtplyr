{% set cols_n = dbtplyr.ends_with( 'c', ref('data') ) %}
select 
  {{ dbtplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}