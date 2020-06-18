module "vote_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "user-service"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = "vpc-da5cc1bd"

  ingress_cidr_blocks      = ["10.10.0.0/16"]
  ingress_rules            = ["https-443-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "10.10.0.0/16"
    },
    {
      rule        = "postgresql-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

module "service_sg_with_ports" {
  source  = "alibaba/security-group/alicloud"
  region  = "cn-hangzhou"

  name        = "user-service"
  description = "Security group for user-service with custom ports open within VPC"
  vpc_id      = "vpc-bp1muagf8gincxeaph8uj"

  ingress_cidr_blocks      = ["10.10.0.0/16"]
  ingress_rules            = ["https-443-tcp"]

  ingress_ports = [50, 150, 8080]
  ingress_with_cidr_blocks_and_ports = [
    {
      ports       = "10,20,30"
      protocol    = "tcp"
      priority    = 1
      cidr_blocks = "10.10.0.0/20,10.11.0.0/20"
    },
    {
      # Using ingress_ports to set ports
      protocol    = "udp"
      description = "ingress for tcp"
      cidr_blocks = "172.10.0.0/20"
    },
    {
      # Using ingress_ports and ingress_cidr_blocks to set ports and cidr_blocks
      protocol    = "icmp"
      priority    = 20
      description = "ingress for icmp"
    }
  ]
}
