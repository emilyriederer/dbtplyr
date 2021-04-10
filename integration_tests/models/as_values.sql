{% set cols = get_columns_names( ref('data') ) %}
{% set cast_to %}
  {% if target.type == 'postgres' %}
    text
  {% else %}
    string
  {% endif %}
{% endset %}

select

  -- starts_with
  cast({{ "'" ~ dbt_dplyr.starts_with(cols, 'n') | join(',') ~ "'"}} as {{cast_to}})    as starts_with_n, -- single item
  cast({{ "'" ~ dbt_dplyr.starts_with(cols, 'ind') | join(',') ~ "'" }} as {{cast_to}}) as starts_with_ind, -- multiple items
  cast({{ "'" ~ dbt_dplyr.starts_with(cols, 'cat') | join(',') ~ "'"}} as {{cast_to}})  as starts_with_cat, -- no items
  
  -- ends_with (TODO)
  cast({{ "'" ~ dbt_dplyr.ends_with(cols, 'b') | join(',') ~ "'"}} as {{cast_to}})  as ends_with_b, -- single item
  cast({{ "'" ~ dbt_dplyr.ends_with(cols, 'a') | join(',') ~ "'" }} as {{cast_to}}) as ends_with_a, -- multiple items
  cast({{ "'" ~ dbt_dplyr.ends_with(cols, 'z') | join(',') ~ "'"}} as {{cast_to}})  as ends_with_z, -- no items
  
  -- matches (TODO)
    
  -- contains (TODO)
  
  -- not_contains (TODO)
  
  -- one_of (TODO)
  
  -- not_one_of (TODO)
  
  -- everything
  cast({{ "'" ~ dbt_dplyr.everything(cols) | join(',') ~ "'"}} as {{cast_to}}) as everything, -- no items
  
  1 as x -- dummy to allow trailing commas

  