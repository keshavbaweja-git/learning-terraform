resource "aws_vpc" "learn_tf_vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
    Name = "learn_tf_vpc"
  }
}

resource "aws_subnet" "learn_tf_subnet_1_pub" {
  cidr_block        = "${cidrsubnet(aws_vpc.learn_tf_vpc.cidr_block, 4, 0)}"
  vpc_id            = "${aws_vpc.learn_tf_vpc.id}"
  availability_zone = "${lookup(var.zones, "learn_tf_subnet_1_pub")}"

  tags {
    Name = "learn_tf_subnet_1_pub"
  }
}

resource "aws_subnet" "learn_tf_subnet_2_pri" {
  cidr_block        = "${cidrsubnet(aws_vpc.learn_tf_vpc.cidr_block, 4, 1)}"
  vpc_id            = "${aws_vpc.learn_tf_vpc.id}"
  availability_zone = "${lookup(var.zones, "learn_tf_subnet_2_pri")}"


  tags {
    Name = "learn_tf_subnet_2_pri"
  }
}

resource "aws_security_group" "learn_tf_securitygroup" {
  vpc_id = "${aws_vpc.learn_tf_vpc.id}"

  tags {
    Name = "learn_tf_secgrp"
  }

  ingress {
    cidr_blocks = [
      "${var.my_ip}",
    ]

    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
}

resource "aws_default_route_table" "rtb" {
  default_route_table_id = "${aws_vpc.learn_tf_vpc.default_route_table_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.learn_tf_igw.id}"
  }

  tags {
    Name = "learn_tf_default_rtb"
  }
}

resource "aws_route_table" "learn_tf_rtb_pri" {
  vpc_id = "${aws_vpc.learn_tf_vpc.id}"
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.learn_tf_natgw.id}"
  }

  tags {
    Name = "learn_tf_rtb_pri"
  }
}

resource "aws_route_table_association" "Learn_tf_rtb_assoc" {
  subnet_id      = "${aws_subnet.learn_tf_subnet_2_pri.id}"
  route_table_id = "${aws_route_table.learn_tf_rtb_pri.id}"
}

resource "aws_internet_gateway" "learn_tf_igw" {
  vpc_id = "${aws_vpc.learn_tf_vpc.id}"

  tags {
    Name = "learn_tf_igw"
  }
}

resource "aws_eip" "learn_tf_eip" {
  vpc        = true
  depends_on = ["aws_internet_gateway.learn_tf_igw"]

  tags {
    Name = "learn_tf_eip"
  }
}

resource "aws_nat_gateway" "learn_tf_natgw" {
  allocation_id = "${aws_eip.learn_tf_eip.id}"
  subnet_id     = "${aws_subnet.learn_tf_subnet_1_pub.id}"

  tags {
    Name = "learn_tf_natgw"
  }
}
