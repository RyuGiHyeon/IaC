terraform {
   required_version ="~> 1.0"
   required_providers {
     aws = {
        version = "~> 6.0"
     }
   }

}

provider "aws" {
    region = var.region
    access_key = var.ACCESS_KEY
    secret_key = var.SECRET_KEY
  
}

resource "aws_vpc" "main" {
    cidr_block = var.cidr_block
    tags = {
      Name = "${var.region_name}-vpc-main"
    }
}

resource "aws_security_group" "fws" {
  count = 3
  name        = var.sg_list[count.index].name
  description = var.sg_list[count.index].desc
  vpc_id      = aws_vpc.main.id
  ingress {
      protocol  = var.sg_list[count.index].ingress.protocol
      from_port = var.sg_list[count.index].ingress.from_port
      to_port   = var.sg_list[count.index].ingress.to_port
      cidr_blocks = var.sg_list[count.index].ingress.cidr_blocks
    }
  
  egress {
      protocol  = var.sg_list[count.index].egress.protocol
      from_port = var.sg_list[count.index].egress.from_port
      to_port   = var.sg_list[count.index].egress.to_port
      cidr_blocks = var.sg_list[count.index].egress.cidr_blocks
    }
  
  tags = {
    Name = var.sg_list[count.index].name
  }
}