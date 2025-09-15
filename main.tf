provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source  = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}

module "network" {
  source  = "./modules/network"
  vpc_id  = module.vpc.vpc_id
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones = ["ap-south-1a", "ap-south-1b"]
}

module "ecr" {
  source = "./modules/ecr"
  repo_name = "my-ecr-repo"
}

module "iam" {
  source = "./modules/iam"
}

module "ecs" {
  source       = "./modules/ecs"
  vpc_id       = module.vpc.vpc_id
  subnets      = module.network.public_subnets
  security_group_id = module.network.sg_id
  execution_role_arn = module.iam.ecs_task_execution_role_arn
  repo_url     = module.ecr.repo_url
}
