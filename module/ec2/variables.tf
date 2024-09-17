variable "instance_type" {
    default = "t2.micro"
    description = "인스턴스 타입"
}

variable "security_group_id" {
    type = string
}

variable "key_pair_name" {
    type = string
}

variable "public_key" {
    type = string
}