variable "ACCESS_KEY" {
  type    = string
  default = ""

}

variable "SECRET_KEY" {
  type    = string
  default = ""

}

variable "region" {
  type    = string
  default = "ap-northeast-2"
}

variable "region_name" {
  type = string
  default = "seoul"
}

variable "ami" {
  type = string
  validation {
    condition     = can(regex("^ami-[0-9a-f]{17}", var.ami))
    error_message = "아마존 ami 이미지로 유효하지 않습니다."
  }
  default = "ami-0b6cacee0430cdb2c"
}

variable "instance_type" {
  type = string
  validation {
    condition     = contains(data.aws_ec2_instance_types.main.instance_types, var.instance_type)
    error_message = "AWS EC2 인스턴스 타입으로 유효하지 않습니다."
  }
  default = "t3.micro"
}

variable "key_name" {
  type    = string
  default = "seoul-ed25519"

}

variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-0b68da00de1664304", "subnet-0d333e6b1b5a75585"]

}

variable "sg_map" {
  type = map(string)
  default = {
    default = "sg-08a435965709f3fb3"
    web     = "sg-0be7d891b1fb2a763"
  }
}

variable "password" {
  type = string
  default = "P@ssw0rd123"
  sensitive = true
}