# tf12_can_func
TF 12 new syntax function - can

New type conversion function emerged in TF v 0.12 - `can`

`can` evaluates the given expression and returns a boolean value indicating whether the expression produced a result without any errors.

This is a special function that is able to catch errors produced when evaluating its argument. For most situations where you could use **can** it's better to use instead another function - [try](https://www.terraform.io/docs/configuration/functions/try.html) , because it allows for more concise definition of fallback values for failing expressions.

The primary purpose of can is to turn an error condition into a boolean validation result when writing custom variable validation rules.

>Warning: The can function is intended only for **simple tests in variable validation rules**. Although it can technically accept any sort of expression and be used elsewhere in the configuration, we recommend against using it in other contexts. For error handling elsewhere in the configuration, prefer to use try.

# Examples and tests


# TODO

[ ] definition
[ ] examples and tests

