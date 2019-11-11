provider "aws" {
access_key = ""
secret_key = ""
region = ""
}
variable "public_subnet_cidr_A" {
description = "CIDR for public subnet"
default     = "10.146.55.64/27"
}
variable "public_subnet_cidr_B" {
description = "CIDR for public subnet"
default     = "10.146.55.96/27"
}
variable "private_subnet_cidr_A" {
description = "CIDR for private subnet"
default     = "10.146.55.0/27"
}
variable "private_subnet_cidr_B" {
description = "CIDR for private subnet"
default     = "10.146.55.32/27"
}
variable "key_name" {
description = "Key name for SSHing into EC2"
default = "terrafgit"
}
