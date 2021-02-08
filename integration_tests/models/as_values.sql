select

  -- starts_with
  {{ "'" ~ dbt_dplyr.starts_with( ref('data'), 'n') | join(',') ~ "'"}} as starts_with_n, -- single item
  {{ "'" ~ dbt_dplyr.starts_with( ref('data'), 'ind') | join(',') ~ "'" }} as starts_with_ind, -- multiple items
  {{ "'" ~ dbt_dplyr.starts_with( ref('data'), 'cat') | join(',') ~ "'"}} as starts_with_cat, -- no items
  
  -- ends_with (TODO)
  
  -- matches (TODO)
    
  -- contains (TODO)
  
  -- not_contains (TODO)
  
  -- one_of (TODO)
  
  -- not_one_of (TODO)
  
  -- everything
  {{ "'" ~ dbt_dplyr.everything( ref('data')) | join(',') ~ "'"}} as everything, -- no items
  
  1 as x -- dummy to allow trailing commas

  