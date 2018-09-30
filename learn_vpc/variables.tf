variable "subnet_zones" {
  type = "map"

  default = {
    "learn_tf_subnet_1_pub" = "ap-southeast-1a"
    "learn_tf_subnet_2_pri" = "ap-southeast-1b"
  }
}

variable "my_ip" {
  default = ""
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "instance_attributes" {
  type = "map"

  default = {
    type = "t2.micro"
    ami = "ami-08569b978cc4dfa10"
    key_pair = "kp_1"
  }

}