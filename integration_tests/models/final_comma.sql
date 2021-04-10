select 

  {{ dbtplyr.across([], "{{var}}", final_comma = true) }} 
  {{ dbtplyr.across(['n_a'], "{{var}}", final_comma = true) }} 
  {{ dbtplyr.across(['ind_a','ind_b'], "{{var}}", final_comma = true) }} 
  1 as x 

from {{ ref('data') }}