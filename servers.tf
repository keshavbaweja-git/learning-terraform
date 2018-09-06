resource "aws_instance" "learning-tf-master" {
  ami           = "ami-08569b978cc4dfa10"
  instance_type = "t2.micro"

  tags {
    Name = "learning-tf-master"
  }

  subnet_id = "${aws_subnet.learning-tf-subnet1.id}"
}
