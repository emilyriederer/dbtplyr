{% set cols_n = dbtplyr.ends_with( ref('data'), 'c') %}
select {{ dbtplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}