module "ec2" {
    source = "./module/ec2"
}

output "ec2" {
  value = module.ec2
}