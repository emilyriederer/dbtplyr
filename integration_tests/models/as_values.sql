{% set cols = dbt_dplyr.get_column_names( ref('data')) %}

select

  -- starts_with
  {{ "'" ~ dbt_dplyr.starts_with(cols, 'n') | join(',') ~ "'"}}    as starts_with_n, -- single item
  {{ "'" ~ dbt_dplyr.starts_with(cols, 'ind') | join(',') ~ "'" }} as starts_with_ind, -- multiple items
  {{ "'" ~ dbt_dplyr.starts_with(cols, 'cat') | join(',') ~ "'"}}  as starts_with_cat, -- no items
  
  -- ends_with (TODO)
  {{ "'" ~ dbt_dplyr.ends_with(cols, 'b') | join(',') ~ "'"}}  as ends_with_b, -- single item
  {{ "'" ~ dbt_dplyr.ends_with(cols, 'a') | join(',') ~ "'" }} as ends_with_a, -- multiple items
  {{ "'" ~ dbt_dplyr.ends_with(cols, 'z') | join(',') ~ "'"}}  as ends_with_z, -- no items
  
  -- matches (TODO)
    
  -- contains (TODO)
  
  -- not_contains (TODO)
  
  -- one_of (TODO)
  
  -- not_one_of (TODO)
  
  -- everything
  {{ "'" ~ dbt_dplyr.everything(cols) | join(',') ~ "'"}} as everything, -- no items
  
  1 as x -- dummy to allow trailing commas

  