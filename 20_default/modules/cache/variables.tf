variable "private_subnet_ids" {
  description = "AWS VPC 사설 서브넷 IDs"
  type = list(string)
}

variable "sg_map" {
  description = "보안 그룹 맵"
  type = map(string)
}
