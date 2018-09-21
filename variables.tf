variable "zones" {
  type = "map"

  default = {
    "learn_tf_subnet1_pub" = "ap-southeast-1a"
  }
}

variable "my_ip" {
  default = ""
}
