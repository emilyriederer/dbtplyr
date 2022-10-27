{%- set cols = dbtplyr.get_column_names( ref('data') ) %}
{%- set cast_to %}
  {%- if target.type == 'postgres' -%}
    text
  {%- else -%}
    string
  {%- endif -%}
{% endset %}

select

  -- starts_with
  cast({{ "'" ~ dbtplyr.starts_with('n',   cols) | join(',') ~ "'"}} as {{cast_to}}) as starts_with_n, -- single item
  cast({{ "'" ~ dbtplyr.starts_with('ind', cols) | join(',') ~ "'"}} as {{cast_to}}) as starts_with_ind, -- multiple items
  cast({{ "'" ~ dbtplyr.starts_with('cat', cols) | join(',') ~ "'"}} as {{cast_to}}) as starts_with_cat, -- no items
  
  -- ends_with (TODO)
  cast({{ "'" ~ dbtplyr.ends_with('b', cols) | join(',') ~ "'"}} as {{cast_to}}) as ends_with_b, -- single item
  cast({{ "'" ~ dbtplyr.ends_with('a', cols) | join(',') ~ "'"}} as {{cast_to}}) as ends_with_a, -- multiple items
  cast({{ "'" ~ dbtplyr.ends_with('z', cols) | join(',') ~ "'"}} as {{cast_to}}) as ends_with_z, -- no items
  
  -- matches (TODO)
    
  -- contains (TODO)
  
  -- not_contains (TODO)
  
  -- one_of (TODO)
  
  -- not_one_of (TODO)
  
  -- everything
  cast({{ "'" ~ dbtplyr.everything(cols) | join(',') ~ "'"}} as {{cast_to}}) as everything, -- no items
  
  -- where
  cast({{ "'" ~ dbtplyr.where("is_number", ref('data_types')) | join(',') ~ "'"}} as {{cast_to}}) as where_number,
  
  1 as x -- dummy to allow trailing commas

  