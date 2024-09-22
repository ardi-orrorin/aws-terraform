variable "region" {
    type = string
}

variable "availability_zone" {
    type = list(string)
}

variable "instance_type" {
    type = string
}

variable "security_group_ids" {
    type = list(string)
}

variable "key_pair_name" {
    type = string
}

# variable "private_key" {
#     type = string
# }

variable "project_name" {
    type = string
}