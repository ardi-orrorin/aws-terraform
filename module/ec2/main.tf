resource "local_sensitive_file" "aws_secret_key" {
    content = var.private_key
    filename = "${path.module}/aws_secret_key.pem"
}

resource "aws_default_vpc" "default" {
    tags = {
        Name = "${var.project_name}-vpc"
    }
}

data "aws_subnets" "aws_subnet_default" {
    filter {
        name = "availability-zone"
        values = ["ap-northeast-2a"]
    }
}

data "aws_ami" "ubuntu_latest" {
    most_recent = true
    owners = ["099720109477"]
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
    }
}

resource "aws_instance" "instance_test" {
    depends_on = [ aws_default_vpc.default ]
    ami = data.aws_ami.ubuntu_latest.id
    
    availability_zone = "${var.region}a"
    
    instance_type = var.instance_type
    associate_public_ip_address = true
    
    key_name = var.key_pair_name
    subnet_id = data.aws_subnets.aws_subnet_default.ids[0]
    security_groups = [var.security_group_id]

    ebs_block_device {
        device_name = "/dev/sda1"
        volume_size = 20
        volume_type = "gp3"
        delete_on_termination = true
        tags = {
            Name = "${var.project_name}-ebs_volume"
        }
    }

    lifecycle {
        # prevent_destroy = true
        create_before_destroy = false
        ignore_changes = [ ebs_block_device ]
    }

    tags = {
        Name = "${var.project_name}-instance"
    }

    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file(local_sensitive_file.aws_secret_key.filename)
        host = self.public_ip
    }

    provisioner "file" {
        source = "./module/ec2/user_data"
        destination = "data"
        
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x ./data/install_docker.sh",
            "./data/install_docker.sh",
            "sudo docker swarm init",
            "chmod +x ./data/swap-setting.sh",
            "./data/swap-setting.sh"
        ]
    }
}
