Terraform Script to setup AWS VPC

Introduction
This is Terraform script sets up a new VPC with an internet gateway , nat gateway and public and private subnets.

Prerequisites
Terraform 0.11.x

Instructions:
The below parameters are defined as variables , they can be defined in terraform.tvars or provided at the run time.

"aws_region" ----> "Region for the VPC"
"access_key"  ----- >   AWS Access Key
"secret_key"  ------ >  AWS Secret key
"vpc_cidr"    ------- > VPC cidr network required
"company_name"  ------- >  Name of the vpc (tag)

An example of terraform.tfvars is uploaded in the code , change the values in them as per the environment. As a good practice provide the aws credentials ( Access and Secret keys) at the runtime.

Commands:
 terraform plan --var-file="terraform.tfvars"

 After verifying the plan run the below command to apply it

 terraform apply --var-file="terrafrom.tfvars"


