variable "allow_ssh_ip" {}

variable "project_name" {}

variable "allow_ip" {
    type = map(object({
        ip = string
        port = number
    }))
}