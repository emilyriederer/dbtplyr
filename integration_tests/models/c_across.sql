select

  c_across(['ind_a', 'ind_b'], '+') as plus_operator,
  c_across(['ind_a', 'ind_b'], 'least({{var}}') as least_function
  
from {{ ref('data') }}