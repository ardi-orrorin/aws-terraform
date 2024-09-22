resource "aws_default_vpc" "default" {
    tags = {
        Name = "${var.project_name}-vpc"
    }
}

data "aws_subnets" "aws_subnet_default" {
    filter {
        name   = "availability-zone"
        values = var.availability_zone
    }
}

data "aws_ami" "ubuntu_latest" {
    most_recent = true
    owners      = ["099720109477"]
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
    }
}

resource "aws_instance" "default" {
    depends_on        = [ aws_default_vpc.default ]
    ami               = data.aws_ami.ubuntu_latest.id
    availability_zone = "${var.region}a"
    instance_type     = var.instance_type
    key_name          = var.key_pair_name
    subnet_id         = data.aws_subnets.aws_subnet_default.ids[0]
    security_groups   = var.security_group_ids

    

    associate_public_ip_address = true

    tags = {
        Name = "${var.project_name}-instance"
    }

    user_data = file("${path.module}/user_data/install.sh")

    root_block_device {
        volume_size = 10
        volume_type = "gp3"
        tags = {
            Name = "${var.project_name}-root-volume"
        }
    }

    lifecycle {
        # prevent_destroy = true
        create_before_destroy = true
        ignore_changes        = [security_groups]
    }

    # connection {
    #     type        = "ssh"
    #     user        = "ubuntu"
    #     host        = self.public_ip
    #     private_key = var.private_key
    # }

    # provisioner "file" {
    #     source      = "${path.module}/user_data"
    #     destination = "data"
    # }

    # provisioner "remote-exec" {
    #     inline = [
    #         "chmod +x ./data/install_docker.sh",
    #         "./data/install_docker.sh",
    #         "sudo docker swarm init",
    #         "chmod +x ./data/swap-setting.sh",
    #         "./data/swap-setting.sh"
    #     ]
    # }
}