{% set cols_n = dbtplyr.not_contains( ref('data'), 'n') %}
select {{ dbtplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}