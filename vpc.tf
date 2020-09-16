
resource "aws_vpc" "vpc_main" {
  cidr_block       = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support=true
  tags = {
    Name = "${var.company_name}_vpc"
  }
}

data "aws_availability_zones" "available" {
state ="available"
}
