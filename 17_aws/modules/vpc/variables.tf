variable "region" {
  description = "AWS Region"
  type = string
}

variable "region_name" {
  description = "AWS Resion Name"
  type = string
}

variable "cidr_block" {
  description = "cidr_block"
  type = string
}


variable "count_of_public_subnets" {
  description = "count_of_public_subnets"
  type = number
}

variable "count_of_private_subnets" {
  description = "count_of_private_subnets"
  type = number
}

variable "subnet_bit" {
  description = "subnet_bit"
  type = number
}

variable "count_of_az" {
  description = "count_of_az"
  type = number
}

variable "create_nat_gw" {
  description = "create_nat_gw"
  type = bool
}
