{% set cols_n = dbtplyr.not_one_of( ref('data'), ['n_a', 'ind_a', 'ind_b']) %}
select {{ dbtplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}