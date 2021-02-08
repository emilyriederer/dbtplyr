{% set cols_n = dbt_dplyr.not_one_of( ref('data'), ['n_a', 'ind_a', 'ind_b']) %}
select {{ dbt_dplyr.across(cols_n, "{{var}}") }}
from {{ ref('data') }}