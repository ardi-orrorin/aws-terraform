variable "project_name" {
    type = string
}

variable "master_username" {
    type = string
}

variable "master_password" {
    type = string
}

variable "db_engine" {
    type = string
}

variable "engine_version" {
    type = string
}

variable "instance_class" {
    type = string
}

variable "region" {
    type = string
}

variable "availability_zone" {
    type = list(string)
}

variable "security_group_id" {
    type = string
}