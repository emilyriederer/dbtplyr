{% set cols_n = dbtplyr.starts_with('amt', ref('data')) %}
select 
  {{ dbtplyr.across(cols_n) }}
from {{ ref('data') }}