{% docs __overview__ %}

## Introducing dbtplyr

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

This package enables us to similarly write `dbt` data models. The complete list of macros included are:

- `across(var_list, script_string, final_comma)`
- `c_across(var_list, script_string)`
- `if_any(var_list, script_string)`
- `if_all(var_list, script_string)`
- `starts_with(relation or list, string)` 
- `ends_with(relation or list, string)`
- `contains(relation or list, string)`
- `not_contains(relation or list, string)`
- `one_of(relation or list, string_list)`
- `not_one_of(relation or list, string_list)`
- `matches(relation or list, string)`
- `everything(relation or list)`

Note that all of the select-helper functions that take a relation as an argument can optionally be passed a list of names instead.

{% enddocs %}