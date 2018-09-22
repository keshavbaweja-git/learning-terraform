variable "zones" {
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
