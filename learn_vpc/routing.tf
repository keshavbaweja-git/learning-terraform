resource "aws_default_route_table" "rtb" {
  default_route_table_id = "${aws_vpc.learn_tf_vpc.default_route_table_id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.learn_tf_natgw.id}"
  }

  tags {
    Name = "learn_tf_default_rtb"
  }
}

resource "aws_route_table" "learn_tf_rtb_pub" {
  vpc_id = "${aws_vpc.learn_tf_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.learn_tf_igw.id}"
  }

  tags {
    Name = "learn_tf_rtb_pub"
  }
}

resource "aws_route_table_association" "learn_tf_rtb_assoc" {
  subnet_id      = "${aws_subnet.learn_tf_subnet_1_pub.id}"
  route_table_id = "${aws_route_table.learn_tf_rtb_pub.id}"
}
