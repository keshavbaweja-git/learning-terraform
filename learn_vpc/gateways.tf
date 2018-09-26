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
