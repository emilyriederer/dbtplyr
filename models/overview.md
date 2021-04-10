{% docs __overview__ %}

## dbtplyr

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
{% raw %}
{% set cols = dbtplyr.get_column_names( ref('mydata') ) %}
{% set cols_n = dbtplyr.starts_with('N', cols) %}
{% set cols_ind = dbtplyr.starts_with('IND', cols) %}

select

  {{ dbtplyr.across(cols_n, "sum({{var}}) as {{var}}_tot") }},
  {{ dbtplyr.across(cols_ind, "mean({{var}}) as {{var}}_avg") }}

from {{ ref('mydata') }}
{% endraw %}
```

which `dbt` then compiles to standard SQL. 

Alternatively, to protect against cases where no column names matched the pattern provided 
(e.g. no variables start with `n` so `cols_n` is an empty list), one may instead internalize the final comma
so that it is only compiled to SQL when relevant by using the `final_comma` parameter of `across`.

```
{% raw %}
  {{ dbtplyr.across(cols_n, "sum({{var}}) as {{var}}_tot", final_comma = true) }}
{% endraw %}
```


Note that, slightly more `dplyr`-like, you may also write:

```
{% raw %}
select

  {{ dbtplyr.across(dbtplyr.starts_with('N', ref('mydata')), "sum({{var}}) as {{var}}_tot") }},
  {{ dbtplyr.across(dbtplyr.starts_with('IND', ref('mydata')), "mean({{var}}) as {{var}}_avg") }}

from {{ ref('mydata') }}
{% endraw %}
```

But, as each function call is a bit longer than the equivalent `dplyr` code, I personally find the first form more readable.

## Macros

The complete list of macros included are:

**Functions to apply operation across columns**

- `across(var_list, script_string, final_comma)`
- `c_across(var_list, script_string)`

**Functions to evaluation condition across columns**

- `if_any(var_list, script_string)`
- `if_all(var_list, script_string)`

**Functions to subset columns by naming conventions**

- `starts_with(string, relation or list)` 
- `ends_with(string, relation or list)`
- `contains(string, relation or list)`
- `not_contains(string, relation or list)`
- `one_of(string_list, relation or list)`
- `not_one_of(string_list, relation or list)`
- `matches(string, relation)`
- `everything(relation)`

Note that all of the select-helper functions that take a relation as an argument can optionally be passed a list of names instead.

You may access documentation for each individual macro using the navigation bar on the left-hand side of the screen.

{% enddocs %}