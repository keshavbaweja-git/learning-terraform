resource "aws_vpc" "learning-tf-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
    Name = "learning-tf-vpc"
  }
}

resource "aws_subnet" "learning-tf-subnet1" {
  cidr_block        = "${cidrsubnet(aws_vpc.learning-tf-vpc.cidr_block, 3, 1)}"
  vpc_id            = "${aws_vpc.learning-tf-vpc.id}"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "learning-tf-subnet1"
  }
}

resource "aws_security_group" "learning-tf-securitygroup" {
  vpc_id = "${aws_vpc.learning-tf-vpc.id}"

  tags {
    Name = "learning-tf-secgrp"
  }

  ingress {
    cidr_blocks = [
      "${aws_vpc.learning-tf-vpc.cidr_block}",
    ]

    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }

  ingress {
    cidr_blocks = [
      "42.60.110.35/32",
    ]

    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }

}


resource "aws_default_route_table" "r" {
  default_route_table_id = "${aws_vpc.learning-tf-vpc.default_route_table_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.learning_tf_igw.id}"
  }

  tags {
    Name = "default table"
  }
}


resource "aws_internet_gateway" "learning_tf_igw" {
  vpc_id = "${aws_vpc.learning-tf-vpc.id}"
}