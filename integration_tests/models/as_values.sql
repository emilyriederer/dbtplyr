select

  {{ "'" ~ dbt_dplyr.starts_with( ref('data'), 'n') | join(',') ~ "'"}} as starts_with_n,
  {{ "'" ~ dbt_dplyr.starts_with( ref('data'), 'ind') | join(',') ~ "'" }} as starts_with_ind,
  {{ "'" ~ dbt_dplyr.starts_with( ref('data'), 'cat') | join(',') ~ "'"}} as starts_with_cat,

  