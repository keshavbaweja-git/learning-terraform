variable "zones" {
  type = "map"

  default = {
    "learning-tf-subnet1" = "ap-southeast-1a"
  }
}

variable "my_ip" {
  default = ""
}
