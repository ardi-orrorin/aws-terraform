
variable "region" {
    type = string
    description = "리전"
    default = "ap-northeast-2"
}

variable "availability_zone" {
    type = list(string)
    description = "가용 영역"
    default = ["ap-northeast-2a"]
  
}

variable "project_name" {
    type = string
    description = "프로젝트 이름"
    default = "myproject"
}

variable "ec2_instance_type" {
    type = string
    description = "ec2_인스턴스 타입"
    default = "t2.micro"
}

variable "aws_ec2_key_pair_key_name" {
    type = string
    description = "AWS EC2 Key Pair"
    default = "ec2_key_pair"
}

variable "public_key" {
    type = string
    description = "Public Key"
    default = "~/ec2_key_pair.pem"
}

variable "rds_master_username" {
    type = string
    description = "RDS Master Username"
    default = "postgres"
}

variable "rds_master_password" {
    type = string
    description = "RDS Master Password"
    default = "rootroot"
}

variable "rds_db_engine" {
    type = string
    description = "RDS Engine"
    default = "postgres"
}

variable "rds_engine_version" {
    type = string
    description = "RDS Engine Version"
    default = "16.3"
}

variable "rds_instance_class" {
    type = string
    description = "RDS Instance Class"
    default = "db.t3.micro"
}


variable "elastic_cache_node_type" {
    type = string
    description = "Elastic Cache Node Type"
    default = "cache.t3.micro"
}

variable "elastic_cache_engine" {
    type = string
    description = "Elastic Cache Engine"
    default = "redis"
}