variable "region" {
  description = "AWS 리전 코드"
  type        = string
}

variable "region_name" {
  description = "AWS 리전 이름"
  type        = string
}

variable "cidr_block" {
  description = "AWS VPC 전체 CIDR 네트워크 대역"
  type        = string
}
