resource "aws_ebs_volume" "ec2_volume" {
  availability_zone = var.availability_zone[0]
  size              = 10
  type              = "gp3"

  tags = {
    Name = "${var.project_name}-ebs-ec2-volume"
  }
}