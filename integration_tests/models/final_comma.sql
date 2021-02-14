select 

  {{ dbt_dplyr.across([], "{{var}}", final_comma = true) }} 
  {{ dbt_dplyr.across(['n_a'], "{{var}}", final_comma = true) }} 
  {{ dbt_dplyr.across(['ind_a','ind_b'], "{{var}}", final_comma = true) }} 
  1 as x 

from {{ ref('data') }}