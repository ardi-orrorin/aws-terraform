
variable "instance_type" {
    default = "t2.micro"
    description = "인스턴스 타입"
}

data "aws_ami" "ubuntu_latest" {
    most_recent = true
    owners = ["099720109477"]
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
    }
}

resource "aws_default_vpc" "default" {
    tags = {
        Name = "anamensis-vpc"
    }
}

data "aws_subnets" "aws_subnet_default" {
    filter {
        name = "availability-zone"
        values = ["ap-northeast-2a"]
    }
}
# resource "aws_security_group" "anamensis-test+-sg" {
    # vpc_id = aws_default_vpc.default.id
    # 
# }

data "aws_key_pair" "anamensis-key" {
    key_name = "anamensis"
}

resource "aws_instance" "anamensis-test" {
    depends_on = [ aws_default_vpc.default ]
    ami = data.aws_ami.ubuntu_latest.id
    
    instance_type = var.instance_type
    associate_public_ip_address = true
    subnet_id = data.aws_subnets.aws_subnet_default.ids[0]
    security_groups = [ "sg-0692b78ccc2a6aab6", "sg-0b662da6229216810" ]
    key_name = data.aws_key_pair.anamensis-key.key_name
    lifecycle {
        create_before_destroy = true
    }

    tags = {
        Name = "anamensis-test"
    }

    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("${data.aws_key_pair.anamensis-key.key_name}.pem")
        host = self.public_ip
    }

    provisioner "file" {
        source = "install_docker.sh"
        destination = "install_docker.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x install_docker.sh",
            "./install_docker.sh",
            "sudo docker swarm init",
        ]
    }
}

output "public_ip" {
    value = aws_instance.anamensis-test.public_ip
    description = "퍼블릭 아이피 주소"
}

output "ssh_command" {
    value = "ssh -i ${data.aws_key_pair.anamensis-key.key_name}.pem ubuntu@${aws_instance.anamensis-test.public_ip}"
    description = "SSH 접속 명령어"
}
