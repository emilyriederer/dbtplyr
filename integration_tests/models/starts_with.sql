{% set cols_n = dbtplyr.starts_with( ref('data'), 'amt') %}
select {{ dbtplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}