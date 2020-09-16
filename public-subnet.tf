
resource "aws_subnet" "subnet_public_1" {
 count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id                  = "${aws_vpc.vpc_main.id}"
  cidr_block              = "${cidrsubnet("${var.vpc_cidr}" , 8 , count.index)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = true

tags = {
   Name = "Public-subnet-${count.index + 1}"
  }
}


resource "aws_route_table_association" "rt_assoc" {
    count = "${length(data.aws_availability_zones.available.names)}"
    subnet_id = "${aws_subnet.subnet_public_1.*.id[count.index]}"
    route_table_id = "${aws_route_table.route_table_main.id}"
}
