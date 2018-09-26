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
