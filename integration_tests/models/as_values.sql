{% set cols = dbt_dplyr.get_column_names( ref('data')) %}

select

  -- starts_with
  cast({{ "'" ~ dbt_dplyr.starts_with(cols, 'n') | join(',') ~ "'"}} as text)    as starts_with_n, -- single item
  cast({{ "'" ~ dbt_dplyr.starts_with(cols, 'ind') | join(',') ~ "'" }} as text) as starts_with_ind, -- multiple items
  cast({{ "'" ~ dbt_dplyr.starts_with(cols, 'cat') | join(',') ~ "'"}} as text)  as starts_with_cat, -- no items
  
  -- ends_with (TODO)
  cast({{ "'" ~ dbt_dplyr.ends_with(cols, 'b') | join(',') ~ "'"}} as text)  as ends_with_b, -- single item
  cast({{ "'" ~ dbt_dplyr.ends_with(cols, 'a') | join(',') ~ "'" }} as text) as ends_with_a, -- multiple items
  cast({{ "'" ~ dbt_dplyr.ends_with(cols, 'z') | join(',') ~ "'"}} as text)  as ends_with_z, -- no items
  
  -- matches (TODO)
    
  -- contains (TODO)
  
  -- not_contains (TODO)
  
  -- one_of (TODO)
  
  -- not_one_of (TODO)
  
  -- everything
  cast({{ "'" ~ dbt_dplyr.everything(cols) | join(',') ~ "'"}} as text) as everything, -- no items
  
  1 as x -- dummy to allow trailing commas

  