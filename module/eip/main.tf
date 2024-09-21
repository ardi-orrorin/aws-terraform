resource "aws_eip" "default" {
    instance = var.ec2_instance_id
    domain = "vpc"
    tags = {
        Name = "${var.project_name}-eip"
    }
}