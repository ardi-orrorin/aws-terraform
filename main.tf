provider "aws" {
    region     = var.region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

module "key_pair" {
    source       = "./module/key_pair"
    key_name     = var.aws_ec2_key_pair_key_name
    project_name = var.project_name
    public_key   = var.public_key
}

module "security_group" {
  source       = "./module/security_group"
  project_name = var.project_name
  allow_ssh_ip = var.allow_ssh_ip
}

# # ec2 인스턴스 생성 시 사용할 목적
# module "ebs" {
#   source            = "./module/ebs"
#   project_name      = var.project_name
#   availability_zone = var.availability_zone
#   region            = var.region
# }

module "ec2" {
  depends_on         = [ module.security_group ]
  source             = "./module/ec2"
  security_group_ids = [module.security_group.id]
  key_pair_name      = module.key_pair.key_pair_name
  instance_type      = var.ec2_instance_type
  project_name       = var.project_name
  region             = var.region
  availability_zone  = var.availability_zone
  private_key        = var.private_key
}

module "eip" {
  depends_on   = [ module.ec2 ]
  source       = "./module/eip"
  project_name = var.project_name
  ec2_instance_id = module.ec2.ec2_id
}

module "rds" {
  depends_on        = [ module.ec2 ]
  source            = "./module/rds"
  project_name      = var.project_name
  master_username   = var.rds_master_username
  master_password   = var.rds_master_password
  db_engine         = var.rds_db_engine
  engine_version    = var.rds_engine_version
  instance_class    = var.rds_instance_class
  region            = var.region
  security_group_id = module.security_group.id
  availability_zone = var.availability_zone
}

module "s3" {
  depends_on        = [ module.security_group ]
  source            = "./module/s3"
  project_name      = var.project_name
  availability_zone = var.availability_zone
}

module "elastic_cache" {
  depends_on        = [ module.security_group ]
  source            = "./module/elastic_cache"
  project_name      = var.project_name
  region            = var.region
  security_group_id = module.security_group.id
  node_type         = var.elastic_cache_node_type
  engine            = var.elastic_cache_engine
  availability_zone = var.availability_zone
}

module "acm" {
  source     = "./module/acm"
  domain_name = var.public_domain_name
}

# module "cloudfront" {
#   depends_on         = [ module.s3 ]
#   source             = "./module/cloudfront"
#   project_name       = var.project_name
#   bucket_domain_name = module.s3.bucket_domain_name
#   bucket_id          = module.s3.id
#   availability_zone  = var.availability_zone
# }