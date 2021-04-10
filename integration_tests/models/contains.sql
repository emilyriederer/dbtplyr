{% set cols_n = dbtplyr.contains( ref('data'), 'c') %}
select {{ dbtplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}