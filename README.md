# tf12_can_func
TF 12 new syntax function - can

New type conversion function emerged in TF v 0.12 - `can`

`can` evaluates the given expression and returns a boolean value indicating whether the expression produced a result without any errors.

This is a special function that is able to catch errors produced when evaluating its argument. For most situations where you could use **can** it's better to use instead another function - [try](https://www.terraform.io/docs/configuration/functions/try.html) , because it allows for more concise definition of fallback values for failing expressions.

The primary purpose of can is to turn an error condition into a boolean validation result when writing custom variable validation rules.

>Warning: The can function is intended only for **simple tests in variable validation rules**. Although it can technically accept any sort of expression and be used elsewhere in the configuration, we recommend against using it in other contexts. For error handling elsewhere in the configuration, prefer to use try.

# Examples and tests

Let's define a simple example in (main.tf([main.tf])) : 

```terraform
# define map var
#
variable "animal" {
  default = {
    rabbit = "white"
  }
}

output "animal-banner" {
  value = can(var.animal.piggy)
}
```
Here we using `can` function , and if we run `terraform apply` results going to be : 

```bash

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

animal-banner = false
```
E.g. our `animal-banner` equals to **false** boolean value, e.g. we have `piggy`. 

But if we check for `rabbit` , e.g. let's modify line 10 as follows : 

```terraform
  value = can(var.animal.rabbit)
```

And execute `terrafrom apply`  :

```bash
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

animal-banner = true
```

> Note - function will not catch errors relating to constructs that are provably invalid even before dynamic expression evaluation, such as a malformed reference or a reference to a top-level object that has not been declared:

For example following , modified example going to fail **BEFORE** calling `can` function : 

```terraform
variable "animal" {
  default = {
    rabbit = "white"
  }
}

output "animal-banner" {
  value = can(var.plant.maple)
}
```

Let's check this by executing `terraform apply` : 

```bash
Error: Reference to undeclared input variable

  on main.tf line 10, in output "animal-banner":
  10: 	value = can(var.plant.maple)

An input variable with the name "plant" has not been declared. This variable
can be declared with a variable "plant" {} block.
```


# TODO

- [X] definition
- [x] examples and tests

