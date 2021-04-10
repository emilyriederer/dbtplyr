{% set cols_n = dbtplyr.one_of( ref('data'), ['amt_c']) %}
select {{ dbtplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}