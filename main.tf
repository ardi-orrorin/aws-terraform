provider "aws" {
    region     = var.region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

module "key_pair" {
    source = "./module/key_pair"
    public_key = var.public_key
    aws_ec2_key_pair_key_name = var.aws_ec2_key_pair_key_name
    project_name = var.project_name
}

module "security_group" {
  source = "./module/security_group"
  project_name = var.project_name
  myself_ip = var.myself_ip
}

module "ec2" {
  depends_on = [ module.security_group ]
  source = "./module/ec2"
  security_group_id = module.security_group.id
  key_pair_name = module.key_pair.key_pair_name
  public_key = module.key_pair.key_pair_public_key
  instance_type = var.instance_type
  project_name = var.project_name
  region = var.region
}


# module "rds" {
#   depends_on = [ module.ec2 ]
#   source = "./module/rds"
#   project_name = var.project_name
#   master_username = var.rds_master_username
#   master_password = var.rds_master_password
#   db_engine = var.rds_db_engine
#   engine_version = var.rds_engine_version
#   instance_class = var.rds_instance_class
#   region = var.region
#   security_group_id = module.security_group.id
# }


output "security_group" {
  value = module.security_group.id
}

output "ec2" {
  value = module.ec2
}

# output "rds" {
#   value = module.rds
# }