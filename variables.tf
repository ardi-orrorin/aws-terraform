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

variable "allow_ssh_ip" {
    type = string
    description = "SSH 접속을 허용할 IP"
    sensitive = true
}

variable "region" {
    type = string
    description = "리전"
}

variable "availability_zone" {
    type = list(string)
    description = "가용 영역"
}

variable "db_subnet_availability_zone" {
    type = list(string)
    description = "RDS 가용 영역"
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

# variable "private_key" {
#     type = string
#     description = "Private Key"
#     sensitive = true
# }

variable "public_key" {
    type = string
    description = "Public Key"
    sensitive = true
}

variable "rds_master_username" {
    type = string
    description = "RDS Master Username"
}

variable "rds_master_password" {
    type = string
    description = "RDS Master Password"
    sensitive = true
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

variable "public_domain_name" {
    type = string
    description = "Public Domain Name (www.example.com) http 제외"
}

variable "ec2_ingress_allow_ip" {
    type = map(object({
        ip   = string
        port = number
    }))
    description = "EC2 인바운드 허용할 IP"
}

variable "ec2_egress_allow_ip" {
    type = map(object({
        ip   = string
        port = number
    }))
    description = "EC2 아웃바운드 허용할 IP"
}