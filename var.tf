variable "aws_region" {
  description = "Region for the VPC"
  default = "us-east-1"
}

variable "access_key" {}
variable "secret_key" {}

variable "vpc_cidr" {
default = "10.0.0.0/16"
}

variable "company_name" {}
