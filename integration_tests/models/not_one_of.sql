{% set cols_n = dbtplyr.not_one_of(['n_a', 'ind_a', 'ind_b'], ref('data')) %}
select {{ dbtplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}