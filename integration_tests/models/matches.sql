{% set cols_n = dbtplyr.matches( ref('data'), '.*_c') %}
select {{ dbtplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}