resource "aws_instance" "learning-tf-master" {
  ami                         = "ami-08569b978cc4dfa10"
  instance_type               = "t2.micro"
  key_name                    = "kp_1"
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.learning-tf-subnet1.id}"
  security_groups             = ["${aws_security_group.learning-tf-securitygroup.id}", "${aws_vpc.learning-tf-vpc.default_security_group_id}"]

  tags {
    Name = "learning-tf-master"
  }
}
