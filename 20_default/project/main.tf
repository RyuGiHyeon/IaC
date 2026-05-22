terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
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

  region      = local.main.region
  region_name = local.main.region_name
  cidr_block  = local.main.cidr_block

  count_of_public_subnets  = local.main.count_of_public_subnets
  count_of_private_subnets = local.main.count_of_private_subnets
  subnet_bit               = local.main.subnet_bit
  count_of_az              = local.main.count_of_az
  create_nat_gw            = local.main.create_nat_gw
}

module "sg" {
  source = "../modules/sg"

  vpc_id = module.vpc.vpc_id
  sg_map = local.main.sg_map
}

module "keypair" {
  source = "../modules/keypair"

  algorithm = local.main.algorithm
}

module "s3" {
  source = "../modules/s3"

  account_id    = local.main.account_id
  s3_subname    = local.main.s3_subname
  iam_role_name = local.main.iam_role_name
  file_map      = local.main.file_map
}

module "lt" {
  source = "../modules/lt"

  lt_web   = local.main.lt_web
  key_name = module.keypair.key.key_name
  file_map = local.main.file_map
}

module "ec2" {
  source = "../modules/ec2"

  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  lt_web_id          = module.lt.lt_web_id
  web                = local.main.web
  sg_map             = module.sg.sg_map
}

module "tg" {
  source = "../modules/tg"

  vpc_id       = module.vpc.vpc_id
  instance_ids = module.ec2.instance_ids
  tg_web       = local.main.tg_web
}

module "lb" {
  source = "../modules/lb"

  sg_map            = module.sg.sg_map
  public_subnet_ids = module.vpc.public_subnet_ids
  target_group_arn  = module.tg.target_group_arn
}

module "route53" {
  source = "../modules/route53"

  domainname   = local.main.domainname
  lb_dns_names = module.lb.lb_dns_names
}

module "rds" {
  source = "../modules/rds"

  run_db_init        = 0
  private_subnet_ids = module.vpc.private_subnet_ids
  public_subnet_ids  = module.vpc.public_subnet_ids
  sg_map             = module.sg.sg_map
  rds_mariadb        = local.main.rds_mariadb
}

module "files" {
  source = "../modules/files"

  account_id     = local.main.account_id
  s3_subname     = local.main.s3_subname
  rds_address    = module.rds.rds_address
  username       = local.main.rds_mariadb.username
  password       = local.main.rds_mariadb.password
  file_map       = local.main.file_map
  database       = local.main.database
  cache_endpoint = module.cache.cache_endpoint
}

output "value1" {
  value = module.cache.cache_endpoint
  
}

module "cache" {
  source = "../modules/cache"

  private_subnet_ids = module.vpc.private_subnet_ids
  sg_map = module.sg.sg_map
}

resource "local_file" "key" {
  content  = module.keypair.key.openssh
  filename = "${path.module}/id_${lower(module.keypair.key.algorithm)}"
}
