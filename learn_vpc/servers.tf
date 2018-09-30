resource "aws_instance" "learn_tf_server_1_pub" {
  ami                         = "${var.instance_attributes.ami}"
  instance_type               = "${var.instance_attributes.type}"
  key_name                    = "${var.instance_attributes.key_pair}"
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.learn_tf_subnet_1_pub.id}"
  security_groups             = ["${aws_security_group.learn_tf_securitygroup.id}", "${aws_vpc.learn_tf_vpc.default_security_group_id}"]

  tags {
    Name = "learn_tf_server_pub_1"
  }
}

resource "aws_instance" "learn_tf_server_1_pri" {
  ami                         = "${var.instance_attributes.ami}"
  instance_type               = "${var.instance_attributes.type}"
  key_name                    = "${var.instance_attributes.key_pair}"
  subnet_id                   = "${aws_subnet.learn_tf_subnet_2_pri.id}"
  security_groups             = ["${aws_vpc.learn_tf_vpc.default_security_group_id}"]

  tags {
    Name = "learn_tf_server_pri_1"
  }
}
