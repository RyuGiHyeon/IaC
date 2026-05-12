terraform {
  required_version = "~> 1.0"
  required_providers {
    local = {
      version = "~> 2.5"
    }
    aws = {
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region     = "ap-northeast-2"
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_KEY


}

resource "aws_vpc" "main" {
  cidr_block = "10.2.0.0/16"
  tags = {
    Name = "seoul-vpc-main"
  }
}

resource "aws_subnet" "public1" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.2.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "seoul-subnet-public-1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.2.1.0/24"
  availability_zone = aws_subnet.public1.availability_zone
  tags = {
    Name = "seoul-subnet-public-2"
  }
}

resource "aws_instance" "name" {
    ami = "ami-0b6cacee0430cdb2c"
    instance_type = "t3.micro"
    key_name = "seoul-ed25519"
    subnet_id = aws_subnet.public1.id
    user_data = <<-EOF
      #!/bin/bash

      dnf install httpd -y
      systemctl restart httpd.service
      EOF

    lifecycle {
      create_before_destroy = false
    }
    tags = {
      Name = "ec2-web"
    }
  
}