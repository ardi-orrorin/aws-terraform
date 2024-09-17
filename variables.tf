variable "project_name" {
    description = "프로젝트 이름"
    default = "myproject"
}

variable "instance_type" {
    description = "인스턴스 타입"
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
    description = "RDS Master Username"
    default = "postgres"
}

variable "rds_master_password" {
    description = "RDS Master Password"
    default = "rootroot"
}

variable "rds_db_engine" {
    description = "RDS Engine"
    default = "postgres"
}

variable "rds_engine_version" {
    description = "RDS Engine Version"
    default = "16.3"
}

variable "rds_instance_class" {
    description = "RDS Instance Class"
    default = "db.t3.micro"
}