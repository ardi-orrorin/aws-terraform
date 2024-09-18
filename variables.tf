variable "aws_access_key" {
    type = string
    sensitive = true
    description = "AWS Access"
}

variable "aws_secret_key" {
    type = string
    sensitive = true
    description = "AWS Secret"
}

variable "myself_ip" {
    type = string
    description = "Myself IP"
}

variable "region" {
    type = string
    description = "리전"
}

variable "availability_zone" {
    type = list(string)
    description = "가용 영역"
}

variable "project_name" {
    type = string
    description = "프로젝트 이름"
}

variable "ec2_instance_type" {
    type = string
    description = "ec2_인스턴스 타입"
}

variable "aws_ec2_key_pair_key_name" {
    type = string
    description = "AWS EC2 Key Pair"
}

variable "public_key" {
    type = string
    description = "Public Key"
}

variable "rds_master_username" {
    type = string
    description = "RDS Master Username"
}

variable "rds_master_password" {
    type = string
    description = "RDS Master Password"
}

variable "rds_db_engine" {
    type = string
    description = "RDS Engine"
}

variable "rds_engine_version" {
    type = string
    description = "RDS Engine Version"
}

variable "rds_instance_class" {
    type = string
    description = "RDS Instance Class"
}


variable "elastic_cache_node_type" {
    type = string
    description = "Elastic Cache Node Type"
}

variable "elastic_cache_engine" {
    type = string
    description = "Elastic Cache Engine"

}