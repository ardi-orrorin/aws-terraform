resource "aws_elasticache_cluster" "default" {
    cluster_id        = "${var.project_name}-redis"
    engine            = var.engine
    node_type         = var.node_type 
    availability_zone = "${var.region}a"
    num_cache_nodes   = 1
    # port              = 6379
    apply_immediately = true
    # engine_version    = 7.1

    security_group_ids = [ var.security_group_id ]

#   log_delivery_configuration {
#     destination      = aws_cloudwatch_log_group.example.name
#     destination_type = "cloudwatch-logs"
#     log_format       = "json"
#     log_type         = "slow-log"
#   }
#   log_delivery_configuration {
#     destination      = aws_kinesis_firehose_delivery_stream.example.name
#     destination_type = "cloudwatch-logs"
#     log_format       = "json"
#     log_type         = "engine-log"
#   }
    # subnet_group_name = "anamensis"
}

resource "aws_vpc_security_group_ingress_rule" "allow_redis_ipv4" {
    security_group_id = var.security_group_id
    to_port           = 6379
    from_port         = 6379
    ip_protocol       = "tcp"
    cidr_ipv4         = "0.0.0.0/0"
}