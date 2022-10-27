{% set cols_n = dbtplyr.contains( 'c', ref('data') ) %}
select 
  {{ dbtplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}