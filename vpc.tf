resource "aws_vpc" "main" {
  cidr_block       = "10.146.55.0/24"
  enable_dns_hostnames = "true"
  tags = {
    Name = "DR-VPC"
  }
}
resource "aws_eip" "byoip-ip" {
  vpc              = true
}
resource "aws_nat_gateway" "gw-private" {
  allocation_id = "${aws_eip.byoip-ip.id}"
  subnet_id     = "${aws_subnet.private-subnet-A.id}"
}
resource "aws_internet_gateway" "default" {
vpc_id = "${aws_vpc.main.id}"                                                                               
tags {
    Name = "linoxide gw"
  }
}
resource "aws_subnet" "public-subnet-A" {
vpc_id = "${aws_vpc.main.id}"
cidr_block = "${var.public_subnet_cidr_A}"
availability_zone = "us-east-2a"

tags {
Name = "Linoxide Public Subnet-A"
}
}
resource "aws_subnet" "public-subnet-B" {
vpc_id = "${aws_vpc.main.id}"
cidr_block = "${var.public_subnet_cidr_B}"
availability_zone = "us-east-2c"

tags {
Name = "Linoxide Public Subnet-B"
}
}
resource "aws_subnet" "private-subnet-A" {
vpc_id = "${aws_vpc.main.id}"
cidr_block = "${var.private_subnet_cidr_A}"
availability_zone = "us-east-2a"

tags {
Name = "Linoxide Private Subnet-A"
}
}
resource "aws_subnet" "private-subnet-B" {
vpc_id = "${aws_vpc.main.id}"
cidr_block = "${var.private_subnet_cidr_B}"
availability_zone = "us-east-2c"

tags {
Name = "Linoxide Private Subnet-B"
}
}
resource "aws_route_table" "public-subnet-A" {
vpc_id = "${aws_vpc.main.id}"

route {
cidr_block = "0.0.0.0/0"
gateway_id = "${aws_internet_gateway.default.id}"
}

tags {
Name = "Linoxide Public Subnet-A"
}
}
resource "aws_route_table" "public-subnet-B" {
vpc_id = "${aws_vpc.main.id}"

route {
cidr_block = "0.0.0.0/0"
nat_gateway_id = "${aws_nat_gateway.gw-private.id}"
}

tags {
Name = "Linoxide Private routetable Subnet-A"
}
}
resource "aws_ec2_transit_gateway" "example" {
  description = "example"
}
resource "aws_ec2_transit_gateway_vpc_attachment" "my-transit" {
  subnet_ids         = ["${aws_subnet.private-subnet-A.id}","${aws_subnet.private-subnet-B.id}"]
  transit_gateway_id = "${aws_ec2_transit_gateway.example.id}"
  vpc_id             = "${aws_vpc.main.id}"
}
