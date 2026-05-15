terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}

provider "aws" {
    region = local.main.region
}

locals {
  main = yamldecode(file("./variables.yaml"))
}

module "vpc" {
  source = "../modules/vpc"
  
  region = local.main.region
  region_name = local.main.region_name
  cidr_block = local.main.cidr_block
}