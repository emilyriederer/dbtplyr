## dbt-dplyr

**This project is a WIP and experimental. It is not well tested or ready for production**

This add-on package enhances `dbt` by providing macros which programmatically select columns
based on their column names. It is inspired by the 
[`select helpers`](https://tidyselect.r-lib.org/reference/select_helpers.html) in the R package `dplyr`.

`dplyr` has helpful semantics for selecting and applying transformations to variables based on their names.
For example, to sum all columns in the `mydata` dataset that begin with `N`, we may write:

```
summarize(mydata, vars(starts_with('N')), sum)
```

This package enables us to similarly write `dbt` data models with commands like:

```
select

  {% for c in starts_with( ref('mydata'), 'N') %}
    sum({{c}}) as {{c}}
  {% if not loop.last %},{% endif %} 
  {% endfor %}

from {{ ref('mydata') }}
```

## Macros

The complete list of macros included are:

- `starts_with(relation, string)`
- `ends_with(relation, string)`
- `contains(relation, string)`
- `not_contains(relation, string)`
- `one_of(relation, string_list)`
- `not_one_of(relation, string_list)`
- `matches(relation, string)`
- `everything(relation)`
