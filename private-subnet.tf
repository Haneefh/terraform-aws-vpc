resource "aws_subnet" "subnet_private_1" {
 count = "${length(slice(data.aws_availability_zones.available.names, 0, 2))}"
  vpc_id                  = "${aws_vpc.vpc_main.id}"
  cidr_block              = "${cidrsubnet("${var.vpc_cidr}" , 8 , count.index + length(data.aws_availability_zones.available.names))}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

tags = {
   Name = "Private-subnet-${count.index + 1}"
  }
}

resource "aws_route_table" "rt-private" {
    vpc_id = "${aws_vpc.vpc_main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.main-nat-gw.id}"
    }

    tags {
        Name = "${var.company_name}-rt-private"
    }
}


resource "aws_route_table_association" "priv_assoc" {
   count = "${length(slice(data.aws_availability_zones.available.names, 0, 2))}"
    subnet_id = "${aws_subnet.subnet_private_1.*.id[count.index]}"
    route_table_id = "${aws_route_table.rt-private.id}"
}
