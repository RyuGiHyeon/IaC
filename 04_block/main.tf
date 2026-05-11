terraform {
  required_version = "~> 1.0" # 1.0 < 버전 < 2.0, 사용가능
  required_providers {
    local = {
      version = "~> 2.5.0"
    }
    aws = {
      version = "~> 5.0"
    }
  }
}

# version 은 deprecated 되고, region 정의하는 칸으로만 이용함.
# 기존 버전 관리는 terraform 블록 내에서 진행!
provider "aws" {
  region     = "ap-northeast-2"
  access_key = "ACCESS"
  secret_key = "SECRET"

}

resource "aws_vpc" "main" {
  cidr_block = "10.11.0.0/16"
  tags = {
    Name = "seoul-vpc-xxx"
  }
}

resource "aws_subnet" "publics" {
  count = 4
  vpc_id = aws_vpc.main.id
  cidr_block = "10.11.${count.index}.0/24"
  tags = {
    Name = "seoul-subnet-public-${count.index + 1}"
  }
}
