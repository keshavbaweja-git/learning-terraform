resource "aws_instance" "learning-tf-master" {
  ami                         = "ami-08569b978cc4dfa10"
  instance_type               = "t2.micro"
  key_name                    = "kp_1"
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.learn_tf_subnet1_pub.id}"
  security_groups             = ["${aws_security_group.learn_tf_securitygroup.id}", "${aws_vpc.learn_tf_vpc.default_security_group_id}"]

  tags {
    Name = "learning-tf-master"
  }
}
