resource "aws_db_instance" "default" {
    identifier               = "${var.project_name}-rds"
    instance_class           = var.instance_class
    engine                   = var.db_engine
    engine_version           = var.engine_version
    username                 = var.master_username
    password                 = var.master_password
    allocated_storage        = 10
    max_allocated_storage    = 20
    skip_final_snapshot      = true
    apply_immediately        = true
    storage_type             = "gp3"
    availability_zone        = "${var.region}a"
    multi_az                 = false
    publicly_accessible      = false
    storage_encrypted        = false
    backup_retention_period  = 7
    delete_automated_backups = true
    vpc_security_group_ids   = [var.security_group_id]


    tags = {
        Name = "${var.project_name}-rds"
    }
    # iops = "gp3"
}

resource "aws_vpc_security_group_ingress_rule" "allow_postgres_ipv4" {
    security_group_id = var.security_group_id
    to_port           = 5432
    from_port         = 5432
    ip_protocol       = "tcp"
    cidr_ipv4         = "0.0.0.0/0"
}
