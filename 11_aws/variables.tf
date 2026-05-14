variable "ACCESS_KEY" {
  type    = string
  default = "기본값"

}

variable "SECRET_KEY" {
  type    = string
  default = "비밀키"

}

variable "region" {
  type = string
}

variable "region_name" {
  type = string
}

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"

}

variable "count_of_az" {
  type = number
}

variable "subnet_bit" {
  type = number
}

variable "count_of_public_subnets" {
  type = number
}

variable "count_of_private_subnets" {
  type = number
}

variable "fw-rules" {
  type = list(object(
    {
      key         = string
      name        = string
      description = string
      in = object(
        {
          protocol    = string
          from_port   = number
          to_port     = number
          cidr_blocks = list(string)
      })
      out = object(
        {
          protocol    = string
          from_port   = number
          to_port     = number
          cidr_blocks = list(string)
      })
    }
  ))
}
