# Binaris quine collection
#### **This is a simple collection of quines accompanying a lecture given at [Serverlessconf Austin 2017](https://austin.serverlessconf.io/)**

A [quine](https://en.wikipedia.org/wiki/Quine_(computing)) is a non-empty computer program which takes no input and produces a copy of its own source code as its only output

Requirements
* AWS account
* terrafrom cli
* aws cli

`make` will generate the necessary lambda zip files

`make plan` will print the accompanying Terraform plan

`make apply` will apply the Terraform plan to your AWS account (you will need to specify an AWS region and an account id in tf/terraform.tfvars)

`make test` will exercise the functions and check their correctness

`make destroy` will destroy all resources generated by the Terraform plan

**If you choose to apply the Terraform plan the following will be added to your AWS account**
* IAM role and policy
* Lambda functions
* API gateway resources

Any questions or comments can be directed at michael@binaris.com
