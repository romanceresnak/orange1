terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"
}

# # Security Groups Module
module "security_groups" {
  source  = "./modules/security_group"
  vpc_id  = module.vpc.vpc_id
  allowed_security_groups = []
}

# S3 Module
module "s3" {
  source      = "./modules/s3"
  bucket_name = "my-application-logs-bucket"
  environment = "production"
}

module "networking" {
  source            = "./modules/networking"
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_id
}

module "routing" {
  source             = "./modules/routing"
  vpc_id             = module.vpc.vpc_id
  internet_gateway_id = module.networking.internet_gateway_id
  public_subnet_id   = module.vpc.public_subnet_id
}

module "vpn" {
  source       = "./modules/vpn"
  vpc_id       = module.vpc.vpc_id
  customer_ip  = "203.0.113.1" # Replace with actual IP
}
