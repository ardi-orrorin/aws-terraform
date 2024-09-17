
module "key_pair" {
    source = "./module/key_pair"
}
module "security_group" {
  source = "./module/security_group"
}

module "ec2" {
    depends_on = [ module.security_group ]
    source = "./module/ec2"
    security_group_id = module.security_group.id
    key_pair_name = module.key_pair.key_pair_name
    public_key = module.key_pair.key_pair_public_key
}