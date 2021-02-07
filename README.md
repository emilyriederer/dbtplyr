## dbt-dplyr

**This project is a WIP and experimental. It is not well tested or ready for production**

This add-on package enhances `dbt` by providing macros which programmatically select columns
based on their column names. It is inspired by the [`across()` function](https://www.tidyverse.org/blog/2020/04/dplyr-1-0-0-colwise/) 
and the [`select helpers`](https://tidyselect.r-lib.org/reference/select_helpers.html) in the R package `dplyr`.

`dplyr` (>= 1.0.0) has helpful semantics for selecting and applying transformations to variables based on their names.
For example, if one wishes to take the *sum* of all variables with name prefixes of `N` and the mean of all variables with
name prefixes of `IND` in the dataset `mydata`, they may write:

```
summarize(
  mydata, 
  across( starts_with('N'), sum),
  across( starts_with('IND', mean)
)
```

This package enables us to similarly write `dbt` data models with commands like:

```
{% cols_n = starts_with( ref('mydata'), 'N') %}
{% cols_ind = starts_with( ref('mydata'), 'IND') %}

select

  {{ across(cols_n, "sum({{var}}) as {{var}}_tot") }},
  {{ across(cols_ind, "mean({{var}}) as {{var}}_avg") }}

from {{ ref('mydata') }}
```

which `dbt` then compiles to standard SQL. 

## Macros

The complete list of macros included are:

- `across(var_list, script_string)`
- `starts_with(relation, string)`
- `ends_with(relation, string)`
- `contains(relation, string)`
- `not_contains(relation, string)`
- `one_of(relation, string_list)`
- `not_one_of(relation, string_list)`
- `matches(relation, string)`
- `everything(relation)`
