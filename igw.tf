resource "aws_internet_gateway" "igw_main" {
    vpc_id = "${aws_vpc.vpc_main.id}"
    tags {
        Name = "${var.company_name}-igw"
    }
}



resource "aws_route_table" "route_table_main" {
vpc_id = "${aws_vpc.vpc_main.id}"

route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw_main.id}"
}

tags {
    Name = "${var.company_name}-rt-public"
}
}

resource "aws_eip" "nat_eip" {
vpc      = true
tags {
Name = "ngw-eip"
}
}


resource "aws_nat_gateway" "main-nat-gw" {
allocation_id = "${aws_eip.nat_eip.id}"
subnet_id = "${aws_subnet.subnet_public_1.*.id[0]}"
depends_on = ["aws_internet_gateway.igw_main"]

tags {
 Name = "${var.company_name}-ngw"
}
}
