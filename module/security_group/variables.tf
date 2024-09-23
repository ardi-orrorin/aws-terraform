variable "allow_ssh_ip" {}

variable "project_name" {}

variable "ingress_allow_ip" {
    type = map(object({
        ip = string
        port = number
    }))
}

variable "egress_allow_ip" {
    type = map(object({
        ip = string
        port = number
    }))
}