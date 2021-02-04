### Note about the example

It is possible to add an extra disk or two to your vm. Below are the steps:

1. Create a VM without defining a disk as it is just a copy of your template which already has one.
2. Once `terraform apply` has completed run `terraform show` and take your exsisting disk config and put it in your `vm.tf` file. In the example (disk with slot 0)
3. Add the extra disk you wanted. In the example (disk with slot 1)
4. run `terraform apply` again
5. congrats you have a vm with an extra disk. 